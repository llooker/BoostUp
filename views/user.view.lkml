view: user {
  sql_table_name: "MONGO_BOOSTUP_FIVETRAN"."USER"
    ;;

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

  dimension: crm_metadata_user_id {
    type: string
    sql: ${TABLE}."CRM_METADATA_USER_ID" ;;
  }

  dimension: admin_email_domains {
    type: string
    sql: ${TABLE}."ADMIN_EMAIL_DOMAINS" ;;
  }

  dimension: auth_hash {
    type: string
    sql: ${TABLE}."AUTH_HASH" ;;
  }

  dimension_group: calendar_watcher_last_errored {
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
    sql: CAST(${TABLE}."CALENDAR_WATCHER_LAST_ERRORED_AT" AS TIMESTAMP_NTZ) ;;
  }

  dimension_group: calendar_watcher_last_processed {
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
    sql: CAST(${TABLE}."CALENDAR_WATCHER_LAST_PROCESSED_AT" AS TIMESTAMP_NTZ) ;;
  }

  dimension_group: calendar_watcher_refreshed {
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
    sql: CAST(${TABLE}."CALENDAR_WATCHER_REFRESHED_AT" AS TIMESTAMP_NTZ) ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}."COMPANY" ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}."CREATED_BY" ;;
  }

  dimension: crm_metadata {
    type: string
    sql: ${TABLE}."CRM_METADATA" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: email_verification_token {
    type: string
    sql: ${TABLE}."EMAIL_VERIFICATION_TOKEN" ;;
  }

  dimension_group: email_watcher_last_errored {
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
    sql: CAST(${TABLE}."EMAIL_WATCHER_LAST_ERRORED_AT" AS TIMESTAMP_NTZ) ;;
  }

  dimension_group: email_watcher_last_processed {
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
    sql: CAST(${TABLE}."EMAIL_WATCHER_LAST_PROCESSED_AT" AS TIMESTAMP_NTZ) ;;
  }

  dimension_group: email_watcher_refreshed {
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
    sql: CAST(${TABLE}."EMAIL_WATCHER_REFRESHED_AT" AS TIMESTAMP_NTZ) ;;
  }

  dimension: failed_login_attempts {
    type: number
    sql: ${TABLE}."FAILED_LOGIN_ATTEMPTS" ;;
  }

  dimension: google_calendar_full_sync_done {
    type: yesno
    sql: ${TABLE}."GOOGLE_CALENDAR_FULL_SYNC_DONE" ;;
  }

  dimension: google_email_sync_info {
    type: string
    sql: ${TABLE}."GOOGLE_EMAIL_SYNC_INFO" ;;
  }

  dimension: google_oauth_credentials {
    type: string
    sql: ${TABLE}."GOOGLE_OAUTH_CREDENTIALS" ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}."IS_ACTIVE" ;;
  }

  dimension: is_admin {
    type: yesno
    sql: ${TABLE}."IS_ADMIN" ;;
  }

  dimension: is_anonymous {
    type: yesno
    sql: ${TABLE}."IS_ANONYMOUS" ;;
  }

  dimension: is_authenticated {
    type: yesno
    sql: ${TABLE}."IS_AUTHENTICATED" ;;
  }

  dimension: is_locked_down {
    type: yesno
    sql: ${TABLE}."IS_LOCKED_DOWN" ;;
  }

  dimension: is_login_allowed {
    type: yesno
    sql: ${TABLE}."IS_LOGIN_ALLOWED" ;;
  }

  dimension: is_user_impersonation_allowed {
    type: yesno
    sql: ${TABLE}."IS_USER_IMPERSONATION_ALLOWED" ;;
  }

  dimension_group: last_login {
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
    sql: CAST(${TABLE}."LAST_LOGIN_AT" AS TIMESTAMP_NTZ) ;;
  }

  dimension_group: last_login_attempt {
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
    sql: CAST(${TABLE}."LAST_LOGIN_ATTEMPT_AT" AS TIMESTAMP_NTZ) ;;
  }

  dimension_group: last_updated {
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
    sql: CAST(${TABLE}."LAST_UPDATED" AS TIMESTAMP_NTZ) ;;
  }

  dimension: last_updated_by {
    type: string
    sql: ${TABLE}."LAST_UPDATED_BY" ;;
  }

  dimension: manager {
    type: string
    sql: ${TABLE}."MANAGER" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: outlook_calendar_full_sync_done {
    type: yesno
    sql: ${TABLE}."OUTLOOK_CALENDAR_FULL_SYNC_DONE" ;;
  }

  dimension: outlook_email_sync_info {
    type: string
    sql: ${TABLE}."OUTLOOK_EMAIL_SYNC_INFO" ;;
  }

  dimension: outlook_oauth_credentials {
    type: string
    sql: ${TABLE}."OUTLOOK_OAUTH_CREDENTIALS" ;;
  }

  dimension: profile {
    type: string
    sql: ${TABLE}."PROFILE" ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}."ROLE" ;;
  }

  dimension: role_id {
    type: string
    sql: ${TABLE}."ROLE_ID" ;;
  }

  dimension: salesforce_login_url {
    type: string
    sql: ${TABLE}."SALESFORCE_LOGIN_URL" ;;
  }

  dimension: salesforce_oauth_credentials {
    type: string
    sql: ${TABLE}."SALESFORCE_OAUTH_CREDENTIALS" ;;
  }

  dimension_group: salesforce_token_refreshed {
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
    sql: CAST(${TABLE}."SALESFORCE_TOKEN_REFRESHED_AT" AS TIMESTAMP_NTZ) ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}."TEAM" ;;
  }

  dimension: territories {
    type: string
    sql: ${TABLE}."TERRITORIES" ;;
  }

  dimension: user_settings {
    type: string
    sql: ${TABLE}."USER_SETTINGS" ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
