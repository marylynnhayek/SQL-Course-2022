-- Table Implementation:

Create Table employee(
	empID INT NOT NULL,
	empName varchar(100) NOT NULL,
	DeptID INT,
    --mafroud ykouno nafs l type men l empID car un supervisor est aussi un employee
	SupervisorID INT NOT NULL, 	
	Primary key(empID),
	Constraint FK_supID_empID Foreign key(SupervisorID) references emplyee(empID)
  );

Create table department (
  DeptID INT NOT NULL,
  DeptName varchar(100) NOT NULL,
  ManagerID INT NOT NULL, 
  Primary Key (DeptID), 
  Foreign key(ManagerID) references employee(empID)
);

-- Insertion de données:

use test3; 

insert into employee values (1,’MaryLynn’,1,NULL);
insert into employee values (2,’Haifa’,1,NULL);
insert into employee values (3,’Nicolas’,1,NULL);
insert into employee values (4,’Charbel’,2,NULL);
insert into employee values (5,’Joseph’,2,NULL);

insert into department values (100,’HR’,3,); 
insert into department values(200,’Finance’,1);

--Adding constraints:

alter table employee
add constraint FK_Dept_ID_Department Foreign Key DeptID references department(DeptID);