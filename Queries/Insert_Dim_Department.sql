--USE master;
--GO
--EXEC sp_addlinkedserver 
--   'LCL-FAXS',
--   N'SQL Server'
--GO

INSERT Into dim_department (DepartmentNumber,DepartmentName)
select DepartmentID,Description from [LCL-FAXS].LCLAdmin.dbo.tbldepartement

select * from dim_department
