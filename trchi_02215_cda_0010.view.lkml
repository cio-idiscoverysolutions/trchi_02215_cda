view: trchi_02215_cda_0010 {
  derived_table: {
    sql: Select c.DESCRIPTION 'CDA Name'
        , cr.RESULTS_NUM_VALUE 'Risk Level'
        --, o.OBJ_ID
        , o.NAME 'File/Folder'
      --  , u.UDF_ID
        , u.DATE_BEG_source 'Activity Date'
        , p.FULL_NAME
        , e.NAME As 'Event'
      --Select distinct convert(Date, date_beg_source)
      From cda.CDA_RESULTS cr
        Inner Join cda.CDA c
          ON cr.CDA_ID = c.CDA_ID
        Inner Join udf.UDF u
          ON cr.UDF_ID = u.UDF_ID
        Inner Join dim.OBJ o
          ON o.OBJ_ID = u.OBJ_ID
        Inner Join dim.EVT e
          ON e.EVT_ID = u.EVT_ID
        Inner Join dim.PPL p
          ON p.PPL_ID = u.PPL_ID
      Where cr.CDA_ID = 11
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: number_of_unique_visits {
    type: count_distinct
    sql: ${activity_date_time} ;;
  }

  dimension: cda_name {
    type: string
    label: "CDA Name"
    sql: ${TABLE}."CDA Name" ;;
  }

  dimension: risk_level {
    type: string
    label: "Risk Level"
    sql: ${TABLE}."Risk Level" ;;
  }

  dimension: filefolder {
    type: string
    sql: ${TABLE}."File/Folder" ;;
  }

  dimension_group: activity_date {
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
    sql: ${TABLE}."Activity Date" ;;
  }

  dimension: full_name {
    type: string
    sql: ${TABLE}.FULL_NAME ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.Event ;;
  }

  set: detail {
    fields: [
      cda_name,
      risk_level,
      filefolder,
      activity_date_raw,
      activity_date_time,
      activity_date_date,
      activity_date_week,
      activity_date_month,
      activity_date_quarter,
      activity_date_year,
      full_name,
      event
    ]
  }
}
