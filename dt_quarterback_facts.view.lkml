view: dt_quarterback_facts {
  derived_table: {
    sql: SELECT
        player.esb_id AS "player.esb_id",
        player.full_name  AS "player.full_name",
        player.player_id  AS "player.player_id",
        player.position  AS "player.position",
        player.team  AS "player.team",
        AVG(CASE WHEN (play_player.passing_att  = 1) THEN play_player.passing_yds ELSE NULL END) AS "play_player.average_passing_yards",
        COUNT(CASE WHEN (play_player.passing_att  = 1) THEN 1 ELSE NULL END) AS "play_player.count_passing_att",
        1.0*(COALESCE(SUM(CASE WHEN (play_player.rushing_att  = 1) THEN COALESCE(play_player.rushing_att,0)  ELSE NULL END), 0))/nullif((COUNT(*)),0)  AS "play_player.pass_perc",
        COALESCE(SUM(CASE WHEN (play_player.passing_att  = 1) THEN play_player.passing_att  ELSE NULL END), 0) AS "play_player.total_passing_att",
        COALESCE(SUM(COALESCE(play_player.passing_cmp,0) ), 0) AS "play_player.total_passing_comp",
        COALESCE(SUM(play_player.passing_int ), 0) AS "play_player.total_passing_ints",
        COALESCE(SUM(CASE WHEN (play_player.passing_att  = 1) THEN play_player.passing_yds  ELSE NULL END), 0) AS "play_player.total_passing_yds",
        COALESCE(SUM(play_player.passing_tds ), 0) AS "play_player.total_passing_tds"
      FROM public.play_player  AS play_player
      INNER JOIN public.player  AS player ON play_player.player_id = player.player_id
      WHERE player.position IN ('QB', 'UNK')

      GROUP BY 1,2,3,4,5
      ORDER BY 9 DESC

       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: player_esb_id {
    type: string
    sql: ${TABLE}."player.esb_id" ;;
  }

  dimension: player_full_name {
    type: string
    sql: ${TABLE}."player.full_name" ;;
  }

  dimension: player_player_id {
    type: string
    sql: ${TABLE}."player.player_id" ;;
  }

  dimension: player_position {
    type: string
    sql: ${TABLE}."player.position" ;;
  }

  dimension: player_team {
    type: string
    sql: ${TABLE}."player.team" ;;
  }

  measure: average_passing_yards {
    type: number
    sql: ${TABLE}."play_player.average_passing_yards" ;;
  }

  measure: total_pass_perc {
    type:sum
    sql: ${TABLE}."play_player.pass_perc" ;;
  }

  measure: total_passing_att {
    type:sum
    sql: ${TABLE}."play_player.total_passing_att" ;;
  }

  measure: total_passing_comp {
    type:sum
    sql: ${TABLE}."play_player.total_passing_comp" ;;
  }

  measure: total_passing_ints {
    type:sum
    sql: ${TABLE}."play_player.total_passing_ints" ;;
  }

  measure: total_passing_yds {
    type:sum
    sql: ${TABLE}."play_player.total_passing_yds" ;;
  }

  measure: total_passing_tds {
    type:sum
    sql: ${TABLE}."play_player.total_passing_tds" ;;
  }

  set: detail {
    fields: [
      player_esb_id,
      player_full_name,
      player_player_id,
      player_position,
      player_team,
      total_pass_perc,
      total_passing_att,
      total_passing_comp,
      total_passing_ints,
      total_passing_yds,
      total_passing_tds
    ]
  }
}
