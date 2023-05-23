USE thu_vien;
GO
SELECT sach.ma_sach,sach.ten_sach,sach.gia_tien,sach.tac_gia FROM loai_sach JOIN sach ON loai_sach.ma_loai = sach.ma_loai
         WHERE (loai_sach.ma_loai = 'IT');
GO
SELECT phieu_muon.ma_phieu_muon,phieu_muon_chi_tiet.ma_sach,phieu_muon.ngay_muon,phieu_muon.msv 
       FROM phieu_muon JOIN phieu_muon_chi_tiet ON phieu_muon.ma_phieu_muon = phieu_muon_chi_tiet.ma_phieu_muon
	   WHERE(Year(phieu_muon.ngay_muon)=2017 AND MONTH(phieu_muon.ngay_muon)=1);
GO
SELECT ma_phieu_muon,ngay_muon,trang_thai FROM phieu_muon
       WHERE trang_thai = 'NOT'
	   ORDER BY ngay_muon;
GO
        
SELECT ma_loai,COUNT(ma_sach)AS'Tong Dau sach'
      FROM sach 
	  GROUP BY(ma_loai);
GO
SELECT COUNT(msv) AS 'Luot sinh vien muon sach' FROM phieu_muon;
GO
SELECT * FROM sach
      WHERE(tieu_de='SQL');
GO
SELECT sinh_vien.msv,sinh_vien.ten_sinh_vien,phieu_muon.ma_phieu_muon,sach.tieu_de,phieu_muon.ngay_muon,phieu_muon.ngay_tra 
	FROM sinh_vien JOIN phieu_muon ON sinh_vien.msv = phieu_muon.msv 
             JOIN phieu_muon_chi_tiet ON phieu_muon.ma_phieu_muon = phieu_muon_chi_tiet.ma_phieu_muon 
             JOIN sach ON phieu_muon_chi_tiet.ma_sach = sach.ma_sach
	ORDER BY phieu_muon.ngay_muon;
GO
SELECT COUNT(ma_phieu_muon) AS'So luot muon',sach.ma_loai FROM 
         sach
         JOIN phieu_muon_chi_tiet ON sach.ma_sach = phieu_muon_chi_tiet.ma_sach
		 GROUP BY(sach.ma_loai)
		 HAVING(COUNT(ma_phieu_muon)>20);
GO
UPDATE sach 
      SET gia_tien = gia_tien *0.3
	  WHERE(DAY(ngay_nhap)<2014);
GO
--ph35753 Bui Hoang Dung
UPDATE phieu_muon 
       SET trang_thai='DONE'
	   WHERE msv='PH35753';
SELECT * FROM phieu_muon;
GO
SELECT * FROM sinh_vien JOIN phieu_muon ON sinh_vien.msv = phieu_muon.msv
         WHERE trang_thai = 'NOT';
GO
UPDATE sach SET ban_sao = ban_sao+5
       WHERE ma_sach IN
	   (
	   SELECT phieu_muon_chi_tiet.ma_sach FROM phieu_muon_chi_tiet 
	   GROUP BY phieu_muon_chi_tiet.ma_sach
	   HAVING COUNT(phieu_muon_chi_tiet.ma_sach)>10
	   );
SELECT * FROM sach;
DELETE FROM phieu_muon WHERE YEAR(ngay_muon)<2010 AND  YEAR(ngay_tra)<2010;