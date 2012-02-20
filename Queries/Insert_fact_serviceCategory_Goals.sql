use nomis_warehouse
go
truncate table fact_servicecategory_goals
go
insert into dbo.fact_servicecategory_goals (pc_servicecategory_id, fiscal_month, Goal)
select pc_servicecategory_id, a.fiscal_month, yearly_goal / 12
from Nomis.dbo.tblservicecategorygoals
cross join 
(select distinct fiscal_month from dimtime.time where fiscal_Year = '2010-10-01 00:00:00.000') as a
order by pc_servicecategory_id