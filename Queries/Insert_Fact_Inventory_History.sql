use nomis_warehouse
go
truncate table fact_inventory_history
--drop table fact_inventory_history
go
insert into fact_inventory_history (warehouse_id, inventory_id, warehouse_code, inventory_number, sequence_number, Posting_Date, transaction_Type, transaction_Qty, invoice_number, PO_number, Bef_qty_on_hand, Bef_qty_on_order, Bef_qty_BO, Bef_qty_OR, Aft_qty_on_hand, Aft_qty_on_order, Aft_qty_BO, Aft_qty_OR)
select warehouse_id
     , inventory_id
     , d1d6CF AS warehouse_code
     , d1eqcf as inventory_number
     , d1iYND as sequence_number
     , CONVERT(SMALLDATETIME,(SUBSTRING(CONVERT(CHAR,D1JZNB),2,6)),12) as Posting_Date
     , d1p7ST as transaction_Type
     , d1j0nb as transaction_Qty
     , d1cucd as invoice_number
     , d1hpcd as PO_number
     , D1J1NB as Bef_qty_on_hand
	 , D1J2NB as Bef_qty_on_order
	 , D1J3NB as Bef_qty_BO
	 , D1J4NB as Bef_qty_OR
	 , D1J5NB as Aft_qty_on_hand
	 , D1J8NB as Aft_qty_on_order
	 , D1J6NB as Aft_qty_BO
	 , D1J7NB as Aft_qty_OR
--into fact_inventory_history
FROM NOMIS.NOMDBF95.INHPHY01
inner join dim_warehouse
on d1d6CF = warehouse_code
inner join dim_inventory
on d1eqcf = inventory_number
where D1EQCF <> '18B0263X012'    
and D1AQNB = 1
and d1jznb             >= 1021001

