connection: "snowflake"

include: "/views/*.view.lkml"

explore: event {
  access_filter: {
    field: company
    user_attribute: company
  }
  join: company{
    type: inner
    sql_on: ${event.company} = ${company._id} ;;
    relationship: many_to_one
  }
  join: user {
    type: inner
    sql_on: ${event.user} = ${user._id} ;;
    relationship: many_to_one
  }
  join: dt_account_facts {
    type: left_outer
    sql_on: ${dt_account_facts.event_account} = ${event.account} ;;
    relationship: many_to_one
  }
  join: dt_account_first_meeting_rk {
    type: left_outer
    sql_on: ${dt_account_first_meeting_rk.account} = ${event.account} ;;
    relationship: many_to_one
  }
}

explore: user {
  join: company {
    type: inner
    sql_on: ${user.company} = ${company._id};;
    relationship: many_to_one
  }
  join: manager {
    from: user
    type: left_outer
    relationship: many_to_one
    sql_on: ${user.manager} = ${manager._id} ;;
  }
}

explore: v_opportunity {
  join: user {
    type: inner
    sql_on: ${v_opportunity.user} = ${user._id} ;;
    relationship: many_to_one
  }
  join: manager {
    from: user
    type: left_outer
    relationship: many_to_one
    sql_on: ${user.manager} = ${manager._id} ;;
  }
  join: v_account {
    type:  inner
    sql_on: ${v_opportunity.account} = ${v_account._id} ;;
    relationship: many_to_one
  }
  join: company{
    type: inner
    sql_on: ${v_opportunity.company} = ${company._id} ;;
    relationship: many_to_one
  }
  join: v_opportunity_update {
    type: inner
    sql_on: ${v_opportunity._id} = ${v_opportunity_update.opportunity};;
    relationship: many_to_many
  }
}

explore: v_account {
  join: user {
    type: inner
    sql_on: ${v_account.user} = ${user._id} ;;
    relationship: many_to_one
  }
  join: manager {
    from: user
    type: left_outer
    relationship: many_to_one
    sql_on: ${user.manager} = ${manager._id} ;;
  }
  join: v_opportunity {
    type:  inner
    sql_on: ${v_account._id} = ${v_opportunity.account} ;;
    relationship: one_to_many
  }
  join: company{
    type: inner
    sql_on: ${v_account.company} = ${company._id} ;;
    relationship: many_to_one
  }
}
