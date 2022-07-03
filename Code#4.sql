-- Code #4: Révision pour l’examen final:

create table employee(
    ssn char(9) UNIQUE NOT NULL,
    E_name Varchar(100) NOT NULL,
    E_Age Int check(E_Age>=18),
    Salary Decimal(9,2) CHECK (Salary Between(1000 AND 20000),
    superSSn char(9) DEFAULT '99999999',
    DNO int DEFAULT 1,
    PRIMARY Key(ssn),
    FOREIGN KEY(superSSn) References Employee(SSN) 
);

create table Department(
    Dnumber int not null,
    Dname Varchar(50) NOT NULL,
    MgrSSN char(9) NOT NULL DEFAULT '99999999',
    Primary key(Dnumber),
    Foreign key(MgrSSN) References Employee(SSN) ON DELETE SET DEFAULT ON 	UPDATE Cascade
);

--Add data to our employee table:

insert into employee values('111111111','Jean',19,12000,'111111111',1);
insert into employee values('222222222','John',27,15000,'111111111',1);
insert into employee values('333333333','George',35,11000,'111111111',2);
insert into employee values('444444444','Jawad',18,13000,'111111111',2);
insert into employee values('555555555','Rami',30,15000,'222222222',2);
insert into employee values('999999999','Rita',19,15000,'999999999',2);
insert into employee (ssn,E_name,E_Age,salary,superSSn)values('666666666','Raja',45,12000,'999999999');

insert into department values(1,'Sales',111111111);
insert into department values(2,'HR',111111111);

alter table employee
add constraint FK_emp_dept foreign key(DNO) References Department(Dnumber);

Update Employee
set SSn= 111111112
Where SSn='111111111';
 
select * from employee;
select * from department;