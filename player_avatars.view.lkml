include: "player.view.lkml"

view: player_avatars {
  extends: [player]

  dimension: portrait {
    label: "Player Portrait"
    sql: "JOH127799" ;;
    type: string
    html: <img height=80 width=80 src="http://static.nfl.com/static/content/public/static/img/fantasy/transparent/200x200/{{rendered_value}}}}.png">
      ;;
  }

  dimension: player_id {
    sql: ${TABLE}.player_id ;;
    hidden: yes
    primary_key: yes
  }
  dimension: name {
    label: "Player Name"
    sql: ${first_name} || ' ' || ${TABLE}.last_name ;;
  }

  dimension: first_name {
    label: "Player First Name"
    sql:${TABLE}.first_name;;
    }


#   set: detail {
#     fields: [EXTENDED*, portrait]
#   }
}
