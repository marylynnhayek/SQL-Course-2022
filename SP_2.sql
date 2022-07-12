-- SP_2.sql: Ecrire une procédure stockée qui récupère le nom des 
-- employés d'un titre donné:
CREATE PROCEDURE Print_Emp(@titre varchar(20))
AS
BEGIN
    SELECT last_name, first_name, title
    from s_emp
    where title=@titre;
END;

EXEC Print_Emp('Sales');