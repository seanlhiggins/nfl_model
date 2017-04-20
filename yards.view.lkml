view:  yards {
  derived_table: {
    sql: SELECT play.play_id as play_id,
          (yardline).pos as yardline_string,
          play.gsis_id as gsis_id,
          play.drive_id as drive_id
          FROM play;;
      persist_for: "400 hours"
      indexes: ["play_id"]

  }
  dimension: play_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.play_id ;;
  }
  dimension: drive_id {
    type: number
    sql: ${TABLE}.drive_id ;;
  }

  dimension: gsis_id {
    type: number
    sql: ${TABLE}.gsis_id ;;
  }

  dimension: yardline {
    type: number
    sql: ${TABLE}.yardline_string ;;
  }

  dimension: is_goal_to_go {
    type: yesno
    sql: CAST(${yardline} as numeric) BETWEEN 41 and 50 ;;
  }
}
