--select * from dbo.tblPlan_2009
--truncate table tblPlan_2009

--drop table fact_budget
use nomis_Warehouse
go
truncate table fact_budget
go
insert into fact_budget
select account_id,
       CONVERT(DATETIME,rtrim(CONVERT(CHAR,
       CASE
              WHEN mois < 4
              THEN 2015 - 1
              ELSE 2015
       END)) + '/' + rtrim(CONVERT(CHAR,
       CASE
              WHEN mois < 4
              THEN mois + 9
              ELSE mois - 3
       END))            + '/01') AS DATE       ,
       2015                      AS fiscal_year,
       departmentid as department_id           ,
	   --amount/12,
		case when account_category_id = 1 
		then amount/12 else -amount/12 end as amount,
	   account_name as description
--into fact_budget 
from Nomis.dbo.tblPlan_2015 left join 
Nomis.dbo.tblBudgetNomisGL on
category = budgetDescription 
left join
(select min(account_id) as account_id,account_category_id,
account_name,account_department_id from dim_account group by account_name,account_department_id,account_category_id) as a
on NomisDescription = account_name
and departmentid = account_Department_id
CROSS JOIN LCLADMIN.dbo.yearconvert
where account_id is not null
go
--select * from fact_budget where departmentid = '1.1.000.000'
--select * from dim_account where account_id = 167
--(select min(account_id) as account_id,account_category_id,
--account_name,account_department_id from dim_account group by account_name,account_department_id,account_category_id)

--select * from fact_budget
--where description like '%COGS-commission%'
--order by departmentid
--
--select * from Nomis.dbo.tblPlan_2015
--where category = 'Commission Expense'
--order by departmentid
--where departmentid = '7.0.000.000'
--
--7.0.000.000
--7.1.000.000