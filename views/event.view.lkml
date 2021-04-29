view: event {
  sql_table_name: "MONGO_BOOSTUP_FIVETRAN"."EVENT"
    ;;
  drill_fields: [recurring_event_id]

  dimension: recurring_event_id {
    primary_key: yes
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

  measure: count {
    type: count
    drill_fields: [start_date,summary,attendees]
  }

  measure: first_meeting_date {
    type: date_time
    sql: MIN(${start_raw}) ;;
  }

  measure: number_of_first_meetings {
    type: count
    filters: [dt_account_first_meeting_rk.is_first_meeting: "Yes"]
    drill_fields: [_id,start_raw,summary,attendees]
  }

}
