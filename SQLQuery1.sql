﻿CREATE DATABASE quanlychancong;
go
USE quanlychancong;
GO
CREATE TABLE NHANVIEN
(
     MaNV varchar(5) PRIMARY KEY,
	 hoTen nvarchar(50) NOT NULL,
	 ngaySinh date NOT NULL,
	 luong float NOT NULL,
     Gtinh nvarchar(3) NOT NULL
);
GO
CREATE TABLE DUAN
(
     MaDA varchar(5) PRIMARY KEY,
	 TenDuAn nvarchar(50) NOT NULL,
	 namBatdau INT NOT NULL
);
CREATE TABLE CHAMCONG
(
        MaNV varchar(5) CONSTRAINT FK_MANV FOREIGN KEY(MaNV) REFERENCES NHANVIEN(MaNV),
		MaDA varchar(5) CONSTRAINT FK_DA  FOREIGN KEY(MaDA) REFERENCES DUAN(MaDA),
		SoGio int,
		PRIMARY KEY(MaNV,MaDA)
);
GO
INSERT INTO NHANVIEN 
       VALUES('N01',N'Trần Văn tới','2002-2-1',19000000,N'Nam'),
	         ('N02',N'Tạ Ngọc Bích','1988-3-3',5000000,N'Nữ'),
			 ('N03',N'Chu Thị Hợi','1996-1-5',70000000,N'Nữ')
INSERT INTO DUAN 
       VALUES('C1',N'Phần mềm một cửa',2021),
	         ('C2',N'Chấm công khách sạn',2022),
			 ('C3',N'Quản lý sinh viên',2020)
INSERT INTO CHAMCONG
       VALUES('N01','C1',300),
	         ('N03','C1',200),
			 ('N01','C3',80)
GO
--B
SELECT MaNV,hoTen,ngaySinh
      FROM NHANVIEN 
	  WHERE luong>7000000 AND Gtinh LIKE N'Nữ'
GO
--c
SELECT DUAN.MaDA,DUAN.TenDuAn
      FROM NHANVIEN JOIN CHAMCONG ON NHANVIEN.MaNV = CHAMCONG.MaNV 
	                JOIN DUAN ON  CHAMCONG.MaDA = DUAN.MaDA
	  WHERE NHANVIEN.hoTen LIKE N'Trần Văn Tới';
GO
--d
SELECT NHANVIEN.MaNV, NHANVIEN.hoTen,SUM(CHAMCONG.SoGio) AS 'Tong gio' 
      FROM NHANVIEN JOIN CHAMCONG ON NHANVIEN.MaNV = CHAMCONG.MaNV 
	                JOIN DUAN ON  CHAMCONG.MaDA = DUAN.MaDA
	  GROUP BY NHANVIEN.hoTen , NHANVIEN.MaNV
	  HAVING SUM(CHAMCONG.SoGio)>300;
GO
--e
SELECT NHANVIEN.MaNV, NHANVIEN.hoTen,COUNT(DUAN.MaDA) AS 'soLuongDuan' 
      FROM NHANVIEN JOIN CHAMCONG ON NHANVIEN.MaNV = CHAMCONG.MaNV 
	                JOIN DUAN ON  CHAMCONG.MaDA = DUAN.MaDA
	  GROUP BY NHANVIEN.MaNV, NHANVIEN.hoTen;
GO
--f
INSERT INTO NHANVIEN 
       VALUES('N04',N'Trần Đặc Cầu','2002-2-1',19000,N'Nam');
GO 
--g
UPDATE DUAN 
       SET namBatdau = 2019
	   WHERE TenDuAn =N'Chấm công khách sạn';
GO
--h
SELECT * FROM DUAN
DELETE FROM DUAN 
       WHERE MaDA NOT IN
	   (SELECT DISTINCT MaDA FROM DUAN);