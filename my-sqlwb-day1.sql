-- Day 5. MySQL Workbench (MySQL intro delayed from day4 b/c of computer issues).

Select * from student;

-- 1) Assignment to 'INSERT' a student to the DB

Insert student
(Firstname, Lastname, Sat,GPA, MajorId)
Values
('Shari', 'Mullings', 1600,4.5,(select id from major where description = 'Engineer'));

-- 1a) I didn't type in the correct major description so I did an update with correct description.

Update student set MajorId = (select id from major where Description = 'Engineering') where Id = 197;

select * from Major;

-- 2) 'INSERT' Practice - Major table

Insert Major
(Description, minSAT)
Values
('Ceramics', 1200),
('Underwater Basket Weaving',1400);

select * from class;

-- 2a) 'INSERT' Practice continued- adding classes for previously inserted Major(s)

insert class
(id,Subject, Section)
Values
(70101,'ARTC', 101),
(70201,'ARTC',201),
(70301,'ARTC',301);

-- 2b) Practice for myself to insert new Instructor and to update new classes with new Instructor Id. :) I did it in one try!

Select * from Instructor;

Insert Instructor
(ID,Firstname, Lastname, YearsExperience, IsTenured)
Values
(110,'Cynthia','Doud',35,1),
(120,'Zambia','Sherland',36,1),
(130,'Margaret','Jospeh',15,0),
(140,'Jada','Doud',2,0);

Update Class 
set InstructorId = 140
where id in( 70101 , 70201 , 70301);

-- 3) 'UPDATE' practice - Student table

Update Student 
set Lastname = 'Fagan-Doud'
where ID = 191;

Update Student
set 
sat = 1300, GPA= 4.6
where ID = 191;

-- 3a) 'UPDATE' practice continued- replacing one instructor with another

Update Class
set InstructorId = (select id from Instructor where lastname = 'Jones')
where instructorId = (select Id from Instructor where lastname = 'Downey');


Select * from class
where id in (10101,10201,10301);

-- 3b) 'UPDATE' practice continued- updating ALL students GPA by 10%

select * from student;

Update Student
set GPA = (gpa + (gpa* 0.1));

-- some students had issue with 'safe mode'? warning. Warning message "Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect." 
-- but I was able to run the 'UPDATE' statement without a 'WHERE' clause. I did not see their statements, so not sure why they were getting that warning.

-- 4) 'DELETE' practice- deleting multiple students
-- looking for possible duplicates(my DB doesnt have duplicate students) 
select count(*)
from student
where lastname = 'Doud';

Delete 
from student
where id = 196;

