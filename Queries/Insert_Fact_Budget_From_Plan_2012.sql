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
              THEN 2012 - 1
              ELSE 2012
       END)) + '/' + rtrim(CONVERT(CHAR,
       CASE
              WHEN mois < 4
              THEN mois + 9
              ELSE mois - 3
       END))            + '/01') AS DATE       ,
       2012                      AS fiscal_year,
       departmentid as department_id           ,
	   --amount/12,
	   case when departmentid = '1.1.000.000' then
				case WHEN 
					mois < 4 then 0 
				when mois = 4 then
					case when account_category_id = 1 
					then amount/12/2 else -amount/12/2 end
				else
					case when account_category_id = 1 
					then amount/12 else -amount/12 end
				end
            else
				case when account_category_id = 1 
				then amount/12 else -amount/12 end
       end as amount,
	   account_name as description
--into fact_budget 
from Nomis.dbo.tblPlan_2012 left join 
(select min(account_id) as account_id, account_name,account_Department_id, account_category_id
from Nomis_Warehouse.dbo.Dim_account group by account_name, account_Department_id,account_category_id) as a
on account_name = category
and departmentid = account_Department_id
CROSS JOIN [LCL-FAXS].LCLADMIN.dbo.yearconvert
where account_id is not null
go
select * from fact_budget
where departmentid = '1.1.000.000'