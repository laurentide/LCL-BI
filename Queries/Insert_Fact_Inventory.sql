USE NOMIS_WAREHOUSE
GO
TRUNCATE TABLE DBO.FACT_INVENTORY
GO
INSERT
INTO   FACT_INVENTORY
       (
	    warehouse_id,
		inventory_id,
		warehouse_Code, 
        inventory_Number, 
		sequence_Number, 
		posting_Date, 
		transaction_Type, 
		transaction_Quantity, 
		invoice_Number, 
		po_Number, 
		issue_Adj_Description
       )
SELECT warehouse_id
	   ,inventory_id
	   ,D1D6CF as warehouse_Code
       ,D1EQCF as inventory_Number
	   ,D1IYND as sequence_Number
       ,CONVERT(Datetime,(SUBSTRING(CONVERT(CHAR,D1JZNB),2,6)),12) as posting_Date
       ,D1P7ST as transaction_Type
       ,D1J0NB as transaction_Quantity
       ,D1CUCD as invoice_Number
       ,D1HPCD as po_Number
	   ,D1HYTX as issue_Adj_Description
FROM Nomis.NOMDBF95.INHPHY01
inner join Dim_warehouse
on D1D6CF = Warehouse_code
inner join dim_inventory
on D1EQCF = Inventory_number
inner join (select EBD6CF,EBEQCF from NOMIS.NOMDBF95.WIMPHY01 where ebaqnb = '1') a
on D1D6CF = a.EBD6CF
and D1EQCF = a.EBEQCF
Where d1aqnb = 1
AND D1JZNB >= 1021001
go
select * from FACT_INVENTORY



