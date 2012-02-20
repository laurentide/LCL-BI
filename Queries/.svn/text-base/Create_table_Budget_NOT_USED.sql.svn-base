use Nomis
go
drop table tblbudget_2009
go
SELECT   BUDG.DEPARTMENTID,
		 BUDG.RPTDESC as Category,
         CASE
                        WHEN BUDG.DESCRIPTION = 'Training'
                        THEN (SUM(ISNULL(COSTOFCOURSE, 0)) + SUM(ISNULL(MONTANT, 0))) /12
                        WHEN BUDG.DESCRIPTION = 'Car rental'
                        THEN (SUM(ISNULL(CARRENTAL, 0)) + SUM(ISNULL(MONTANT, 0))) /12
                        WHEN BUDG.DESCRIPTION = 'Travel  fares'
                        THEN (SUM(ISNULL(FARES, 0)) + SUM(ISNULL(MONTANT, 0))) /12
                        WHEN BUDG.DESCRIPTION = 'Travel  hotel'
                        THEN (SUM(ISNULL(HOTEL, 0)) + SUM(ISNULL(MONTANT, 0))) /12
                        WHEN BUDG.DESCRIPTION = 'Meals & entertainment'
                        THEN (SUM(ISNULL(MEALS,0)) + 
							 SUM(ISNULL(ENTERTAINMENT,0)) + 
                             SUM(ISNULL(MONTANT, 0)))  /12
                        ELSE SUM(ISNULL(MONTANT, 0))  /12
          END Amount
INTO TBLBUDGET_2009 
FROM     (SELECT BUDG.BUDGETID,
                 BUDG.DEPARTMENTID,
                 GL.GL,
                 GL.DESCRIPTION,
			     RPTDESC,
                 BUDG.YEAR,
				 GL.rptid
          FROM   [LCL-faxs].LCLADMIN.dbo.TBLBUDGET BUDG,
                 [LCL-faxs].LCLADMIN.dbo.TBLGL GL
		 WHERE DEPARTMENTID IS NOT NULL) BUDG
         LEFT JOIN [LCL-faxs].LCLADMIN.dbo.TBLBUDGETDETAILS DETS
           ON DETS.BUDGETID = BUDG.BUDGETID
              AND DETS.NOGL = BUDG.GL
         LEFT JOIN [LCL-faxs].LCLADMIN.dbo.TBLCOMPONENTS C
           ON C.DETAILID = DETS.DETAILID
		 LEFT JOIN 
(select budgetid,
sum(CostOfCourse) as CostOfCourse, sum(CarRental) as CarRental, sum(Fares) as Fares, sum(Hotel) as Hotel, sum(Meals) as Meals, SUM(Entertainment) as Entertainment from [LCL-faxs].LCLADMIN.dbo.TBLTRAVELBUDGET group by budgetid) TB
		   ON BUDG.BUDGETID = TB.BUDGETID
GROUP BY 
BUDG.DEPARTMENTID,
RPTDESC,
BUDG.DESCRIPTION
go
select departmentid, category, sum(amount) from tblBudget_2009
group by departmentid, category with rollup
