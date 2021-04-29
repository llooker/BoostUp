view: event {
  sql_table_name: "MONGO_BOOSTUP_FIVETRAN"."EVENT"
    ;;
  drill_fields: [_id]

  dimension: recurring_event_id {
    type: string
    sql: ${TABLE}."RECURRING_EVENT_ID" ;;
  }

  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}."_FIVETRAN_DELETED" ;;
  }

  dimension_group: _fivetran_synced {
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
    sql: CAST(${TABLE}."_FIVETRAN_SYNCED" AS TIMESTAMP_NTZ) ;;
  }

  dimension: _id {
    type: string
    primary_key: yes
    sql: ${TABLE}."_ID" ;;
  }

  dimension: account {
    type: string
    sql: ${TABLE}."ACCOUNT" ;;
  }

  dimension: account_trace {
    type: string
    sql: ${TABLE}."ACCOUNT_TRACE" ;;
  }

  dimension: attendees {
    type: string
    sql: ${TABLE}."ATTENDEES" ;;
  }

  dimension: calendar {
    type: string
    sql: ${TABLE}."CALENDAR" ;;
  }

  dimension: call {
    type: string
    sql: ${TABLE}."CALL" ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}."COMPANY" ;;
  }

  dimension: conference_data {
    type: string
    sql: ${TABLE}."CONFERENCE_DATA" ;;
  }

  dimension_group: created {
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
    sql: CAST(${TABLE}."CREATED" AS TIMESTAMP_NTZ) ;;
  }

  dimension: creator {
    type: string
    sql: ${TABLE}."CREATOR" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension: dial_info {
    type: string
    sql: ${TABLE}."DIAL_INFO" ;;
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
    sql: CAST(${TABLE}."END" AS TIMESTAMP_NTZ) ;;
  }

  dimension: event_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."EVENT_ID" ;;
  }

  dimension: html_link {
    type: string
    sql: ${TABLE}."HTML_LINK" ;;
  }

  dimension: ical_uid {
    type: string
    sql: ${TABLE}."ICAL_UID" ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}."LOCATION" ;;
  }

  dimension: opportunity {
    type: string
    sql: ${TABLE}."OPPORTUNITY" ;;
  }

  dimension: opportunity_trace {
    type: string
    sql: ${TABLE}."OPPORTUNITY_TRACE" ;;
  }

  dimension: organizer {
    type: string
    sql: ${TABLE}."ORGANIZER" ;;
  }

  dimension_group: start {
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
    sql: CAST(${TABLE}."START" AS TIMESTAMP_NTZ) ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: summary {
    type: string
    sql: ${TABLE}."SUMMARY" ;;
  }

  dimension_group: updated {
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
    sql: CAST(${TABLE}."UPDATED" AS TIMESTAMP_NTZ) ;;
  }

  dimension: user {
    type: string
    sql: ${TABLE}."USER" ;;
  }

  dimension: account_name {
    type: string
    sql: ${v_account.crm_metadata_account_name} ;;
  }

  dimension: is_confirmed {
    type: yesno
    sql: ${status} = 'confirmed' ;;
  }

  measure: count {
    type: count
    drill_fields: [summary,account_name,start_raw,attendees]
  }

  measure: number_of_first_meetings {
    type: count
    filters: [dt_account_first_meeting.is_first_meeting: "Yes"]
    drill_fields: [summary,account_name,start_raw,attendees]
  }
}
