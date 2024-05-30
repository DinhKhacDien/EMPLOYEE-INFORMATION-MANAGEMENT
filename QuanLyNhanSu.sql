Create database QuanLyNhanSu
go
use QuanLyNhanSu
go

Create table NhanVien(
	MaNhanVien varchar(20) primary key not null
	TaiKhoan varchar(20),
	MatKhau varchar(20),
	HoTen nvarchar(40),
	NgaySinh datetime,
	QueQuan nvarchar(100),
	GioiTinh int,
	sdt varchar(12),
	MaPhongBan varchar(20),
	MaChucVu varchar(20)
	Constraint fk_PhongBan foreign key(MaPhongBan) references dbo.PhongBan(MaPhongBan),
	Constraint fk_ChucVu foreign key(MaChucVu) references dbo.ChucVu(MaChucVu)
)
alter table nhanvien add DateCreate datetime

Create table TongNgayNghi(
	MaNhanVien varchar(20) primary key not null,
	HoTen nvarchar(40) not null,
	TongSoNgayNghi int,
	GhiChu nvarchar(300)
	constraint fk_TongNgayNghi foreign key(MaNhanVien) references dbo.NhanVien(MaNhanVien)
)
alter table tongngaynghi add DateCreate datetime

create table PhongBan(
	MaPhongBan varchar(20) primary key not null,
	TenPhongBan nvarchar(40),
	DiaChi nvarchar(100),
	sdtLienHe varchar(12),
)

alter table phongban add DateCreate datetime

create table ChucVu(
	MaChucVu varchar(20) primary key not null,
	TenChucVu nvarchar(100),
)

create table Luong(
	MaNhanVien varchar(20) primary key,
	LuongCoBan int,
	HeSoLuong float,
	TienPhat int,
	TienThuong int,
	PhuCap int,
	Thue float,
	Constraint fk_Luong foreign key(MaNhanVien) references dbo.NhanVien(MaNhanVien)
)
alter table Luong add DateCreate datetime

Create table CapNhatLuong(
	MaCapNhatLuong varchar(20) primary key not null,
	MaNhanVien varchar(20),
	NgayCapNhat datetime,
	LuongTruoc int,
	LuongSau int,
	GhiChu nvarchar(300)
	Constraint fk_CapNhatLuong foreign key(MaNhanVien) references dbo.NhanVien(MaNhanVien)
)

create table NgayNghi(
	MaNgayNghi varchar(20) primary key not null,
	MaNhanVien varchar(20),
	NgayNghiDate date,
	LyDo nvarchar(300),
	GhiChu nvarchar(300)
	Constraint fk_NgayNghi foreign key(MaNhanVien) references dbo.NhanVien(MaNhanVien)
)
alter table ngaynghi add DateCreate datetime

create table Admins(
	TenDangNhap varchar(30),
	MatKhau varchar(30),
	HoTen nvarchar(40),
	NgaySinh datetime,
	QueQuan nvarchar(100),
	GioiTinh int,
	sdt varchar(12),
)