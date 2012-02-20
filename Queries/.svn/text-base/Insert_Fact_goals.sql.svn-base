use Nomis_Warehouse
go
--drop table fact_goals
truncate table fact_goals
go
INSERT INTO fact_goals (pc_category_id, Date, goal)
select pc_category_id, convert(datetime,convert(char,case when MonthNumber < 4 then fiscal_year - 1 else fiscal_year  end) + '/' + convert(char,case when MonthNumber < 4 then MonthNumber + 9 else MonthNumber - 3 end) + '/01') as Date, Goal/12 as Goal
--into fact_goals
from (Nomis.dbo.tblProductGoal left join
	 dbo.dim_product_code_category
	 on ProductCodeCategory = product_primary_category)
	 cross join tblMonths
go
select * from fact_goals


