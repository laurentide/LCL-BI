use nomis_warehouse
go
TRUNCATE TABLE fact_gl 
go
insert into fact_Gl
SELECT  account_id,
        account_name,
		account_department_name,
        CONVERT(DATETIME,rtrim(CONVERT(CHAR,
        CASE
                WHEN BHAFCD < 4
                THEN BHAGCD - 1
                ELSE BHAGCD
        END)) + '/' + rtrim(CONVERT(CHAR,
        CASE
                WHEN BHAFCD < 4
                THEN BHAFCD + 9
                ELSE BHAFCD - 3
        END))               + '/01') AS DATE         ,
        BHBBTX                       AS GL           ,
        BHAGCD                       AS Fiscal_Year  ,
        BHAFCD                       AS Fiscal_Month ,		
		-BHBKVA                      AS Amount       ,
        BHAQNA                       AS Description_1,
        BHARNA                       AS Description_2
--INTO    fact_GL
FROM    Nomis.YGLWBFIL2.GLBHCPP
        INNER JOIN dim_account
        ON      BHBBTX = dim_account.account_gl
WHERE   BHAGCD         > 2008
AND     BHAACD = '001' 
go
