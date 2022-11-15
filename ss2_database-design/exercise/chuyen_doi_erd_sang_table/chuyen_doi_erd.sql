create database if not exists chuyen_doi_erd;
use chuyen_doi_erd;

create table phieu_xuat(
so_px int primary key,
ngay_xuat date not null
);

create table vat_tu(
ma_vat_tu int primary key,
ten_vat_tu varchar(45)
);

create table phieu_nhap(
so_pn int primary key,
ngay_nhap date not null
);

create table don_dh(
so_dh int primary key,
ngay_dh date not null
);

create table nha_cc(
ma_ncc int primary key,
ten_ncc varchar(50),
dia_chi varchar(50)
);

create table sdt(
sdt varchar(10) primary key,
ma_ncc int not null,
foreign key(ma_ncc) references nha_cc(ma_ncc)
);

create table chi_tiet_phieu_xuat(
gd_xuat double not null,
sl_xuat int not null,
so_px int,
ma_vat_tu int,
primary key( so_px,ma_vat_tu),
foreign key(so_px) references phieu_xuat(so_px),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table chi_tiet_phieu_nhap(
dg_nhap double not null,
sl_nhap int not null,
ma_vat_tu int,
so_pn int,
primary key(ma_vat_tu,so_pn),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key(so_pn) references phieu_nhap(so_pn)
);

create table chi_tiet_don_dat_hang(
ma_vat_tu int,
so_dh int,
primary key( ma_vat_tu, so_dh),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key(so_dh) references don_hd(so_hd)
);

create table cung_cap(
so_dh int,
ma_ncc int,
primary key(so_dh,ma_ncc),
foreign key(so_dh) references don_hd(so_dh),
foreign key(ma_ncc) references nha_cc(ma_ncc)
);

