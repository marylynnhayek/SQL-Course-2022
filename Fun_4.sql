create function nombre_profs_par_nom(@nomP NVARCHAR(10)) returns int
As
Begin
    Declare @cpt INT
    set @cpt=(select count(*) from professor where prof_name like @nomP+’%’)
    return @cpt
End

-- To execute the function:
select dbo.nombre_profs_par_nom ('s')