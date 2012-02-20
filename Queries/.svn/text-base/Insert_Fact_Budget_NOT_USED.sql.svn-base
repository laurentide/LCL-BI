drop table fact_budget
go
select account_id, convert(datetime,rtrim(convert(char,case when mois < 4 then year - 1 else year  end)) + '/' + rtrim(convert(char,case when mois < 4 then mois + 9 else mois - 3 end)) + '/01') as Date, year as fiscal_year, departmentid, case when rptid = 1 then total else -total end as total, description
into fact_budget
from Nomis.dbo.TBLBUDGET_2008 as BUDG
INNER JOIN (select account_budget_gl,account_department_id,min(account_id) as account_id from dim_account group by account_budget_gl,account_department_id) ACC
on BUDG.nogl = ACC.account_budget_gl
and BUDG.departmentid = ACC.account_department_id
where year = 2008
go
select sum(case when rptid = 1 then total else -total end) as total from Nomis.dbo.TBLBUDGET_2008
select sum(total) from fact_budget

