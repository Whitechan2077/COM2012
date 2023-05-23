CREATE DATABASE quan_ly_sinh_vien;
GO
USE quan_ly_sinh_vien;
GO
CREATE TABLE Sinh_vien(
   msv varchar(5) Primary key,
   ho_ten nvarchar(69) NOT NULL,
   ngay_sinh date NOT NULL,
   gioi_tinh nvarchar(3)
);
GO
CREATE TABLE mon_Hoc(
   mmh varchar(3) PRIMARY KEY,
   ten_mon nvarchar(30),
   tin_chi int   
);
GO
CREATE TABLE diem(
   msv varchar(5) CONSTRAINT FK_MSV FOREIGN KEY(msv) REFERENCES Sinh_vien(msv),
   mnh varchar(3) CONSTRAINT FK_MNH FOREIGN KEY(mnh) REFERENCES mon_Hoc(mmh),
   diem float NOT NULL
 );