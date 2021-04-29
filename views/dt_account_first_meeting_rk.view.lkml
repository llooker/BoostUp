view: dt_account_first_meeting {
  derived_table: {
    sql: SELECT
           _ID,
           ACCOUNT,
           "START",
           ROW_NUMBER() OVER (
             PARTITION BY ACCOUNT
             ORDER BY "START" ASC
           ) AS RK
         FROM FIVETRAN_DATABASE.MONGO_BOOSTUP_FIVETRAN.EVENT
         WHERE ACCOUNT IS NOT NULL;;
  }

  dimension: _id {
    hidden: yes
    type: string
    primary_key: yes
    sql: ${TABLE}."_ID" ;;
  }

  dimension: account {
    hidden: yes
    type: string
    sql: ${TABLE}."ACCOUNT" ;;
  }

  dimension: rk {
    hidden: yes
    type: number
    sql: ${TABLE}."RK" ;;
  }

  dimension: is_first_meeting {
    type: yesno
    sql: ${rk} = 1 ;;
  }

  measure: count {
    type: count
  }
}
