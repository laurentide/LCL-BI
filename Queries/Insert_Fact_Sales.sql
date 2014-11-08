USE NOMIS_WAREHOUSE
GO
TRUNCATE TABLE DBO.FACT_SALES
GO
INSERT
INTO   FACT_SALES
       (
              CUSTOMER_ID,
              PRODUCT_ID,
              SALESMAN_ID,
              VENDOR_ID,
              ORIGINATOR_ID,
              DIVISION_ID,
			  INVENTORY_ID,
		      WAREHOUSE_ID,
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
       IMH9VA,
       IMIAVA,
       IMOQNB,
       IMQ9CD,
       IMXICF,
       IMS9NB,
       CONVERT(SMALLDATETIME,(SUBSTRING(CONVERT(CHAR,IMDGDU),2,6)),12),
       IMU5SU,
       IMT7ND
FROM
       (SELECT *
       FROM   NOMIS.NOMDBF95.SSTPHY01
       WHERE  LEN(IMDGDU)  > 6
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
WHERE  A.IMDGDU             >= 1021001
  AND IMAQNB = 1
  and a.imdgdu < 1404002
go
select * from fact_sales
