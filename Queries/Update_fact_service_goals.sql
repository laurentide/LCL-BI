use nomis_warehouse
truncate table fact_service_goals
go
insert into fact_service_goals
select resource_id, yearly_goal / 12 as Hours_Goal, fiscal_month  
--into fact_service_goals
from dbo.Service_Yearly_Hours_Goals 
cross join (select distinct fiscal_month from dimtime.time where fiscal_Year = '2009-10-01 00:00:00.000') as a
go
select * from fact_service_goals
where resource_id = 9


