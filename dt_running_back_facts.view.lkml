view: dt_running_back_facts {
  derived_table: {
    sql: SELECT
        player.player_id  AS "player.player_id",
        player.full_name  AS "player.full_name",
        player.esb_id AS "player.esb_id",
        player.status  AS "player.status",
        player.team  AS "player.team",
        player.position  AS "player.position",
        COALESCE(SUM(CASE WHEN (play_player.rushing_att  = 1) THEN play_player.rushing_yds  ELSE NULL END), 0) AS "play_player.total_rushing_yds",
        COALESCE(SUM(play_player.rushing_tds ), 0) AS "play_player.total_rushing_tds",
        COALESCE(SUM(CASE WHEN (play_player.rushing_att  = 1) THEN play_player.fumbles_lost  ELSE NULL END), 0) AS "play_player.total_rushing_fumbles",
        COALESCE(SUM(CASE WHEN (play_player.rushing_att  = 1) THEN COALESCE(play_player.rushing_att,0)  ELSE NULL END), 0) AS "play_player.total_rushing_att",
        1.0*(COALESCE(SUM(CASE WHEN (play_player.rushing_att  = 1) THEN COALESCE(play_player.rushing_att,0)  ELSE NULL END), 0))/nullif((COUNT(*)),0)  AS "play_player.rush_perc",
        COUNT(CASE WHEN (play_player.rushing_att  = 1) THEN 1 ELSE NULL END) AS "play_player.count_rushing_att",
        AVG(CASE WHEN (play_player.rushing_att  = 1) THEN play_player.rushing_yds ELSE NULL END) AS "play_player.average_rushing_yards",
        COALESCE(SUM(play_player.receiving_rec ), 0) AS "play_player.total_receiving_rec",
        COALESCE(SUM(COALESCE(play_player.receiving_tar,0) ), 0) AS "play_player.total_receiving_tar",
        COALESCE(SUM(play_player.receiving_tds ), 0) AS "play_player.total_receiving_tds"
      FROM public.play_player  AS play_player
      INNER JOIN public.player  AS player ON play_player.player_id = player.player_id
      WHERE player.position IN ('RB', 'UNK')
      GROUP BY 1,2,3,4,5,6
      ORDER BY 7 DESC

       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: player_player_id {
    type: string
    primary_key: yes
    sql: ${TABLE}."player.player_id" ;;
  }

  dimension: player_full_name {
    type: string
    sql: ${TABLE}."player.full_name" ;;
  }

  dimension: player_esb_id {
    type: string
    sql: ${TABLE}."player.esb_id" ;;
  }

  dimension: player_status {
    type: string
    sql: ${TABLE}."player.status" ;;
  }

  dimension: player_team {
    type: string
    sql: ${TABLE}."player.team" ;;
  }

  dimension: player_position {
    type: string
    sql: ${TABLE}."player.position" ;;
  }

  measure: total_rushing_yds {
    type: sum
    sql: ${TABLE}."play_player.total_rushing_yds" ;;
  }

  measure: total_rushing_tds {
    type: sum
    sql: ${TABLE}."play_player.total_rushing_tds" ;;
  }

  measure: total_rushing_fumbles {
    type: sum
    sql: ${TABLE}."play_player.total_rushing_fumbles" ;;
  }

  measure: total_rushing_att {
    type: sum
    sql: ${TABLE}."play_player.total_rushing_att" ;;
  }

  measure: total_rush_perc {
    type: sum
    sql: ${TABLE}."play_player.rush_perc" ;;
  }

  measure: total_count_rushing_att {
    type: sum
    sql: ${TABLE}."play_player.count_rushing_att" ;;
  }

  measure: total_average_rushing_yards {
    type: sum
    sql: ${TABLE}."play_player.average_rushing_yards" ;;
  }

  measure: total_receiving_rec {
    type: sum
    sql: ${TABLE}."play_player.total_receiving_rec" ;;
  }

  measure: total_receiving_tar {
    type: sum
    sql: ${TABLE}."play_player.total_receiving_tar" ;;
  }

  measure: total_receiving_tds {
    type: sum
    sql: ${TABLE}."play_player.total_receiving_tds" ;;
  }

  set: detail {
    fields: [
      player_player_id,
      player_full_name,
      player_esb_id,
      player_status,
      player_team,
      player_position,
      total_rushing_yds,
      total_rushing_tds,
      total_rushing_fumbles,
      total_rushing_att,
      total_rush_perc,
      total_count_rushing_att,
      total_average_rushing_yards,
      total_receiving_rec,
      total_receiving_tar,
      total_receiving_tds
    ]
  }
}
