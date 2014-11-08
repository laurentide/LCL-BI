use nomis_warehouse
go
truncate table dim_originator
go
insert into dim_originator (originator_ident, originator_name, originator_two_letter_code, originator_two_letter_name, originator_one_letter_code, originator_one_letter_name,originator_active)
select FURMCD, 
FUSFTX, 
Originator_Code as originator_two_letter_code,
case when furmcd in ('QKO','PKO','YKO','9KO') then 'Kevin Outhouse ' else Originator_Name end as originator_two_letter_name,
one_letter_code as originator_one_letter_code,
name as originator_one_letter_name , 
fufesu
from Nomis.NOMDBF95.ORGPHY01 left join
	 Nomis.dbo.tblOriginators
on case when len(FURMCD) = 3 then substring(furmcd,2,2) else null end = Originator_Code
LEFT JOIN Nomis.dbo.tblOriginators_csr
ON case when len(furmcd) = 3 then left(furmcd,1) else null end = One_Letter_Code
where fuaqnb = 1
go
select * from 