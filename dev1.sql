select student_name , grade
from student s , course c , section se , grade_report g
where c.course_name='Database' and se.semester='Fall' and se.years=2008 and g.student_number= s.student_number and g.section_identifier = se.section_identifier and se.course_number = c.course_number;



update student
set class= 'sophomore'
where student_name= 'Smith';

insert into section values(18,'CS3380', 'Fall', 2021,null)