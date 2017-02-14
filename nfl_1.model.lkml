connection: "test"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: agg_play {
  fields: [ALL_FIELDS*,-play.state]

  always_filter: {
    filters: {
      field: game.season_year
      value: "2013"
    }
  }
  join: play {
    type: left_outer
    sql_on: ${agg_play.play_id}=${play.play_id} ;;
    relationship: one_to_one
  }
  join: drive{
    type: left_outer
    sql_on: ${play.drive_id}=${drive.drive_id} ;;
    relationship: many_to_one
  }
  join: game {
    type: left_outer
    sql_on: ${drive.gsis_id}=${game.gsis_id};;
    relationship: many_to_one
  }
}

explore: drive {

}

explore: game {}

explore: meta {}

#### Base Explore ####                  Use this to query summary stats year on year as the game view stores the year
explore: play {
#   suggestions: yes
sql_always_where: ${description} NOT LIKE '%extra point%' AND lower(${description}) NOT LIKE '%two point%';;

join: game {
  type: left_outer
  sql_on: ${play.gsis_id}=${game.gsis_id};;
  relationship: many_to_one
}
join: yards {
  type: left_outer
  sql_on: ${play.play_id}=${yards.play_id} AND ${play.gsis_id}=${yards.gsis_id};;
  relationship: one_to_one
}
}


explore: play_player {
  fields: [ALL_FIELDS*,-play.state]

  join: play {
    type: left_outer
    sql_on: ${play_player.play_id} = ${play.play_id} ;;
    relationship: one_to_one
  }

  join: drive {
    type: left_outer
    sql_on: ${play_player.drive_id} = ${drive.drive_id} ;;
    relationship: many_to_one
  }

  join: player {
    type: left_outer
    sql_on: ${play_player.player_id} = ${player.player_id} ;;
    relationship: many_to_one
  }
  join: game {
    type: left_outer
    sql_on: ${game.gsis_id}=${play_player.gsis_id};;
    relationship: many_to_one
  }
  join: yards {
    type: left_outer
    sql_on: ${play.play_id}=${yards.play_id} AND ${play.gsis_id}=${yards.gsis_id};;
    relationship: one_to_one
  }
#   join:  player_avatars {
#     type: left_outer
#     relationship: one_to_one
#     sql_on: ${player_avatars.player_id}=${play_player.player_id} ;;
#   }
}

explore: player {}

explore: team {
  join: play_player {
    type: left_outer
    sql_on: ${team.name}=${play_player.team}.team ;;
    relationship: one_to_many
  }}

# explore: player_avatars {} --Later on I'm going to try compile a list of player avatars and have them
#display if they're queried from the DB
