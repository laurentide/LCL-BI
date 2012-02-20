use nomis_warehouse
go
drop table tblQuoteType
go
select quoteid, revision, case when total > 50000 then 2 else 1 end as type_id, total 
into tblQuoteType
from (
select quot.quoteid, quot.revision, 
sum (((case when [discount] is not null then 0 else[uslistprice]*[exchrate]*(1-isnull([Base],0)/100)*(1-isnull([Ext],0)/100) end)
+IsNull([USNet],0)*[exchrate]
+IsNull([Valve_uslist],0)*[exchrate]*(1-IsNull([Valve_Base],0)/100)*(1-IsNull([Valve_Ext],0)/100)
+IsNull([Actuator_uslist],0)*[exchrate]*(1-IsNull([Actuator_Base],0)/100)*(1-IsNull([Actuator_Ext],0)/100)
+IsNull([Positioner_uslist],0)*[exchrate]*(1-IsNull([Positioner_Base],0)/100)*(1-IsNull([Positioner_Ext],0)/100)
+(case when [discount] is null then 0 else IsNull([uslistprice],0)*[exchrate]*(1-IsNull([discount],0)/100)end)) * [qty]) AS total
FROM    QuoteBuilder.dbo.tblquotes                AS QUOT
        INNER JOIN QuoteBuilder.dbo.tblquotedproducts PROD
        ON      QUOT.QUOTEIDREF = PROD.QUOTEIDREF
        LEFT JOIN QuoteBuilder.dbo.tblValveExtended VALV
        ON      PROD.QUOTEDPRODUCTID = VALV.QUOTEDPRODUCTID
group by quot.quoteid, quot.revision) as A