connection: "snowflake"

include: "/views/*.view.lkml"

explore: event {
  join: user {
    type: inner
    sql_on: ${event.user} = ${user._id} ;;
    relationship: many_to_one
  }
}
