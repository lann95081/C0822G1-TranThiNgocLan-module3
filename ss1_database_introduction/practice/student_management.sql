create database if not exists `student_management`;
use student_management;

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