use Nomis_Warehouse
go
truncate table dim_quote_status 
go
INSERT INTO dim_quote_status (statusid, status)
select statusid,status
--into dim_quote_status
from QuoteBuilder.dbo.tblstatus status 
go
select * from dim_quote_status