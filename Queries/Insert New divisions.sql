--select * from dbo.tblGL
--
--select * from dbo.tblNomisGlDept
--where nogl not in (select gl from tblgl)
insert into tblNomisGLDept (DepartmentID, GL, subAcc, Description, NoGL)
select '7.1.000.000',gl + '7.1.000.000', substring(gl,4,7), Description, gl
from tblgl
where catid < 6
order by catid