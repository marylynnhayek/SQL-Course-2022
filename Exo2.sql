create table Student(
student_number char(5) Unique NOT NULL,
student_name varchar(30) NOT NULL,
Class integer,
Major varchar(4) NOT NULL,
PRIMARY KEY(student_number)
);


CREATE TABLE Course(
course_number varchar(10) UNIQUE NOT NULL,
course_name varchar(50) NOT NULL,
Credit_hours int,
Department varchar(20) Not NULL,
PRIMARY KEY(course_number)
);

CREATE TABLE Prerequisite(
course_number char(10) NOT NULL,
prerequisite_Number char(10),
PRIMARY KEY(course_number,prerequisite_Number),
FOREIGN KEY(course_number) REFERENCES Course(course_number),
FOREIGN KEY(prerequisite_Number) REFERENCES Course(course_number)
);

CREATE TABLE Section(
section_number Char(5) NOT NULL,
course_number char(10),
semester NVARCHAR(10) NOT NULL check(semester IN('fall', 'spring', 'summer')),
s_year int NOT NULL,
Instructor_Name varchar(100),
primary key(section_number),
foreign key(course_number) references Course(course_number)
);

CREATE TABLE Grades(
student_number char(5) NOT NULL,
section_number char(5) NOT NULL,
Grade DECIMAL(5,2),
PRIMARY KEY(student_number,section_number),
FOREIGN KEY(section_number) REFERENCES Section(section_number),
FOREIGN KEY(student_number) REFERENCES  Student(student_number)
);

Alter Table Grades 
Add Grade_L Char(1);

insert into Student values('17','Smith',1,'CS');
insert into Student values('8','Marc',1,'CS');

insert into Course values('CS1310','Intro to computers',4,'CS');
insert into Course values('CS3320','Data Structure',4,'CS');
insert into Course values('MATH2410','Discret Mathematics',3,'MATH');
insert into Course values('CS3380','Database',3,'CS');

insert into prerequisite values('CS3380','CS3320');
insert into prerequisite values('CS3380','MATH2410');
insert into prerequisite values('CS3320','CS1310');

insert into Section values('85','MATH2410','fall',07,'King');
insert into Section values('92', 'CS1310','fall',08,'Anderson');
insert into Section values('102', 'CS3320','spring',08,'Knuth');
insert into Section values('112', 'MATH2410','fall',08,'Chang');
insert into Section values('119', 'CS1310','fall',08,'Anderson');
insert into Section values('135', 'CS3380','fall',08,'Stone');

insert into Grades values('17','112',85,'B');
insert into Grades values('17', '119',75,'C');
insert into Grades values('8', '85',92,'A');
insert into Grades values('8', '92',97,'A');
insert into Grades values('8', '102',83,'B');
insert into Grades values('8', '135',90,'A');

-- Queries:
-- 1- List the names of students who took the section of the ‘Database’ course offered in fall 2008 and their grades in that section:
select s.student_name,se.section_number,g.Grade
from Student s, Grades g, Section se, Course C
Where c.course_name='Database' and se.semester='fall' and se.s_year=8 and se.course_number=c.course_number and se.section_number=g.section_number and s.student_number=g.student_number;

--Output was: Marc, 135, 90.

-- Examples of updates:
-- Change the class of ‘Smith’ to sophomore:
update Student
set class=14
where student_name='Smith';

-- Enter a grade of ‘A’ for ‘Smith’ in the ‘Database’ section of last semester:
update grades
set Grade_l='A'
where student_number=(select student.student_number from student where student_name='Smith') AND
section_number=(select Section.section_number from section,course where course_name='database' and course.course_number=Section.course_number and semester='fall');

