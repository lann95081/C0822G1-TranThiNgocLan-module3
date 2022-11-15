create database if not exists quan_li_ban_hang;
use quan_li_ban_hang;

create table customer(
id_customer int primary key,
name varchar(50) not null,
age int not null
);

create table `order` (
id_order int primary key,
date date not null,
total_price double not null,
id_customer int,
foreign key(id_customer) references customer(id_customer)
);

create table product(
id_product int primary key,
name varchar(50) not null,
price double not null
);

create table order_detail(
od_qty int,
id_order int,
id_product int,
primary key(id_order,id_product),
foreign key(id_order) references `order`(id_order),
foreign key(id_product) references product(id_product)
);