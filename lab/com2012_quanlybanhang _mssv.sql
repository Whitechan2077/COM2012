CREATE DATABASE QUANLY_BAN_HANG_2;
GO
USE QUANLY_BAN_HANG_2;
GO
CREATE TABLE Khach_Hang(
      maKhachHang varchar(5) PRIMARY KEY,
	  hoVaTenLot  Nvarchar(50) NOT NULL,
      Ten Nvarchar(50) NOT NULL,
	  diaChi Nvarchar(255) NOT NULL,
	  email varchar(50) NOT NULL,
	  dienThoai varchar(13) UNIQUE 
);
GO
CREATE TABLE San_Pham(
      maSanPham int PRIMARY KEY,
	  moTa Nvarchar(255),
	  soLuong int CONSTRAINT DK_SO_LUONG CHECK(soLuong>=0),
	  donGia int CONSTRAINT DK_DON_GIA CHECK(donGia>=0),
	  tenSp nvarchar(50) NOT NULL
);
GO
CREATE TABLE Hoa_Don(
      maKhachHang varchar(5) CONSTRAINT FK_maKhachHang FOREIGN KEY(maKhachHang) REFERENCES Khach_Hang(maKhachHang),
	  maHoaDon int PRIMARY KEY,
	  ngayMuaHang date,
	  trangThai nvarchar(50)
);
GO
CREATE TABLE HoaDon_ChiTiet(
      maHoaDonChiTiet int PRIMARY KEY,
      maHoaDon int CONSTRAINT FK_MA_HOA_DON FOREIGN KEY(maHoaDon) REFERENCES Hoa_Don(maHoaDon),
	  maSanPham int CONSTRAINT FK_MA_SAN_PHAM FOREIGN KEY(maSanPham) REFERENCES San_Pham(maSanPham),
	  soLuong int
);