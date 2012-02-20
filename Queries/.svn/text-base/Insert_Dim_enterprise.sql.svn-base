use nomis_warehouse
go
truncate table dim_enterprise
go
insert into dim_enterprise 
(enterprise_number, enterprise_name, enterprise_adress, enterprise_adress2, enterprise_city, enterprise_postal_code)
SELECT EPNBND as enterprise_number,
	   epo3ty as enterprise_name,
       epo4ty as enterprise_adress,
	   epo5ty as enterprise_adress2,
	   epo8ty as enterprise_city,
       epf7cf as enterprise_postal_code
--into dim_enterprise
from Nomis.S1018252.NOMDBF95.ETMPHY01
go
select * from dim_enterprise