/* Create dim_alliance_timefactor */
use nomis_warehouse
truncate table dim_alliance_timefactor
go
insert into dim_alliance_timefactor
(timeFactorCd, Description, Comments, RowStatusCd, TimeFactorTypeCd,TimeFactor)
select  timeFactorCd,
		Description,
		Comments,
		RowStatusCd,
		TimeFactorTypeCd,
	    TimeFactor
--into dim_alliance_timefactor	
from [LCL-SQLA].Foundation.dbo.timefactor
go
select * from dim_alliance_timefactor
