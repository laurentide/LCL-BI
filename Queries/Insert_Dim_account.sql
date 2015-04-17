use Nomis_Warehouse 
GO
TRUNCATE TABLE DIM_ACCOUNT
GO
INSERT
INTO    DIM_ACCOUNT
        (
                account_gl           ,
                account_budget_gl    ,
                account_category_id  ,
                account_category     ,
                account_name         ,
                account_description  ,
                account_department_id,
                account_department_name,
				account_department_grouping
        )
select adbbtx as account_gl,
       '',
	   grouporder as account_category_id  ,
	   [grouping] as account_category     ,
	   case when adbbtx = '06.0601140.4.0.000.000' then 'Sales-Control Devices' 
            when adbbtx = '07.0701160.6.0.000.000' then 'COGS-Control-Devices'
       else rtrim(replace(acbdtx,char(160),char(32))) end as account_name,
	   acactx as account_description,
       departmentID as account_department_id,
       adbdtx as account_department_name,
	   departmentGrouping as account_department_grouping
from Nomis.S1018252.YGLWBFIL2.GLADREP drep
left join Nomis.S1018252.YGLWBFIL2.GLACREP crep
on SUBSTRING(adbbtx, 4, 7)  = ACACCD
left join Nomis.dbo.tbldepartments
on adbdtx = departmentname 
left join Nomis.dbo.tblGLGrouping
on acbdtx = rtrim(fsallinclusive)
where adaacd = '001'
and convert(int,substring(adbbtx,1,2)) between 6 and 10
and adabst = 'A'
and acbdtx <> 'Shareholders equity'
--and substring(adbbtx,12,11) <> '9.0.000.000'
and adbbtx not in ('06.0601340.4.0.000.000','07.0701560.6.0.000.000')
order by account_category_id
GO
SELECT * FROM DIM_ACCOUNT
order by account_name



--select  * from  Nomis.S1018252.YGLWBFIL2.GLACREP
--where acactx like '%Demo%'
--
--select  * from  Nomis.S1018252.YGLWBFIL2.GLADREP
--where adbbtx in ('09.0901510.1.0.000.000','09.0901510.2.1.000.000')
--
--select * from Nomis_warehouse.dbo.dim_account
--where account_name = 'Office Equipment'
--
--drop table tblaccounts
--select adbbtx as account_gl,
--       adbdtx as account_department_name,
--       departmentID as account_department_id,
--	   '' as account_budget_gl    ,
--	   grouporder as account_category_id  ,
--	   [grouping] as account_category     ,
--	   acactx as account_name,
--	   acbdtx as account_description
--from Nomis.S1018252.YGLWBFIL2.GLADREP drep
--left join Nomis.S1018252.YGLWBFIL2.GLACREP crep
--on SUBSTRING(adbbtx, 4, 7)  = ACACCD
--left join Nomis.dbo.tbldepartments
--on adbdtx = departmentname 
--left join Nomis.dbo.tblGLGrouping
--on acbdtx = rtrim(fsallinclusive)
--where adaacd = '001'
--and convert(int,substring(adbbtx,1,2)) between 6 and 10
--and adabst = 'A'
--and acbdtx <> 'Shareholders equity'
----and substring(adbbtx,12,11) <> '9.0.000.000'
--and adbbtx not in ('06.0601340.4.0.000.000','07.0701560.6.0.000.000')
--order by account_category_id
--
--select * from tblaccounts
--
--select distinct account_description from Nomis.dbo.tblAccounts  where account_description not in (select rtrim(fsallinclusive) from tblglgrouping)
--select * from Nomis.S1018252.YGLWBFIL2.GLACREP
--
--select * from Nomis.S1018252.YGLWBFIL2.GLACREP crep
--left join [LCL-FAXS].LCLADmin.dbo.tblgl
--on rptdesc = acbdtx
--where aca7cd = 'ACT'
--and acadst = 'A'
--
--select * from [LCL-FAXS].LCLADmin.dbo.tblgl
--
--select * from 
--order by catid
--
--select * from Nomis.dbo.tblGLGrouping
--
--
--
--select * from Nomis.S1018252.YGLWBFIL2.GLACREP 
--where acactx like '%DEPRE%'
--
--select * from Nomis.S1018252.YGLWBFIL2.GLACREP 
--where acbdtx = 'Office equipment'
--acaccd= '0901510'
--and 

--select *
--from Nomis.S1018252.YGLWBFIL2.GLADREP drep
--left join Nomis.S1018252.YGLWBFIL2.GLACREP crep
--on SUBSTRING(adbbtx, 4, 7)  = ACACCD
--left join Nomis.dbo.tbldepartments
--on adbdtx = departmentname 
--left join Nomis.dbo.tblGLGrouping
--on acbdtx = rtrim(fsallinclusive)
--where adaacd = '001'
--and convert(int,substring(adbbtx,1,2)) between 6 and 10
--and adabst = 'A'
--and acbdtx <> 'Shareholders equity'
----and substring(adbbtx,12,11) <> '9.0.000.000'
--and adbbtx not in ('06.0601340.4.0.000.000','07.0701560.6.0.000.000')
--order by account_category_id
