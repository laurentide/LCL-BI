select * from [LCL-FAXS].LCLAdmin_BAK.dbo.tblNomisGLDept  where departmentid like '8.1.000.000'
where gl like '%1210%'

in (
'06.0601210.',  
'07.0701210.',                                                   
'07.0701250.',
'07.0701260.',
'08.0800110.',
'09.0900320.',
'09.0900420.')
select * from [LCL-FAXS].LCLAdmin.dbo.tblNomisGLDept
delete from [LCL-FAXS].LCLAdmin.dbo.tblNomisGLDept where departmentid = '4.1.000.000'

Insert into [LCL-FAXS].LCLAdmin.dbo.tblNomisGLDept VALUES ('4.1.000.000',	'06.0601210.0.0.000.000',	'601210','ALCAN REVENU'	,'06.0600510.')    
go
Insert into [LCL-FAXS].LCLAdmin.dbo.tblNomisGLDept VALUES ('4.1.000.000',	'07.0701210.0.0.000.000',	'701210','TECHNICIANS'	,'07.0701210.')    
go
Insert into [LCL-FAXS].LCLAdmin.dbo.tblNomisGLDept VALUES ('4.1.000.000',	'07.0701250.0.0.000.000',	'701250','ALCAN COGS'	,'07.0700510.')    
go
Insert into [LCL-FAXS].LCLAdmin.dbo.tblNomisGLDept VALUES ('4.1.000.000',	'07.0701260.0.0.000.000',	'701260','ALCAN SALARIES'	,'07.0701120.')        
go
Insert into [LCL-FAXS].LCLAdmin.dbo.tblNomisGLDept VALUES ('4.1.000.000',	'08.0800110.4.1.000.000',	'0800110',''	,'09.0900310.')
go
Insert into [LCL-FAXS].LCLAdmin.dbo.tblNomisGLDept VALUES ('4.1.000.000',	'09.0900320.0.0.000.000',	'900320','GROUP INSURANCE'	,'09.0900310.')
go
Insert into [LCL-FAXS].LCLAdmin.dbo.tblNomisGLDept VALUES ('4.1.000.000',	'09.0900420.0.0.000.000',	'900420','PAYROLL LEVIES'	,'09.0900310.')
go
     

INSERT INTO [LCL-FAXS].LCLAdmin.dbo.tblNomisGLDept values ('4.1.000.000','','','Automobile expenses','08.0800710.')
go
INSERT INTO [LCL-FAXS].LCLAdmin.dbo.tblNomisGLDept values ('4.1.000.000','','','Cellular','09.0901210.')
go
INSERT INTO [LCL-FAXS].LCLAdmin.dbo.tblNomisGLDept values ('4.1.000.000','','','Cleaning, maintenance','09.0901419.')
go
INSERT INTO [LCL-FAXS].LCLAdmin.dbo.tblNomisGLDept values('4.1.000.000','','','Demo equipment','09.0901510.')
go
INSERT INTO [LCL-FAXS].LCLAdmin.dbo.tblNomisGLDept values ('4.1.000.000','','','Engineering fees - sales','06.0600311.')
go
INSERT INTO [LCL-FAXS].LCLAdmin.dbo.tblNomisGLDept values ('4.1.000.000','','','Group insurance','09.0900310.')
go
INSERT INTO [LCL-FAXS].LCLAdmin.dbo.tblNomisGLDept values ('4.1.000.000','','','Marketing expenses','08.0801610.')
go
INSERT INTO [LCL-FAXS].LCLAdmin.dbo.tblNomisGLDept values ('4.1.000.000','','','Meals & entertainment','08.0800510.')
go
INSERT INTO [LCL-FAXS].LCLAdmin.dbo.tblNomisGLDept values ('4.1.000.000','','','Service Labor','07.0701210.') 
go
INSERT INTO [LCL-FAXS].LCLAdmin.dbo.tblNomisGLDept values ('4.1.000.000','','','Training','09.0900210.')
go
