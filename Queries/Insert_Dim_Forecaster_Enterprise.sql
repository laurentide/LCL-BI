use nomis_warehouse
go
truncate table Dim_ForeCaster_Enterprise
go
insert into dim_ForeCaster_Enterprise (enterpriseid, territorycode, enterprisename)
select --forecaster_enterprise_id,
       enterpriseid,
       territorycode,
       enterprisename
--into dim_ForeCaster_Enterprise
from Forecaster.dbo.tblenterprises a inner join 
Forecaster.dbo.tblterritorycodes b
on a.territorycodeid = b.territorycodeid