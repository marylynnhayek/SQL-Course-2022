create function nombre_profs() returns int
As
Begin
    Declare @cpt INT
    set @cpt=(select count(*) from professor)
    return @cpt
End

-- To  execute the function: 
select dbo.Nombre_profs()