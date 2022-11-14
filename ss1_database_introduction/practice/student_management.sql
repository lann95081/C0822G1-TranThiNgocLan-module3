create database if not exists `my_database1`;
use my_database1;
create table student(
  id int primary key, 
  `name` varchar(50) not null, 
  age int, 
  country varchar(50)
);
create table class(
  id int primary key, 
  `name` varchar(50)
);
create table teacher(
  id int primary key, 
  `name` varchar(50), 
  age int, 
  country varchar(50)
);
