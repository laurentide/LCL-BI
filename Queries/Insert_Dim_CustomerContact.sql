use Nomis_Warehouse
go
truncate table dim_customerContact
go
--drop table dim_customerContact
go
INSERT INTO dim_customerContact(Customerid, ContactID,Customer_Name, Customer_ShortName, Address1, Address2, City, Province, PostalCode, Contact_Name, NomisCustomerID, NomisCustomerName,NomisSalesmanNumber,NomisSalesmanName)
select CUST.Customerid, CTAC.ContactID, Name as Customer_Name, ShortName as Customer_ShortName, Address1,Address2,City,Province,PostalCode, FirstName + ' ' + LastName  as Contact_Name,cazxnb as NomisCustomerID, cacstx as NomisCustomerName, l2rdcd as NomisSalesmanNumber, l2rrtx as NomisSalesmanName
--into dim_customerContact
from QuoteBuilder.dbo.tblcustomers CUST 
inner join QuoteBuilder.dbo.tblcontacts CTAC on
CUST.customerid = CTAC.customerid
LEFT join QuoteBuilder.dbo.tblcities CITY on cust.cityid = CITY.cityid
LEFT join QuoteBuilder.dbo.tblProvinces PROV on cust.provinceid = PROV.provinceid
LEFT join (Nomis.NOMDBF95.CUSPHY01
left join Nomis.NOMDBF95.SLSPHY01
on l2rdcd = cardcd)
on cazxnb = cust.nomiscustomerid and caaqnb = '1'
go
select * from dim_customerContact