view: drive {
  sql_table_name: public.drive ;;

  dimension: compound_primary_key {
    sql: ${drive_id}||'-'||${gsis_id} ;;
    primary_key: yes
    hidden: yes
  }

  dimension: drive_id {
    type: number
    sql: ${TABLE}.drive_id ;;
  }

  dimension: end_field {
    type: string
    sql: ${TABLE}.end_field ;;
  }

  dimension: end_time {
    type: string
    sql: ${TABLE}.end_time ;;
  }

  dimension: first_downs {
    type: number
    sql: ${TABLE}.first_downs ;;
  }

  dimension: gsis_id {
    type: string
    sql: ${TABLE}.gsis_id ;;
  }

  dimension: penalty_yards {
    type: number
    sql: ${TABLE}.penalty_yards ;;
  }

  dimension: play_count {
    type: number
    sql: ${TABLE}.play_count ;;
  }

  dimension: pos_team {
    type: string
    sql: ${TABLE}.pos_team ;;
  }

  dimension: pos_time {
    type: string
    sql: ${TABLE}.pos_time ;;
  }

  dimension: result {
    type: string
    sql: ${TABLE}.result ;;
  }

  dimension: start_field {
    type: string
    sql: ${TABLE}.start_field ;;
  }

  dimension: start_time {
    type: string
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

  dimension: yards_gained {
    type: number
    sql: ${TABLE}.yards_gained ;;
  }
  dimension: is_td_drive {
    sql: ${result}  = 'Touchdown';;
    type: yesno
  }

  dimension: is_fg_drive {
    sql: ${result}  = 'Field Goal';;
    type: yesno
  }
  dimension: is_safety_drive {
    sql: ${result}  = 'Safety';;
    type: yesno
  }

  measure: touchdown_drive_count {
    type: count
    filters: {
      field: result
      value: "Touchdown"
    }
  }
  measure: fg_drive_count {
    type: count
    filters: {
      field: result
      value: "Field Goal"
    }
  }
  measure: safety_drive_count {
    type: count
    filters: {
      field: result
      value: "Safety"

    }
  }

  measure: td_drive_perc {
    sql: 1.0*${touchdown_drive_count}/nullif(${count},0) ;;
    type: number
    value_format_name: decimal_4
  }
  measure: fg_drive_perc {
    sql: 1.0*${fg_drive_count}/nullif(${count},0) ;;
    type: number
    value_format_name: decimal_4
  }
  measure: safety_drive_perc {
    sql: 1.0*${safety_drive_count}/nullif(${count},0) ;;
    type: number
    value_format_name: decimal_4
  }
  measure: expected_points_drive {
    type: number
    sql: (${td_drive_perc}*7)+(${fg_drive_perc}*3)+(${safety_drive_perc}*-2) ;;
    value_format_name: decimal_3



    html: {% if value < 3 %}
        <div style="color: black; background-color: #dc7350; font-size: 100%; text-align:center"> {{rendered_value}} </div>
      {% elsif value < 5 %}
        <div style="color: black; background-color: #e9b404; font-size: 100%; text-align:center"> {{rendered_value}} </div>
      {% else %}
        <div style="color: black; background-color: #49cec1; font-size: 100%; text-align:center"> {{rendered_value}} </div>
      {% endif %}
      ;;
  }
  measure: count {
    type: count
    drill_fields: [drive_id, agg_play.count, play.count, play_player.count]
  }
}
