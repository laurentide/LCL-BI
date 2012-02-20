select * 
from [LCL-FAXS].LCLAdmin.dbo.tblNomisGlDept
where departmentid = '2.1.000.000'
--where gl = '09.0900310.2.1.000.000'

insert into [LCL-FAXS].LCLAdmin.dbo.tblNomisGlDept
values
--('4.0.000.000','08.0800520.4.0.000.000','0800520','MEALS & ENTERTNMNT','08.0800510.')
--('2.1.000.000','08.0800120.2.1.000.000','0800120','TEMP HELP','08.0800110.')
('1.0.000.000','08.0800110.1.1.000.000','0800110','SALARIES','08.0800110.')
select * from [LCL-FAXS].LCLAdmin.dbo.tblgl where gl ='09.0900310.'

select  * from [LCL-FAXS].LCLAdmin.dbo.tblNomisGlDept
where gl = '08.0800110.1.1.000.000'

10.1005590.9.0.000.000	$378.04


select * from 

-- Insert 08.0800520

delete
select *  
from [LCL-FAXS].LCLAdmin.dbo.tblNomisGlDept
where description like 'ADV%'
where gl like '%08.0800520%'

insert into [LCL-FAXS].LCLAdmin.dbo.tblNomisGlDept
select departmentid,'08.0800520.' + departmentid,'0800520','MEALS & ENTERTNMNT','08.0800510.'
from [LCL-FAXS].LCLAdmin.dbo.tbldepartement



-- Insert 08.0801620

delete
--select *  
from [LCL-FAXS].LCLAdmin.dbo.tblNomisGlDept
where gl like '%08.0801620%'

insert into [LCL-FAXS].LCLAdmin.dbo.tblNomisGlDept
select departmentid,'08.0801620.' + departmentid,'0801620','ADV & PROMO','08.0801610.'
from [LCL-FAXS].LCLAdmin.dbo.tbldepartement

-- Insert 08.0801630

delete
select *  
from [LCL-FAXS].LCLAdmin.dbo.tblNomisGlDept
--where description like 'Meals%'
where gl like '%08.0801630%'

insert into [LCL-FAXS].LCLAdmin.dbo.tblNomisGlDept
select departmentid,'08.0801630.' + departmentid,'0801630','ADV &PROMO','08.0801610.'
from [LCL-FAXS].LCLAdmin.dbo.tbldepartement

-- Insert 08.0801640

--delete
select *  
from [LCL-FAXS].LCLAdmin.dbo.tblNomisGlDept
--where description like 'Meals%'
where gl like '%08.0801640%'

insert into [LCL-FAXS].LCLAdmin.dbo.tblNomisGlDept
select departmentid,'08.0801640.' + departmentid,'0801640','ADV & PROMO','08.0801610.'
from [LCL-FAXS].LCLAdmin.dbo.tbldepartement


--set professional into office for atlantic

update [LCL-FAXS].LCLAdmin.dbo.tblNomisGlDept
set nogl = '09.0900919.'
where gl in ('10.1000490.3.0.000.000','10.1000890.3.0.000.000')
      

-- set professional from insurance for finance

update [LCL-FAXS].LCLAdmin.dbo.tblNomisGldept
set nogl = '10.1000890.'
where nogl = '10.1000391.'

select * from [LCL-FAXS].LCLAdmin.dbo.tblgl
where rptdesc = 'Professional'

-- office 3.1

insert into [LCL-FAXS].LCLAdmin.dbo.tblNomisGldept
values ('5.0.000.000','09.0900919.3.1.000.000','0900919','OFFICE','09.0900919.')
select * from [LCL-FAXS].LCLAdmin.dbo.tblNomisGldept where gl = '09.0900919.3.1.000.000'
                     
select * from Nomis.YGLWBFIL2.GLBHCPP where bhbbtx = '09.0900919.3.1.000.000 '
and BHAGCD = '2009' and bhafcd >= 3

--Other Finance
Insert into [LCL-FAXS].LCLAdmin.dbo.tblgl
VALUES ('10.1005190.',6,'Other','Other','Other','General',4)
select * from [LCL-FAXS].LCLAdmin.dbo.tblgl

--update [LCL-FAXS].LCLAdmin.dbo.tblNomisGldept
select * from [LCL-FAXS].LCLAdmin.dbo.tblNomisGldept
--set nogl = '10.1005190.'
where gl in ('10.1005190.9.0.000.000','10.1005590.9.0.000.000','10.1005290.9.0.000.000','10.1005790.9.0.000.000')

--select * from [LCL-FAXS].LCLAdmin.dbo.tblGl where gl = '10.1005190.'

insert into [LCL-FAXS].LCLAdmin.dbo.tblNomisGldept
values ('5.0.000.000','10.1005790.9.0.000.000','1005790','OTHER INCOME - RENT','10.1005190.')

-- delete marketing

