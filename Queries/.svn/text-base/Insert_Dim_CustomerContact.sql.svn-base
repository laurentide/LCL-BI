use Nomis_Warehouse
go
truncate table dim_customerContact
go
INSERT INTO dim_customerContact(Customerid, ContactID,Customer_Name, Customer_ShortName, Address1, Address2, City, Province, PostalCode, Contact_Name)
select CUST.Customerid, CTAC.ContactID, Name as Customer_Name, ShortName as Customer_ShortName, Address1,Address2,City,Province,PostalCode, FirstName + ' ' + LastName  as Contact_Name
from QuoteBuilder.dbo.tblcustomers CUST 
inner join QuoteBuilder.dbo.tblcontacts CTAC on
CUST.customerid = CTAC.customerid
LEFT join QuoteBuilder.dbo.tblcities CITY on cust.cityid = CITY.cityid
LEFT join QuoteBuilder.dbo.tblProvinces PROV on cust.provinceid = PROV.provinceid
go
select * from dim_CustomerContact
select FirstName + ' ' + LastName   from QuoteBuilder.dbo.tblcontacts
