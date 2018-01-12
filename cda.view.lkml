view: cda {
  sql_table_name: cda.CDA ;;

  dimension: cda_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.CDA_ID ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.CATEGORY ;;
  }

  dimension_group: date_created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.DATE_CREATED ;;
  }

  dimension_group: date_lastmodified {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.DATE_LASTMODIFIED ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: last_run_by {
    type: number
    sql: ${TABLE}.LAST_RUN_BY ;;
  }

  dimension_group: last_run {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.LAST_RUN_ON ;;
  }

  dimension: last_run_result_udf_record_count {
    type: number
    sql: ${TABLE}.LAST_RUN_RESULT_UDF_RECORD_COUNT ;;
  }

  dimension: last_run_udf_record_count {
    type: number
    sql: ${TABLE}.LAST_RUN_UDF_RECORD_COUNT ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: script_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.SCRIPT_ID ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.USER_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      cda_id,
      name,
      script.script_id,
      script.script_name,
      users.user_id,
      users.user_name,
      users.first_name,
      users.last_name,
      cda_results.count
    ]
  }
}
