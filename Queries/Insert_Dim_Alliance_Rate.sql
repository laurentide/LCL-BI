/* Create dim_alliance_rate*/
use nomis_warehouse
truncate table dim_alliance_rate
go
insert into dim_alliance_rate
(ratecd, RateType, RateUnit, RateFinancialType, BusinessScope, description, scnDescription, 
currencyCd, 
rate, rowstatuscd)
select a.ratecd,
	   c.description as RateType,
	   d.description as RateUnit,
	   e.description as RateFinancialType,
	   f.description as BusinessScope,
	   a.description,
	   a.scnDescription,
       currencyCd,
       rate,
	   a.rowstatuscd
--into dim_alliance_rate	
from [LCL-SQLA].Foundation.dbo.rate a inner join
(select a.* from [LCL-SQLA].Foundation.dbo.ratedetail a inner join 
(select ratecd,max(startdate) as startdate,MIN(currencycd) as currencycd from [LCL-SQLA].Foundation.dbo.ratedetail group by ratecd) b
on a.ratecd = b.ratecd and a.startdate = b.startdate and a.currencycd = b.currencycd) g
on a.ratecd = g.ratecd
left join [LCL-SQLA].Foundation.dbo.RateType c
on a.ratetypecd = c.ratetypecd
left join [LCL-SQLA].Foundation.dbo.RateUnit d
on a.rateunitcd = d.rateunitcd
left join [LCL-SQLA].Foundation.dbo.RateFinancialType e
on a.ratefinancialtypecd = e.ratefinancialtypecd
left join [LCL-SQLA].Foundation.dbo.BusinessScope f
on a.businessscopecd = f.businessscopecd
go
--select ratecd,count(*) 
--from dim_alliance_rate group by ratecd
--having count(*) > 1



