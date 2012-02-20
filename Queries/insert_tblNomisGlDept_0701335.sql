[LCL-FAXS].LCLAdmin.dbo.tblglINSERT INTO [LCL-FAXS].LCLAdmin.dbo.tblNomisGLDept
select departmentid, '07.0701335.' + departmentid, '0701335','TRAINING, COURSES AND SEMINARS','07.0701335.'
from  [LCL-FAXS].LCLAdmin.dbo.tbldepartement
where departmentid <> '0.2.000.000'

delete from [LCL-FAXS].LCLAdmin.dbo.tblgl where description = 'Training, courses, and seminars'
INSERT into [LCL-FAXS].LCLAdmin.dbo.tblgl
select '07.0701335.',2,'Training, courses, and seminars','', 'Training, courses, and seminars', 'COS',2 


select * from [LCL-FAXS].LCLAdmin.dbo.tblNomisGLDept
where subacc = 0701335
insert into [LCL-FAXS].LCLAdmin.dbo.tblNomisGLDept
select '0.1.000.000','07.0701335.0.1.000.000','0701335','','07.0701120.'


select * from [LCL-FAXS].LCLAdmin.dbo.tbldepartement
0.1.000.000

delete from [LCL-FAXS].LCLAdmin.dbo.tblNomisGLDept
where nogl = '07.0701335.'

select * from dim_Account
where account_department_name = 'Automation'
and account_name = 'Service Costs'

select * from dim_account where account_gl like '07.0701335%'
select 

insert into [LCL-FAXS].LCLAdmin.dbo.tblNomisGLDept
select account_department_id,account_gl,substring(Account_gl,4,7),'',account_budget_gl
from dim_Account

select * from [LCL-FAXS].LCLAdmin.dbo.tblNomisGLDept

update [LCL-FAXS].LCLAdmin.dbo.tblNomisGLDept
set description = description_2 from (select gl as gl_2,description as description_2 from [LCL-FAXS].LCLAdmin_BAK.dbo.tblNomisGLDept) as b
where gl = b.gl_2


select * from Nomis.S1018252.

where nogl = '07.0701335.'     

ROLLBACK TRANSACTION      