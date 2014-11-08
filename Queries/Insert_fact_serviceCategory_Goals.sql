use nomis_warehouse
go
truncate table fact_servicecategory_goals
go
insert into dbo.fact_servicecategory_goals (pc_servicecategory_id, fiscal_month, Goal)
select pc_servicecategory_id, a.fiscal_month, yearly_goal / 12
from Nomis.dbo.tblservicecategorygoals
cross join 
(select distinct fiscal_month from dimtime.time where fiscal_Year = '2013-10-01 00:00:00.000') as a
where year = 2014
and yearly_goal <> 0
order by pc_servicecategory_id
go
select * from fact_servicecategory_goals a 
left join dbo.dim_product_code_servicecategory b
on a.pc_servicecategory_id = b.pc_servicecategory_id 
order by product_service_catgory

select * from Nomis_warehouse.dbo.fact_servicecategory_goals
select * from Nomis_warehouse.dbo.dim_product_code_servicecategory