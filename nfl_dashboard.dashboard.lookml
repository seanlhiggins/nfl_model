- dashboard: play_dashboard
  title: Play Dashboard
  layout: newspaper
  embed_style:
    background_color: "#1a1a1a"
    show_title: false
    title_color: "#0070af"
    show_filters_bar: false
    tile_text_color: "#0070af"
    text_tile_text_color: "#ffffff"
  elements:
  - title: Pass Play Types Count
    name: Pass Play Types Count
    model: nfl_1
    explore: play_player
    type: looker_column
    fields: [play.pass_play_type, play.count, play.expected_points, play_player.average_passing_yards]
    filters:
      play.pass_play_type: "-NULL"
    sorts: [play.count desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: false
    show_y_axis_labels: true
    show_y_axis_ticks: false
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    series_types:
      play.expected_points: line
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    y_axis_orientation: [left, right, left]
    listen:
      Team: play_player.team
      Year: game.season_year
    row: 10
    col: 0
    width: 12
    height: 8
  - title: Run Play Types Count
    name: Run Play Types Count
    model: nfl_1
    explore: play_player
    type: looker_bar
    fields: [play.count, play.run_play_type, play.expected_points, play_player.average_rushing_yards]
    filters:
      play.run_play_type: "-NULL"
    sorts: [play.count desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: false
    show_y_axis_labels: false
    show_y_axis_ticks: false
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    series_types:
      play.expected_points: line
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    y_axis_orientation: [left, right, left]
    listen:
      Team: play_player.team
      Year: game.season_year
    row: 10
    col: 12
    width: 12
    height: 8
  - title: Formation By Down Count
    name: Formation By Down Count
    model: nfl_1
    explore: play_player
    type: table
    fields: [play.count, play.formation, play.down]
    pivots: [play.down]
    filters:
      play.down: NOT NULL
    sorts: [play.count desc 0, play.down]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Team: play_player.team
      Year: game.season_year
    row: 31
    col: 0
    width: 9
    height: 4
  - title: Average Yards Rush/Pass By Formation and Down
    name: Average Yards Rush/Pass By Formation and Down
    model: nfl_1
    explore: play_player
    type: table
    fields: [play.down, play.formation, play_player.average_rushing_yards, play_player.average_passing_yards]
    pivots: [play.down]
    filters:
      play.down: NOT NULL
      play.formation: "-Punt,-Field Goal"
    sorts: [play_player.average_rushing_yards desc 0, play.down]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      play_player.average_passing_yards: Avg Pass Yds
      play_player.average_rushing_yards: Avg Rush Yds
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a,
          palette_id: 99d2d3ac-7579-41a0-b16c-a381b7ae96da}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting_ignored_fields: []
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Team: play_player.team
      Year: game.season_year
    row: 26
    col: 0
    width: 12
    height: 5
  - title: Average Yards by Rush Direction and Down
    name: Average Yards by Rush Direction and Down
    model: nfl_1
    explore: play_player
    type: table
    fields: [play.run_play_type, play_player.average_rushing_yards, play.down]
    pivots: [play.down]
    filters:
      play.down: NOT NULL
      play.run_play_type: "-NULL"
    sorts: [play_player.average_rushing_yards desc 0, play.down]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: cbc9398c-289f-4aab-ae90-2657094eb9de
      palette_id: 8cb37775-f7cd-4f03-ab27-54450d12c164
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      play_player.average_rushing_yards: Avg Rush
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: low to high, value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"], __FILE: nfl_stats/nfl_dashboard_2.dashboard.lookml,
          __LINE_NUM: 312}, bold: false, italic: false, strikethrough: false, __FILE: nfl_stats/nfl_dashboard_2.dashboard.lookml,
        __LINE_NUM: 307}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting_ignored_fields: []
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Team: play_player.team
      Year: game.season_year
    row: 18
    col: 12
    width: 12
    height: 5
  - title: Yards by Pass Play type and Week
    name: Yards by Pass Play type and Week
    model: nfl_1
    explore: play_player
    type: looker_line
    fields: [game.week, play_player.total_passing_yds, play.pass_play_type]
    pivots: [play.pass_play_type]
    filters:
      game.season_type: Regular
      play.pass_play_type: "-NULL"
    sorts: [game.week, play.pass_play_type]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Team: play_player.team
      Year: game.season_year
    row: 18
    col: 0
    width: 12
    height: 8
  - title: Logo
    name: Logo
    model: nfl_1
    explore: team
    type: single_value
    fields: [team.logo]
    sorts: [team.logo desc]
    limit: 1
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: true
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '1'
    series_types: {}
    listen:
      Team: team.team_id
    row: 0
    col: 9
    width: 15
    height: 4
  - title: 3rd Conv %
    name: 3rd Conv %
    model: nfl_1
    explore: play_player
    type: single_value
    fields: [play.first_down_conv_perc]
    filters:
      play.down: '3'
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    value_format: 0.00%
    listen:
      Team: play_player.team
      Year: game.season_year
    row: 4
    col: 16
    width: 4
    height: 2
  - title: Yards by Rush Direction and Week
    name: Yards by Rush Direction and Week
    model: nfl_1
    explore: play_player
    type: looker_line
    fields: [game.week, play.run_play_type, play_player.total_rushing_yds]
    pivots: [play.run_play_type]
    filters:
      game.season_type: Regular
      play.run_play_type: "-NULL"
    sorts: [game.week, play.run_play_type]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Team: play_player.team
      Year: game.season_year
    row: 23
    col: 12
    width: 12
    height: 8
  - title: INTs
    name: INTs
    model: nfl_1
    explore: play_player
    type: single_value
    fields: [play_player.dynamic_metric]
    filters:
      play_player.destination: Metric
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#dc7350"
    show_single_value_title: true
    single_value_title: INT/FUM/TD
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Team: play_player.team
      Year: game.season_year
      Metric: play_player.dynamic_metric_selector
    row: 6
    col: 12
    width: 3
    height: 2
  - name: Pass
    type: text
    title_text: Pass
    row: 8
    col: 0
    width: 12
    height: 2
  - name: Run
    type: text
    title_text: Run
    row: 8
    col: 12
    width: 12
    height: 2
  # - title: TD/ATT Yardline
  #   name: TD/ATT Yardline
  #   model: nfl_1
  #   explore: play_player
  #   type: aster
  #   fields: [play_player.total_passing_att, play_player.total_passing_tds, play.yardlines]
  #   sorts: [play_player.total_passing_att desc]
  #   limit: 10
  #   query_timezone: Europe/Dublin
  #   color_range: ["#639e4f", "#C32F4B", "#E1514B", "#F47245", "#FB9F59", "#FEC574",
  #     "#FAE38C", "#EAF195", "#C7E89E", "#9CD6A4", "#6CC4A4", "#4D9DB4", "#4776B4",
  #     "#5E4EA1"]
  #   dataLabelToggle: true
  #   dataLabelSize: 10.5
  #   keyword_search: ''
  #   legendtoggle: true
  #   legendAlign: left
  #   labelSelection: percentage
  #   labelColour: "#C80815"
  #   titleSize: 12.5
  #   color_0: "#9E0041"
  #   color_1: "#C32F4B"
  #   color_2: "#E1514B"
  #   color_3: "#F47245"
  #   color_4: "#FB9F59"
  #   color_5: "#FEC574"
  #   color_6: "#FAE38C"
  #   color_7: "#EAF195"
  #   color_8: "#C7E89E"
  #   color_9: "#9CD6A4"
  #   axisRadiusMin: '10'
  #   axisRangeMin: '10'
  #   innerRadiusSize: 11
  #   series_types: {}
  #   title_hidden: true
  #   listen:
  #     Team: play_player.team
  #     Year: game.season_year
  #   row: 0
  #   col: 0
  #   width: 9
  #   height: 8
  - title: Pick 6
    name: Pick 6
    model: nfl_1
    explore: play_player
    type: single_value
    fields: [play.pick6_count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#b5103e"
    show_single_value_title: true
    value_format: ''
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Team: play_player.team
      Year: game.season_year
    row: 6
    col: 9
    width: 3
    height: 2
  - title: FGs
    name: FGs
    model: nfl_1
    explore: play_player
    type: single_value
    fields: [play.fg_count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#283b8c"
    show_single_value_title: true
    value_format: ''
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Team: play_player.team
      Year: game.season_year
    row: 6
    col: 15
    width: 3
    height: 2
  - title: Rush Yds
    name: Rush Yds
    model: nfl_1
    explore: play_player
    type: single_value
    fields: [play_player.total_rushing_yds]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#8c8710"
    show_single_value_title: true
    value_format: ''
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Team: play_player.team
      Year: game.season_year
    row: 6
    col: 21
    width: 3
    height: 2
  - title: Pass Yds
    name: Pass Yds
    model: nfl_1
    explore: play_player
    type: single_value
    fields: [play_player.total_passing_yds]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#227f8c"
    show_single_value_title: true
    value_format: "#"
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Team: play_player.team
      Year: game.season_year
    row: 6
    col: 18
    width: 3
    height: 2
  - title: 2nd Conv %
    name: 2nd Conv %
    model: nfl_1
    explore: play_player
    type: single_value
    fields: [play.first_down_conv_perc]
    filters:
      play.down: '2'
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#3a7b8c"
    show_single_value_title: true
    value_format: 0.00%
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Team: play_player.team
      Year: game.season_year
    row: 4
    col: 12
    width: 4
    height: 2
  - title: 1st Conv %
    name: 1st Conv %
    model: nfl_1
    explore: play_player
    type: single_value
    fields: [play.first_down_conv_perc]
    filters:
      play.down: '1'
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#683d8c"
    show_single_value_title: true
    value_format: 0.00%
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Team: play_player.team
      Year: game.season_year
    row: 4
    col: 9
    width: 3
    height: 2
  - title: 4th Conv %
    name: 4th Conv %
    model: nfl_1
    explore: play_player
    type: single_value
    fields: [play.first_down_conv_perc]
    filters:
      play.down: '4'
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#8c251a"
    show_single_value_title: true
    value_format: 0.00%
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Team: play_player.team
      Year: game.season_year
    row: 4
    col: 20
    width: 4
    height: 2
  filters:
  - name: Team
    title: Team
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: nfl_1
    explore: play_player
    listens_to_filters: []
    field: play_player.team
  - name: Year
    title: Year
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: nfl_1
    explore: game
    listens_to_filters: []
    field: game.season_year
  - name: Metric
    title: Metric
    type: field_filter
    default_value: INT
    allow_multiple_values: true
    required: false
    model: nfl_1
    explore: play_player
    listens_to_filters: []
    field: play_player.dynamic_metric_selector
