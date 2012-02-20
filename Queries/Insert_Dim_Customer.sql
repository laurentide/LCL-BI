use nomis_warehouse
go
truncate table dim_customer
go
insert into dim_customer 
(customer_number, customer_name, 
customer_adress1,
customer_adress2,customer_city, 
customer_province,
customer_active, customer_territory_code, customer_salesman_number,customer_industry_class,
enterprise_number,
enterprise_name,
enterprise_adress,
enterprise_adress2,
enterprise_city,
enterprise_postal_code,
forecaster_customer_name,
forecaster_customer_id,
forecaster_enterprise_name,	
forecaster_enterprise_id,	   
forecaster_Territory_code)
SELECT CAZXNB,
       CACSTX,
	   CACPTX,
	   CANITY,
	   CACTTX, 
	   CAT4ST,
       CAFESU, 
       CADUCD, 
       CARDCD, 
       CADOCD,
	   EPNBND as enterprise_number,
	   epo3ty as enterprise_name,
       epo4ty as enterprise_adress,
	   epo5ty as enterprise_adress2,
	   epo8ty as enterprise_city,
       epf7cf as enterprise_postal_code,
	   c.CustomerName as forecaster_customer_name,
       c.customerid as forecaster_customer_id,
	   d.enterprisename as forecaster_enterprise_name,	
	   d.enterpriseid as forecaster_enterprise_id,	   
	   e.territorycode as forecaster_Territory_code
from Nomis.S1018252.NOMDBF95.CUSPHY01 a 
left join Nomis.S1018252.NOMDBF95.ETMPHY01 b
on CANBND = EPNBND
left join Forecaster.dbo.tblcustomers c on
c.NomisCustomerNum = cazxnb
left join Forecaster.dbo.tblenterprises d 
on c.enterpriseid = d.enterpriseid
left join Forecaster.dbo.tblTerritoryCodes e
on d.territorycodeid = e.territorycodeid
where CAAQNB = 1
go
select * from dim_customer
where customer_id = 709
