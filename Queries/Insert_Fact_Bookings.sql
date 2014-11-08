-- Author: Duc Duy Nguyen
-- Purpose: Creating a fact table for bookings from BOOKING.BPTPHY01

USE NOMIS_WAREHOUSE 
GO
TRUNCATE TABLE DBO.FACT_BOOKINGS 
GO
INSERT
INTO    FACT_BOOKINGS
        (
                ORDER_NUMBER    ,
                SEQUENCE_NUMBER ,
                COMPONENT_NUMBER,
                LINE_NUMBER     ,
                CUSTOMER_ID     ,
                PRODUCT_ID      ,
                SALESMAN_ID     ,
                ORIGINATOR_ID   ,
                DIVISION_ID     ,
                SHIP_TO_ID      ,
                SELLING_PRICE   ,
                COST            ,
                QUANTITY_ORDERED,
                BOOKING_DATE    ,
				ADDED_DATE       
        )
SELECT  D2IWMA       ,
        D2S8NC       ,
        D2S7NC       ,
        D2S6NC       ,
        DIM_CUSTOMER.CUSTOMER_ID  ,
        PRODUCT_ID   ,
        DIM_SALESMAN.SALESMAN_ID  ,
        ORIGINATOR_ID,
        DIVISION_ID  ,
        SHIP_TO_ID   ,
        D2DGVA       ,
        D2DHVA       ,
        D2S9NC       ,
        CONVERT(DATETIME,RTRIM(CONVERT(CHAR,
        CASE
                WHEN D2IZMA < 4
                THEN D2IYMA - 1
                ELSE D2IYMA
        END)) + '/' + RTRIM(CONVERT(CHAR,
        CASE
                WHEN D2IZMA < 4
                THEN D2IZMA + 9
                ELSE D2IZMA - 3
        END))               + '/01') AS DATE,
		CONVERT(SMALLDATETIME,(SUBSTRING(CONVERT(CHAR,D2F8DT),2,6)),12)
FROM    NOMIS.S1018252.BOOKING.BPTPHY01       AS A
        LEFT JOIN DIM_CUSTOMER
        ON      DIM_CUSTOMER.CUSTOMER_NUMBER = A.D2ZXNB
        LEFT JOIN DIM_PRODUCTCODES
        ON      PRODUCT_CODE = A.D2C5AA
        --AND     D2AQNB = Product_company_number
        LEFT JOIN DIM_SALESMAN
        ON      SALESMAN_NUMBER = A.D2RDCD
        LEFT JOIN DIM_ORIGINATOR
        ON      ORIGINATOR_IDENT = A.D2RMCD
	    LEFT JOIN DIM_DIVISION
        ON      DIVISION_IDENT = A.D2RJCD
		LEFT JOIN DIM_Customer_Ship_to
        ON D2RHCD = ship_to_number
        and D2ZXNB = ship_to_customer_number
WHERE   D2IYMA                   >= 2003
  AND   D2AQNB = 1
go

