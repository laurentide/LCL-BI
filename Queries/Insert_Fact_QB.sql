USE NOMIS_WAREHOUSE
GO
TRUNCATE TABLE FACT_QUOTES
--drop table fact_Quotes
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
            , followupby
            , ALTERNATIVE
            , MODELNUMBER
            , RESPONSETIME
            , LATEST_REVISION
            , OS1
            , OS2
	        , currency_id
            , source
            , Notes
            ,SELTSponsor
            ,FollowupComment
            ,FollowupDoneDate
       )
SELECT quot.CONTACTID as CONTACT_ID
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
     , (CASE WHEN [discount] IS NOT NULL THEN 0 ELSE ISNULL([uslistprice],0)*ISNULL([exchrate],0)*(1-ISNULL([Base],0)/100)*(1-ISNULL([Ext],0)/100) END)
      +(CASE WHEN [discount] IS NULL THEN 0 ELSE ISNULL(ISNULL([uslistprice],0),0)*ISNULL([exchrate],0)*(1-ISNULL([discount],0)/100) END)
      +ISNULL([USNet],0)*ISNULL([exchrate],0)
      +ISNULL([Valve_uslist],0)*ISNULL([exchrate],0)*(1-ISNULL([Valve_Base],0)/100)*(1-ISNULL([Valve_Ext],0)/100)
      +ISNULL([Actuator_uslist],0)*ISNULL([exchrate],0)*(1-ISNULL([Actuator_Base],0)/100)*(1-ISNULL([Actuator_Ext],0)/100)
      +ISNULL([Positioner_uslist],0)*ISNULL([exchrate],0)*(1-ISNULL([Positioner_Base],0)/100)*(1-ISNULL([Positioner_Ext],0)/100)
      *ISNULL([Qty],0)  AS TOTAL
     , ISNULL([uslistprice],0)*ISNULL([exchrate],0) AS CDNLIST
     , REVISEDQUOTE
     , case when followupby is null then 0 else 1 end as FOLLOWUP
     , followupby
     , ALTERNATIVE
     , MODELNUMBER
     , RESPONSETIMEHOURS*60+RESPONSETIMEMINUTES as RESPONSETIME
     , LATEST_REVISION
     , OS1
     , OS2
     , currency_id
     , source
     , Notes
     , SELTSponsor
     ,left(FollowupComment,100)
     ,FollowupDoneDate
--into fact_Quotes
FROM   QUOTEBUILDER.DBO.TBLQUOTES AS QUOT
       INNER JOIN QUOTEBUILDER.DBO.TBLQUOTEDPRODUCTS PROD
       ON     QUOT.QUOTEIDREF=PROD.QUOTEIDREF
       LEFT JOIN QUOTEBUILDER.DBO.TBLVALVEEXTENDED VALV
       ON     PROD.QUOTEDPRODUCTID=VALV.QUOTEDPRODUCTID
       Inner JOIN DIM_CUSTOMERCONTACT CUST
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
and quot.quoteid is not null
go
