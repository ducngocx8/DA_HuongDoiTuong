USE [master]
GO
/****** Object:  Database [QuanLyVatTu]    Script Date: 1/24/2022 9:52:00 PM ******/
CREATE DATABASE [QuanLyVatTu]
GO
ALTER DATABASE [QuanLyVatTu] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyVatTu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyVatTu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyVatTu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyVatTu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyVatTu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyVatTu] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyVatTu] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyVatTu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyVatTu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyVatTu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyVatTu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyVatTu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyVatTu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyVatTu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyVatTu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyVatTu] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyVatTu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyVatTu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyVatTu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyVatTu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyVatTu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyVatTu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyVatTu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyVatTu] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyVatTu] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyVatTu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyVatTu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyVatTu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyVatTu] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuanLyVatTu] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyVatTu', N'ON'
GO
USE [QuanLyVatTu]
GO
/****** Object:  Table [dbo].[CTHOADON]    Script Date: 1/24/2022 9:52:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHOADON](
	[SoHD] [nvarchar](20) NOT NULL,
	[MaVT] [nvarchar](20) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[DonGia] [int] NOT NULL,
	[Vat] [float] NOT NULL,
 CONSTRAINT [PK_CTHOADON] PRIMARY KEY CLUSTERED 
(
	[SoHD] ASC,
	[MaVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HOADON]    Script Date: 1/24/2022 9:52:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADON](
	[SoHD] [nvarchar](20) NOT NULL,
	[NgayLap] [date] NOT NULL,
	[Loai] [nvarchar](50) NOT NULL,
	[MaNV] [nvarchar](10) NULL,
 CONSTRAINT [PK_HD] PRIMARY KEY CLUSTERED 
(
	[SoHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 1/24/2022 9:52:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MaNV] [nvarchar](10) NOT NULL,
	[HoNV] [nvarchar](50) NOT NULL,
	[TenNV] [nvarchar](50) NOT NULL,
	[Phai] [nvarchar](5) NOT NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_NV] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[USERS]    Script Date: 1/24/2022 9:52:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[UserName] [nvarchar](10) NOT NULL,
	[PASS] [nvarchar](20) NOT NULL,
	[QUYEN] [int] NOT NULL,
 CONSTRAINT [PK_USERS] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VATTU]    Script Date: 1/24/2022 9:52:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VATTU](
	[MaVT] [nvarchar](20) NOT NULL,
	[TenVT] [nvarchar](50) NOT NULL,
	[SoLuongTon] [int] NOT NULL,
	[DonViTinh] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_VT] PRIMARY KEY CLUSTERED 
(
	[MaVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'2099', N'1003', 1, 10, 1)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'2148117383', N'1001', 9, 10000, 11)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'2148117383', N'1003', 4, 10000, 11)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'2148117383', N'1011', 1, 10000, 11)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'2148117383', N'5', 56, 10000, 1)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'2148505589', N'1002', 10, 200000, 4)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'2148505589', N'1009', 10, 200000, 4)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'2149030650', N'1009', 1, 1, 1)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'2149451423', N'1001', 1, 1, 1)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'2149673485', N'1001', 1, 1, 1)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'2149741309', N'1000', 10, 1000, 1)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'2149741309', N'1001', 10, 1000, 1)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'2149741309', N'1002', 11, 1000, 1)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'2149741309', N'1003', 11, 10000, 1)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'2149741309', N'1009', 9, 1000, 1)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'2149741309', N'5', 10, 1000, 1)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'2149977956', N'1009', 1, 11, 1)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'2151199363', N'1001', 1, 1, 1)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'2151378419', N'1001', 43434, 344, 34)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'2151378419', N'1002', 43434, 344, 34)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'2151443722', N'1001', 121, 121323, 12)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'2151443722', N'1002', 121, 121323, 12)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'2151443722', N'1008', 121, 121323, 12)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'3000', N'1000', 10, 90000, 1)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'3000', N'1001', 5, 50000, 1.5)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'3000', N'1002', 7, 4500, 1.5)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'3000', N'1003', 8, 20000, 1)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'3000', N'1004', 15, 70000, 2)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'3001', N'1003', 2, 60000, 1)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'3001', N'1004', 7, 15000, 1)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'3001', N'1005', 3, 4000, 0)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'3001', N'1007', 5, 16000, 1)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'3001', N'1008', 15, 20000, 2)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'3002', N'1009', 7, 65000, 1)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'3002', N'1010', 2, 55000, 1)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'3003', N'1005', 2, 65000, 1)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'3004', N'1005', 2, 65000, 1)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'3005', N'1003', 1, 10000, 1)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'656532860', N'1000', 11, 11, 1)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'656532860', N'1001', 11, 11, 1)
INSERT [dbo].[CTHOADON] ([SoHD], [MaVT], [SoLuong], [DonGia], [Vat]) VALUES (N'656532860', N'1002', 11, 11, 1)
INSERT [dbo].[HOADON] ([SoHD], [NgayLap], [Loai], [MaNV]) VALUES (N'2099', CAST(N'2021-01-06' AS Date), N'N', N'2000')
INSERT [dbo].[HOADON] ([SoHD], [NgayLap], [Loai], [MaNV]) VALUES (N'2148117383', CAST(N'2022-01-24' AS Date), N'X', N'1')
INSERT [dbo].[HOADON] ([SoHD], [NgayLap], [Loai], [MaNV]) VALUES (N'2148505589', CAST(N'2022-01-24' AS Date), N'N', N'1')
INSERT [dbo].[HOADON] ([SoHD], [NgayLap], [Loai], [MaNV]) VALUES (N'2149030650', CAST(N'2022-01-24' AS Date), N'N', N'1')
INSERT [dbo].[HOADON] ([SoHD], [NgayLap], [Loai], [MaNV]) VALUES (N'2149451423', CAST(N'2022-01-24' AS Date), N'N', N'1')
INSERT [dbo].[HOADON] ([SoHD], [NgayLap], [Loai], [MaNV]) VALUES (N'2149673485', CAST(N'2022-01-24' AS Date), N'N', N'1')
INSERT [dbo].[HOADON] ([SoHD], [NgayLap], [Loai], [MaNV]) VALUES (N'2149741309', CAST(N'2022-01-24' AS Date), N'N', N'1')
INSERT [dbo].[HOADON] ([SoHD], [NgayLap], [Loai], [MaNV]) VALUES (N'2149977956', CAST(N'2022-01-24' AS Date), N'X', N'2000')
INSERT [dbo].[HOADON] ([SoHD], [NgayLap], [Loai], [MaNV]) VALUES (N'2151199363', CAST(N'2022-01-24' AS Date), N'X', N'2000')
INSERT [dbo].[HOADON] ([SoHD], [NgayLap], [Loai], [MaNV]) VALUES (N'2151378419', CAST(N'2022-01-24' AS Date), N'N', N'2003')
INSERT [dbo].[HOADON] ([SoHD], [NgayLap], [Loai], [MaNV]) VALUES (N'2151443722', CAST(N'2022-01-24' AS Date), N'X', N'2003')
INSERT [dbo].[HOADON] ([SoHD], [NgayLap], [Loai], [MaNV]) VALUES (N'3000', CAST(N'2021-12-05' AS Date), N'N', N'2000')
INSERT [dbo].[HOADON] ([SoHD], [NgayLap], [Loai], [MaNV]) VALUES (N'3001', CAST(N'2021-12-04' AS Date), N'X', N'2001')
INSERT [dbo].[HOADON] ([SoHD], [NgayLap], [Loai], [MaNV]) VALUES (N'3002', CAST(N'2021-12-06' AS Date), N'N', N'2000')
INSERT [dbo].[HOADON] ([SoHD], [NgayLap], [Loai], [MaNV]) VALUES (N'3003', CAST(N'2021-12-06' AS Date), N'X', N'2000')
INSERT [dbo].[HOADON] ([SoHD], [NgayLap], [Loai], [MaNV]) VALUES (N'3004', CAST(N'2021-12-04' AS Date), N'X', N'2001')
INSERT [dbo].[HOADON] ([SoHD], [NgayLap], [Loai], [MaNV]) VALUES (N'3005', CAST(N'2021-12-03' AS Date), N'N', N'2002')
INSERT [dbo].[HOADON] ([SoHD], [NgayLap], [Loai], [MaNV]) VALUES (N'656532860', CAST(N'2022-01-07' AS Date), N'X', N'2000')
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenNV], [Phai], [TrangThai]) VALUES (N'1', N'D', N'Ad', N'Nam', 1)
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenNV], [Phai], [TrangThai]) VALUES (N'2000', N'Nguyễn Văn', N'An', N'Nam', 0)
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenNV], [Phai], [TrangThai]) VALUES (N'2001', N'Hoàng Đức', N'Tuấn', N'Nam', 0)
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenNV], [Phai], [TrangThai]) VALUES (N'2002', N'Vũ Minh', N'Phan', N'Nam', 0)
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenNV], [Phai], [TrangThai]) VALUES (N'2003', N'Nguyễn Đức', N'Ngọc', N'Nam', 1)
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenNV], [Phai], [TrangThai]) VALUES (N'2005', N'Nguyễn Văn', N'Tú', N'Nam', 1)
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenNV], [Phai], [TrangThai]) VALUES (N'2007', N'Vũ Tín', N'Phong', N'Nam', 1)
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenNV], [Phai], [TrangThai]) VALUES (N'2009', N'Phan Ngọc', N'Thi', N'Nữ', 1)
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenNV], [Phai], [TrangThai]) VALUES (N'2010', N'Trần Văn', N'Toán', N'Nam', 1)
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenNV], [Phai], [TrangThai]) VALUES (N'2011', N'Nguyễn Minh', N'Toàn', N'Nam', 1)
INSERT [dbo].[USERS] ([UserName], [PASS], [QUYEN]) VALUES (N'1', N'1', 1)
INSERT [dbo].[USERS] ([UserName], [PASS], [QUYEN]) VALUES (N'2000', N'1', 0)
INSERT [dbo].[USERS] ([UserName], [PASS], [QUYEN]) VALUES (N'2001', N'1', 1)
INSERT [dbo].[USERS] ([UserName], [PASS], [QUYEN]) VALUES (N'2002', N'1', 0)
INSERT [dbo].[USERS] ([UserName], [PASS], [QUYEN]) VALUES (N'2003', N'1', 0)
INSERT [dbo].[USERS] ([UserName], [PASS], [QUYEN]) VALUES (N'2005', N'1', 0)
INSERT [dbo].[USERS] ([UserName], [PASS], [QUYEN]) VALUES (N'2007', N'1', 0)
INSERT [dbo].[USERS] ([UserName], [PASS], [QUYEN]) VALUES (N'2009', N'1', 0)
INSERT [dbo].[USERS] ([UserName], [PASS], [QUYEN]) VALUES (N'2010', N'1', 0)
INSERT [dbo].[USERS] ([UserName], [PASS], [QUYEN]) VALUES (N'2011', N'1', 1)
INSERT [dbo].[USERS] ([UserName], [PASS], [QUYEN]) VALUES (N'admin', N'1', 2)
INSERT [dbo].[VATTU] ([MaVT], [TenVT], [SoLuongTon], [DonViTinh]) VALUES (N'1', N'T', 1, N'T')
INSERT [dbo].[VATTU] ([MaVT], [TenVT], [SoLuongTon], [DonViTinh]) VALUES (N'1000', N'Xi Măng', 10, N'Bao')
INSERT [dbo].[VATTU] ([MaVT], [TenVT], [SoLuongTon], [DonViTinh]) VALUES (N'1001', N'Gạch', 43603, N'Viên')
INSERT [dbo].[VATTU] ([MaVT], [TenVT], [SoLuongTon], [DonViTinh]) VALUES (N'1002', N'Ghế massage', 43333, N'Chiếc')
INSERT [dbo].[VATTU] ([MaVT], [TenVT], [SoLuongTon], [DonViTinh]) VALUES (N'1003', N'Máy bay', 11, N'Cái')
INSERT [dbo].[VATTU] ([MaVT], [TenVT], [SoLuongTon], [DonViTinh]) VALUES (N'1004', N'Máy Giặt', 0, N'Cái')
INSERT [dbo].[VATTU] ([MaVT], [TenVT], [SoLuongTon], [DonViTinh]) VALUES (N'1005', N'Tivi', 7000, N'Chiếc')
INSERT [dbo].[VATTU] ([MaVT], [TenVT], [SoLuongTon], [DonViTinh]) VALUES (N'1006', N'Quạt Máy', 1, N'Cái')
INSERT [dbo].[VATTU] ([MaVT], [TenVT], [SoLuongTon], [DonViTinh]) VALUES (N'1007', N'Iphone 13', 400, N'Cái')
INSERT [dbo].[VATTU] ([MaVT], [TenVT], [SoLuongTon], [DonViTinh]) VALUES (N'1008', N'Máy Bơm', 79, N'Chiếc')
INSERT [dbo].[VATTU] ([MaVT], [TenVT], [SoLuongTon], [DonViTinh]) VALUES (N'1009', N'Bàn', 19, N'Cái')
INSERT [dbo].[VATTU] ([MaVT], [TenVT], [SoLuongTon], [DonViTinh]) VALUES (N'1010', N'Máy In', 200, N'Chiếc')
INSERT [dbo].[VATTU] ([MaVT], [TenVT], [SoLuongTon], [DonViTinh]) VALUES (N'1011', N'Máy pha cà phê', 0, N'Cái')
INSERT [dbo].[VATTU] ([MaVT], [TenVT], [SoLuongTon], [DonViTinh]) VALUES (N'5', N'Uu', 10, N'Uu')
ALTER TABLE [dbo].[CTHOADON]  WITH CHECK ADD  CONSTRAINT [FK_CTHOADON_HOADON] FOREIGN KEY([SoHD])
REFERENCES [dbo].[HOADON] ([SoHD])
GO
ALTER TABLE [dbo].[CTHOADON] CHECK CONSTRAINT [FK_CTHOADON_HOADON]
GO
ALTER TABLE [dbo].[CTHOADON]  WITH CHECK ADD  CONSTRAINT [FK_CTHOADON_VATTU] FOREIGN KEY([MaVT])
REFERENCES [dbo].[VATTU] ([MaVT])
GO
ALTER TABLE [dbo].[CTHOADON] CHECK CONSTRAINT [FK_CTHOADON_VATTU]
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [FK_HOADON_NHANVIEN] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NHANVIEN] ([MaNV])
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [FK_HOADON_NHANVIEN]
GO
USE [master]
GO
ALTER DATABASE [QuanLyVatTu] SET  READ_WRITE 
GO
