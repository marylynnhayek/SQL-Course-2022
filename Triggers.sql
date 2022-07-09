-- Create a Trigger: Syntax:
-- CREATE TRIGGER trigger_name ON  table_name 
-- FOR | AFTER | INSTEAD OF  { [ INSERT ] ,  [ UPDATE ] , [ DELETE ] } AS 
    -- { 
       -- sql_statement 
    -- } 

-- Exemples:

-- Exemple  #1: Supression En Cascade:

-- Explicatio de la situation:
-- We want to delete the 'Sales' department in the table 'Departments'
-- However, since we have a foreign key link between the table 
-- 'Employees' and 'Departments' if we directly delete the department
-- We'll have to deal with an error in the 'Employees' Table, so what
-- we do is, we create a trigger, that deletes the employees that
-- Hold the same department ID as the department we have to delete
-- And after deleting the employees, we delete the department.
-- Another method, is that we can set the dep_id to NULL in the
-- 'Employees' table, that way we won't face any errors in the foreign
-- Key constraint. Here is our trigger. So instead of the delete operation
-- the following trigger is launched.

CREATE TRIGGER Delete_Cascade_Department
ON s_dept
instead of DELETE
AS
BEGIN
    DECLARE @code char(3);
    SELECT @code = id FROM DELETED;
    DELETE FROM s_emp where dept_id=@code;
    DELETE FROM s_dept WHERE DeptNo=@dept_id;
END; 


-- Exemple #2: Controler le Salaire:

-- The purpose of this trigger is to make sure that the new salary 
-- inserted is greater than the old salary, if the condition is not
-- respected, we rollback the transaction. The following trigger would 
-- be: ( What launches this trigger is an update operation ):

CREATE trigger Ctrl_Salary
ON s_emp
AFTER UPDATE
AS 
BEGIN 
    DECLARE @Old_Salary MONEY;
    DECLARE @New_Salary MONEY;
    SELECT @Old_Salary=Salaire FROM DELETED;
    SELECT @New_Salary=Salaire FROM INSERTED;
    if(@New_Salary<@Old_Salary)
        ROLLBACK;
        RAISERROR(15600,-1,1,'New Salary should be Greater than Old Salary');
    END;

-- Example of what could launch our trigger:
UPDATE s_emp
set Salaire=4000
where id=201;

-- And the output would depend on the value of the old salary, which would
-- be stored in the temporary 'DELETED' table and the 'INSERTED' table
-- would contain 4000; 

-- Exemple #3: Controler le Salaire:

-- If we have more than 2 commands in our If() statement
-- We then have to write another BEGIN / END block.

CREATE trigger Ctrl_Salary 
on s_emp
after update 
as 
BEGIN 
    declare @Old_Salary money, @New_Salary money; 
    select @Old_Salary = Salary from deleted ; 
    select @New_Salary = Salary from inserted;
        IF (@Old_Salary > @New_Salary)
            BEGIN 
                rollback; 
                RAISERROR (15600,-1,-1, 'pas bon salaire');
            END
        Else 
            COMMIT; 
END;

-- Exemple #4: Type d'emploi:

CREATE TRIGGER  CHK_Salary
on s_emp
after INSERT,UPDATE
AS 
BEGIN
    declare @MinSalary money, @MaxSalary money, @NewSalary money;
    select @MinSalary = SalairMin from Emplois where TypeEmplois = (Select title from inserted);
    select @MaxSalary = SalaireMax from Emplois where TypeEmplois = (Select title from inserted);
    select @NewSalary = Salaire from inserted;
    if(@New_Salary>@MaxSalary OR @New_Salary<@MinSalary)
        ROLLBACK TRANSACTION;
    ELSE
        COMMIT TRANSACTION;
    END;
