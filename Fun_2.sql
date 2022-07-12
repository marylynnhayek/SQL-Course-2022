-- Fun_2.sql: Create a function that returns the number of employees in a given department:
CREATE FUNCTION Nb_Employee(@dept varchar(20))
RETURNS TABLE
AS
BEGIN
    SELECT d.name, count(*)
    from s_dept d, s_emp e
    where d.id=c.dept_id and @dept=dept_id;
END;

-- To execute it:
SELECT * from Nb_Employee('Sales'); 