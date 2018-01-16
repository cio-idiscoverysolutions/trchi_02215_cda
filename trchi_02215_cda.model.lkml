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

explore: trchi_02215_cda_0005 {
  from: trchi_02215_cda_0005
}

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


explore: cda_results {
  label: "cda results"
  join: cda{
    type: left_outer
    sql_on: ${cda_results.cda_id} = ${cda.cda_id} ;;
    relationship: one_to_many
    view_label: "CDA"
    }
  join: udf{
    type: left_outer
    sql_on: ${cda_results.udf_id} = ${udf.udf_id} ;;
    relationship: one_to_many
    view_label: "UDF"
  }

  join: ppl{
    type: left_outer
    sql_on: ${cda_results.ppl_id} = ${ppl.ppl_id} ;;
    relationship: one_to_many
    view_label: "People "

  }
  join: obj{
    type: left_outer
    sql_on: ${cda_results.obj_id} = ${obj.obj_id} ;;
    relationship: one_to_many
    view_label: "Object"
  }
  join: loc{
    type: left_outer
    sql_on: ${cda_results.loc_id} = ${loc.loc_id} ;;
    relationship: one_to_many
  }
  join: evt{
    type: left_outer
    sql_on: ${cda_results.evt_id} = ${evt.evt_id} ;;
    relationship: one_to_many
  }
  join: ppl_attribute{
    from: attribute
    type: left_outer
    sql_on: ${ppl.ppl_id} = ${ppl_attribute.ppl_id} ;;
    relationship: one_to_many
  }

  join: obj_attribute{
    from: attribute
    type: left_outer
    sql_on: ${obj.obj_id} = ${obj_attribute.obj_id} ;;
    relationship: one_to_many
  }
  join: loc_attribute{
    from: attribute
    type: left_outer
    sql_on: ${loc.loc_id} = ${loc_attribute.loc_id} ;;
    relationship: one_to_many
  }
  join: evt_attribute{
    from: attribute
    type: left_outer
    sql_on: ${evt_attribute.evt_id} = ${evt_attribute.evt_id} ;;
    relationship: one_to_many
  }



  }
