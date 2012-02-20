use Nomis_Warehouse
go
truncate table dbo.dim_product_code_category
go
INSERT INTO dbo.dim_product_code_category (product_primary_category)
select A1FXTU
from Nomis.S1018252.NOMDBF95.FRA1REL4
WHERE a1aqnb = 1 
group by A1FXTU
go
select * from dbo.dim_product_code_category

