use nomis_warehouse
go
--1	Hours                     	Automation
--2	Training                  	Automation
--3	Product                   	Automation
--4	Hours                     	Engineering
--5	Training                  	Engineering
--6	Product                   	Engineering
--7	Hours                     	Instrumentation
--8	Training                  	Instrumentation
--9	Product                   	Instrumentation
--10	Hours                   Huile
--11	Training                Huile
--12	Product                 Huile
--17	No Category             No Category                                                                                         
--18	Rebilled Expenses       Automation
--19	Rebilled Expenses       Engineering
--20	Rebilled Expenses       Instrumentation
--21	Rebilled Expenses       Huile
--22	Rebilled Expenses       Vibration
--23	Rebilled Expenses       CSI
--24	Hours                   Alcan
--25	Hours                   PWC
--26	Hours                   Vibration
--27	Training                Vibration
--28	Product                 Vibration
--29	Hours                   CSI
--30	Product                 CSI
--31	Training                CSI
update dim_productcodes
set pc_servicecategory_id = null
go
update dim_productcodes
set pc_servicecategory_id = 1 --Hours Automation
where product_code in ('34','S3','S5','S6','S7')
go
update dim_productcodes
set pc_servicecategory_id = 2 --Training Automation
where product_code in ('37','AQ')
go
update dim_productcodes
set pc_servicecategory_id = 3 --Products Automation
where product_Code in ('S1','S2','S4','S9','98')
go
update dim_productcodes
set pc_servicecategory_id = 4 --Hours Engineering
where product_Code in ('39','36')
go
update dim_productcodes
set pc_servicecategory_id = 5 --Training Engineering
where product_Code in ('')
go
update dim_productcodes
set pc_servicecategory_id = 6 --Products Engineering 
where product_Code in ('29')
go
update dim_productcodes
set pc_servicecategory_id = 7 --Hours FI  
where product_Code in ('FI','CC','53','AP','I6','I3', 'IS','I7','IR')
go
update dim_productcodes
set pc_servicecategory_id = 8 --Training FI 
where product_Code in ('I1')
go
update dim_productcodes
set pc_servicecategory_id = 9 --Products FI
where product_Code in ('57','60') 
go
update dim_productcodes
set pc_servicecategory_id = 10 --Hours huile
where product_Code in ('P4','B5','PM') 
go
update dim_productcodes
set pc_servicecategory_id = 11 --Training huile
where product_Code in ('B4','B6') 
go
update dim_productcodes
set pc_servicecategory_id = 12 --Products huile
where product_Code in ('P8','PD') 
go
update dim_productcodes
set pc_servicecategory_id = 18 --Rebilled Expenses - Automation
where product_Code in ('38') 
go
update dim_productcodes
set pc_servicecategory_id = 19 --Rebilled Expenses - Engineerting
where product_Code in ('30') 
go
update dim_productcodes
set pc_servicecategory_id = 20 --Rebilled Expenses - Intrumentation
where product_Code in ('I2') 
go
update dim_productcodes
set pc_servicecategory_id = 21 --Rebilled Expenses - Huile
where product_Code in ('B7') 
go
update dim_productcodes
set pc_servicecategory_id = 22 --Rebilled Expenses - Vibration
where product_Code in ('P7') 
go
update dim_productcodes
set pc_servicecategory_id = 23 --Rebilled Expenses - CSI
where product_Code in ('') 
go
update dim_productcodes
set pc_servicecategory_id = 24 --Hours Alcan
where product_Code in ('S8') 
go
update dim_productcodes
set pc_servicecategory_id = 25 --Hours PWC
where product_Code in ('Y9') 
go
update dim_productcodes
set pc_servicecategory_id = 26 --Hours Vibration
where product_Code in ('P1','P2','P3','P5','B1','B2') 
go
update dim_productcodes
set pc_servicecategory_id = 27 --Training Vibration
where product_Code in ('P0','P6') 
go
update dim_productcodes
set pc_servicecategory_id = 28 --Products Vibration
where product_Code in ('PR') 
go
update dim_productcodes
set pc_servicecategory_id = 29 --CSI Hours
where product_Code in ('96') 
go
update dim_productcodes
set pc_servicecategory_id = 30 --CSI Product
where product_Code in ('62','65','67','73','C2','82','83','91','92','93','94','96','97') 
go
update dim_productcodes
set pc_servicecategory_id = 31 --CSI Training
where product_Code in ('B3') 
go
update dim_productcodes
set pc_servicecategory_id = 17 --Le reste 
where pc_servicecategory_id is null

--01 x
--02 x
--03 x
--34 y
--35 x
--36 x
--37 y
--38 x
--40 x
--AP x
--FS x
--S1 y
--S2 y
--S3 y
--S4 y
--S5 y
--S6 y
--S7 y
--S9 y
--SA x
--T1 x
--T2 x
--TS x
--ZZ x
--AQ z
--98 z

