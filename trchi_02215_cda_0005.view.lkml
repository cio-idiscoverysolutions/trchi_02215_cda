view: trchi_02215_cda_0005 {
  derived_table: {
    sql: Select c.DESCRIPTION 'CDA Name'
        , case when cr.RESULTS_NUM_VALUE = 50 then 'Low: Other file activity'
          when cr.RESULTS_NUM_VALUE = 10 then 'Medium: File activity on USB'
          when cr.RESULTS_NUM_VALUE = 0 then 'High: USB insertion' else 'Undetermined' end as risk
        , o.NAME 'File/Folder'
        , u.DATE_BEG_SOURCE 'Activity Date'
        , p.FULL_NAME
        , e.NAME As 'Event'
        , att.DESCRIPTION 'Activity Detail'
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
        Left Join spt.ATTRIBUTE att
          ON att.OBJ_ID = o.OBJ_ID
          AND att.PPL_ID = p.PPL_ID
          and att.EVT_ID = e.EVT_ID
      Where cr.CDA_ID = 6
      ORDER BY u.DATE_BEG_SOURCE, RESULTS_NUM_VALUE
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cda_name {
    type: string
    label: "CDA Name"
    sql: ${TABLE}."CDA Name" ;;
  }

  dimension: risk {
    type: string
    sql: ${TABLE}.risk ;;
  }

  dimension: filefolder {
    type: string
    sql: ${TABLE}."File/Folder" ;;
  }

  dimension: activity_date {
    type: string
    label: "Activity Date"
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

  dimension: activity_detail {
    type: string
    label: "Activity Detail"
    sql: ${TABLE}."Activity Detail" ;;
  }

  set: detail {
    fields: [
      cda_name,
      risk,
      filefolder,
      activity_date,
      full_name,
      event,
      activity_detail
    ]
  }
}
