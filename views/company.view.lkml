view: company {
  sql_table_name: "MONGO_BOOSTUP_FIVETRAN"."COMPANY"
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
    sql: ${TABLE}."_ID" ;;
  }

  dimension: active {
    type: yesno
    sql: ${TABLE}."ACTIVE" ;;
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
    sql: CAST(${TABLE}."CREATED_AT" AS TIMESTAMP_NTZ) ;;
  }

  dimension: deal_risk_analyzer_info {
    type: string
    sql: ${TABLE}."DEAL_RISK_ANALYZER_INFO" ;;
  }

  dimension: email_domain {
    type: string
    sql: ${TABLE}."EMAIL_DOMAIN" ;;
  }

  dimension: email_domain_aliases {
    type: string
    sql: ${TABLE}."EMAIL_DOMAIN_ALIASES" ;;
  }

  dimension: is_dashboard_activated {
    type: yesno
    sql: ${TABLE}."IS_DASHBOARD_ACTIVATED" ;;
  }

  dimension: outlook_oauth_credentials {
    type: string
    sql: ${TABLE}."OUTLOOK_OAUTH_CREDENTIALS" ;;
  }

  dimension: salesforce_sync_info {
    type: string
    sql: ${TABLE}."SALESFORCE_SYNC_INFO" ;;
  }

  dimension: settings {
    type: string
    sql: ${TABLE}."SETTINGS" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
