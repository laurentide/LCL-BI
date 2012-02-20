/* Create Dim_alliance_resource*/
use nomis_warehouse
truncate table dim_alliance_resource
go
insert into dim_alliance_resource
(resourceNo, DomainUserCd, resourceTypeCd, CoreDivisionCd, ResourceStatusCd, Title, DepartmentNo, department_name, DefaultRateCd, ManagerResourceNo, ContactNo, ManagerFlag, OverTimePayoutFlag, CoreVendorCd, RowStatusCd)
select resourceNo,
	DomainUserCd,
	resourceTypeCd,
	CoreDivisionCd,
	--CoreOriginatorCd,
	ResourceStatusCd,
	Title,
	a.DepartmentNo,
	b.description as department_name,
	DefaultRateCd,
	ManagerResourceNo,
	ContactNo,
	ManagerFlag,
	OverTimePayoutFlag,
	CoreVendorCd,
	a.RowStatusCd
--into dim_alliance_resource	
from [LCL-SQLA].Foundation.dbo.resource a
left join [LCL-SQLA].Foundation.dbo.department b
on a.departmentno = b.departmentno
go
