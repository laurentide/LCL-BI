select * from [LCL-faxs].LCLADMIN_BAK.DBO.tblNomisGLDept

Engineering  4.0.000.000 06.0601230.3.0.000.000      Salary transfer
Service      0.0.000.000 06.0601240.4.0.000.000      Salary transfer
 
insert into [LCL-faxs].LCLADMIN_BAK.DBO.tblNomisGLDept
(Departmentid,gl,subacc,description,nogl)
values
--('4.0.000.000','06.0601230.3.0.000.000','','SALARY TRANSFER','06.0600311.')
--('0.0.000.000','06.0601240.4.0.000.000','','SALARY TRANSFER','06.0601120.')
--('1.0.000.000','07.0701570.7.0.000.000','0701570','FREIGHT AND DUTY - IN','07.0701670.')
('3.0.000.000','07.0701570.7.0.000.000','0701570','FREIGHT AND DUTY - IN','07.0701670.')

select * from [LCL-faxs].LCLADMIN_BAK.DBO.tblgl where rptid = 2

select * from [LCL-faxs].LCLADMIN_BAK.DBO.tblgl where rptid = 1
select * from dim_Account
where account_name like '%FREIGHT%'

'071570.7' -expense
'061570.7' -revenues   

select * from [LCL-faxs].LCLADMIN_BAK.DBO.tblNomisGLDept where gl = '07.0701540.9.0.000.000'

delete from [LCL-faxs].LCLADMIN_BAK.DBO.tblNomisGLDept
where gl = '07.0701540.9.0.000.000' or gl = '07.0701680.1.0.000.000'

SELECT GL,COUNT(*) from [LCL-faxs].LCLADMIN_BAK.DBO.tblNomisGLDept
group by gl
having count(*) > 1

SELECT * FROM [LCL-faxs].LCLADMIN_BAK.DBO.tblNomisGLDept WHERE GL = '07.0701570.7.0.000.000'
select * from [LCL-faxs].LCLADMIN_BAK.DBO.tblgl where gl = '07.0701670.'


select * from dim_account where account_gl = '07.0701550.5.0.000.000'
07.0701570.7.0.000.000 sales 0.52, atlantic 0.48 freight


07.0701570.7.0.000.000 Freight 
07.0701550.5.0.000.000 Gains

select * from [LCL-faxs].LCLADMIN_BAK.DBO.tbldepartEment
