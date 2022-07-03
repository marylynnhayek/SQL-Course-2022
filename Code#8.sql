--Code #8: Révision pour l’examen final: Exception handling:
USE Client;
 
BEGIN
 -- Declare a variable:
DECLARE @v_a float = 20;
DECLARE @v_b float = 0;
DECLARE @v_c float;
DECLARE @v_Error_Number integer;
 -- Use BEGIN TRY .. END TRY to trap errors.
-- If an error occurs in this block
-- It will jump to block BEGIN CATCH .. END CATCH.
BEGIN TRY
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

