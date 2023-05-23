USE QUANLY_BAN_HANG;
GO
/*Bai 1*/
SELECT * FROM KhachHang;
GO
SELECT TOP 10 maKhachHang,hoVaTenLot,Ten,email,dienThoai FROM KhachHang;
GO
SELECT maSanPham,tenSp, soLuong*donGia AS 'Tổng tiền tồn kho' FROM SanPham;
GO
SELECT maKhachHang,CONCAT(hoVaTenLot,' ',Ten)AS'Họ và tên',diaChi 
       FROM KhachHang
	   WHERE(Ten LIKE 'H%');
GO
SELECT * FROM HoaDon
         WHERE(trangThai='NOT'AND YEAR(ngayMuaHang)=2016);
GO 
SELECT maHoaDon FROM HoaDon
       WHERE(maKhachHang IN('KH001','KH002','KH003'));
GO
/*Bai 2*/
SELECT COUNT(maKhachHang) AS 'So luong khach hang' FROM KhachHang;
GO
SELECT MAX(soLuong) AS 'Nhieu Nhat' FROM SanPham;
GO
SELECT MIN(soLuong) AS 'It nhat' FROM SanPham;
GO
SELECT SUM(soLuong) AS 'Tong' FROM SanPham;
GO
SELECT COUNT(maHoaDon) AS 'So hoa don' 
       FROM HoaDon
	   WHERE(YEAR(ngayMuaHang)=2016 AND MONTH(ngayMuaHang)=12 AND trangThai='NOT');
GO
SELECT COUNT(maHoaDon) AS 'loai san pham' ,maHoaDon AS 'ma hoa don' 
       FROM HoaDonChiTiet
	   GROUP BY(maHoaDon);
GO
SELECT COUNT(maSanPham) AS 'loai san pham >5' ,maHoaDon AS 'ma hoa don' 
       FROM HoaDonChiTiet
	   GROUP BY(maHoaDon)
	   HAVING(COUNT(maSanPham)>=5);
GO
SELECT maHoaDon,ngayMuaHang,maKhachHang 
       FROM HoaDon 
	   ORDER BY ngayMuaHang DESC;
GO