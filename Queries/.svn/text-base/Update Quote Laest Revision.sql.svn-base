update tblquotes
set latest_revision = 1
where convert(char,quoteid) + ' ' + convert(char,date) in 
(select convert(char,quoteid) + ' ' + convert(char,max(date)) from tblquotes group by quoteid)

update tblquotes
set latest_revision = 0
where latest_revision is null

select quoteid,count(*), count(Distinct latest_revision) as counts,
sum(case when latesT_revision = 1 then 1 else 0 end) as true_cases,
sum(case when latesT_revision = 1 then 0 else 1 end) as false_cases
from tblquotes
group by quoteid





