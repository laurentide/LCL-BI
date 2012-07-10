use Nomis_Warehouse 
GO
TRUNCATE TABLE DIM_ACCOUNT
GO
INSERT
INTO    DIM_ACCOUNT
        (
                account_gl           ,
                account_budget_gl    ,
                account_category_id  ,
                account_category     ,
                account_name         ,
                account_description  ,
                account_department_id,
                account_department_name
        )
SELECT  b.gl                                                  AS account_gl           ,
        b.nogl                                                AS account_budget_gl    ,
        a.rptid                                               AS account_category_id  ,
        a.rptcat                                              AS account_category     ,
        a.rptdesc                                             AS account_name         ,
        a.help                                                AS account_description  ,
        c.departmentid                                        AS account_department_id,
        c.description                                         AS account_department_name
FROM    [LCL-FAXS].LCLAdmin.dbo.tblgl          AS a
        INNER JOIN [LCL-FAXS].LCLAdmin.dbo.tblNomisGLDept AS b
        ON      a.GL = NOGL
        INNER JOIN [LCL-FAXS].LCLAdmin.dbo.tbldepartement AS c
        ON      b.departmentid = c.departmentid
        INNER JOIN [LCL-FAXS].LCLAdmin.dbo.tblMaincat AS d
        ON      a.catid = d.catid 
GO