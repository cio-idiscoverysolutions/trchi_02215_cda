connection: "trchi-02215"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: trchi_02215_cda_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: trchi_02215_cda_default_datagroup

explore: primary_audit {}

explore: relationship {}

explore: script {
  join: users {
    type: left_outer
    sql_on: ${script.user_id} = ${users.user_id} ;;
    relationship: many_to_one
  }
}

explore: users {}


explore: cda {
  label: "CDA"
  join: cda_results{
    type: left_outer
    sql_on: ${cda.cda_id} = ${cda_results.cda_id} ;;
    relationship: one_to_many
    view_label: "CDA Results"
    }
  }
