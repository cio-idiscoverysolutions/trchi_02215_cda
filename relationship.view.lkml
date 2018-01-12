view: relationship {
  sql_table_name: dbo.RELATIONSHIP ;;

  dimension: confidence {
    type: number
    sql: ${TABLE}.CONFIDENCE ;;
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

  dimension: destination_id {
    type: number
    sql: ${TABLE}.DESTINATION_ID ;;
  }

  dimension: destination_type {
    type: string
    sql: ${TABLE}.DESTINATION_TYPE ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.NOTES ;;
  }

  dimension: rel_id {
    type: number
    sql: ${TABLE}.REL_ID ;;
  }

  dimension: source_id {
    type: number
    sql: ${TABLE}.SOURCE_ID ;;
  }

  dimension: source_type {
    type: string
    sql: ${TABLE}.SOURCE_TYPE ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
