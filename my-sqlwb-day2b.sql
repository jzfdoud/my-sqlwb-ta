-- Day 6 (day 2 MySQL) contd.
-- creating procedures

#######

Drop Procedure GetAllUsers()

Delimiter //

Create procedure GetAllUsers()

Begin
	Select id,username,firstName,lastName,phone,email,isReviewer,isAdmin
		from users;
End//

Delimiter ;

call GetAllUsers();

######

Drop Procedure AddUser

Delimiter //

Create Procedure AddUser(
	in username varchar(30),
    in password varchar(30),
    in firstName varchar(30),
    in lastName varchar(30))
Begin
	Insert into users 
    (username,password,firstName,lastName,isReviewer,isAdmin)
    Values
    (username,password,firstName,lastName,false,false);
End//
Delimiter ;

Call AddUser('erdoud','erd','Eden','Doud');