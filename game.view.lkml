view: game {
  sql_table_name: public.game ;;

  dimension: away_score {
    type: number
    group_label: "Away"

    sql: ${TABLE}.away_score ;;
  }

  dimension: is_home_win {
    type: yesno
    sql: ${home_score} > ${away_score} ;;
  }


  dimension: away_score_q1 {
    type: number
    group_label: "Scores"
    sql: ${TABLE}.away_score_q1 ;;
  }

  dimension: away_score_q2 {
    type: number
    group_label: "Scores"
    sql: ${TABLE}.away_score_q2 ;;
  }

  dimension: away_score_q3 {
    type: number
    group_label: "Scores"
    sql: ${TABLE}.away_score_q3 ;;
  }

  dimension: away_score_q4 {
    type: number
    group_label: "Scores"
    sql: ${TABLE}.away_score_q4 ;;
  }

  dimension: away_score_q5 {
    type: number
    group_label: "Scores"
    sql: ${TABLE}.away_score_q5 ;;
  }

  dimension: away_team {
    type: string
    group_label: "Away"

    sql: ${TABLE}.away_team ;;
  }

  dimension: away_turnovers {
    type: number
    group_label: "Away"
    sql: ${TABLE}.away_turnovers ;;
  }

  dimension: day_of_week {
    type: string
    sql: ${TABLE}.day_of_week ;;
  }

  dimension: finished {
    type: yesno
    sql: ${TABLE}.finished ;;
  }

  dimension: gamekey {
    type: string
    sql: ${TABLE}.gamekey ;;
  }

  dimension: gsis_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.gsis_id ;;
  }

  dimension: home_score {
    type: number
    group_label: "Home"

    sql: ${TABLE}.home_score ;;
  }

  dimension: home_score_q1 {
    type: number
    group_label: "Scores"
    sql: ${TABLE}.home_score_q1 ;;
  }

  dimension: home_score_q2 {
    type: number
    group_label: "Scores"
    sql: ${TABLE}.home_score_q2 ;;
  }

  dimension: home_score_q3 {
    type: number
    group_label: "Scores"
    sql: ${TABLE}.home_score_q3 ;;
  }

  dimension: home_score_q4 {
    type: number
    group_label: "Scores"
    sql: ${TABLE}.home_score_q4 ;;
  }

  dimension: home_score_q5 {
    type: number
    group_label: "Scores"
    sql: ${TABLE}.home_score_q5 ;;
  }

  dimension: home_team {
    type: string
    group_label: "Home"

    sql: ${TABLE}.home_team ;;
  }

  dimension: score_differential {
    type: number
    sql: ABS(${home_score}-${away_score}) ;;
  }
  dimension: score_difference_for_measure {
    type: number
    hidden: yes
    sql: ABS(${home_score})-ABS(${away_score}) ;;
  }

  dimension: home_turnovers {
    type: number
    group_label: "Home"

    sql: ${TABLE}.home_turnovers ;;
  }

  dimension: season_type {
    type: string
    sql: ${TABLE}.season_type ;;
  }


  dimension: season_year {
    type: number
    sql: ${TABLE}.season_year ;;
  }

  parameter: datetime {
    type: date
    # default_value: "today"
    suggest_dimension: start_date
  }

  dimension_group: start {
    type: time
    timeframes: [time, date, week, month, year, day_of_week]
    sql: ${TABLE}.start_time ;;
  }

  dimension_group: time_inserted {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.time_inserted ;;
  }

  dimension_group: time_updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.time_updated ;;
  }

  dimension: week {
    type: number
    sql: ${TABLE}.week ;;
  }

  measure: total_home_wins {
    type: count
#     hidden: yes
    filters: {
      field: is_home_win
      value: "yes"
    }
  }
  measure: total_away_wins {
    type: count
#     hidden: yes
    filters: {
      field: is_home_win
      value: "no"
    }
  }

  measure: home_vs_away {
    type: number
    sql: ${total_home_wins}  ;;
    html:
    <div style="width:100%; text-align: right;">
   {{ total_home_wins._linked_value }}-{{ total_away_wins._linked_value }}
    </div>;;
    }

  measure: total_score_differential {
    type: sum
    sql: ${score_difference_for_measure} ;;
  }
  measure: count {
    type: count
    drill_fields: []
  }
}
