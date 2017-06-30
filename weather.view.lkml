view: weather {
  sql_table_name: public.weather ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: away_score {
    type: number
    sql: ${TABLE}.away_score ;;
  }

  dimension: away_team {
    type: string
    sql: ${TABLE}.away_team ;;
  }

  dimension_group: game_played {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      day_of_week,
      year
    ]
    convert_tz: no
    sql: ${TABLE}.date ;;
  }

  dimension: home_score {
    type: number
    sql: ${TABLE}.home_score ;;
  }

  dimension: home_team {
    type: string
    sql: ${TABLE}.home_team ;;
  }

  dimension: humidity {
    type: string
    sql: ${TABLE}.humidity ;;
  }

  dimension: temperature {
    type: number
    sql: ${TABLE}.temperature ;;
  }

  dimension: weather {
    type: string
    sql: ${TABLE}.weather ;;
  }

  dimension: wind_chill {
    type: number
    sql: ${TABLE}.wind_chill ;;
  }
  dimension: home_team_abbr {
    type: string
    sql: UPPER(RIGHT(${id},3)) ;;
  }
  dimension: home_team_corr {
    type: string
    sql: CASE WHEN ${home_team_abbr} = 'HTX' THEN 'HOU'
    WHEN ${home_team_abbr} = 'CLT' THEN 'IND'
    WHEN ${home_team_abbr} = 'CRD' THEN 'ARI'
    WHEN ${home_team_abbr} = 'NOR' THEN 'NO'
    WHEN ${home_team_abbr} = 'RAV' THEN 'BAL'
    WHEN ${home_team_abbr} = 'TAM' THEN 'TB'
    WHEN ${home_team_abbr} = 'GNB' THEN 'GB'
    WHEN ${home_team_abbr} = 'JAX' THEN 'JAC'
    WHEN ${home_team_abbr} = 'KAN' THEN 'KC'
    WHEN ${home_team_abbr} = 'OTI' THEN 'TEN'
    WHEN ${home_team_abbr} = 'SDG' THEN 'SD'
    WHEN ${home_team_abbr} = 'SFO' THEN 'SF'
    WHEN ${home_team_abbr} = 'NWE' THEN 'NE'
    WHEN ${home_team_abbr} = 'RAI' THEN 'OAK'
    WHEN ${home_team_abbr} = 'RAM' THEN 'STL'
    END;;
  }



  dimension: wind_mph {
    type: number
    sql: ${TABLE}.wind_mph ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
