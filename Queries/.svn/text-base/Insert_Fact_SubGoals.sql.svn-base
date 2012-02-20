use Nomis_Warehouse
go
--drop table fact_subgoals
truncate table fact_subgoals
go
INSERT INTO fact_subgoals (pc_subcategory_id, Date, goal)
select pc_subcategory_id, convert(datetime,convert(char,case when MonthNumber < 4 then fiscal_year - 1 else fiscal_year  end) + '/' + convert(char,case when MonthNumber < 4 then MonthNumber + 9 else MonthNumber - 3 end) + '/01') as Date, Goal/12 as Goal
--into fact_subgoals
from (Nomis.dbo.tblSubProductGoal left join
	 dbo.dim_product_code_subcategory
	 on ProductCodeCategory = product_primary_subcategory)
	 cross join tblMonths
go

select * from fact_subgoals