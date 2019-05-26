view: team {
  derived_table: {
    sql: SELECT
        new_urls.url  AS "new_urls.url",
        team.name  AS "team.name",
        team.city  AS "team.city",
        CASE WHEN team.team_id = 'UNK' THEN 'Z' ELSE team.team_id END AS "team.team_id"
      FROM looker_scratch.new_urls  AS new_urls
      LEFT JOIN public.team  AS team ON new_urls.url LIKE ('%'||team.name||'%')

      GROUP BY 1,2,3,4
      ORDER BY 1
      LIMIT 500
       ;;
#       indexes: ["team_id"]
#       persist_for: "24 hours"
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: logo {
    type: string
    sql: ${TABLE}."new_urls.url" ;;
    html: <img src="{{rendered_value}}" height="80"> ;;
    order_by_field: team_id
  }

  dimension: name {
    type: string
    sql: ${TABLE}."team.name" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."team.city" ;;
  }

  dimension: team_id {
    type: string
    sql: ${TABLE}."team.team_id" ;;
  }

  set: detail {
    fields: [logo, name, city, team_id]
  }
}
