view: users {
  sql_table_name: dbo.USERS ;;

  dimension: user_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.USER_ID ;;
  }

  dimension: access_level {
    type: number
    sql: ${TABLE}.ACCESS_LEVEL ;;
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

  dimension: email_address {
    type: string
    sql: ${TABLE}.EMAIL_ADDRESS ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.FIRST_NAME ;;
  }

  dimension: is_active {
    type: string
    sql: ${TABLE}.IS_ACTIVE ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.LAST_NAME ;;
  }

  dimension: password_hash {
    type: string
    sql: ${TABLE}.PASSWORD_HASH ;;
  }

  dimension: password_salt {
    type: string
    sql: ${TABLE}.PASSWORD_SALT ;;
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}.USER_NAME ;;
  }

  measure: count {
    type: count
    drill_fields: [user_id, user_name, first_name, last_name, script.count]
  }
}
