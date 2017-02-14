view: test {
  sql_table_name: public.test ;;

  dimension: coltest {
    type: string
    sql: ${TABLE}.coltest ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
