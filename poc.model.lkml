connection: "snowflake"

include: "/views/*.view.lkml"

explore: event {

  access_filter: {
    field: company
    user_attribute: company
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
}
