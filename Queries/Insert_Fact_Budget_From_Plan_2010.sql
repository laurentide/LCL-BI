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
              THEN 2010 - 1
              ELSE 2010
       END)) + '/' + rtrim(CONVERT(CHAR,
       CASE
              WHEN mois < 4
              THEN mois + 9
              ELSE mois - 3
       END))            + '/01') AS DATE       ,
       2010                      AS fiscal_year,
       departmentid as department_id           ,
	   amount/12,
	   --case when account_category_id = 1 then amount else -amount end as amount,
	   account_name as description
--into fact_budget 
from Nomis.dbo.tblPlan_2010 left join 
(select min(account_id) as account_id, account_name,account_Department_id, account_category_id
from Nomis_Warehouse.dbo.Dim_account group by account_name, account_Department_id,account_category_id) as a
on account_name = category
and departmentid = account_Department_id
CROSS JOIN [LCL-FAXS].LCLADMIN.dbo.yearconvert
where account_id is not null
go
--select * from fact_budget