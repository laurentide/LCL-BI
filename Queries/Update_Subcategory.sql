use nomis_warehouse
go
update dim_productcodes
set pc_subcategory_id = null
go
update dim_productcodes
set pc_subcategory_id = 1 --AMS
where product_code in ('49','50')
go
update dim_productcodes
set pc_subcategory_id = 2 --CSI online
where product_code in ('62')
go
update dim_productcodes
set pc_subcategory_id = 3 --CSI offline
where product_Code in ('65','67','73','C2','82','83','91','92','93','94','96','97')
go
update dim_productcodes
set pc_subcategory_id = 6 --FIELD COMMUNICATORS 
where product_Code in ('A9','N1','47','48')
go
update dim_productcodes
set pc_subcategory_id = 7 --ENGINEERING
where product_Code in ('30','39','36','29')
go
update dim_productcodes
set pc_subcategory_id = 8 --Automation 
where product_Code in ('34','37','38','S1','S2','S3','S4','S5','S6','S7','98', 'S9', 'TS')
go
update dim_productcodes
set pc_subcategory_id = 9 --PROAXION 
where product_Code in ('B1','B2','B4','B5','B6','B7','PE','PM','PR','P0','P1','P2','P3','P4','P5','P6','P7','P8','P9','PV')
update dim_productcodes
set pc_subcategory_id = 12 --PSS 
where product_Code in ('28','31','32','33','41','42','43','44','45','46','54','81','84','85','FC')
go
update dim_productcodes
set pc_subcategory_id = 13 --Field Instrumentation
where product_Code in ('I1','I2','I3','I5','I6','I7', 'CC','FI','AP','IR') 
go
update dim_productcodes
set pc_subcategory_id = 14 --TECHNICAL SERVICES
where product_Code in ('S8') 
go
update dim_productcodes
set pc_subcategory_id = 16 --TECHNICAL SERVICES
where product_Code in ('Y9') 
go
update dim_productcodes
set pc_subcategory_id = 15 --Others
where product_Code in ('01','02','03','75','AQ','35','FS','X7','X8','X9','SA','TS','ZZ') 
go
update dim_productcodes
set pc_subcategory_id = 17 --CSI Training
where product_Code in ('B3') 
go
update dim_productcodes
set pc_subcategory_id = 11 --Le reste 
where pc_subcategory_id is null

