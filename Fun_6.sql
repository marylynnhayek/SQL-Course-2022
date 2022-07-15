create function liste_profs_par_Ville(@nomVille NVARCHAR(100)) returns table
As
Return select City, prof_name from professor where city=@nomVille 

select * from liste_profs_par_ville('Beirut')  