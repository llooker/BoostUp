view: manager {
  derived_table: {
    sql:
      SELECT
        MANAGER._ID AS _ID,
        USER._ID AS TEAM_MEMBER,
      FROM FIVETRAN_DATABASE.MONGO_BOOSTUP_FIVETRAN.USER AS MANAGER
      LEFT JOIN FIVETRAN_DATABASE.MONGO_BOOSTUP_FIVETRAN.USER AS TEAM_MEMBER ON MANAGER._ID = TEAM_MEMBER.MANAGER
    ;;
  }

  dimension: _id {
    hidden: yes
    type: string
    primary_key: yes
    sql: ${TABLE}."_ID" ;;
  }
}
