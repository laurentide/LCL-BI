use nomis_warehouse
go
truncate table fact_warehouse_inventory
--drop table fact_warehouse_inventory
go
insert into fact_warehouse_inventory (warehouse_id,inventory_id, warehouse_code, inventory_number, qty_on_hand, qty_on_order, qty_backordered, qty_on_reserve, date_last_sold, Reorder_Flag)
select warehouse_id
     , inventory_id
     , EBD6CF AS warehouse_code
     , EBEQCF as inventory_number
     , EBJPNB AS qty_on_hand 
     , EBJQNB as qty_on_order
     , EBA0NB as qty_backordered
     , EBK7NB as qty_on_reserve
     , EBK8NB as date_last_sold
     , EBGNST as Reorder_Flag
--into fact_warehouse_inventory
FROM NOMIS.NOMDBF95.WIMPHY01
inner join dim_warehouse
on EBD6CF = warehouse_code
inner join dim_inventory
on ebeqcf = inventory_number
where EBEQCF <> '18B0263X012'    
and ebaqnb = 1