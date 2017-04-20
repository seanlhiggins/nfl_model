connection: "test"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: agg_play {
  fields: [ALL_FIELDS*]

#   always_filter: {
#     filters: {
#       field: game.season_year
#       value: "2013"
#     }
#   }
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
  join: yards {
    type: left_outer
    sql_on: ${play.play_id}=${yards.play_id} AND ${play.gsis_id}=${yards.gsis_id} and ${play.drive_id} = ${yards.drive_id};;
    relationship: one_to_one
  }
}

explore: drive {
  join:  play {
    sql_on: ${drive.drive_id}=${play.drive_id};;
    relationship: one_to_many
    type: left_outer
  }

}

# explore: game {} # don't need right now, Game is joined in to other explores but haven't needed it on its own

# explore: meta {} # as with Game, no need for meta on its own.

#### Base Explore ####                  Use this to query summary stats year on year as the game view stores the year
explore: play {
#   suggestions: yes
  join: drive {
    type: left_outer
    sql_on: ${play.drive_id} = ${drive.drive_id} ;;
    relationship: many_to_one
  }
}


explore: play_player {
  fields: [ALL_FIELDS*]

  join: play {
    type: inner
    sql_on: ${play_player.play_id} = ${play.play_id} AND ${play_player.gsis_id} = ${play.gsis_id} AND ${play_player.drive_id} = ${play.drive_id};;
    relationship: many_to_one
  }

  join: drive {
    type: inner
    sql_on: ${play_player.drive_id} = ${drive.drive_id} AND ${play_player.gsis_id} = ${drive.gsis_id};;
    relationship: many_to_one
  }

  join: player {
    type: inner
    sql_on: ${play_player.player_id} = ${player.player_id} ;;
    relationship: many_to_one
  }
  join: game {
    type: inner
    sql_on: ${game.gsis_id}=${play_player.gsis_id};;
    relationship: many_to_one
  }
#   join: yards {
#     type: left_outer
#     sql_on: ${play.play_id}=${yards.play_id} AND ${play.gsis_id}=${yards.gsis_id} and ${play.drive_id} = ${yards.drive_id};;
#     relationship: one_to_one
#   }
#   join:  player_avatars {
#     type: left_outer
#     relationship: one_to_one
#     sql_on: ${player_avatars.player_id}=${play_player.player_id} ;;
#   }
}
explore: running_backs_summary {
  join: play_player {
    type: inner
    sql_on: ${play_player.player_id}=${running_backs_summary.player_id} ;;
    relationship: one_to_many
  }
  join: play {
    type: inner
    sql_on: ${play_player.play_id} = ${play.play_id} AND ${play_player.gsis_id} = ${play.gsis_id} AND ${play_player.drive_id} = ${play.drive_id};;
    relationship: many_to_one
  }
  join: player {
    type: inner
    sql_on: ${running_backs_summary.player_id} = ${player.player_id} ;;
    relationship: many_to_one
  }
}

explore: player {}

explore: team {
  join: play_player {
    type: left_outer
    sql_on: ${team.team_id}=${play_player.team} ;;
    relationship: one_to_many
  }}

# explore: player_avatars {} --Later on I'm going to try compile a list of player avatars and have them
#display if they're queried from the DB
