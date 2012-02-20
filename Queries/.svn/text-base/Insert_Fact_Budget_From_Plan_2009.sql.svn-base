--select * from dbo.tblPlan_2009
--truncate table tblPlan_2009

--drop table fact_budget
go
insert into fact_budget
select account_id,
       CONVERT(DATETIME,rtrim(CONVERT(CHAR,
       CASE
              WHEN mois < 4
              THEN 2009 - 1
              ELSE 2009
       END)) + '/' + rtrim(CONVERT(CHAR,
       CASE
              WHEN mois < 4
              THEN mois + 9
              ELSE mois - 3
       END))            + '/01') AS DATE       ,
       2009                      AS fiscal_year,
       departmentid as department_id           ,
	   total,
	   accountname as description
--into fact_budget 
from Nomis.dbo.tblPlan_2009 left join 
(select min(account_id) as account_id, account_name,account_Department_id from Nomis_Warehouse.dbo.Dim_account group by account_name, account_Department_id) as a
on account_name = accountname
and departmentid = account_Department_id
CROSS JOIN [LCL-FAXS].LCLADMIN.dbo.yearconvert
where account_id is not null
go
--Verif
--select * from fact_budget where department_id = '1.0.000.000'
--and description like '%Meals%'
--select * from dim_account where account_department_id = '1.0.000.000'
--and account_name = 'Meals & Entertainment'
--SELECT * FROM Nomis.dbo.tblPlan_2009 WHERE DEPARTMENTID = '1.0.000.000'
--AND ACCOUNTNAME = 'Meals & Entertainment'