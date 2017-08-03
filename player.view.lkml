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

  filter: position_selector {
    suggestions: ["QB","RB","WR"]
  }

  dimension: position_comparitor {
    type: string
    sql: CASE
      WHEN {% condition position_selector %} ${position}::text {% endcondition %}
        THEN ${position}::text
      ELSE 'All Other Positions'
    END ;;
  }

  dimension: is_sd_player_or_active {
    sql: ${status}='Active' OR ${team}='SD'  ;;
    type: yesno
  }

  dimension: conditional_output {
    case: {
      when: {
        sql: ${status}='Active' ;;
        label: "Green"
      }
      when: {
        sql: ${team}='SF' ;;
        label: "Red"
      }
      else: "White"
    }
  }

  dimension: profile_id {
    type: number
    hidden: yes
    sql: ${TABLE}.profile_id ;;
  }

  dimension: profile_test {
    type: number
    hidden: yes
    label: "profile_id"
  }
  dimension: profile_shown {
    sql: CASE WHEN user_attributes.shown = 'true' THEN ${profile_test} ELSE ${profile_id} END ;;
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
