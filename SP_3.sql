-- SP_3.sql: Ecrire une procédure qui affiche le nombre de clients dans chaque
-- région:
create PROCEDURE emp_region
AS
BEGIN 
    select c.name, r.name, count(*)
    from s_customer c, s_region r
    where c.region_id=r.id;
end;
