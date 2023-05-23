--lab7
--bai1
USE QUANLY_BAN_HANG_2
GO
INSERT INTO Khach_Hang
        VALUES('KH001',N'Nguyễn Thị',N'Nga',N'15 Quang Trung TP Đà Nẵng','ngant@gmail.com','0912345670'),
		       ('KH002',N'Trần Công',N'Thành',N'234 Lê Lợi Quảng Nam','thanhtc@gmail.com','16109423443'),
			   ('KH003',N'Lê Hoàng',N'Nam,',N'23 Trần Phú TP Huế','namlh@yahoo.com','0989354556'),
			   ('KH004',N'Vũ Ngọc',N'Hiền,',N'23 Trần Phú TP Huế','hienvh@gmail.com',' 0894545435');
GO
INSERT INTO San_Pham 
       VALUES('1',N'Samsung Galaxy J7 Pro là một chiếc smartphone phù hợp với những người yêu thích một sản phẩm pin tốt, thích hệ điều hành mới cùng những tính năng đi kèm độc quyền','800','6600000','Samsung Galaxy J7 Pro'),
	         ('2',N'iPhone 6 là một trong những smartphone được yêu thích nhất. Lắng nghe nhu cầu về thiết kế, khả năng lưu trữ và giá cả, iPhone 6 32GB được chính thức phân phối chính hãng tại Việt Nam hứa hẹn sẽ là một sản phẩm rất "Hot"','500','8990000','iPhone 6 32GB'),
			 ('3',N'Dell Inspiron 3467 i3 7100U/4GB/1TB/Win10/(M20NR21)','507','11290000','Laptop Dell Inspiron 3467'),
			 ('4',N'Pin sạc dự phòng Polymer 5.000 mAh eSaver JP85','600','200000','Pin sạc dự phòng'),
			 ('5',N'Nokia 3100 phù hợp với SINH VIÊN','100','700000','Nokia 3100');
GO
INSERT INTO Hoa_Don 
       VALUES('KH001','120954','2016-3-23','Đã thanh toán'),
	         ('KH002','120955','2016-4-2','Đã thanh toán'),
			 ('KH001','120956','2016-7-12','chưa thanh toán'),
			 ('KH004','125957','2016-12-4','chưa thanh toán');
GO
INSERT INTO HoaDon_ChiTiet
       VALUES('1','120954','3','40'),
	         ('2','120954','1','20'),
			 ('3','120955','2','100'),
			 ('4','120956','4','6'),
			 ('5','120956','2','60'),
			 ('6','120956','1','10'),
			 ('7','125957','2','50');
GO 
--b
SELECT CONCAT(hoVaTenLot,' ',Ten) AS 'Họvà tên' INTO KH_DN FROM Khach_Hang
         WHERE diaChi LIKE N'%Đà Nẵng%';
GO
 --bai2
 --a
 UPDATE Khach_Hang 
        SET dienThoai = '16267788989'
		WHERE maKhachHang = 'KH002';
GO
--b
UPDATE San_Pham 
       SET soLuong = soLuong + 200
	   WHERE maSanPham ='3';
GO
--c
UPDATE San_Pham 
       SET donGia = donGia *0.05;
GO
--d
UPDATE San_Pham 
       SET donGia = donGia *0.1
	   WHERE maSanPham IN
	   (
	   SELECT TOP 2 maSanPham FROM HoaDon_ChiTiet JOIN Hoa_Don ON HoaDon_ChiTiet.maHoaDon =Hoa_Don.maHoaDon
	   GROUP BY maSanPham , ngayMuaHang
	   HAVING (Hoa_Don.ngayMuaHang > '2016-1-1') AND (Hoa_Don.ngayMuaHang <= '2016-12-31') 
	   ORDER BY SUM(soLuong)
	   );
GO
UPDATE Hoa_Don
       SET trangThai = N'Ðã thanh toán'
	   WHERE maHoaDon='120956';
GO
DELETE FROM HoaDon_ChiTiet
       WHERE maSanPham IN
	   (
	   SELECT maSanPham FROM Hoa_Don JOIN HoaDon_ChiTiet ON Hoa_Don.maHoaDon = HoaDon_ChiTiet.maHoaDon
	   WHERE HoaDon_ChiTiet.maHoaDon='120956' AND HoaDon_ChiTiet.maSanPham = '2' AND Hoa_Don.trangThai ='chua thanh toán'
	   )
GO
--h
DELETE FROM Khach_Hang
            WHERE maKhachHang IN
			(
			SELECT Khach_Hang.maKhachHang FROM Khach_Hang LEFT JOIN Hoa_Don ON Hoa_Don.maKhachHang = Khach_Hang.maKhachHang
			WHERE YEAR(Hoa_Don.ngayMuaHang)<2016
			);
GO