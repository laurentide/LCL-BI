/* Create fact_alliance_taskdetail */
use nomis_warehouse
truncate table fact_alliance_taskdetail
go
insert into fact_alliance_taskdetail
(task_id, resource_id, product_id, costTimeFactor, selltimeFactor, TaskDetailNo, TaskNo, ResourceNo, TimeIn, Duration, BillableDuration, AfterHoursFlag, CostTimeFactorCd, SellTimeFactorCd, CoverageClassCd, Resolution, CoreProductCd, InvoiceStatusCd, TaskCompleteFlag, CoreStateCd, RowStatusCd,Sell_Duration,Cost_Duration)
select  task_id,
		resource_id,
		product_id,
		ct.timefactor as costTimeFactor,
		st.timefactor as selltimeFactor,
		TaskDetailNo,
		td.TaskNo,
		td.ResourceNo,
		CAST(FLOOR(CAST( timein AS float)) as datetime) as Timein,
		Duration/36000000000 as Duration,
		BillableDuration/36000000000 as BillableDuration,
		AfterHoursFlag,
		CostTimeFactorCd,
		SellTimeFactorCd,
		CoverageClassCd,
		Resolution,
		td.CoreProductCd,
		InvoiceStatusCd,
		TaskCompleteFlag,
		CoreStateCd,
		td.RowStatusCd,
		(Duration/36000000000 * st.timefactor) Sell_Duration,
        (Duration/36000000000 * ct.timefactor) Cost_Duration
--into fact_alliance_taskdetail
from [LCL-SQLA].Foundation.dbo.TaskDetail TD
left join [LCL-SQLA].Foundation.dbo.timefactor CT
on CostTimeFactorCd = ct.TimeFactorCd
left join [LCL-SQLA].Foundation.dbo.timefactor ST
on sellTimeFactorCd = ST.TimeFactorCd
inner join dbo.dim_alliance_task t
on td.TaskNo = t.TaskNo
left join dbo.dim_alliance_resource r
on td.ResourceNo = r.ResourceNo
left join dbo.dim_productcodes pc
on td.CoreProductCd = pc.product_code
inner join  dimtime.time
on CAST(FLOOR(CAST( timein AS float)) as datetime)  = pk_date
where td.rowstatuscd <> 'I'
go
select * from fact_alliance_taskdetail where taskdetailno = 108411
--where resource_id = 29
--go
--select * from [LCL-SQLA].Foundation.dbo.TaskDetail
--where resourceno = 39
--select taskdetailno,count(*) from fact_alliance_taskdetail group by taskdetailno having count(*) > 1