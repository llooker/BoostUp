connection: "snowflake"

include: "/views/*.view.lkml"

explore: event_attendees {
  always_filter: {
    filters: [event_attendees.response_status: "accepted,tentative,tentativelyAccepted,organizer"]
  }
  join: event{
    type: inner
    sql_on: ${event_attendees._id} = ${event._id} ;;
    relationship: many_to_one
  }
  join: v_account{
    type: left_outer
    sql_on: ${event.account} = ${v_account._id} ;;
    relationship: many_to_one
  }
  join: user {
    type: inner
    sql_on: ${event_attendees.email} = ${user.email} and ${event.company} = ${user.company};;
    relationship: many_to_many
  }
  join: company{
    type: inner
    sql_on: ${event.company} = ${company._id} ;;
    relationship: many_to_one
  }
  join: dt_account_first_meeting {
    type: left_outer
    sql_on: ${dt_account_first_meeting._id} = ${event._id} ;;
    relationship: many_to_one
  }
}

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
  join: v_account {
    type: left_outer
    sql_on: ${event.account} = ${v_account._id} ;;
    relationship: many_to_one
  }
  join: v_opportunity {
    type:  left_outer
    sql_on: ${event.opportunity} = ${v_opportunity._id} ;;
    relationship: many_to_one
  }
  join: event_attendees {
    type: left_outer
    sql_on: ${event._id} = ${event_attendees._id} ;;
    relationship: one_to_many
  }
  join: dt_account_first_meeting {
    type: left_outer
    sql_on: ${dt_account_first_meeting._id} = ${event._id} ;;
    relationship: many_to_one
  }
}

explore: user {
  access_filter: {
    field: company
    user_attribute: company
  }
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
  join: salesforce_user {
    type:  left_outer
    relationship: one_to_one
    sql_on: ${user.company} = ${salesforce_user.company} AND ${user.crm_metadata_user_id} = ${salesforce_user.user_id};;
  }
}

explore: v_opportunity {
  access_filter: {
    field: company
    user_attribute: company
  }
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
  access_filter: {
    field: company
    user_attribute: company
  }
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
