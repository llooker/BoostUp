view: user_yearly_target {
  sql_table_name: "MONGO_BOOSTUP_FIVETRAN"."USER_YEARLY_TARGET"
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

  dimension: attribute {
    type: string
    sql: ${TABLE}."ATTRIBUTE" ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}."COMPANY" ;;
  }

  dimension: fiscal_year {
    type: number
    sql: ${TABLE}."FISCAL_YEAR" ;;
  }

  dimension: target {
    type: number
    sql: ${TABLE}."TARGET" ;;
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

  dimension: updated_by {
    type: string
    sql: ${TABLE}."UPDATED_BY" ;;
  }

  dimension: user {
    type: string
    sql: ${TABLE}."USER" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
