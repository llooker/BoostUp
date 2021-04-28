view: v_opportunity {
  sql_table_name: "MONGO_BOOSTUP_FIVETRAN"."V_OPPORTUNITY"
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

  dimension: account {
    type: string
    sql: ${TABLE}."ACCOUNT" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: account_owner_emails_count {
    type: number
    sql: ${TABLE}."ACCOUNT_OWNER_EMAILS_COUNT" ;;
  }

  dimension: account_positive_indicators {
    type: string
    sql: ${TABLE}."ACCOUNT_POSITIVE_INDICATORS" ;;
  }

  dimension: account_risk_factors {
    type: string
    sql: ${TABLE}."ACCOUNT_RISK_FACTORS" ;;
  }

  dimension: account_risk_score {
    type: number
    sql: ${TABLE}."ACCOUNT_RISK_SCORE" ;;
  }

  dimension: activity_count {
    type: number
    sql: ${TABLE}."ACTIVITY_COUNT" ;;
  }

  dimension: activity_sync_info {
    type: string
    sql: ${TABLE}."ACTIVITY_SYNC_INFO" ;;
  }

  dimension: activity_sync_status {
    type: string
    sql: ${TABLE}."ACTIVITY_SYNC_STATUS" ;;
  }

  dimension: allow_read_account_assignments {
    type: string
    sql: ${TABLE}."ALLOW_READ_ACCOUNT_ASSIGNMENTS" ;;
  }

  dimension: allow_read_assignments {
    type: string
    sql: ${TABLE}."ALLOW_READ_ASSIGNMENTS" ;;
  }

  dimension: allow_write_account_assignments {
    type: string
    sql: ${TABLE}."ALLOW_WRITE_ACCOUNT_ASSIGNMENTS" ;;
  }

  dimension: allow_write_assignments {
    type: string
    sql: ${TABLE}."ALLOW_WRITE_ASSIGNMENTS" ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}."AMOUNT" ;;
  }

  dimension: amount_override {
    type: number
    sql: ${TABLE}."AMOUNT_OVERRIDE" ;;
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

  dimension: company {
    type: string
    sql: ${TABLE}."COMPANY" ;;
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

  dimension: crm_metadata_additional_fields {
    type: string
    sql: ${TABLE}."CRM_METADATA_ADDITIONAL_FIELDS" ;;
  }

  dimension: crm_metadata_amount {
    type: number
    sql: ${TABLE}."CRM_METADATA_AMOUNT" ;;
  }

  dimension_group: crm_metadata_close {
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
    sql: ${TABLE}."CRM_METADATA_CLOSE_DATE" ;;
  }

  dimension_group: crm_metadata_created {
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
    sql: ${TABLE}."CRM_METADATA_CREATED_AT" ;;
  }

  dimension: crm_metadata_forecast_category_name {
    type: string
    sql: ${TABLE}."CRM_METADATA_FORECAST_CATEGORY_NAME" ;;
  }

  dimension: crm_metadata_opportunity_closed {
    type: yesno
    sql: ${TABLE}."CRM_METADATA_OPPORTUNITY_CLOSED" ;;
  }

  dimension: crm_metadata_opportunity_id {
    type: string
    sql: ${TABLE}."CRM_METADATA_OPPORTUNITY_ID" ;;
  }

  dimension: crm_metadata_opportunity_name {
    type: string
    sql: ${TABLE}."CRM_METADATA_OPPORTUNITY_NAME" ;;
  }

  dimension: crm_metadata_opportunity_stage {
    type: string
    sql: ${TABLE}."CRM_METADATA_OPPORTUNITY_STAGE" ;;
  }

  dimension: crm_metadata_opportunity_won {
    type: yesno
    sql: ${TABLE}."CRM_METADATA_OPPORTUNITY_WON" ;;
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

  dimension: email_metadata {
    type: string
    sql: ${TABLE}."EMAIL_METADATA" ;;
  }

  dimension_group: email_processing_locked {
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
    sql: CAST(${TABLE}."EMAIL_PROCESSING_LOCKED_AT" AS TIMESTAMP_NTZ) ;;
  }

  dimension_group: email_processing_selected {
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
    sql: CAST(${TABLE}."EMAIL_PROCESSING_SELECTED_AT" AS TIMESTAMP_NTZ) ;;
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

  dimension: opportunity_stage {
    type: string
    sql: ${TABLE}."OPPORTUNITY_STAGE" ;;
  }

  dimension_group: opportunity_stage_last_update {
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
    sql: CAST(${TABLE}."OPPORTUNITY_STAGE_LAST_UPDATE" AS TIMESTAMP_NTZ) ;;
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

  dimension: previous_account_risk_score {
    type: number
    sql: ${TABLE}."PREVIOUS_ACCOUNT_RISK_SCORE" ;;
  }

  dimension: previous_risk_score {
    type: number
    sql: ${TABLE}."PREVIOUS_RISK_SCORE" ;;
  }

  dimension: progression_positive_indicators {
    type: string
    sql: ${TABLE}."PROGRESSION_POSITIVE_INDICATORS" ;;
  }

  dimension: progression_risk_factors {
    type: string
    sql: ${TABLE}."PROGRESSION_RISK_FACTORS" ;;
  }

  dimension: progression_risk_score {
    type: number
    sql: ${TABLE}."PROGRESSION_RISK_SCORE" ;;
  }

  dimension: progression_risk_status {
    type: string
    sql: ${TABLE}."PROGRESSION_RISK_STATUS" ;;
  }

  dimension: risk_factors {
    type: string
    sql: ${TABLE}."RISK_FACTORS" ;;
  }

  dimension: risk_score {
    type: number
    sql: ${TABLE}."RISK_SCORE" ;;
  }

  dimension: risk_status {
    type: string
    sql: ${TABLE}."RISK_STATUS" ;;
  }

  dimension: seller_emails_count {
    type: number
    sql: ${TABLE}."SELLER_EMAILS_COUNT" ;;
  }

  dimension: seller_time_spent {
    type: number
    sql: ${TABLE}."SELLER_TIME_SPENT" ;;
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

  measure: count {
    type: count
    drill_fields: [crm_metadata_opportunity_name, crm_metadata_forecast_category_name, user_name, account_name]
  }
}
