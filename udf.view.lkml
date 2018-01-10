view: udf {
  sql_table_name: udf.UDF ;;

  dimension: udf_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.UDF_ID ;;
  }

  dimension: confidence {
    type: number
    sql: ${TABLE}.CONFIDENCE ;;
  }

  dimension_group: date_beg_lcl {
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
    sql: ${TABLE}.DATE_BEG_LCL ;;
  }

  dimension_group: date_beg_source {
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
    sql: ${TABLE}.DATE_BEG_SOURCE ;;
  }

  dimension_group: date_beg_utc {
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
    sql: ${TABLE}.DATE_BEG_UTC ;;
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

  dimension_group: date_end_lcl {
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
    sql: ${TABLE}.DATE_END_LCL ;;
  }

  dimension_group: date_end_source {
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
    sql: ${TABLE}.DATE_END_SOURCE ;;
  }

  dimension_group: date_end_utc {
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
    sql: ${TABLE}.DATE_END_UTC ;;
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

  dimension: evt_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.EVT_ID ;;
  }

  dimension: gps_lat {
    type: number
    sql: ${TABLE}.GPS_LAT ;;
  }

  dimension: gps_long {
    type: number
    sql: ${TABLE}.GPS_LONG ;;
  }

  dimension: loc_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.LOC_ID ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.NOTES ;;
  }

  dimension: obj_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.OBJ_ID ;;
  }

  dimension: ppl_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.PPL_ID ;;
  }

  dimension: src_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.SRC_ID ;;
  }

  dimension: src_record_id {
    type: number
    sql: ${TABLE}.SRC_RECORD_ID ;;
  }
}
