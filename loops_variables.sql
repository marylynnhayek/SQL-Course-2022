-- DECLARATION AND AFFECTATION DES VARIABLES:
BEGIN
    Declare @a int = 3;
    Declare @b int = 7;
    Declare @r int;
    set @r=@a+@b;
    PRINT 'r= '+CAST(@a as varchar(10))+ CAST(@b as varchar(10));
    PRINT 'r= '+CAST(@r AS VARCHAR(10));
END;

-- To be able to print an integer like any other string, we cast it.

-- LOOP WHILE AND IF STATMENTS:

BEGIN
    DECLARE @i AS INTEGER=1; 
    DECLARE @j as INTEGER=10;
    WHILE (@i<@j)
        BEGIN
            set @i=@i+1;
            set @j=@j-2;
            PRINT 'i= ' +CAST(@i as varchar(10));
            PRINT 'j= ' +CAST(@j as varchar(10));
            if @j<8 
                BREAK;
        END;
END;

-- ASSIGN DATA TO VARIABLES FROM DB TABLES:

BEGIN
    DECLARE @CID INT =1;
    DECLARE @CName Varchar(50);
    Declare @Country varchar(50);
    SELECT ent.dbo.Cli
    WHERE id=1 and @CName=Cli.name and  @country=Cli.country
    FROM Cli=@CID;
    PRINT 'Client Name = ' +@CName;
    PRINT 'Country = ' +@Country;
END;

-- DECLARE VARIABLE AS TABLE: 
BEGIN
    DECLARE @v_table TABLE(
    CID int NOT NULL,
    CName Varchar(50),
    City Varchar(50),
    Country Varchar (50)
);
    INSERT INTO @v_table (CID,CName,City,Country) 
    SELECT Cli.ID,Cli.Name,Cli.City,Cli.Country FROM Cli ;
    SELECT * FROM @v_table;
END;

-- TRY AND CATCH
USE Client;
 
BEGIN
 
--  
-- Declare a variable:
DECLARE @v_a float = 20;
DECLARE @v_b float = 0;
DECLARE @v_c float;
DECLARE @v_Error_Number integer;
 
-- Use BEGIN TRY .. END TRY to trap errors.
-- If an error occurs in this block
-- It will jump to block BEGIN CATCH .. END CATCH.
BEGIN TRY
 
  ---
  PRINT '@v_a = ' + CAST(@v_a AS varchar(15));
  PRINT '@v_b = ' + CAST(@v_b AS varchar(15));
  -- Divide by 0 error, occurring here.
  SET @v_c = @v_a / @v_b;
 
  -- Below this line will not be running.
  -- Program jump to block BEGIN CATCH .. END CATCH
  PRINT '@v_c= ' + CAST(@v_c AS varchar(15));
 
END TRY
-- BEGIN CATCH .. END CATCH must be placed immediately behind BEGIN TRY .. END TRY.
BEGIN CATCH
  -- Error Number.
  SET @v_Error_Number = ERROR_NUMBER();
  -- Print out error number:
  PRINT 'Error Number: ' + CAST(@v_Error_Number AS varchar(15));
  -- Error message:
  PRINT 'Error Message: ' + ERROR_MESSAGE();
  --  The severity of the error:
  PRINT 'Error Severity: ' + CAST(ERROR_SEVERITY() AS varchar(15));
  -- Error State:
  PRINT 'Error State: ' + CAST(ERROR_STATE() AS varchar(15));
  -- Line Number:
  PRINT 'Error Line: ' + CAST(ERROR_LINE() AS varchar(15));
  -- Name of procedure (or function, or trigger).
  PRINT 'Error Procedure: ' + ERROR_PROCEDURE();
END CATCH;
 
END;

-- Output: 
-- @v_a = 20
-- @v_b = 0
-- Error Number: 8134
-- Error Message: Divide by zero error encountered.
-- Error Severity: 16
-- Error State: 1
-- Error Line: 21