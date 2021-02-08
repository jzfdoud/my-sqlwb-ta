-- Day 6(day 2 of MySQL), hopefully finish SQL
-- Creating PRSDB in MySQL for Java portion of class, .Net portion this is just practice
-- Created required tables and also entered mock data for all tables

use sys;

drop database if exists PRSDBTA;

create database PRSDBTA;

use PRSDBTA;

Create Table users (
id int primary key not null auto_increment,
username varchar(30) unique not null,
password varchar(30) not null,
firstName varchar(30) not null,
lastName varchar(30) not null,
phone varchar(12),
email varchar(255),
isReviewer bit not null default 0,
isAdmin bit not null default 0
);

Insert into users 
(username,password,firstName,lastName,isReviewer, isAdmin)
values
('sa','sa','System','Admin',1,1),
('jzfdoud','jzf', 'Jada','Fagan-Doud',1,1);
select * from users;


Create Table vendors (
id int primary key not null auto_increment,
code varchar(30) not null unique,
name varchar(30) not null,
address varchar(30) not null,
city varchar(30) not null,
state varchar(2) not null,
zip varchar(5) not null,
phone varchar(12),
email varchar(255)
);

Insert into vendors 
(code,name,address,city,state,zip)
Values
('AMZN', 'Amazon','123 Prime Way','Seattle','WA',12345),
('WHFD', 'Whole Foods','456 Prime Way','Seattle','WA',12345),
('TRGT', 'Target','123 Target Cr','Minneapolis','MN',23456),
('MEJR', 'Meijer','123 Fresh St','Detroit','MI',34567),
('CRCT','Cricut','123 Maker Rd','San Diego','CA', 90279);
Select * from vendors;


Create Table products(
id int primary key not null auto_increment,
partNbr varchar(30) not null unique,
name varchar(30) not null,
price decimal(11,2) not null,
unit varchar(30) not null,
photoPath varchar(255),
vendorId int not null,
foreign key (vendorId) references vendors(id)
);

Insert into products
(partNbr,name,price,unit,vendorId)
Values
(1001,'Echo Show 8',129.99,'each',(Select id from vendors where code = 'AMZN')),
(1002,'Smart Plug',24.99,'each',(Select id from vendors where code = 'AMZN')),
(1003,'Sit-Stand Desk',249.99,'each',(Select id from vendors where code = 'AMZN')),
(1004,'Ergonomic Rolling Chair',98.99,'each',(Select id from vendors where code = 'AMZN')),
(1005,'60" Curved Monitor', 399.99,'each',(Select id from vendors where code = 'AMZN')),
(2001,'Organic Popcorn',2.29,'each',(Select id from vendors where code = 'WHFD')),
(2002,'Fresh-Organic Honey Roasted PB',14.99,'per/lb',(Select id from vendors where code = 'WHFD')),
(2003,'Organic Frog Legs',27.99,'per/lb',(Select id from vendors where code = 'WHFD')),
(2004,'Fresh Atlantic Salmon Fillet',11.99,'per/lb',(Select id from vendors where code = 'WHFD')),
(3001,'Bath Sheet',8.99,'each',(Select id from vendors where code = 'TRGT')),
(3002,'Floor Lamp',19.98,'each',(Select id from vendors where code = 'TRGT')),
(4001,'Mixed Fruit Tray',6.99,'per/lb',(Select id from vendors where code = 'MEJR')),
(5001,'Maker',349.99,'each',(Select id from vendors where code = 'CRCT')),
(5002,'EasyPress2 12"',149.99,'each',(Select id from vendors where code = 'CRCT')),
(5003,'Bulk Iron-on Vinyl',3.99,'per/ft',(Select id from vendors where code = 'CRCT'));
Select * from products;

Create Table requests(
id int primary key not null auto_increment,
description varchar(80) not null,
justification varchar(80) not null,
rejectionReason varchar(80),
deliveryMode varchar(20) not null default 'PICKUP',
status varchar(10) not null default 'NEW',
total decimal(11,2) not null default 0,
submitDate datetime not null default current_timestamp,
userId int not null,
foreign key(userId) references users(id)
);

Insert into requests
(description,justification,userId)
values
('I''m STARVING!','People have to eat',(Select id from users where username ='sa'));
Select * from requests;

Create Table requestLines(
id int primary key not null auto_increment,
requestId int not null,
productId int not null,
quantity int not null default 1,
foreign key(requestId) references requests(id),
foreign key(productId) references products(id),
constraint requestId_productId unique (requestId, productId)
-- line above prohibits inserting multiple of the same product into a request
);

Insert into requestLines
(requestId,productId,quantity)
Values
(1,3,2),
(1,12,1);
Select * from requestLines

