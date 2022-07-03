-- Code #2: Révision pour l’examen final:
create table employee(
ssn char(9) unique not null, 
E_name varchar(100) not null,
E_age int check (E_age >= 18),
salary decimal(9,2) check (salary between 1000 and 2000),
superSSn char(9) default '9999999',
DNO int default 1,
primary key (ssn),
foreign key (superSSn) references employee(ssn));

create table department(
Dnumber int not null,
Dname varchar(50) not null,
mgrSSN char(9) not null default '99999999',
primary key (Dnumber),
foreign key (mgrSSN) references employee (SSN) ON DELETE SET DEFAULT ON UPDATE Cascade);

alter table employee
drop constraint [CK__employee__salary__267ABA7A];

alter table employee
add check (salary>= 1000 and salary <= 20000);

insert into employee values('111111111','Jean',19,12000,'111111111',1);
insert into employee values('222222222','John',27,15000,'111111111',1);
insert into employee values('333333333','George',35,11000,'111111111',2);
insert into employee values('444444444','Jawad',18,13000,'111111111',2);
insert into employee values('555555555','Rami',30,15000,'222222222',2);
insert into employee values('999999999','Rita',19,15000,'999999999',2);

insert into employee (ssn, E_name, E_age, salary, superSSn)
values('666666666', 'Raja', 45, 12000, '999999999')

insert into department values (1, 'Sales', '111111111')
insert into department values (2, 'HR', '111111111');

--Update to modify data in a table, alter to change the table's structure (add or delete columns etc..)
update employee 
set superSSn = Null 
where superSSn = '111111111'

delete from employee
where SSn = '1111';

select * from employee;
select * from department;