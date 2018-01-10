view: ancillary_001_chronic_claims {
  sql_table_name: dbo.Ancillary_001_ChronicClaims ;;

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: unique_count {
    type: number
    sql: ${TABLE}.UniqueCount ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
