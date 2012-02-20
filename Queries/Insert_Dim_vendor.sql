use nomis_warehouse
go
truncate table dbo.dim_vendor
go
insert into dbo.dim_vendor ( vendor_number,vendor_name, vendor_address1, vendor_address2, vendor_city, vendor_state, vendor_zip_code, vendor_telephone_number)
select LRRCCD,LRRKTX,LRRLTX,LRRMTX,LRRNTX,LRROTX,LRN9TY,LRQGCD from Nomis.dbo.VENPHY01
