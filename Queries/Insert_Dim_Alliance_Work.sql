/* Create dim_alliance_work */
use nomis_warehouse
truncate table dim_alliance_work
go
insert into dim_alliance_work
(WorkNo, WorkTypeCd, WorkType, CoreWarehouseCd, CoreDivisionCd, SiteNo, BillToSiteLocationNo, ShipToSiteLocationNo, EnduserSiteLocationNo, Description, DispatcherResourceNo, WorkStatusCd, StatType, serviceRequestedCd, ServType, ScheduledDate, RequestedDate, Comments, CompletionDate, CustomerPurchaseOrderCode, AgreementNo, CoreSalesOrderCd, InvoiceMessageNo, InvoiceNote, rowStatusCd)
select  WorkNo,
		WRK.WorkTypeCd,
		Typ.Description as WorkType,
		CoreWarehouseCd,
		CoreDivisionCd,
		SiteNo,
		BillToSiteLocationNo,
		ShipToSiteLocationNo,
		EnduserSiteLocationNo,
		WRK.Description,
		DispatcherResourceNo,
		WRK.WorkStatusCd,
		Stat.description as StatType,
		WRK.serviceRequestedCd,
		Serv.description as ServType,
		ScheduledDate,
		RequestedDate,
		WRK.Comments,
		CompletionDate,
		CustomerPurchaseOrderCode,
		AgreementNo,
		CoreSalesOrderCd,
		InvoiceMessageNo,
		InvoiceNote,
		WRK.rowStatusCd
--into dim_alliance_work	
from [LCL-SQLA].Foundation.dbo.work WRK
	Left join [LCL-SQLA].Foundation.dbo.workType TYP
	on WRK.workTypeCd = TYP.workTypeCd
	Left join [LCL-SQLA].Foundation.dbo.workstatus STAT
	on WRK.workStatusCd = STAT.workStatusCd
    and WRK.workTypeCd = STAT.WORKTYPECD
	Left join [LCL-SQLA].Foundation.dbo.ServiceRequested SERV
	on WRK.serviceRequestedCd = serv.serviceRequestedCd
go
--select workno,count(*) from dim_alliance_work group by workno having count(*) > 1
select * from dim_alliance_work