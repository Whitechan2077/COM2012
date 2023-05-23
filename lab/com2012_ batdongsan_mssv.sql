CREATE DATABASE QUAN_LY_BDS;
GO
USE QUAN_LY_BDS;
GO

CREATE TABLE Van_phong(
     maVanphong varchar(10) PRIMARY KEY,
	 diaChi nvarchar(50) NOT NULL,
	 maTruongphong varchar(10) 
);
CREATE TABLE nhan_Vien (
     maNhanvien varchar(10) PRIMARY KEY ,
     tenNhanvien Nvarchar(50) NOT NULL,
	 maVanphong  varchar(10)
);
GO
CREATE TABLE nhan_Than(
      maNhanthan varchar(10) CONSTRAINT FK_NHAN_THAN FOREIGN KEY(maNhanthan) REFERENCES nhan_Vien(maNhanvien),
	  tenNhanthan Nvarchar(50) NOT NULL,
	  quanHe nvarchar(5) NOT NULL,
	  ngaySinh date
);
GO
CREATE TABLE chu_SH(
      maChush varchar(10) PRIMARY KEY,
	  ten nvarchar(50) NOT NULL,
	  diaChi nvarchar(50) NOT NULL,
	  sdt varchar(13) NOT NULL UNIQUE,
);
GO
CREATE TABLE danh_sach_BDS(
      maBDS varchar(10),
	  diachiBDS nvarchar(50),
	  maVanphong varchar(10) CONSTRAINT FK_MA_VP_BDS FOREIGN KEY(maVanphong) REFERENCES Van_phong(maVanphong),
	  maChush varchar(10) CONSTRAINT FK_MA_CHU_SO_HUU FOREIGN KEY(maChush) REFERENCES chu_SH(maChush)
);

ALTER TABLE Van_phong
ADD CONSTRAINT FK_MA_TRUONG_PHONG FOREIGN KEY(maTruongphong) REFERENCES nhan_Vien(maNhanvien);
GO
ALTER TABLE nhan_Vien 
ADD CONSTRAINT FK_MA_VAN_PHONG FOREIGN KEY(maVanphong) REFERENCES Van_phong(maVanphong);