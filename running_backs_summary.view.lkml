view: running_backs_summary {
  derived_table: {
    sql: SELECT player_id
          , sum(play_player.rushing_att) as total_rushing_attempts
          , sum(play_player.rushing_tds) as total_rushing_tds
          , sum(play_player.rushing_yds) as total_rushing_yards
          , sum(play_player.receiving_tar) as total_receiving_targets
          , sum(play_player.passing_att) as total_passing_attempts
          , sum(play_player.passing_tds) as total_passing_tds
          , sum(play_player.passing_yds) as total_passing_yards
          FROM play_player
          GROUP BY 1
          HAVING sum(rushing_att) >50
          ;;
          persist_for: "48 hours"
          indexes: ["player_id"]
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: total_rushing_attempts {
    type: number
    sql: ${TABLE}.total_rushing_attempts ;;
  }

  dimension: total_rushing_tds {
    type: number
    sql: ${TABLE}.total_rushing_tds ;;
  }

  dimension: total_rushing_yards {
    type: number
    sql: ${TABLE}.total_rushing_yards ;;
  }

  dimension: total_passing_yards {
    type: number
    sql: ${TABLE}.total_passing_yards ;;
  }
  dimension: total_passing_TDs {
    type: number
    sql: ${TABLE}.total_passing_tds ;;
  }
  dimension: total_passing_attempts {
    type: number
    sql: ${TABLE}.total_passing_attempts ;;
  }
  dimension: total_receiving_tar {
    type: number
    sql: ${TABLE}.total_receiving_targets ;;
  }

  dimension: player_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.player_id ;;
  }

  measure: sum_passing_yds {
    sql: ${total_passing_yards};;
    type:sum
  }
  measure: sum_rushing_yds {
    sql: ${total_rushing_yards};;
    type:sum
  }
  measure: sum_receiving_targets {
    sql: ${total_receiving_tar};;
    type:sum
  }
  measure: sum_passing_attempts {
    sql: ${total_passing_attempts};;
    type:sum
  }
  measure: sum_passing_tds {
    sql: ${total_passing_TDs};;
    type:sum
  }
  measure: sum_rushing_tds {
    sql: ${total_rushing_tds};;
    type:sum
  }
  set: detail {
    fields: [total_rushing_attempts, total_rushing_tds, total_rushing_yards, player_id]
  }
}
