view: event_attendees {
  sql_table_name: "MONGO_BOOSTUP_FIVETRAN"."EVENT_ATTENDEES"
    ;;

  dimension: _id {
    type: string
    sql: ${TABLE}."_ID" ;;
  }

  dimension: display_name {
    type: string
    sql: ${TABLE}."DISPLAY_NAME" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: is_self {
    type: yesno
    sql: ${TABLE}."IS_SELF" ;;
  }

  dimension: organizer {
    type: yesno
    sql: ${TABLE}."ORGANIZER" ;;
  }

  dimension: response_status {
    type: string
    sql: ${TABLE}."RESPONSE_STATUS" ;;
  }

  dimension: label {
    type: string
    sql: IFNULL(${TABLE}."DISPLAY_NAME", ${TABLE}."EMAIL")  ;;
  }

  dimension: is_confirmed {
    type: yesno
    sql: ${response_status} IN ('accepted', 'tentative', 'tentativelyAccepted', 'organizer') ;;
  }

  measure: count {
    type: count
    drill_fields: [label]
  }

  measure: attendees_list {
    type: list
    list_field: label
  }
}
