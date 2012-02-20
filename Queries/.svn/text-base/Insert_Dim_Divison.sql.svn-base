use nomis_warehouse
go
truncate table dim_division
go
insert into dim_division (division_ident, division_name)
SELECT CBRJCD as division_ident, CBSBTX as division_name
--INTO dim_division
FROM NOMIS.NOMDBF95.DIVPHY01
