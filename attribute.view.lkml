view: attribute {
  sql_table_name: spt.ATTRIBUTE ;;

  dimension: attribute_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ATTRIBUTE_ID ;;
  }

  dimension_group: beg {
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
    sql: ${TABLE}.BEG_DATE ;;
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

  dimension_group: end {
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
    sql: ${TABLE}.END_DATE ;;
  }

  dimension: evt_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.EVT_ID ;;
  }

  dimension: loc_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.LOC_ID ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.NOTES ;;
  }

  #dimension: numeric_value {
  #  type: number
  #  sql: ${TABLE}.NUMERIC_VALUE ;;
  #  link: {
  #    label: "Location Details"
  #    url: "/looks/74?Locationid%20Filter={{ loc.loc_id._value | encode_uri }}"
  #    icon_url: "http://www.looker.com/favicon.ico"
  #  }
  #}

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

  dimension: rel_id {
    type: number
    sql: ${TABLE}.REL_ID ;;
  }

  dimension: src_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.SRC_ID ;;
  }

  dimension: type_id {
    type: number
    sql: ${TABLE}.TYPE_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      attribute_id,
      name,
      ppl.ppl_id,
      ppl.full_name,
      ppl.first_name,
      ppl.middle_name,
      ppl.last_name,
      obj.obj_id,
      obj.name,
      loc.loc_id,
      loc.name,
      evt.evt_id,
      evt.name,
      src.src_id,
      src.name,
      src_attributes.count
    ]
  }
}
