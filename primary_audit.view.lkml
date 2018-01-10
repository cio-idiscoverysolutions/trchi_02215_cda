view: primary_audit {
  sql_table_name: dbo.PRIMARY_AUDIT ;;

  dimension: primary_audit_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.PRIMARY_AUDIT_ID ;;
  }

  dimension: column_id {
    type: number
    sql: ${TABLE}.COLUMN_ID ;;
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

  dimension: new_value {
    type: string
    sql: ${TABLE}.NEW_VALUE ;;
  }

  dimension: orig_value {
    type: string
    sql: ${TABLE}.ORIG_VALUE ;;
  }

  dimension: table_id {
    type: number
    sql: ${TABLE}.TABLE_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [primary_audit_id]
  }
}
