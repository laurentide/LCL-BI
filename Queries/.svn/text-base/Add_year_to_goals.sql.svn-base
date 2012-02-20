select * from fact_goals
where date between '2009-10-01' and '2010-09-30'
go
insert into fact_goals (pc_category_id, date,goal)
select pc_category_id, dateadd(yy,1,date), goal
from fact_goals
where date between '2008-10-01' and '2009-09-30'
go
select * from fact_subgoals
where date between '2008-10-01' and '2009-09-30'
go
insert into fact_subgoals
select pc_subcategory_id, dateadd(yy,1,date), goal
from fact_subgoals
where date between '2008-10-01' and '2009-09-30'
go
select * from fact_budget
go
insert into fact_budget
select account_id, dateadd(yy,1,date), '2010' as fiscal_year,department_id, total,description
from fact_budget
go
select * from fact_salesman_goals
go
insert into fact_salesman_goals
select salesman_id,pc_category_id, dateadd(yy,1,date), goal
from fact_salesman_goals
where date between '2008-10-01' and '2009-09-30'