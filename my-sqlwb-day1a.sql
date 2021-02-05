-- Day5. Creating DB tables 

use BootcampTA;
-- 1) created two tables
 
create Table Users 
( 
	Id int not null primary key auto_increment,
    FirstName varchar(50) not null,
    LastName varchar(50) not null,
    StreetAddress varchar(50),
    City varchar(30),
    StateCode varchar(2),
    ZipCode varchar(5),
    Phone varchar(12),
    Email varchar(250),
    Role varchar(50) not null
);

create Table Vehicles
(
	Id int not null primary key auto_increment,
	Make varchar(30) not null,
    Model varchar(50) not null,
    Year varchar(4) not null,
    Vin varchar(17),
    Trim varchar(30),
    Color varchar(50),
    UserId int,
    foreign key(UserId) references Users(Id)
);

-- 2) inserting user and vehicle data

Insert Users

(FirstName, LastName,Role)
Values
('Jada', 'Doud', 'Teacher''s Assistant');

Insert Vehicles
(Make, Model, Year,Color, UserId)
Values
('Honda', 'Insight', 2021, 'White',1),
('Honda', 'Civic', 2021, 'White',1),
('Honda', 'Accord', 2021, 'White',1);


Select *
	from Vehicles v
    left join Users u on u.id = v.UserId
 