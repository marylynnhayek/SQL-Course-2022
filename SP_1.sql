-- Stored Procedure: SP_1.sql: Ecrire une procédure stockée qui affiche le nombre
-- d'employées pour chaque titre: 
create Procedure Total_Emp_By_Title
AS
BEGIN
    SELECT title, count(*)
    from s_emp
    group by title
    order by count(*) desc;
END;

EXEC Total_Emp_By_Title;

-- Ou bien: Autre méthode d'exécution:
EXECUTE Total_Emp_By_Title;