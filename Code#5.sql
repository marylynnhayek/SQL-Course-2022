-- Code #5: Révision pour l’examen final:

--VARCHAR plus flexible dans la memoire que CHAR
-- Student --
create table student(
student_name varchar(50) not null,
student_number int not null,
class varchar(10) not null, -- char(2) fina nshil not null en cas l case ma betfidna b shi
major varchar(20) not null, -- char(10)
Primary Key (student_number));

-- Course --
create table course(
course_name varchar(50) not null ,
course_number varchar(20) not null ,
credit_hour int not null,
department varchar(50) not null,
Primary Key (course_number));

-- Section --
create table section(
section_identifier int not null,
course_number varchar(20) not null,
semester varchar(10) not null,
years int not null,
instructor varchar(50),
Primary Key (section_identifier),
/* Foreign Key (course_number) References course(course_number) */
constraint FK_section_course Foreign Key (course_number) References course(course_number) );

-- Grade Report --
create table grade_report(
student_number int not null,
section_identifier int not null,
grade varchar(2), -- char(2)
Primary Key (student_number,section_identifier),
constraint FK_section_section Foreign Key (section_identifier) References section(section_identifier),
constraint FK_section_student Foreign Key (student_number) References student(student_number));

--Prerequisite --
create table prerequisite(
course_number varchar(20) not null,
prerequisite_number varchar(20) not null,
Primary Key (prerequisite_number),
constraint FK_section_course Foreign Key (course_number) References course(course_number));
