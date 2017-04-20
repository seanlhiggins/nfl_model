view: team {
  sql_table_name: public.team ;;

  dimension: team_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.team_id ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: logo {
    type: string
    sql: ${TABLE}.logo_url ;;
    html: <img src="{{rendered_value}}" height="80">;;
    }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [team_id, name]
  }
}
