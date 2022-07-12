-- Fun_1.sql= Ecrire une fonction qui retourne le nombre d'employées: 
create FUNCTION Nb_Employee() RETURNS INT
AS
BEGIN
    DECLARE @nb int;
    set @nb=(select count(*) from s_emp);
    RETURN @nb;
END;

-- To execute the function:
SELECT dbo.nb_emp();
