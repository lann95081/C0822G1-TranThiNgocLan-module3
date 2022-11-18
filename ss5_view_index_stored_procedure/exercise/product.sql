drop database if exists product;
create database if not exists product;
use product;

create table product(
id int auto_increment primary key,
product_code int,
product_name varchar(50),
product_price double,
product_amount int,
product_description text,
product_status bit default 1
);

insert into product (product_code,product_name,product_price,product_amount,product_description)
values
(1,'Trứng gà',3000,50,'Trứng gà nông nghiệp'),
(2,'Cà phê lon',10000,20,'Rất ngon nhé bạn'),
(3,'Sữa chua Vinamilk',20000,30,'Tốt cho hệ tiêu hoá lắm nhá'),
(4,'Bơ',10000,12,'Muốn bơ người khác thì hãy ăn bơ'),
(5,'Kẹo mút',2000,100,'Chup chup');

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create index i_product_code on product(product_code);

explain select * from product where product_code = 2;

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index i_product on product(product_name, product_price);

explain select * from product where product_name like 'Bơ';

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view w_product as
select product_code, product_name, product_price, product_status 
from product;

-- Tiến hành sửa đổi view
update w_product set product_price = 5000 where product_code = 1;

select * from product;

-- Tiến hành xoá view
drop view w_product;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure sp_get_all_product()
begin
select * from product;
end //
delimiter ;

call sp_get_all_product();

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure sp_add_product (in product_id int, product_code int, product_name varchar(50), product_price double, product_amount int, product_description text, product_status bit)
begin
insert into product values (product_id,product_code,product_name,product_price,product_amount,product_description,product_status);
end //
delimiter ;

call sp_add_product(6,6,'Đồ ăn cho chó',40000,55,'Chó nhà bạn đang đợi bạn mua cho nó đó',1);

call sp_get_all_product();

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure sp_set_product(in set_id int, in product_name_update varchar(50))
begin 
update product set product_name = product_name_update where id = set_id;
end //
delimiter ;

call sp_set_product(4,'Hồng');

call sp_get_all_product();

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure sp_delete_product(in delete_id int)
begin 
delete from product where id = delete_id;
end //
delimiter ;

call sp_delete_product(6);

call sp_get_all_product();