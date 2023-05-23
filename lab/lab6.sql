 USE QUANLY_BAN_HANG;
GO
--bai1--
--a
SELECT * FROM HoaDon JOIN HoaDonChiTiet ON HoaDon.maHoaDon = HoaDonChiTiet.maHoaDon
GO
--b
SELECT * 
      FROM HoaDon JOIN HoaDonChiTiet ON HoaDon.maHoaDon = HoaDonChiTiet.maHoaDon
	  WHERE (HoaDon.maKhachHang = 'KH001');
GO
--c
SELECT HoaDon.maHoaDon,HoaDon.ngayMuaHang,SanPham.tenSp,(SanPham.donGia*HoaDonChiTiet.soLuong) AS 'Thanh_tien' 
       FROM HoaDon JOIN HoaDonChiTiet ON HoaDon.maHoaDon = HoaDonChiTiet.maHoaDon 
	               JOIN SanPham ON HoaDonChiTiet.maSanPham = SanPham.maSanPham;
--d
SELECT * 
       FROM 
	   KhachHang FULL JOIN HoaDon ON KhachHang.maKhachHang = HoaDon.maKhachHang 
	   FULL JOIN HoaDonChiTiet ON HoaDon.maHoaDon = HoaDonChiTiet.maHoaDon
	   WHERE HoaDon.trangThai = 'NOT';
--e               
SELECT HoaDon.maHoaDon,HoaDon.ngayMuaHang,SUM(SanPham.donGia*HoaDonChiTiet.soLuong) AS'tong_tien'
       FROM HoaDon JOIN HoaDonChiTiet ON HoaDon.maHoaDon = HoaDonChiTiet.maHoaDon 
	               JOIN SanPham ON HoaDonChiTiet.maSanPham = SanPham.maSanPham
				   GROUP BY HoaDon.maHoaDon,HoaDon.ngayMuaHang
				   HAVING SUM(SanPham.donGia*HoaDonChiTiet.soLuong)>500000
				   ORDER BY tong_tien DESC;
--Bai2
--a
SELECT  *
	FROM khachHang
	LEFT JOIN(
		SELECT hoaDon.maKhachHang
			FROM HoaDon
		WHERE YEAR(HoaDon.ngayMuaHang) >= 2016
		)
		HoaDon ON khachHang.maKhachHang = HoaDon.maKhachHang
		WHERE HoaDon.maKhachHang IS NULL;

GO
--b
SELECT TOP 1 SanPham.maSanPham,COUNT(HoaDonChiTiet.maSanPham) AS'tong_sp',SanPham.tenSp FROM HoaDonChiTiet JOIN SanPham ON SanPham.maSanPham = HoaDonChiTiet.maSanPham
       GROUP BY SanPham.maSanPham , SanPham.tenSp 
	   ORDER BY tong_sp DESC; 
GO
--c
SELECT TOP 5 KhachHang.maKhachHang,CONCAT(KhachHang.hoVaTenLot,' ',KhachHang.Ten) AS'Ho_va_ten',HoaDon.maHoaDon,HoaDon.ngayMuaHang,SUM(SanPham.donGia*HoaDonChiTiet.soLuong) AS'tong_tien'
       FROM KhachHang JOIN HoaDon ON HoaDon.maKhachHang = KhachHang.maKhachHang 
	   JOIN HoaDonChiTiet ON HoaDon.maHoaDon = HoaDonChiTiet.maHoaDon 
	   JOIN SanPham ON HoaDonChiTiet.maSanPham = SanPham.maSanPham
	   GROUP BY HoaDon.maHoaDon,HoaDon.ngayMuaHang,CONCAT(KhachHang.hoVaTenLot,' ',KhachHang.Ten),KhachHang.maKhachHang
	   ORDER BY tong_tien DESC;
GO
--d
SELECT KhachHang.maKhachHang,KhachHang.hoVaTenLot,KhachHang.Ten,KhachHang.diaChi,KhachHang.dienThoai,KhachHang.email,HoaDonChiTiet.maSanPham,SanPham.tenSp,HoaDon.ngayMuaHang
       FROM 
	   KhachHang JOIN HoaDon ON KhachHang.maKhachHang = HoaDon.maKhachHang 
	   JOIN HoaDonChiTiet ON HoaDon.maHoaDon = HoaDonChiTiet.maHoaDon
	   JOIN SanPham ON HoaDonChiTiet.maSanPham = SanPham.maSanPham
	   WHERE KhachHang.diaChi LIKE N'%Đà Nẵng%' AND (YEAR(HoaDon.ngayMuaHang)=2016 AND MONTH(HoaDon.ngayMuaHang) = 12) AND HoaDonChiTiet.maSanPham = 8220;
GO

--e
SELECT SanPham.tenSp, COUNT(SanPham.maSanPham) AS 'TOTAL'
	FROM SanPham
	JOIN HoaDonChiTiet ON hoaDonChiTiet.maSanPham = sanPham.maSanPham
	
	GROUP BY sanPham.tenSp
	having COUNT(sanPham.maSanPham) < ((select count( * ) from hoaDonChiTiet) / (select count(*) from sanPham));

select maSP, count (*)/
