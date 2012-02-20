use nomis_warehouse
go
truncate table dim_customer_ship_to
go
insert into dim_customer_ship_to 
(customer_id, 
 ship_to_customer_number,  
 customer_name,
 customer_city, 
 customer_adress1, 
 customer_adress2, 
 customer_province, 
 customer_territory_code, 
 customer_industry_class,
 ship_to_number, 
 ship_to_name, 
 ship_to_address, 
 ship_to_adress_2, 
 ship_to_city, 
 ship_to_province, 
 ship_to_territory_code, 
 ship_to_active, 
 ship_to_salesman_number, 
 ship_to_salesman_name,
customer_salesman_number,
customer_salesman_name,
ship_to_segment)
select customer_id, 
       convert(decimal(5,0),i0zxnb) as ship_to_customer_number,
	   customer_name,
       customer_city,
       customer_adress1,
       customer_adress2,
       customer_province,
       customer_territory_code,
       customer_industry_class,
	   CONVERT(nchar(3), I0RHCD) AS ship_to_number,
       i0lGTX as ship_to_name, 
       i0lhtx as ship_to_address, 
       i0litx as ship_to_adress_2,
       i0ljtx as ship_to_city, 
       i0hjcd as ship_to_province, 
       i0Oncd as ship_to_territory_code, 
       i0fesu as ship_to_active,
       a.L2RDCD as ship_to_salesman_number,
	   a.L2RRTX as ship_to_salesman_name,
       b.L2RDCD as customer_salesman_number,
	   b.L2RRTX as customer_salesman_name,
	   case when left(i0Oncd,1)  = 'C' then '2 - Core Business'
			when left(i0Oncd,1) = 'S' then '1 - Strategic Accounts'
			when left(i0Oncd,1) = 'T' then '3 - Territory Growth Accounts'
			when left(i0Oncd,1) = 'W' then '4 - Whole Sellers,Distributors, Contrators'
			when left(i0Oncd,1) = 'E' then '5 - Engineer Procurement Contrators'
	   else '6 - Everything else'
	   end as ship_to_segment
--into dim_customer_ship_to
from Nomis.NOMDBF95.CSMPHY01 
inner join dim_customer 
on customer_number = i0zxnb
left join Nomis.NOMDBF95.SLSPHY01 a  
on a.L2RDCD = I0RDCD
left join Nomis.NOMDBF95.SLSPHY01 b 
on customer_salesman_number = b.L2RDCD
where i0aqnb = '1'
go
select * from dim_customer_ship_to

