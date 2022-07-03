-- Code #3: Révision pour l’examen final:
--Table 1
create table Student(
student_number int NOT NULL,
student_name varchar(30) NOT NULL,
class char(1),
major varchar(3),
primary key(student_number)
)

--Table 2
create table Course(
course_number varchar(20) NOT NULL,
course_name varchar(50) NOT NULL,
credit_hours int NOT NULL,
Dept varchar(50) NOT NULL,
primary key(course_number)
)

--Table 3
create table Section(
sectionID int NOT NULL, --ou char ma btefrou2
course_number varchar(20) NOT NULL,
semester varchar(10) NOT NULL,
Syear int NOT NULL, --Le mot year est reservé en SQL
instructor varchar(50),
primary key(sectionID),
constraint FK_section_course foreign key(course_number) references course(course_number)
)

--Table 4
create table Grade_Report(
student_number int NOT NULL,
sectionID int NOT NULL, --ou char ma btefrou2
grade char(1),
primary key(student_number, sectionID),
constraint FK_grade_student foreign key(student_number) references student(student_number),
constraint FK_grade_section foreign key(sectionID) references section(sectionID)
)


