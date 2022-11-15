create database if not exists `furama_create_table`;
use `furama_create_table`;
create table vi_tri(
  ma_vi_tri int primary key auto_increment,
  ten_vi_tri varchar(45)
);
create table trinh_do(
  ma_trinh_do int,
  ten_trinh_do varchar(45)
);
create table bo_phan(
  ma_bo_phan int,
  ten_bo_phan varchar(45)
);
create table nhan_vien(
  ma_nhan_vien int,
  ho_ten varchar(45),
  ngay_sinh date,
  so_cmnd varchar(45),
  luong double,
  so_dien_thoai varchar(45),
  email varchar(45),
  dia_chi varchar(50),
  ma_vi_tri int,
  ma_trinh_do int,
  ma_bo_phan int
);
create table loai_khach(
  ma_loai_khach int,
  ten_loai_khach varchar(45)
);
create table loai_dich_vu(
  ma_loai_dich_vu int,
  ten_loai_dich_vu varchar(45)
);
create table khach_hang(
  ma_khach_hang int,
  ma_loai_khach int,
  ho_ten varchar(45),
  ngay_sinh date,
  gioi_tinh bit,
  so_cmnd varchar(45),
  so_dien_thoai varchar(45),
  email varchar(45),
  dia_chi varchar(45)
);
create table hop_dong(
  ma_hop_dong int, ngay_lam_hop_dong datetime,
  ngay_ket_thuc datetime, tien_dat_coc double,
  ma_nhan_vien int, ma_khach_hang int,
  ma_dich_vu int
);
create table dich_vu(
  ma_dich_vu int,
  ten_dich_vu varchar(45),
  dien_tich int,
  chi_phi_thue double,
  so_nguoi_toi_da int,
  ma_kieu_thue int,
  ma_loai_dich_vu int,
  tieu_chuan_phong varchar(45),
  mo_ta_tien_nghi_khac varchar(45),
  dien_tich_ho_boi double,
  so_tang int,
  dich_vu_mien_phi_di_kem text
);
create table dich_vu_di_kem(
  ma_dich_vu_di_kem int,
  ten_dich_vu_di_kem varchar(45),
  gia double,
  don_vi varchar(10),
  trang_thai varchar(45)
);
create table hop_dong_chi_tiet(
  ma_hop_dong_chi_tiet int, ma_hop_dong int,
  ma_dich_vu_di_kem int, so_luong int
);
create table kieu_thue(
  ma_kieu_thue int,
  ten_kieu_thue varchar(45)
);