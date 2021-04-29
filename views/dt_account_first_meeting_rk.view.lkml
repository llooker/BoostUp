view: dt_account_first_meeting_rk {
  derived_table: {
    sql: SELECT
           *,
           ROW_NUMBER() OVER (
             PARTITION BY ACCOUNT
             ORDER BY "START" ASC
           ) AS RK
         FROM FIVETRAN_DATABASE.MONGO_BOOSTUP_FIVETRAN.EVENT
         WHERE ACCOUNT IS NOT NULL;;
  }

  dimension: account {
    hidden: yes
    type: string
    sql: ${TABLE}."ACCOUNT" ;;
  }

  dimension: event_rk {
    hidden: yes
    type: number
    sql: ${TABLE}."rk" ;;
  }

  dimension: is_first_meeting {
    type: yesno
    sql: ${event_rk} = 1 ;;
  }

  measure: count {
    type: count
  }
}
