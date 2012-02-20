use nomis_warehouse
go
truncate table dim_inventory
--go
insert into dim_inventory (inventory_number,inventory_desc_1, inventory_desc_2, inventory_selling, inventory_purchasing, inventory_selling_factor, inventory_non_stock, inventory_cost_last, inventory_product_code, inventory_avg_cost_on_hand,product_id)
SELECT CIEQCF AS inventory_number
     , CIODTY AS inventory_desc_1
     , CIOETY AS inventory_desc_2
     , CIKUVC AS inventory_selling
     , CIKVVC AS inventory_purchasing
     , CIMFND AS inventory_selling_factor       
     , CIHOSU AS inventory_non_stock
     , CILHVC AS inventory_cost_last
     , CIC5AA AS inventory_product_code
     , CILIVC AS inventory_avg_cost_on_hand 
     , product_id as product_id
--INTO dim_inventory
FROM NOMIS.NOMDBF95.INVPHY01 
inner join dim_productcodes
on CIC5AA = product_code
where CIEQCF <> '18B0263X012'    
and ciaqnb = 1
go
select * from dim_inventory



