USE NOMIS_WAREHOUSE
GO
TRUNCATE TABLE DBO.fact_alliance_sales
GO
INSERT
INTO   fact_alliance_sales
       (
              CUSTOMER_ID,
              PRODUCT_ID,
              SALESMAN_ID,
              VENDOR_ID,
              ORIGINATOR_ID,
              DIVISION_ID,
			  INVENTORY_ID,
		      WAREHOUSE_ID,
			  WORK_ID,
              SELLING_PRICE,
              COST,
              QUANTITY_ORDERED,
              ORDER_NUMBER,
              LINE_NUMBER,
              SEQUENCE_NUMBER,
              INVOICE_DATE,
              NONSTOCKITEM,
			  INVOICE_NUMBER
       )
SELECT CUSTOMER_ID,
       DIM_PRODUCTCODES.PRODUCT_ID,
       SALESMAN_ID,
       VENDOR_ID,
       ORIGINATOR_ID,
       DIVISION_ID,
	   INVENTORY_ID,
	   WAREHOUSE_ID,
	   WORK_ID,
       IMH9VA as SELLING_PRICE,
       IMIAVA as COST,
       IMOQNB as QUANTITY_ORDERED,
       IMQ9CD as ORDER_NUMBER,
       IMXICF as LINE_NUMBER,
       IMS9NB as SEQUENCE_NUMBER,
       CONVERT(SMALLDATETIME,(SUBSTRING(CONVERT(CHAR,IMDGDU),2,6)),12) as INVOICE_DATE,
       IMU5SU as NONSTOCKITEM,
       IMT7ND as INVOICE_NUMBER
--into fact_alliance_sales
FROM
       (SELECT *
       FROM   NOMIS.NOMDBF95.SSTPHY01
       WHERE  LEN(IMDGDU)   > 6
          AND IMDGDU      < 1500101
       ) AS A
       LEFT JOIN DIM_CUSTOMER
       ON     DIM_CUSTOMER.CUSTOMER_NUMBER = A.IMZXNB
       LEFT JOIN DIM_PRODUCTCODES
       ON     PRODUCT_CODE = A.IMC5AA
       LEFT JOIN DIM_SALESMAN
       ON     SALESMAN_NUMBER = A.IMRDCD
       LEFT JOIN DIM_VENDOR
       ON     VENDOR_NUMBER = A.IMRCCD
       LEFT JOIN DIM_ORIGINATOR
       ON     ORIGINATOR_IDENT = A.IMRMCD
       LEFT JOIN DIM_INVENTORY
       ON     INVENTORY_NUMBER = A.IMEQCF
       LEFT JOIN DIM_DIVISION
       ON     DIVISION_IDENT = A.IMRJCD
       LEFT JOIN DIM_WAREHOUSE
	   ON     WAREHOUSE_code = A.IMD6CF
	   INNER JOIN DIM_ALLIANCE_WORK
	   on DIM_ALLIANCE_WORK.coresalesordercd = imq9cd
WHERE  A.IMDGDU             >= 1021001
  AND IMAQNB = 1
  and a.imdgdu <> 1404002
go
select * from fact_alliance_sales
--drop table fact_alliance_sales