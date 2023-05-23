 CREATE DATABASE thu_vien;
 Go
 USE thu_vien;
 GO
 CREATE TABLE loai_sach(
       ma_loai varchar(5) PRIMARY KEY,
	   Ten_loai nvarchar(20) NOT NULL,
);
GO
CREATE TABLE sach(
       ma_sach varchar(5) PRIMARY KEY,
	   ten_sach nvarchar(150) UNIQUE NOT NULL,
	   tac_gia nvarchar(69) NOT NULL,
	   so_trang int CONSTRAINT So_Trang_Sach CHECK(so_trang>5),
	   NBX nvarchar(69) NOT NULL, 
	   gia_tien int CONSTRAINT DK_GIA CHECK(gia_tien>0),
	   ban_sao int CONSTRAINT So_Ban_Sao CHECK(ban_sao>0),
	   ngay_nhap date NOT NULL,
	   vi_tri_dat nvarchar(69) NOT NULL,
	   tieu_de nvarchar(20),
	   ma_loai varchar(5) FOREIGN KEY(ma_loai) REFERENCES loai_sach(ma_loai)
);
GO
CREATE TABLE sinh_vien(
       msv varchar(7) PRIMARY KEY,
	   ten_sinh_vien nvarchar(69) NOT NULL,
	   chuyen_nganh nvarchar(50),
	   SDT varchar(10) UNIQUE NOT NULL,
	   email varchar(69) UNIQUE NOT NULL,
	   ngay_het_han date NOT NULL
);
GO
CREATE TABLE phieu_muon(
       msv varchar(7) CONSTRAINT FK_MSV FOREIGN KEY(msv) REFERENCES sinh_vien(msv),
	   ma_lop varchar(7) NOT NULL,
	   ngay_muon date DEFAULT GETDATE(),
	   ngay_tra date NOT NULL,
	   CHECK (ngay_tra >= ngay_muon),
	   ma_phieu_muon int IDENTITY(06122004,1) PRIMARY KEY,
	   trang_thai nvarchar(10) NOT NULL
);
GO
CREATE TABLE phieu_muon_chi_tiet(
       ma_phieu_muon int CONSTRAINT FK_MaPhieuMuon FOREIGN KEY(ma_phieu_muon) REFERENCES phieu_muon(ma_phieu_muon),
	   ma_sach varchar(5) CONSTRAINT FK_MaSach FOREIGN KEY(ma_sach) REFERENCES sach(ma_sach), 
	   Ghi_chu nvarchar(255),
	   ma_phieu_muon_chi_tiet int PRIMARY KEY
);
GO
