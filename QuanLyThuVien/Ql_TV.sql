create database QLTV_Java 
use QLTV_Java 
go
create table TheLoai(
	MaTheLoai char(10) not null , 
	TenTheLoai nvarchar(20) , 
	CONSTRAINT PK_TheLoai PRIMARY KEY(MaTheLoai) 
);
create table Sach 
(
	MaSach char(10) not null  ,
	TenSach nvarchar(30) , 
	TacGia nvarchar(30) , 
	SoLuong int  , 
	NamXB int ,
    MaTheLoai char(10), 
	CONSTRAINT PK_Sach PRIMARY KEY(MaSach),
    CONSTRAINT FK_Sach_TheLoai FOREIGN KEY (MaTheLoai) REFERENCES TheLoai (MaTheLoai)
) ;

create table KhachHang(
	MaKhach char(10) not null , 
	TenKhach nvarchar(20)  ,
	DiaChi nvarchar(30) , 
	Sdt char(11) ,
	CONSTRAINT PK_KH PRIMARY KEY(MaKhach) 
);
create table NhanVien(
	MaNV char(10) not null , 
	TenNV nvarchar(20) , 
	DiaChi nvarchar(20) , 
	Sdt char(10) ,
	CONSTRAINT PK_NV PRIMARY KEY(MaNV)
);
create table PhieuMuon (
	MaPhieu char(10) not null , 
	MaKhach char(10) ,
    MaNV char(10) ,
	CONSTRAINT PK_Phieu PRIMARY KEY(MaPhieu),
	CONSTRAINT FK_PM_KH FOREIGN KEY (MaKhach) REFERENCES KhachHang (MaKhach) ,
    CONSTRAINT FK_PM_NV FOREIGN KEY (MaNV) REFERENCES NhanVien (MaNV)
);

create table Chitietphieumuon (
	MaPhieu char(10) not null , 
	MaSach char(10) , 
	NgayMuon datetime , 
	NgayTra datetime , 
    constraint Pk_CTPM primary key(MaPhieu,MaSach),
    constraint FK_CTPM_Sach foreign key (MaSach) references Sach (MaSach),
    Constraint FK_CTPM_PM foreign key (MaPhieu) references PhieuMuon(MaPhieu)
);

select * from Sach