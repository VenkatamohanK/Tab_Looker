view: sales {
  sql_table_name: `Tableau_Looker_Func.Sales` ;;

  dimension: _unit_price_ {
    type: number
    sql: ${TABLE}._Unit_price_ ;;
  }
  dimension: ord_dt {
    type: string
    sql: ${TABLE}.Ord_Dt ;;
  }
  dimension: prod_id {
    type: number
    sql: ${TABLE}.Prod_Id ;;
  }
  dimension: prod_name {
    type: string
    sql: ${TABLE}.Prod_Name ;;
  }
  dimension: reg_id {
    type: number
    sql: ${TABLE}.Reg_Id ;;
  }
  dimension: units {
    type: number
    sql: ${TABLE}.Units ;;
  }
  measure: count {
    type: count
    drill_fields: [prod_name]
    }

  dimension: date {
    type:  date
   # datatype: date
    sql: cast(${ord_dt} as date) ;;
  }

    measure: Sales {
      group_label: "Count"
      type: number
      sql: sum(${units} * ${_unit_price_}) ;;
      drill_fields: [detail*]
    }

  set: detail {
    fields: [
      region.region_name,
      prod_id,
      prod_name,
      Sales




      
    ]
  }
}
