drop database if exists truy_van_quan_li_ban_hang;
create database  truy_van_quan_li_ban_hang;
use truy_van_quan_li_ban_hang;

create table customer (
id_customer int primary key,
name varchar(50) not null,
age int not null
);

create table `order` (
id_order int primary key,
`date` date not null,
total_price int,
id_customer int,
foreign key(id_customer) references customer(id_customer)
);

create table product (
id_product int primary key,
name varchar(50) not null,
price double not null
);

create table order_detail (
od_qty int,
id_order int,
id_product int,
primary key(id_order,id_product),
foreign key(id_order) references `order`(id_order),
foreign key(id_product) references product(id_product)
);

insert into customer
values
(1,'Ming Quan',10),
(2,'Ngoc Oanh',20),
(3,'Hong Ha',50);

insert into `order`(id_order,id_customer,`date`,total_price)
values
(1,1,'2006-3-21',null),
(2,2,'2006-3-23',null),
(3,1,'2006-3-16',null);

insert into product
values
(1,'May giat',3),
(2,'Tu lanh',5),
(3,'Dieu hoa',7),
(4,'Quat',1),
(5,'Bep dien',2);

insert into order_detail(id_order,id_product,od_qty)
values
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select id_order,`date`,total_price from `order`;


-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.id_customer,c.name,c.age,product.name
from customer c
join `order` on `order`.id_customer = c.id_customer
join order_detail on order_detail.id_order = `order`.id_order
join product on product.id_product = order_detail.id_product;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.name
from customer c
where c.id_customer not in (
select c.id_customer
from customer c
join `order` on `order`.id_customer = c.id_customer
join order_detail on order_detail.id_order = `order`.id_order
join product on product.id_product = order_detail.id_product);

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
 -- Giá bán của từng loại được tính = odQTY*pPrice)
select o.id_order, o.`date`, sum(order_detail.od_qty * product.price) as total_price
from `order` o
join order_detail on o.id_order = order_detail.id_order
join product on order_detail.id_product = product.id_product
group by o.id_order;