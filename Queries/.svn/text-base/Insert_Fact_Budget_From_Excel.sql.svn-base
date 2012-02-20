use nomis_warehouse
go
DROP TABLE fact_budget 
go
SELECT account_id,
       CONVERT(DATETIME,rtrim(CONVERT(CHAR,
       CASE
              WHEN mois < 4
              THEN YEAR - 1
              ELSE YEAR
       END)) + '/' + rtrim(CONVERT(CHAR,
       CASE
              WHEN mois < 4
              THEN mois + 9
              ELSE mois - 3
       END))            + '/01') AS DATE       ,
       YEAR                      AS fiscal_year,
       departmentid as department_id           ,
       CASE
              WHEN rptid = 1
              THEN amount
              ELSE -amount
       END AS total,
       description
INTO   fact_budget
FROM
       (SELECT *,
              2009 AS YEAR
       FROM   Nomis.dbo.TBLBUDGET_2009
              INNER JOIN
                     (SELECT  MIN(gl)    AS gl               ,
                              MIN(CATID) AS CATID            ,
                              RPTDESC                        ,
                              MIN(dESCRIPTION) AS dESCRIPTION,
                              MIN(HELP)        AS HELP       ,
                              MIN(RPTCAT)      AS RPTCAT     ,
                              MIN(RPTID)       AS RPTID
                     FROM     [LCL-FAXS].LCLADMIN.dbo.TBLGL
                     GROUP BY RPTDESC
                     ) AS b
              ON     category = rptdesc
              CROSS JOIN [LCL-FAXS].LCLADMIN.dbo.yearconvert
       ) AS BUDG
       LEFT JOIN
              (SELECT  account_department_id,
                       account_name         ,
                       MIN(account_id) AS account_id
              FROM     dim_account
              GROUP BY account_name,
                       account_department_id
              ) ACC
       ON     BUDG.departmentid  = ACC.account_department_id
          AND BUDG.RPTDESC       = ACC.account_name 
go
