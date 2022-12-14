use `furama_create_table`;

-- 2.Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select ma_nhan_vien, ho_ten
from nhan_vien 
where ho_ten like 'H%' or ho_ten like 'T%' or ho_ten like 'K%' and length(ho_ten) <= 15;

-- 3.Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select ma_khach_hang, ho_ten
from khach_hang 
where (year(curdate()) - year(ngay_sinh) between 18 and 50) and (dia_chi like '%Đà Nẵng' or dia_chi like '%Quảng Trị');

-- 4.Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select kh.ma_khach_hang, kh.ho_ten, count(hd.ma_khach_hang) as so_lan_dat_phong
from khach_hang kh
join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
where lk.ten_loai_khach = 'Diamond'
group by ma_khach_hang
order by so_lan_dat_phong;

-- 5.Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, 
-- tong_tien (Với tổng tiền được tính theo công thức như sau:
-- Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng.
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc,
ifnull(dv.chi_phi_thue,0) + sum(ifnull(dvdk.gia,0) * ifnull(hdct.so_luong,0)) as tong_tien
from khach_hang kh
left join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
left join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by ma_hop_dong;

-- 6.Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
left join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
left join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where hd.ma_dich_vu not in (
     select hd.ma_dich_vu
     from hop_dong hd
     where (year(hd.ngay_lam_hop_dong) >= 2021) and (month(hd.ngay_lam_hop_dong) in (1,2,3) ))
group by ma_dich_vu;

 -- 7.Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue,
 -- ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong
 -- năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
left join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
left join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where year(hd.ngay_lam_hop_dong) = 2020 and hd.ma_dich_vu not in (
     select hd.ma_dich_vu
     from hop_dong hd
     where year(hd.ngay_lam_hop_dong) = 2021)
group by ma_dich_vu;

-- 8.Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
-- Cach 1 
select distinct ho_ten
from khach_hang;

-- Cach 2
select ho_ten
from khach_hang
group by ho_ten;

-- Cach 3
select ho_ten
from khach_hang
union
select ho_ten
from khach_hang;

-- 9.Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong 
-- năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(ngay_lam_hop_dong) as thang, count(ma_khach_hang) as so_luong_khach_hang
from hop_dong
where year(ngay_lam_hop_dong) = 2021
group by thang
order by thang;  

-- 10.Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, 
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, 
sum(ifnull(hdct.so_luong, 0)) as so_luong_dich_vu_di_kem
from hop_dong hd
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
group by ma_hop_dong;

-- 11.Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach
 -- là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
 select dvdk.ma_dich_vu_di_kem,dvdk.ten_dich_vu_di_kem 
 from dich_vu_di_kem dvdk
 join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
 join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
 join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
 join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
 where lk.ten_loai_khach = 'Diamond' and (kh.dia_chi like '%Quảng Ngãi' or kh.dia_chi like '%Vinh');
 
 -- 12.Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng),
 -- ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), 
 -- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối 
 -- năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
 select hd.ma_hop_dong, nv.ho_ten as ho_ten_nhan_vien, kh.ho_ten as ho_ten_khach_hang, kh.so_dien_thoai as sdt_khach_hang, dv.ten_dich_vu,
 dv.ma_dich_vu,sum(ifnull(hdct.so_luong,0)) as so_luong_dich_vu_di_kem, hd.tien_dat_coc
 from hop_dong hd
 left join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
 left join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien
 left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
 left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
 where (year(hd.ngay_lam_hop_dong) = 2020 and month(hd.ngay_lam_hop_dong) between 10 and 12) and hd.ma_hop_dong not in(
	select ma_hop_dong
	from hop_dong
	where (year(ngay_lam_hop_dong) = 2021 and month(ngay_lam_hop_dong) between 1 and 6))
group by hd.ma_hop_dong;

-- 13.Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by ma_dich_vu_di_kem
having so_luong_dich_vu_di_kem = (
	select sum(hdct.so_luong) as sl
	from hop_dong_chi_tiet hdct
    group by ma_dich_vu_di_kem
    order by sl desc
    limit 1);
    
-- 14.Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung 
-- (được tính dựa trên việc count các ma_dich_vu_di_kem).
set sql_mode = (select replace(@@sql_mode,'only_full_group_by',''));
select hdct.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(hdct.ma_dich_vu_di_kem) as so_lan_su_dung
from dich_vu dv
join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by hdct.ma_dich_vu_di_kem
having count(hdct.ma_dich_vu_di_kem) = 1;

-- 15.Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, 
-- dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021
select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi
from nhan_vien nv 
join trinh_do td on td.ma_trinh_do = nv.ma_trinh_do
join bo_phan bp on bp.ma_bo_phan = nv.ma_bo_phan
join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
group by ma_nhan_vien
having count(hd.ma_nhan_vien) <= 3;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
update nhan_vien set is_delete = 1 where ma_nhan_vien in (
select temp.ma_nhan_vien
from (select ma_nhan_vien
	from nhan_vien
	where ma_nhan_vien not in (
		select ma_nhan_vien
		from hop_dong
		where year(ngay_lam_hop_dong) between 2019 and 2021)) as temp);

select *
from nhan_vien
where is_delete = 1;

-- 17.Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
update khach_hang set ma_loai_khach = 1 where ma_khach_hang in(
select ma_khach_hang
from (select kh.ma_khach_hang, sum(ifnull(dv.chi_phi_thue, 0) + ifnull(hdct.so_luong, 0) * ifnull(dvdk.gia, 0)) as tong_tien
	from khach_hang kh
	left join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
	left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
	left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
	left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
	left join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
	where year(hd.ngay_lam_hop_dong) = 2021 and lk.ten_loai_khach = 'Platinium'
	group by ma_khach_hang
	having tong_tien > 10000000) as nan
);

-- 18.Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
update khach_hang set is_delete = 1 where ma_khach_hang in(
select ma_khach_hang
from hop_dong
where year(ngay_lam_hop_dong) < 2021);

select *
from khach_hang
where is_delete = 1;

-- 19.Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
set sql_safe_updates = 0;
update dich_vu_di_kem 
set gia = gia * 2 where ma_dich_vu_di_kem in (
select * from (select dvdk.ma_dich_vu_di_kem
	from dich_vu_di_kem dvdk
	join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
	join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
	where year(hd.ngay_lam_hop_dong) = 2020
	group by ma_dich_vu_di_kem
	having sum(hdct.so_luong) > 10) as nan);

select *
from dich_vu_di_kem;

-- 20.Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select ma_nhan_vien as id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from nhan_vien
union all
select ma_khach_hang as id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from khach_hang;

-- 21.Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” 
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
create view v_nhan_vien as 
select nv.ma_nhan_vien, nv.ho_ten, nv.dia_chi, hd.ngay_lam_hop_dong
from nhan_vien nv
join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
where nv.dia_chi like '%Hải Châu%' and hd.ngay_lam_hop_dong = '12/12/2019';

select * from v_nhan_vien;

drop view v_nhan_vien;

