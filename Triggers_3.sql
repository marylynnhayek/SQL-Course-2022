-- Second Exercise:
create table Department(
    DepID int NOT NULL primary Key,
    DepName varchar(50)
);

create table Employee(
    iD int NOT NULL PRIMARY KEY,
    LastName VARCHAR(50),
    FirstName VARCHAR(50),
    UserID int,
    startDate date,
    managerID int,
    Title VARCHAR(50),
    salary int,
    DepID int,
    lifetime int,
    FOREIGN KEY(DepID) REFERENCES Department(DepID),
    FOREIGN KEY(managerID) REFERENCES Employee(iD)
);

-- 1.Trigger #1:
ALTER trigger [dbo].[Emp_Lifetime]
On [dbo].[Employee]
After Insert,Update
As
    Update employee
    set lifetime = (select year(getDate()) - year(startDate)
    from employee 
    where id IN(select id from inserted));

    USE [Client]
    GO
    /****** Object:  Trigger [dbo].[AgeTrigger]    Script Date: 2/1/2022 11:14:48 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
    ALTER trigger [dbo].[AgeTrigger]
    On [dbo].[Cli]
    AFTER Insert,update
    AS
    Update dbo.cli
    set age = year(getdate())-year(dob)
    where id in (select ID From INSERTED) 