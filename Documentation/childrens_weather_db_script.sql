SELECT * FROM childrens_weatherdb;

GRANT ALL ON *.* to root@'%' IDENTIFIED BY 'root'; 

#create table account(email varchar(255), password varchar(255), fname varchar(255), lname varchar(255), zip varchar(255), location1 varchar(255), location2 varchar(255), location3 varchar(255));
#insert into account values('test', 'test', 'test', 'test', '52246', '52246', '54855', '54806');
#create table savedlocations(location1 varchar(255), location2 varchar(255), location3 varchar(255));
#insert into login values('test', 'test', 'test', 'test', 'user', '52246', '54855', '54806');
#insert into login values('admin', 'test', 'test', 'test', 'admin', '52246', '54806', '54855');
#drop table account;

#create table login(email varchar(255), password varchar(255), fname varchar(255), lname varchar(255), type varchar(255), loc1 varchar(255), loc2 varchar(255), loc3 varchar(255));
#create table weather(location varchar(255), time varchar(255), zip varchar(255), temperatureF varchar(255), temperatureC varchar(255), humidity varchar(255), feelslike varchar(255), wind varchar(255), pressure varchar(255));
#create table daily(location varchar(255), day varchar(255), zip varchar(255), temperatureF varchar(255), temperatureC varchar(255), humidity varchar(255), feelslike varchar(255), wind varchar(255), pressure varchar(255));

create table login(email varchar(255), password varchar(255), fname varchar(255), lname varchar(255), type varchar(255), loc1 varchar(255), loc2 varchar(255), loc3 varchar(255));
create table today(cityState varchar(255), time varchar(255), temperatureF varchar(255), temperatureC varchar(255), highTemperatureF varchar(255), highTemperatureC varchar(255), lowTemperatureF varchar(255), lowTemperatureC varchar(255), wind varchar(255), tomorrowHighF varchar(255), tomorrowHighC varchar(255), tomorrowLowF varchar(255), tomorrowLowC varchar(255));

drop table today;

insert into login values('test','test','test','test','user','52246', '54855','54806');
insert into login values('test2','test','test','test','admin','52246', '54855','54806');

insert into today values('Iowa City, IA', '2:00PM', '61F', '30C', '65F', '31C', '32F', '0C', '2MPH N', '66F', '33C', '30F', '1C');
insert into today values('Ashland, WI', '2:00PM', '59F', '28C', '60F', '29C', '30F', '-1C', '4MPH N', '45F', '18C', '30F', '1C');
