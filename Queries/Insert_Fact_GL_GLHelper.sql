use nomis_Warehouse
go
Insert into fact_Gl (account_id, DATE, Fiscal_Year, Fiscal_Month, Amount, Description_1, Description_2)
select account_id,         
        CONVERT(DATETIME,rtrim(CONVERT(CHAR,
        CASE
                WHEN Fiscal_Month < 4
                THEN Fiscal_Year - 1
                ELSE Fiscal_Year
        END)) + '/' + rtrim(CONVERT(CHAR,
        CASE
                WHEN Fiscal_Month < 4
                THEN Fiscal_Month + 9
                ELSE Fiscal_Month - 3
        END)) + '/01') AS DATE,
        Fiscal_Year, Fiscal_Month, -Amount, 'GL HELPER','GL HELPER'
from dbo.tblGLHelper inner join dim_account
on gl = account_gl

