-- Day 7 ( day 3 of MySQL)
-- 'snow day', class was virtual

-- practicing joins using EdDb

select s.firstname,s.lastname, m.description
from Student s
left join Major m on m.id = s.MajorId;

#####

select s.firstname, s.lastname
	from Student s
	join Studentclassrel sc on s.id = sc.studentId
	join class c on sc.classId = c.id