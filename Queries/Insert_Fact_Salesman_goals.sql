use Nomis_Warehouse
go
--drop table fact_goals
truncate table fact_salesman_goals
go
--INSERT INTO fact_salesman_goals (salesman_id, pc_category_id, Date, Goal)
--select salesman_id,pc_category_id, convert(datetime,convert(char,case when MonthNumber < 4 then fiscal_year - 1 else fiscal_year  end) + '/' + convert(char,case when MonthNumber < 4 then MonthNumber + 9 else MonthNumber - 3 end) + '/01') as Date, Goal/12 as Goal
----into fact_goals
--from (Nomis.dbo.tblSalesmanGoal
--     left join dbo.dim_product_code_category
--	 on rtrim(ProductCodeCategory) = rtrim(product_primary_category) 
--	 left join (select salesman_name, min(salesman_id) as salesman_id  from dbo.dim_salesman group by salesman_name) as a
--     on rtrim(upper(salesman_name)) = replace(rtrim(upper(Salesman)),'DENIS - BRUNO','DENIS GAULIN'))
--	 cross join tblMonths
--go
--INSERT INTO fact_salesman_goals (salesman_id, pc_category_id, Date, Goal)
--select salesman_id,pc_category_id, convert(datetime,convert(char,case when MonthNumber < 4 then fiscal_year - 1 else fiscal_year  end) + '/' + convert(char,case when MonthNumber < 4 then MonthNumber + 9 else MonthNumber - 3 end) + '/01') as Date, Goal/12 as Goal
----into fact_goals
--from (Nomis.dbo.tblSalesmanGoal_2010
--     left join dbo.dim_product_code_category
--	 on rtrim(ProductCodeCategory) = rtrim(product_primary_category) 
--	 left join (select salesman_name, min(salesman_id) as salesman_id  from dbo.dim_salesman group by salesman_name) as a
--     on rtrim(upper(salesman_name)) = replace(rtrim(upper(Salesman)),'DENIS - BRUNO','DENIS GAULIN'))
--	 cross join tblMonths

go
INSERT INTO fact_salesman_goals (salesman_id, pc_category_id, Date, Goal)
select salesman_id,pc_category_id, convert(datetime,convert(char,case when MonthNumber < 4 then fiscal_year - 1 else fiscal_year  end) + '/' + convert(char,case when MonthNumber < 4 then MonthNumber + 9 else MonthNumber - 3 end) + '/01') as Date, Goal/12 as Goal
--into fact_goals
from (Nomis.dbo.tblSalesmanGoal_2012
     left join dbo.dim_product_code_category
	 on rtrim(ProductCodeCategory) = rtrim(product_primary_category) 
	 left join (select salesman_name, min(salesman_id) as salesman_id  from dbo.dim_salesman group by salesman_name) as a
     on rtrim(upper(salesman_name)) = replace(rtrim(upper(Salesman)),'DENIS - BRUNO','DENIS GAULIN'))
	 cross join tblMonths

go
select * from fact_salesman_goals
where salesman_id = 23
                                        
--select * from fact_salesman_goals
--where salesman_id = 60
--and pc_category_id = 14
--select * from dim_salesman
--where salesman_name like 'ANDRE%'
--select * from dbo.dim_product_code_category