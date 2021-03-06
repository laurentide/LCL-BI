use nomis_warehouse
go
truncate table dbo.dim_salesman 
go
insert into dbo.dim_salesman ( Salesman_Number, Salesman_Name, salesman_account_name,salesman_active)
select L2RDCD,L2RRTX, sAmaccountName,l2fesu from Nomis.S1018252.NOMDBF95.SLSPHY01
left join (
SELECT     *
FROM         OPENQUERY(ADSI, 
                      'SELECT sn,givenname, sAMAccountName, telephoneNumber, mail FROM
''LDAP://OU=LCL USERS,DC=ADC,DC=laurentidecontrols, DC=COM'' WHERE
      objectClass = ''user''')) ActiveDirectory
On rtrim(Upper(ActiveDirectory.givenName + ' ' + sn)) = RTRIM(L2RRTX) 
go
update dim_Salesman
set salesman_account_name = 'SylvainR'
where salesman_name = 'OLIVIER G. SYLVAIN R'
go
update dim_salesman
set salesman_account_name = null 
where salesman_name in ('Sylvain Roch')
go
SET IDENTITY_INSERT dim_salesman ON
go
insert into dbo.dim_salesman ( salesman_id,Salesman_Number, Salesman_Name, salesman_account_name,salesman_active)
select 0,'','','','A'
go
SET IDENTITY_INSERT dim_salesman OFF
