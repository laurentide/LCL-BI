USE NOMIS_WAREHOUSE
GO
TRUNCATE TABLE FACT_QUOTES
GO
INSERT
INTO   FACT_QUOTES
       (
              CONTACT_ID
            , PRODUCT_ID
            , STATUS_ID
            , EMPLOYEE_ID
            , TYPE_ID
            , QUOTEIDREF
            , QUOTEID
            , REVISION
            , QUOTEDPRODUCTID
            , VALVEEXTENDEDID
            , date
            , TOTAL
            , CDNLIST
            , REVISEDQUOTE
            , FOLLOWUP
            , ALTERNATIVE
            , MODELNUMBER
            , RESPONSETIME
            , LATEST_REVISION
            , OS1
            , OS2
	        , currency_id
            , source
            , Notes
       )
SELECT CONTACT_ID
     , PRODUCT_ID
     , STATUS_ID
     , EMPLOYEE_ID
     , TYPE_ID
     , QUOT.QUOTEIDREF
     , QUOT.QUOTEID
     , QUOT.REVISION
     , PROD.QUOTEDPRODUCTID
     , VALV.VALVEEXTENDEDID
     , CAST(FLOOR(CAST(date AS float)) as datetime) as [date]
     , ((
                     CASE WHEN [discount] IS NOT NULL THEN 0
                            ELSE[uslistprice]*[exchrate]*(1-ISNULL([Base],0)/100)*(1-ISNULL([Ext],0)/100)
                     END)+ISNULL([USNet],0)*[exchrate]+ISNULL([Valve_uslist],0)*[exchrate]*(1-ISNULL([Valve_Base],0)/100)*(1-ISNULL([Valve_Ext],0)/100)+ISNULL([Actuator_uslist],0)*[exchrate]*(1-ISNULL([Actuator_Base],0)/100)*(1-ISNULL([Actuator_Ext],0)/100)+ISNULL([Positioner_uslist],0)*[exchrate]*(1-ISNULL([Positioner_Base],0)/100)*(1-ISNULL([Positioner_Ext],0)/100)+(
                     CASE WHEN [discount] IS NULL THEN 0
                            ELSE ISNULL([uslistprice],0)*[exchrate]*(1-ISNULL([discount],0)/100)
                     END))*[qty] AS TOTAL
     , [uslistprice]*[exchrate]  AS CDNLIST
     , REVISEDQUOTE
     , FOLLOWUP
     , ALTERNATIVE
     , MODELNUMBER
     , RESPONSETIMEHOURS*60+RESPONSETIMEMINUTES
     , LATEST_REVISION
     , OS1
     , OS2
     , currency_id
     , source
     , Notes
FROM   QUOTEBUILDER.DBO.TBLQUOTES AS QUOT
       INNER JOIN QUOTEBUILDER.DBO.TBLQUOTEDPRODUCTS PROD
       ON     QUOT.QUOTEIDREF=PROD.QUOTEIDREF
       LEFT JOIN QUOTEBUILDER.DBO.TBLVALVEEXTENDED VALV
       ON     PROD.QUOTEDPRODUCTID=VALV.QUOTEDPRODUCTID
       LEFT JOIN DIM_CUSTOMERCONTACT CUST
       ON     QUOT.CONTACTID=CUST.CONTACTID
       LEFT JOIN DIM_PRODUCTCODES PC
       ON     PROD.PRODUCTCODE=PC.PRODUCT_CODE
       LEFT JOIN DIM_QUOTE_STATUS STAT
       ON     PROD.STATUS=STAT.STATUSID
       LEFT JOIN DIM_QUOTE_EMPLOYEE EMP
       ON     QUOT.QUOTEDBY=EMP.EMPLOYEE_NAME
       LEFT JOIN TBLQUOTETYPE TYPES
       ON     QUOT.QUOTEID=TYPES.QUOTEID
          AND QUOT.REVISION=TYPES.REVISION
       LEFT JOIN DIM_CURRENCY CURR
       ON     CURR.Currency_quote_code = QUOT.Currency
WHERE  PRODUCT_COMPANY_NUMBER=1
go
select * from dim_productcodes
where product_id = 308

select * from fact_quotes
where product_id = 308