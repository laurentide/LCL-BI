use Nomis_Warehouse
go
--drop table fact_goals
truncate table dbo.fact_margin_goals
go
INSERT INTO fact_margin_goals (salesman_id, fiscal_month, profit_margin_goal)
select salesman_id,
       convert(datetime,convert(char,case when MonthNumber < 4 then year - 1 else year  end) + '/' + convert(char,case when MonthNumber < 4 then MonthNumber + 9 else MonthNumber - 3 end) + '/01') as Date, 
       Margin_goals/12 as Goal       
--into fact_goals
from Nomis.dbo.tblSalesmanMargin_Goals  b
	 left join (select salesman_name, min(salesman_id) as salesman_id  
                  from dbo.dim_salesman 
                 group by salesman_name) as a
     on rtrim(upper(a.salesman_name)) = rtrim(upper(b.salesman_name))
     cross join tblMonths
go
select count(distinct salesman_id)
from fact_margin_goals