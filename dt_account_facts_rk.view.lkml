view: dt_account_facts_rk {
  derived_table: {
    sql: SELECT _ID, ACCOUNT
           ROW_NUMBER() OVER (
             PARTITION BY ACCOUNT
             ORDER BY "START" ASC
           ) AS RK
         FROM FIVETRAN_DATABASE.MONGO_BOOSTUP_FIVETRAN.EVENT
         WHERE ACCOUNT IS NOT NULL;;
  }

  dimension: event_account {
    hidden: yes
    type: string
    sql: ${TABLE}."account" ;;
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
}
