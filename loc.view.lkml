view: loc {
  sql_table_name: dim.LOC ;;

  dimension: loc_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.LOC_ID ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.ADDRESS ;;
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

  dimension: gps_lat {
    type: number
    sql: ${TABLE}.GPS_LAT ;;
  }

  dimension: gps_long {
    type: number
    sql: ${TABLE}.GPS_LONG ;;
  }

  dimension: gps_location {
    type: location
    sql_latitude: ${TABLE}.gps_lat ;;
    sql_longitude: ${TABLE}.gps_long ;;
    # drill_fields: [ppl.ppl_id,ppl.full_name]
#     link: {
#       label: "Location Details"
# #       url: "/looks/74?LocationID%20Filter={{ loc.loc_id | encode_uri }}"
#         url: "/looks/74?&f[loc.Locationid_Filter]={{ loc.loc_id | encode_uri }}"
#         icon_url: "http://www.looker.com/favicon.ico"
#     }

  }

  dimension: name {
    type: string
    label: "Location Type"
    sql: ${TABLE}.NAME ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.NOTES ;;
  }

  dimension: type_id {
    type: number
    sql: ${TABLE}.TYPE_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [loc_id, name, attribute.count, udf.count, udf_enrichment_audit.count]
  }
}
