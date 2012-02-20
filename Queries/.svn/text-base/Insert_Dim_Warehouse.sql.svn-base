use nomis_Warehouse
go
truncate table dim_warehouse
go
insert into dim_warehouse (warehouse_code, warehouse_name, warehouse_contact)
select  CHD6CF as warehouse_code,
        chmvty as warehouse_name,
        chokty as warehouse_contact
--into dim_warehouse
from Nomis.S1018252.NOMDBF95.WHMPHY01
where chaqnb = 1