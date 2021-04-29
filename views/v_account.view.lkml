view: v_account {
  sql_table_name: "MONGO_BOOSTUP_FIVETRAN"."V_ACCOUNT"
    ;;

  dimension_group: _boostup_transformed {
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
    sql: CAST(${TABLE}."_BOOSTUP_TRANSFORMED" AS TIMESTAMP_NTZ) ;;
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

  dimension: account_owner_emails_count {
    type: number
    sql: ${TABLE}."ACCOUNT_OWNER_EMAILS_COUNT" ;;
  }

  dimension_group: account_renewal {
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
    sql: CAST(${TABLE}."ACCOUNT_RENEWAL_DATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: account_value {
    type: number
    sql: ${TABLE}."ACCOUNT_VALUE" ;;
  }

  dimension: activity_count {
    type: number
    sql: ${TABLE}."ACTIVITY_COUNT" ;;
  }

  dimension: activity_sync_info {
    type: string
    sql: ${TABLE}."ACTIVITY_SYNC_INFO" ;;
  }

  dimension: additional_email_domains {
    type: string
    sql: ${TABLE}."ADDITIONAL_EMAIL_DOMAINS" ;;
  }

  dimension: allow_read_assignments {
    type: string
    sql: ${TABLE}."ALLOW_READ_ASSIGNMENTS" ;;
  }

  dimension: allow_write_assignments {
    type: string
    sql: ${TABLE}."ALLOW_WRITE_ASSIGNMENTS" ;;
  }

  dimension: buyer_emails_count {
    type: number
    sql: ${TABLE}."BUYER_EMAILS_COUNT" ;;
  }

  dimension: call_customer_outreach_email_addresses {
    type: string
    sql: ${TABLE}."CALL_CUSTOMER_OUTREACH_EMAIL_ADDRESSES" ;;
  }

  dimension: call_metadata {
    type: string
    sql: ${TABLE}."CALL_METADATA" ;;
  }

  dimension: closed_opportunities {
    type: number
    sql: ${TABLE}."CLOSED_OPPORTUNITIES" ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}."COMPANY" ;;
  }

  dimension: contact_email_domain_counts {
    type: string
    sql: ${TABLE}."CONTACT_EMAIL_DOMAIN_COUNTS" ;;
  }

  dimension: contacts {
    type: string
    sql: ${TABLE}."CONTACTS" ;;
  }

  dimension: contacts_engaged {
    type: number
    sql: ${TABLE}."CONTACTS_ENGAGED" ;;
  }

  dimension: contacts_touched {
    type: number
    sql: ${TABLE}."CONTACTS_TOUCHED" ;;
  }

  dimension: crm_metadata {
    type: string
    sql: ${TABLE}."CRM_METADATA" ;;
  }

  dimension: crm_metadata_account_id {
    type: string
    sql: ${TABLE}."CRM_METADATA_ACCOUNT_ID" ;;
  }

  dimension: crm_metadata_account_name {
    type: string
    sql: ${TABLE}."CRM_METADATA_ACCOUNT_NAME" ;;
  }

  dimension: crm_metadata_additional_fields {
    type: string
    sql: ${TABLE}."CRM_METADATA_ADDITIONAL_FIELDS" ;;
  }

  dimension_group: email_added {
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
    sql: CAST(${TABLE}."EMAIL_ADDED_AT" AS TIMESTAMP_NTZ) ;;
  }

  dimension: email_customer_outreach_email_addresses {
    type: string
    sql: ${TABLE}."EMAIL_CUSTOMER_OUTREACH_EMAIL_ADDRESSES" ;;
  }

  dimension: email_domain {
    type: string
    sql: ${TABLE}."EMAIL_DOMAIN" ;;
  }

  dimension: email_metadata {
    type: string
    sql: ${TABLE}."EMAIL_METADATA" ;;
  }

  dimension_group: event_added {
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
    sql: CAST(${TABLE}."EVENT_ADDED_AT" AS TIMESTAMP_NTZ) ;;
  }

  dimension: event_count {
    type: number
    sql: ${TABLE}."EVENT_COUNT" ;;
  }

  dimension: event_customer_outreach_email_addresses {
    type: string
    sql: ${TABLE}."EVENT_CUSTOMER_OUTREACH_EMAIL_ADDRESSES" ;;
  }

  dimension: event_metadata {
    type: string
    sql: ${TABLE}."EVENT_METADATA" ;;
  }

  dimension_group: event_processing_locked {
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
    sql: CAST(${TABLE}."EVENT_PROCESSING_LOCKED_AT" AS TIMESTAMP_NTZ) ;;
  }

  dimension_group: event_processing_selected {
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
    sql: CAST(${TABLE}."EVENT_PROCESSING_SELECTED_AT" AS TIMESTAMP_NTZ) ;;
  }

  dimension: events_count {
    type: number
    sql: ${TABLE}."EVENTS_COUNT" ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}."IS_ACTIVE" ;;
  }

  dimension: is_partner {
    type: yesno
    sql: ${TABLE}."IS_PARTNER" ;;
  }

  dimension: last_activity {
    type: string
    sql: ${TABLE}."LAST_ACTIVITY" ;;
  }

  dimension_group: last_engaged {
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
    sql: CAST(${TABLE}."LAST_ENGAGED" AS TIMESTAMP_NTZ) ;;
  }

  dimension: last_event {
    type: string
    sql: ${TABLE}."LAST_EVENT" ;;
  }

  dimension_group: last_processed {
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
    sql: CAST(${TABLE}."LAST_PROCESSED" AS TIMESTAMP_NTZ) ;;
  }

  dimension_group: last_risk_score_process {
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
    sql: CAST(${TABLE}."LAST_RISK_SCORE_PROCESS_TIME" AS TIMESTAMP_NTZ) ;;
  }

  dimension_group: last_touched {
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
    sql: CAST(${TABLE}."LAST_TOUCHED" AS TIMESTAMP_NTZ) ;;
  }

  dimension_group: last_update {
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
    sql: CAST(${TABLE}."LAST_UPDATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: next_event {
    type: string
    sql: ${TABLE}."NEXT_EVENT" ;;
  }

  dimension: open_amount {
    type: number
    sql: ${TABLE}."OPEN_AMOUNT" ;;
  }

  dimension: open_opportunities {
    type: number
    sql: ${TABLE}."OPEN_OPPORTUNITIES" ;;
  }

  dimension: pending_emails {
    type: string
    sql: ${TABLE}."PENDING_EMAILS" ;;
  }

  dimension: pending_events {
    type: string
    sql: ${TABLE}."PENDING_EVENTS" ;;
  }

  dimension: positive_indicators {
    type: string
    sql: ${TABLE}."POSITIVE_INDICATORS" ;;
  }

  dimension: previous_risk_score {
    type: number
    sql: ${TABLE}."PREVIOUS_RISK_SCORE" ;;
  }

  dimension: risk_factors {
    type: string
    sql: ${TABLE}."RISK_FACTORS" ;;
  }

  dimension: risk_history {
    type: string
    sql: ${TABLE}."RISK_HISTORY" ;;
  }

  dimension: risk_score {
    type: number
    sql: ${TABLE}."RISK_SCORE" ;;
  }

  dimension: risk_status {
    type: string
    sql: ${TABLE}."RISK_STATUS" ;;
  }

  dimension: root_account {
    type: string
    sql: ${TABLE}."ROOT_ACCOUNT" ;;
  }

  dimension: seller_emails_count {
    type: number
    sql: ${TABLE}."SELLER_EMAILS_COUNT" ;;
  }

  dimension: seller_time_spent {
    type: number
    sql: ${TABLE}."SELLER_TIME_SPENT" ;;
  }

  dimension: target_value {
    type: number
    sql: ${TABLE}."TARGET_VALUE" ;;
  }

  dimension: territories {
    type: string
    sql: ${TABLE}."TERRITORIES" ;;
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
    sql: CAST(${TABLE}."UPDATED_AT" AS TIMESTAMP_NTZ) ;;
  }

  dimension: user {
    type: string
    sql: ${TABLE}."USER" ;;
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}."USER_NAME" ;;
  }

  dimension: won_amount {
    type: number
    sql: ${TABLE}."WON_AMOUNT" ;;
  }

  measure: count {
    type: count
    drill_fields: [user_name, crm_metadata_account_name]
  }
}
