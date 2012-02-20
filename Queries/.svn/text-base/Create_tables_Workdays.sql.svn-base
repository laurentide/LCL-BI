/* http://msdn.microsoft.com/en-us/library/aa224826(SQL.80).aspx */

use nomis_warehouse
go
CREATE TABLE [work_day] 
(
  [work_day_key] [smallint] IDENTITY (0, 1) NOT NULL ,
  [work_date] [datetime] NULL ,
  [mtd_work_days] [tinyint] NULL ,
  CONSTRAINT [work_day_pk] PRIMARY KEY  CLUSTERED 
  (
        [work_day_key]
  )  ON [PRIMARY] 
)
go
CREATE TABLE [work_month]
(
  [work_month_key] [smallint] IDENTITY (0, 1) NOT NULL ,
  [Year_month] [datetime] NULL ,
  [num_work_days] [tinyint] NULL ,
  CONSTRAINT [work_month_pk] PRIMARY KEY  CLUSTERED 
  (
        [work_month_key]
  )  ON [PRIMARY] 
)
go
/* fill in data */
truncate table [work_day] 
go
insert into [work_day] ([work_date],[mtd_work_days])
select a.pk_date as [work_date], 
       sum(work_day_number) as [mtd_work_days]
from dimtime.time as a inner join (select pk_date, CASE WHEN DATENAME(dw,pk_date) = 'Saturday' 
							   or DATENAME(dw,pk_date) = 'Sunday'
							   or pk_date in (select date from tblStatHolidays)
							 Then 0 else 1 end as work_day_number,
			convert(varchar,year(pk_date))+ convert(varchar,month(pk_date)) as yearmonth
		from dimtime.time) as b on convert(varchar,year(a.pk_date))+ convert(varchar,month(a.pk_date)) = yearmonth
and a.pk_date >= b.pk_date
group by a.pk_date
go
truncate table work_month 
go 
insert into work_month ([Year_month],[num_work_days])
select convert(datetime,convert(varchar,year([work_date]))+'/' +convert(varchar,month([work_date])) + '/01',111)
[Year_month], 
max([mtd_work_days]) as [num_work_days]
from [work_day]
group by  convert(datetime,convert(varchar,year([work_date]))+'/' +convert(varchar,month([work_date])) + '/01',111)
order by [Year_month]
go
update dimtime.time
set workday  =  mtd_work_days
				from work_day
				where dimtime.time.pk_date = work_date
go
update dimtime.time
set workmonth  =  [num_work_days]
				 from work_month
				 where dimtime.time.fiscal_month = [Year_month]
go
select * from dimtime.time