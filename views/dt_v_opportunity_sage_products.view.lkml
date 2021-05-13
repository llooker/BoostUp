view: dt_v_opportunity_sage_products {
  derived_table: {
    sql:
      SELECT _ID, CAST(VALUE AS STRING) AS SAGE_PRODUCT
      FROM FIVETRAN_DATABASE.MONGO_BOOSTUP_FIVETRAN.V_OPPORTUNITY,
      LATERAL FLATTEN (INPUT => CRM_METADATA_ADDITIONAL_FIELDS:Sage_Products__c)
    ;;
  }

  dimension: _id {
    hidden: yes
    type: string
    primary_key: yes
    sql: ${TABLE}."_ID" ;;
  }

  dimension: sage_product {
    type: string
    sql: ${TABLE}."SAGE_PRODUCT" ;;
  }
}
