use nomis_warehouse
go
truncate table dim_quote_employee
go
insert into dim_quote_employee (employeeid, Employee_Name, FrenchTitle, EnglishTitle, Email, Extension, Deparment)
select employeeid, Fullname as Employee_Name, FrenchTitle, EnglishTitle, Email, Ext as Extension,department 
--into dim_quote_employee
from QuoteBuilder.dbo.tblEmployees a
inner join QuoteBuilder.dbo.tblDepartments b
on a.departmentid = b.departmentid 
go 



--select AEID as employeeid, FirstName + ' ' + LastName as Employee_Name, FrenchTitle, EnglishTitle, Email, Ext as Extension, 'AE' as Deparment from 
--QuoteBuilder.dbo.tblAES
--union
--select SLSID as employeeid, FirstName + ' ' + LastName as Employee_Name, FrenchTitle, EnglishTitle, Email, Ext as Extension, 'OS' as Deparment from 
--QuoteBuilder.dbo.tblSLS
--union
--select SAID as employeeid, FirstName + ' ' + LastName as Employee_Name, FrenchTitle, EnglishTitle, Email, Ext as Extension, 'CSR' as Deparment from 
--QuoteBuilder.dbo.tblSAS

