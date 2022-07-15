create function liste_profs_par_nom(@nomP NVARCHAR(100)) returns table
As
Return select * from professor where prof_name like @nomP+'%'

select * from liste_profs_par_nom ('s');