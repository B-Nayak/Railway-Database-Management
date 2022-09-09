create database railway;
use railway;
select database();

CREATE TABLE employees ( 
	E_ID INT auto_increment PRIMARY KEY NOT NULL,
	E_NAME VARCHAR(100) NOT NULL,
    ADDRESS VARCHAR(100) NOT NULL,
    GENDER VARCHAR(20) NOT NULL,
    PHONE_NO bigint NOT NULL,
    DOJ date NOT NULL,
    SALARY int NOT NULL
    );
describe employees;

CREATE TABLE passangers (
	P_ID INT auto_increment primary key NOT NULL,
    P_NAME VARCHAR(100) NOT NULL,
    SEAT_NO INT NOT NULL,
    GENDER VARCHAR(20) NOT NULL,
    PHONE_NO bigint NOT NULL,
    E_ID INT NOT NULL,
    foreign key (E_ID) references employees(E_ID) ON DELETE CASCADE
    );
describe passangers; 

CREATE TABLE stations (
	STATION_ID INT auto_increment primary KEY NOT NULL,
    STATION_NAME VARCHAR(100) NOT NULL,
    NO_OF_LINES INT NOT NULL,
    NO_OF_PLATFORMS INT NOT NULL
    );
describe stations; 

create table trains (
	TRAIN_ID INT auto_increment primary KEY NOT NULL,
    STATION_ID INT NOT NULL,
    TRAIN_NAME VARCHAR(100) NOT NULL,
    foreign key (STATION_ID) references stations(STATION_ID) ON DELETE CASCADE
);
describe trains;

CREATE TABLE classes (
	CLASS VARCHAR(20) primary key NOT NULL,
    JOURNEY_DATE timestamp not null,
    NO_OF_SEATS INT NOT NULL,
    TRAIN_ID INT NOT NULL,
    foreign key (TRAIN_ID) references trains(TRAIN_ID) ON DELETE CASCADE
    );
describe classes;



CREATE TABLE fares (
	RECIEPT_NO INT auto_increment not NULL PRIMARY KEY,
    TRAIN_ID INT NOT NULL,
    SOURCE_ VARCHAR(100) NOT NULL unique,
    DESTINATION VARCHAR(100) NOT NULL unique,
    CLASS VARCHAR(20) NOT NULL,
    FARE DECIMAL(5,2) NOT NULL,
    foreign key (TRAIN_ID) references trains(TRAIN_ID) ON DELETE CASCADE,
    foreign key (CLASS) references classes(CLASS) ON DELETE CASCADE
);
describe fares;


create table tickets (
	TICKET_NO INT auto_increment PRIMARY KEY NOT NULL,
    SOURCE_ VARCHAR(100) NOT NULL,
    DESTINATION VARCHAR(100) NOT NULL,
    CLASS VARCHAR(20) NOT NULL,
    TRAIN_ID INT NOT NULL,
    foreign key (TRAIN_ID) references trains(TRAIN_ID) ON DELETE CASCADE,
    foreign key (CLASS) references classes(CLASS) ON DELETE CASCADE,
    foreign key (SOURCE_) references fares(SOURCE_) ON DELETE CASCADE,
	foreign key (DESTINATION) references fares(DESTINATION) ON DELETE CASCADE
    );
describe tickets;

CREATE TABLE times (
	REF_NO int auto_increment primary key,
    DEP_TIME time not null unique,
    ARR_TIME time not null unique,
    TRAIN_ID INT NOT NULL,
    STATION_ID int,
    foreign key (TRAIN_ID) references trains(TRAIN_ID) ON DELETE CASCADE,
    foreign key (STATION_ID) references stations(STATION_ID) ON DELETE cascade
    );
describe times;

create table routes (
		STOP_NO INT auto_increment primary KEY,
        ARR_TIME TIME NOT NULL,
        DEP_TIME TIME NOT NULL,
        foreign key (ARR_TIME) references times(ARR_TIME) ON delete cascade,
         foreign key (DEP_TIME) references times(DEP_TIME) ON delete cascade
         );
DESCRIBE routes;
        
show tables;

use railway;
DESC employees;
insert into employees(E_NAME,ADDRESS,GENDER,PHONE_NO,DOJ,SALARY) VALUES ("Arpan","Cuttack","Male",1234567890,'2000-10-10',79000.00);


select E_NAME,DOJ,SALARY from employees where E_ID=6;

update employees set salary=12000 where E_ID=8;

delete from employees where E_ID=7;

select * from employees LIMIT 10;

select * from employees group by gender limit 15;

select * from employees order by salary limit 12;

