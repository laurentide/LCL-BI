use nomis_warehouse
go
truncate table Nomis_Warehouse.dbo.dim_productcodes
go
insert into Nomis_Warehouse.dbo.dim_productcodes (product_code, product_description, product_company_number,pc_category_id, pc_nomis_secondary_category)
SELECT AQC5AA,AQC6AA,A1AQNB,pc_category_id,a1fytu
from Nomis.S1018252.NOMDBF95.PCDPHY01
LEFT JOIN Nomis.S1018252.NOMDBF95.FRA1REL4
on A1C5AA = AQC5AA
--and A1AQNB = AQAQNB
INNER JOIN Nomis_Warehouse.dbo.dim_product_code_category
on A1FXTU = product_primary_category
where AQAQNB = 1
AND A1AQNB = 1
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = null
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 1 --Hours Automation
where product_code in ('34','S3','S5','S6','S7')
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 2 --Training Automation
where product_code in ('37','AQ')
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 3 --Products Automation
where product_Code in ('S1','S2','S4','S9','98')
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 4 --Hours Engineering
where product_Code in ('39','36','C9')
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 5 --Training Engineering
where product_Code in ('')
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 6 --Products Engineering 
where product_Code in ('29')
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 7 --Hours FI  
where product_Code in ('FI','CC','53','AP','I6','I3', 'IS','I7','IR')
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 8 --Training FI 
where product_Code in ('I1')
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 9 --Products FI
where product_Code in ('57','60') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 10 --Hours huile
where product_Code in ('P4','B5','PM','P5','PH','BM') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 11 --Training huile
where product_Code in ('B4','B6') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 12 --Products huile
where product_Code in ('P8','PD') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 18 --Rebilled Expenses - Automation
where product_Code in ('38') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 19 --Rebilled Expenses - Engineerting
where product_Code in ('30','C0') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 20 --Rebilled Expenses - Intrumentation
where product_Code in ('I2') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 21 --Rebilled Expenses - Huile
where product_Code in ('B7') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 22 --Rebilled Expenses - Vibration
where product_Code in ('P7') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 23 --Rebilled Expenses - CSI
where product_Code in ('') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 24 --Hours Alcan
where product_Code in ('S8') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 25 --Hours PWC
where product_Code in ('Y9') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 26 --Hours Vibration
where product_Code in ('P1','P2','P3','B1','B2','PG') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 27 --Training Vibration
where product_Code in ('P0','P6','B3') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 28 --Products Vibration
where product_Code in ('PR','73') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 29 --CSI Hours
where product_Code in ('') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 30 --CSI Product
where product_Code in ('62','65','67','C2','82','83','91','92','93','94','96','97') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 31 --CSI Training
where product_Code in ('') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 32 --Sub-Contractors Engineering
where product_Code in ('35','C5') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 33 --Sub-Contractors Huile
where product_Code in ('CH') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 34 --Sub-Contractors Vibration
where product_Code in ('CV') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 35 --Products Reliability Products 
where product_Code in ('62','65','67','82','91','92','93','94','96','P8','PD','73','PR','52','59','75','PS','WV') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 36 --Hours Reliability Services 
where product_Code in ('P4','B5','PM','P5','BM','P1','P2','P3','B1','B2','PG') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 37 --Sub-Contractors Reliability Services
where product_Code in ('CV','CH') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 38 --Training Reliability Services
where product_Code in ('P0','P6','B3','B4','B6') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 39 --Rebilled Expenses Reliability Services
where product_Code in ('B7','P7') 
                                                                             
go
--32	Sub-Contractors                                                                                     	Engineering
--33	Sub-Contractors                                                                                     	Huile
--34	Sub-Contractors                                                                                     	Vibration
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_servicecategory_id = 17 --Le reste 
where pc_servicecategory_id is null
go
use nomis_warehouse
go
----------------------------------------------
-------------- SUBCATEGORY -------------------
----------------------------------------------

update Nomis_Warehouse.dbo.dim_productcodes
set pc_subcategory_id = null
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_subcategory_id = 1 --AMS
where product_code in ('49','50')
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_subcategory_id = 2 --CSI online
where product_code in ('62','WV')
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_subcategory_id = 3 --CSI offline
where product_Code in ('65','67','73','C2','82','83','91','92','93','94','96','97')
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_subcategory_id = 6 --FIELD COMMUNICATORS 
where product_Code in ('A9','N1','47','48')
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_subcategory_id = 7 --ENGINEERING
where product_Code in ('30','39','36','29','35','C0','C5','C9') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_subcategory_id = 8 --Automation 
where product_Code in ('34','37','38','S1','S2','S3','S4','S5','S6','S7','98', 'S9', 'TS')
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_subcategory_id = 9 --PROAXION 
where product_Code in ('B1','B2','B4','B5','B6','B7','PE','PM','PR','P0','P1','P2','P3','P4','P5','P6','P7','P8','P9','PV','PD','CV','CH','B3')
update Nomis_Warehouse.dbo.dim_productcodes
set pc_subcategory_id = 12 --PSS 
where product_Code in ('28','31','32','33','41','42','43','44','45','46','54','81','84','85','FC')
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_subcategory_id = 13 --Field Instrumentation
where product_Code in ('I1','I2','I3','I5','I6','I7', 'CC','FI','AP','IR','53') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_subcategory_id = 14 --TECHNICAL SERVICES
where product_Code in ('S8') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_subcategory_id = 16 --TECHNICAL SERVICES
where product_Code in ('Y9') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_subcategory_id = 18 --Others
where product_Code in ('P8','PD') 
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_subcategory_id = 15 --Others
where product_Code in ('01','02','03','75','AQ','FS','X7','X8','X9','SA','TS','ZZ') 
go

go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_subcategory_id = 17 --CSI Training
where product_Code in ('') 
----------------------------------------------
-------------- SUBCATEGORY -------------------
----------------------------------------------
go
update Nomis_Warehouse.dbo.dim_productcodes
set pc_subcategory_id = 11 --Le reste 
where pc_subcategory_id is null


