view: dt_v_opportunity_sage_products {
  derived_table: {
    sql:
      SELECT _ID, VALUE AS SAGE_PRODUCT
      FROM FIVETRAN_DATABASE.MONGO_BOOSTUP_FIVETRAN.V_OPPORTUNITY,
      LATERAL FLATTEN (INPUT => CRM_METADATA_ADDITIONAL_FIELDS:Sage_Products__c)
      WHERE COMPANY = '607fd11d8c93f2b9cb7de2f1'
    ;;
  }

  dimension: _id {
    hidden: yes
    type: string
    primary_key: yes
    sql: ${TABLE}."_ID" ;;
  }

  dimension: sage_product {
    type: number
    sql: ${TABLE}."SAGE_PRODUCT" ;;
  }
}
