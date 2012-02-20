/* Create Dim_alliance_task */
use nomis_warehouse
truncate table Dim_alliance_task
go
insert into Dim_alliance_task
(work_id, rate_id,TaskNo, WorkNo, TaskTypeCd, TaskType, RateCd, TaskStatusCd, TaskStatus, Description, ScheduledStartDate, ScheduledEndDate, RowStatusCd, CoreProductCd, CostOverTimeFlag, SellOvertimeFlag)
select  work.work_id,
		rate.rate_id,
		TaskNo,
		Task.WorkNo,
	    TASK.TaskTypeCd,
		TYP.description as TaskType,
		Task.RateCd,
		TASK.TaskStatusCd,
		STAT.description as TaskStatus,
		TASK.Description,
		ScheduledStartDate,
		ScheduledEndDate,
		TASK.RowStatusCd,
		CoreProductCd,
		CostOverTimeFlag,
		SellOvertimeFlag
--into dim_alliance_task	
from [LCL-SQLA].Foundation.dbo.task TASK
	Left join [LCL-SQLA].Foundation.dbo.taskType TYP
	on TASK.TaskTypeCd = TYP.TaskTypeCd
	Left join [LCL-SQLA].Foundation.dbo.taskstatus STAT
	on TASK.TaskStatusCd = STAT.TaskStatusCd
	inner join dbo.dim_alliance_work Work
	on Task.WorkNo = Work.WorkNo
	left join dbo.dim_alliance_rate rate
	on task.ratecd = rate.ratecd
go
--select taskno,count(*)
--from dim_alliance_task
--group by taskno
--having count(*) >1

