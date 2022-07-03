-- Code #6: Révision pour l’examen final: (Suite code #5): insert data in previous table:
insert into student values('Smith', '17', 1, 'CS');
insert into student values('Brown', '8', 2, 'CS');

insert into course values('Intro to CS', 'CS1310', 4, 'CS');
insert into course values('Data Structures', 'CS3320', 4, 'CS');
insert into course values('Discrete Math', 'MATH2410', 3, 'MATH');
insert into course values('Database', 'CS3380', 3, 'CS');


insert into section values(85, 'MATH2410', 'FALL', 2007, 'King');
insert into section values(92, 'CS1310', 'FALL', 2008, 'Anderson');
insert into section values(102, 'CS3320', 'SPRING', 2008, 'Kruth');
insert into section values(112, 'MATH2410', 'FALL', 2008, 'Chang');
insert into section values(119, 'CS1310', 'FALL', 2008, 'Anderson');
insert into section values(135, 'CS3380', 'FALL', 2008, 'Stone');


insert into grade_report values(17, 112, 'B');
insert into grade_report values(17, 119, 'C');
insert into grade_report values(8, 85, 'A');
insert into grade_report values(8, 92, 'A');
insert into grade_report values(8, 102, 'B');
insert into grade_report values(8, 135, 'A'); 

insert into prerequisite values('CS3380', 'CS3320');
insert into prerequisite values('CS3380', 'MATH2410');
insert into prerequisite values('CS3320', 'CS1310');


select * from student;
select * from grade_report;