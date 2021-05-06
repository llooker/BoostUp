view: dt_pipeline_progress {
  derived_table: {
    sql:
      WITH V_O_BOOKED AS (
        SELECT V_O.USER AS USER,
        COUNT(*) AS COUNT,
        SUM(CRM_METADATA_AMOUNT) AS AMOUNT
        FROM FIVETRAN_DATABASE.MONGO_BOOSTUP_FIVETRAN.V_OPPORTUNITY AS V_O
        WHERE V_O.CRM_METADATA_OPPORTUNITY_CLOSED = TRUE
        AND V_O.CRM_METADATA_OPPORTUNITY_WON = TRUE
        AND {% condition close_date %} V_O.CRM_METADATA_CLOSE_DATE {% endcondition %}
        GROUP BY 1
      ),
      V_O_FORECAST AS (
        SELECT V_O.USER AS USER,
        COUNT(*) AS COUNT,
        SUM(V_O.CRM_METADATA_AMOUNT) AS AMOUNT
        FROM FIVETRAN_DATABASE.MONGO_BOOSTUP_FIVETRAN.V_OPPORTUNITY AS V_O
        WHERE V_O.CRM_METADATA_OPPORTUNITY_CLOSED <> TRUE
        AND {% condition forecast_categories %} V_O.CRM_METADATA_FORECAST_CATEGORY_NAME {% endcondition %}
        AND {% condition close_date %} V_O.CRM_METADATA_CLOSE_DATE {% endcondition %}
        GROUP BY 1
      ),
      U_Q_T AS (
        SELECT U_Q_T.USER AS USER,
        SUM(U_Q_T.TARGET) AS TARGET
        FROM FIVETRAN_DATABASE.MONGO_BOOSTUP_FIVETRAN.USER_QUARTERLY_TARGET AS U_Q_T
        WHERE {% condition fiscal_year %} U_Q_T.FISCAL_YEAR {% endcondition %}
        AND {% condition quarter %} U_Q_T.QUARTER {% endcondition %}
        GROUP BY 1
      )
      SELECT
        USER._ID AS USER,
        USER_MANAGER.NAME AS MANAGER,
        COALESCE(U_Q_T.TARGET, 0) AS TARGET,
        COALESCE(V_O_BOOKED.AMOUNT, 0) AS BOOKED,
        COALESCE(V_O_FORECAST.AMOUNT, 0) AS FORECAST
      FROM FIVETRAN_DATABASE.MONGO_BOOSTUP_FIVETRAN.USER AS USER
      LEFT JOIN FIVETRAN_DATABASE.MONGO_BOOSTUP_FIVETRAN.USER AS USER_MANAGER ON USER.MANAGER = USER_MANAGER._ID
      LEFT JOIN V_O_BOOKED ON USER._ID = V_O_BOOKED.USER
      LEFT JOIN V_O_FORECAST ON USER._ID = V_O_FORECAST.USER
      LEFT JOIN U_Q_T ON USER._ID = U_Q_T.USER
    ;;
  }

  filter: fiscal_year {
    type: number
  }

  filter: quarter {
    type: number
  }

  filter: forecast_categories {
    type: string
    default_value: "Pipeline,Commit,Best Case"
    suggestions: ["Pipeline", "Commit", "Best Case"]
  }

  filter: close_date {
    type: date
  }

  dimension: user {
    hidden: yes
    type: string
    primary_key: yes
    sql: ${TABLE}."USER" ;;
  }

  dimension: target {
    type: number
    sql: ${TABLE}."TARGET" ;;
  }

  dimension: booked {
    type: number
    sql: ${TABLE}."BOOKED" ;;
  }

  dimension: forecast {
    type: number
    sql: ${TABLE}."FORECAST" ;;
  }

  measure: total_booked {
    type:  sum
    sql: ${TABLE}.booked ;;
  }

  measure: total_target {
    type:  sum
    sql: ${TABLE}.target ;;
  }

  measure: total_forecast {
    type:  sum
    sql: ${TABLE}.forecast ;;
  }

}
