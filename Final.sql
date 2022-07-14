-- Révision pour l'examen final:

-- Chapitre: Date:

-- they give date and time:
select CURRENT_TIMESTAMP,SYSDATETIME(),GETDATE(); 
select YEAR(CURRENT_TIMESTAMP),YEAR(SYSDATETIME()),YEAR(GETDATE());

-- datepart (year,month,day or quarter returns a date
-- DATEADD (datepart , number , date )  
SELECT DATEADD(year,-2147483649, '20060731');

-- DATEDIFF ( datepart , startdate , enddate )
SELECT DATEDIFF(week,'2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');

-- DATEPART ( datepart , date )  
SELECT DATEPART(week, '2007-04-21 '), DATEPART(weekday, '2007-04-21 ');

SELECT * 
FROM Orders 
WHERE OrderDate='2008-11-11';

-- Chapitre: String:
-- CONCAT(strng1,string2,….)
SELECT CONCAT ('Happy ', 'Birthday ', 11, '/', '25') AS Result;
select Concat(last_Name,' ',First_Name) from s_emp

-- LEFT ( character_expression , integer_expression )
select left(last_Name,5) from s_emp

-- Right ( character_expression , integer_expression )
select Right(last_Name,5) from s_emp

-- LEN (string_expression )
-- REPLACE ( string_expression , string_pattern , string_replacement )

-- SUBSTRING (expression ,start , length )
select substring(last_Name,2,5) from s_emp

-- UPPER ( character_expression )
-- LOWER ( character_expression )

-- LTRIM ( character_expression )
SELECT LTRIM('     Five spaces are at the beginning of this string.');  
-- RTRIM ( character_expression )
SELECT RTRIM('Removes trailing spaces.   ');