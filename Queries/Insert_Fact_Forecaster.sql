USE NOMIS_WAREHOUSE
GO
TRUNCATE TABLE DBO.FACT_FORECASTER
--drop table DBO.FACT_FORECASTER
GO
INSERT
INTO   FACT_FORECASTER
       (
       forecaster_enterprise_id,
       pc_category_id,
       salesman_id,
       Date,
       Budgeted,
       ManagerBudget
       )
SELECT forecaster_enterprise_id,
       pc_category_id,
       salesman_id,
       convert(datetime,MonthNumber + '/01/' + convert(char,case when MonthNumber > 9 then i.year - 1 else i.year end),101) as Date,
       Budgeted /12 as Budgeted,
       ManagerBudget / 12 as ManagerBudget
--into Fact_Forecaster      
FROM   Forecaster.dbo.tblForecasts a
	   INNER JOIN Forecaster.dbo.tblForecastDetails b
	   ON a.ForecastID=b.forecastid
	   inner join Forecaster.dbo.tblenterprises c
       ON c.enterpriseid = b.enterpriseid
       LEFT JOIN 
	   (select distinct forecaster_enterprise_id from DIM_CUSTOMER) g
       ON     c.enterpriseid = forecaster_enterprise_id
       INNER JOIN Forecaster.dbo.tblProductCategories e
       ON e.ProductCategoryID  = b.Productcategoryid
       LEFT JOIN dbo.dim_product_code_category
       ON     product_primary_category = e.productcategory
       INNER JOIN Forecaster.dbo.tblTeams f
       ON     a.teamid = f.teamid
	   LEFT JOIN dbo.dim_salesman h
       on f.sls = h.salesman_number
       inner join Forecaster.dbo.tblForecastYears i
       on i.ForecastYearID = a.ForecastYearID
       cross join tblmonths
go
select * from FACT_FORECASTER
