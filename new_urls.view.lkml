view: new_urls {
  sql_table_name: looker_scratch.new_urls ;;

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
