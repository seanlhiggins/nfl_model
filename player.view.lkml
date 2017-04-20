view: player {
  sql_table_name: public.player ;;

  dimension: player_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.player_id ;;
  }

  dimension: birthdate {
    type: string
    sql: ${TABLE}.birthdate ;;
  }

  dimension: portrait {
    label: "Player Portrait"
    sql: ${TABLE}.esb_id ;;
    type: string
    link: {url:"http://static.nfl.com/static/content/public/static/img/fantasy/transparent/200x200/{{rendered_value}}.png"}
    html: <img height=80 width=80 src="http://static.nfl.com/static/content/public/static/img/fantasy/transparent/200x200/{{rendered_value}}.png">
      ;;
  }

  dimension: esb_id {
    sql: ${TABLE}.esb_id;;
    type: string
  }

  dimension: college {
    type: string
    sql: ${TABLE}.college ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: full_name {
    type: string
    sql: ${TABLE}.full_name ;;
    drill_fields: [team,birthdate,college]
  }

  dimension: gsis_name {
    type: string
    sql: ${TABLE}.gsis_name ;;
  }

  dimension: height {
    type: number
    sql: ${TABLE}.height ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: position {
    type: string
    sql: ${TABLE}.position ;;
  }

  dimension: profile_id {
    type: number
    sql: ${TABLE}.profile_id ;;
  }

  dimension: profile_url {
    type: string
    sql: ${TABLE}.profile_url ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}.team ;;
    link:{
      label: "Team Play Analysis Dashboard"
      url: "https://localhost:9999/dashboards/8"
    }
  }

  dimension: uniform_number {
    type: number
    sql: ${TABLE}.uniform_number ;;
  }

  dimension: weight {
    type: number
    sql: ${TABLE}.weight ;;
  }

  dimension: years_pro {
    type: number
    sql: ${TABLE}.years_pro ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      player_id,
      gsis_name,
      full_name,
      first_name,
      last_name,
      play_player.count
    ]
  }
}
