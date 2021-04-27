view: dt_account_facts {
  derived_table: {
    sql: SELECT
          event."ACCOUNT"  AS "event.account",
              (TO_CHAR(DATE_TRUNC('second', MIN(CAST(event."START" AS TIMESTAMP_NTZ) )), 'YYYY-MM-DD HH24:MI:SS')) AS "event.first_meeting_date",
          COUNT(*) AS "event.count"
      FROM "MONGO_BOOSTUP_FIVETRAN"."EVENT"
           AS event
      GROUP BY
          1
       ;;
  }

  dimension: event_account {
    hidden: yes
    type: string
    sql: ${TABLE}."event.account" ;;
  }

  dimension: event_first_meeting_date {
    hidden: yes
    type: string
    sql: ${TABLE}."event.first_meeting_date" ;;
  }

  dimension: number_of_meetings {
    hidden: yes
    type: number
    sql: ${TABLE}."event.count" ;;
  }

  dimension: is_first_meeting {
    type: yesno
    sql: ${event_first_meeting_date} = ${event.start_raw} ;;
  }

}
