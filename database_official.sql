USE [master]
GO
/****** Object:  Database [NHASACH]    Script Date: 12/15/2020 10:37:43 PM ******/
CREATE DATABASE [NHASACH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NHASACH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\NHASACH.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NHASACH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\NHASACH_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [NHASACH] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NHASACH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NHASACH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NHASACH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NHASACH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NHASACH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NHASACH] SET ARITHABORT OFF 
GO
ALTER DATABASE [NHASACH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NHASACH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NHASACH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NHASACH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NHASACH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NHASACH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NHASACH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NHASACH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NHASACH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NHASACH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NHASACH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NHASACH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NHASACH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NHASACH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NHASACH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NHASACH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NHASACH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NHASACH] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NHASACH] SET  MULTI_USER 
GO
ALTER DATABASE [NHASACH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NHASACH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NHASACH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NHASACH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NHASACH] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NHASACH] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [NHASACH] SET QUERY_STORE = OFF
GO
USE [NHASACH]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 12/15/2020 10:37:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[MaAD] [int] IDENTITY(1,1) NOT NULL,
	[HoAD] [nvarchar](10) NULL,
	[TenAD] [nvarchar](30) NULL,
	[UsernameAD] [varchar](50) NULL,
	[GioiTinh] [char](1) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[AnhDaiDien] [varchar](50) NULL,
	[DienThoai] [varchar](10) NULL,
	[NgaySinh] [date] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[MaAD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhGiaSach]    Script Date: 12/15/2020 10:37:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGiaSach](
	[MaSach] [int] NOT NULL,
	[MaKH] [int] NOT NULL,
	[NoiDungDanhGia] [nvarchar](200) NULL,
	[ThoiGianDang] [datetime] NULL,
 CONSTRAINT [PK_DanhGiaSach] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC,
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 12/15/2020 10:37:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[MaGH] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[MaSach] [int] NULL,
	[SoLuong] [int] NULL,
	[Thoigian] [datetime] NULL,
	[ThanhTien] [float] NULL,
	[MaDH] [int] NULL,
 CONSTRAINT [PK_GioHang] PRIMARY KEY CLUSTERED 
(
	[MaGH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/15/2020 10:37:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[NgayLapHD] [datetime] NULL,
	[TongTien] [float] NULL,
	[TenKhach] [nvarchar](50) NULL,
	[SDTDatHang] [char](10) NULL,
	[EmailXacNhan] [varchar](50) NULL,
	[DiaChiNhanHang] [nvarchar](200) NULL,
	[GiamGia] [int] NULL,
	[TongThanhToan] [float] NULL,
	[TrangThai] [nvarchar](50) NULL,
	[NgayNhanHang] [date] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/15/2020 10:37:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoKH] [nvarchar](20) NULL,
	[TenKH] [nvarchar](30) NULL,
	[UsernameKH] [varchar](50) NULL,
	[GioiTinh] [char](1) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[AnhDaiDien] [varchar](50) NULL,
	[DienThoai] [varchar](10) NULL,
	[NgaySinh] [date] NULL,
	[GiamGia] [int] NULL,
	[SoLanHuyDon] [smallint] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSach]    Script Date: 12/15/2020 10:37:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSach](
	[MaLoai] [varchar](50) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](100) NULL,
 CONSTRAINT [PK_LoaiSach_1] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaXuatBan]    Script Date: 12/15/2020 10:37:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaXuatBan](
	[MaNXB] [int] IDENTITY(1,1) NOT NULL,
	[TenNXB] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[SDT] [char](11) NULL,
	[Fax] [char](11) NULL,
	[Email] [varchar](50) NULL,
	[Website] [varchar](50) NULL,
 CONSTRAINT [PK_NhaXuatBan] PRIMARY KEY CLUSTERED 
(
	[MaNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 12/15/2020 10:37:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSach] [int] IDENTITY(1,1) NOT NULL,
	[TuaSach] [nvarchar](100) NULL,
	[TacGia] [int] NULL,
	[NhaXuatBan] [int] NULL,
	[NgayXuatBan] [date] NULL,
	[TheLoai] [varchar](50) NULL,
	[SoLuong] [int] NULL,
	[DonGia] [float] NULL,
	[AnhMinhHoa] [varchar](60) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TacGia]    Script Date: 12/15/2020 10:37:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TacGia](
	[MaTacGia] [int] IDENTITY(1,1) NOT NULL,
	[TenTacGia] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[QuocTich] [nvarchar](30) NULL,
 CONSTRAINT [PK_TacGia] PRIMARY KEY CLUSTERED 
(
	[MaTacGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 12/15/2020 10:37:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](100) NULL,
	[Role] [varchar](10) NULL,
	[Email] [varchar](50) NULL,
	[Latest_Login] [datetime] NULL,
	[block] [bit] NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([MaAD], [HoAD], [TenAD], [UsernameAD], [GioiTinh], [DiaChi], [AnhDaiDien], [DienThoai], [NgaySinh]) VALUES (2, N'Huỳnh', N'Thanh Tâm', N'tamhuynh', N'M', N'Bà Rịa Vũng Tàu', N'/images/tamhuynh.png', N'0347933844', CAST(N'2000-05-26' AS Date))
INSERT [dbo].[Admin] ([MaAD], [HoAD], [TenAD], [UsernameAD], [GioiTinh], [DiaChi], [AnhDaiDien], [DienThoai], [NgaySinh]) VALUES (3, N'Phùng', N'Vĩnh Đức', N'ducphung', N'M', N'Nha Trang', N'/images/ducphung.png', N'0326246343', CAST(N'2000-01-31' AS Date))
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[GioHang] ON 

INSERT [dbo].[GioHang] ([MaGH], [MaKH], [MaSach], [SoLuong], [Thoigian], [ThanhTien], [MaDH]) VALUES (24, 1, 50, 3, CAST(N'2020-12-15T17:32:38.253' AS DateTime), 60000, 7)
INSERT [dbo].[GioHang] ([MaGH], [MaKH], [MaSach], [SoLuong], [Thoigian], [ThanhTien], [MaDH]) VALUES (25, 10, 4, 1, CAST(N'2020-12-15T17:34:08.853' AS DateTime), 20000, 8)
INSERT [dbo].[GioHang] ([MaGH], [MaKH], [MaSach], [SoLuong], [Thoigian], [ThanhTien], [MaDH]) VALUES (26, 10, 3, 1, CAST(N'2020-12-15T17:34:12.023' AS DateTime), 20000, 8)
INSERT [dbo].[GioHang] ([MaGH], [MaKH], [MaSach], [SoLuong], [Thoigian], [ThanhTien], [MaDH]) VALUES (27, 1, 3, 1, CAST(N'2020-12-15T22:22:15.783' AS DateTime), 20000, NULL)
SET IDENTITY_INSERT [dbo].[GioHang] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayLapHD], [TongTien], [TenKhach], [SDTDatHang], [EmailXacNhan], [DiaChiNhanHang], [GiamGia], [TongThanhToan], [TrangThai], [NgayNhanHang]) VALUES (7, 1, CAST(N'2020-12-15T17:32:46.527' AS DateTime), 54000, N'Phạm Nhật Bình', N'0316848645', N'binh@gmail.com', N'Ho Chi Minh', 10, 69000, N'Đã giao hàng', CAST(N'2020-12-20' AS Date))
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayLapHD], [TongTien], [TenKhach], [SDTDatHang], [EmailXacNhan], [DiaChiNhanHang], [GiamGia], [TongThanhToan], [TrangThai], [NgayNhanHang]) VALUES (8, 10, CAST(N'2020-12-15T17:34:39.110' AS DateTime), 39200, N'Nguyễn Khoa Đảnh', N'0111222222', N'danh@gmail.com', N'Bà Rịa', 2, 54200, N'Đã nhận đơn', CAST(N'2020-12-20' AS Date))
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [UsernameKH], [GioiTinh], [DiaChi], [AnhDaiDien], [DienThoai], [NgaySinh], [GiamGia], [SoLanHuyDon]) VALUES (1, N'Phạm Nhật', N'Bình', N'binhpham', N'M', N'Ho Chi Minh', N'/images/User/binhpham.png', N'0316848645', CAST(N'2000-05-26' AS Date), 10, 3)
INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [UsernameKH], [GioiTinh], [DiaChi], [AnhDaiDien], [DienThoai], [NgaySinh], [GiamGia], [SoLanHuyDon]) VALUES (7, N'Bùi Trung', N'Hiếu', N'hieubui', N'M', N'Ho Chi Minh', N'/images/User/hieubui.png', N'0111111111', CAST(N'2000-06-26' AS Date), 10, 0)
INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [UsernameKH], [GioiTinh], [DiaChi], [AnhDaiDien], [DienThoai], [NgaySinh], [GiamGia], [SoLanHuyDon]) VALUES (8, N'Đỗ Đức', N'Anh', N'anhdo', N'M', N'Ho Chi Minh', N'/images/avatar_icon.png', N'0111222222', CAST(N'2000-01-01' AS Date), 10, 0)
INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [UsernameKH], [GioiTinh], [DiaChi], [AnhDaiDien], [DienThoai], [NgaySinh], [GiamGia], [SoLanHuyDon]) VALUES (10, N'Nguyễn Khoa', N'Đảnh', N'danhnguyen', N'M', N'Bà Rịa', N'/images/User/danhnguyen.png', N'0111222222', CAST(N'2000-12-13' AS Date), 2, 0)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
INSERT [dbo].[LoaiSach] ([MaLoai], [TenLoai], [GhiChu]) VALUES (N'CTPL', N'Chính trị pháp luật', NULL)
INSERT [dbo].[LoaiSach] ([MaLoai], [TenLoai], [GhiChu]) VALUES (N'GD', N'Giáo dục', NULL)
INSERT [dbo].[LoaiSach] ([MaLoai], [TenLoai], [GhiChu]) VALUES (N'KHCN', N'Khoa học công nghệ', NULL)
INSERT [dbo].[LoaiSach] ([MaLoai], [TenLoai], [GhiChu]) VALUES (N'LS', N'Lịch sử', NULL)
INSERT [dbo].[LoaiSach] ([MaLoai], [TenLoai], [GhiChu]) VALUES (N'SGK', N'Sách giáo khoa', NULL)
INSERT [dbo].[LoaiSach] ([MaLoai], [TenLoai], [GhiChu]) VALUES (N'SK', N'Sức khỏe', NULL)
INSERT [dbo].[LoaiSach] ([MaLoai], [TenLoai], [GhiChu]) VALUES (N'STN', N'Sách thiếu nhi', NULL)
INSERT [dbo].[LoaiSach] ([MaLoai], [TenLoai], [GhiChu]) VALUES (N'TLTG', N'Tâm lý, tâm linh, tôn giáo', NULL)
INSERT [dbo].[LoaiSach] ([MaLoai], [TenLoai], [GhiChu]) VALUES (N'TT', N'Truyện tranh', NULL)
INSERT [dbo].[LoaiSach] ([MaLoai], [TenLoai], [GhiChu]) VALUES (N'TTH', N'Tiểu thuyết', NULL)
INSERT [dbo].[LoaiSach] ([MaLoai], [TenLoai], [GhiChu]) VALUES (N'VHNT', N'Văn học nghệ thuật', NULL)
INSERT [dbo].[LoaiSach] ([MaLoai], [TenLoai], [GhiChu]) VALUES (N'VHXH', N'Văn hóa xã hội', NULL)
GO
SET IDENTITY_INSERT [dbo].[NhaXuatBan] ON 

INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Fax], [Email], [Website]) VALUES (1, N'NXB Kim Đồng', N'55 Quang Trung, Hai Bà Trưng, Hà Nội', N'02439434730', N'02430454065', N'kimdong@hn.vnn.vn', N'http://www.nxbkimdong.com.vn')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Fax], [Email], [Website]) VALUES (2, N'NXB Trẻ', N'161B Lý Chính Thắng, Phường 7, Quận 3, Thành phố Hồ Chí Minh', N'02839317849', N'02838437450', N'hopthubandoc@nxbtre.com.vn', N'http://www.nxbtre.com.vn')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Fax], [Email], [Website]) VALUES (3, N'NXB Tổng hợp TPHCM', N'62 Nguyễn Thị Minh Khai, Phường Đa Kao, Quận 1, TP.HCM', N'02838225340', N'02838222726', N'tonghop@nxbhcm.com.vn', N'http://www.nxbhcm.com.vn')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Fax], [Email], [Website]) VALUES (4, N'NXB Giáo dục', N'81 Trần Hưng Đạo, Hà Nội', N'02438220801', N'02439422010', NULL, N'http://www.nxbgd.vn')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Fax], [Email], [Website]) VALUES (5, N'NXB Lao động', N'175 Giảng Võ, Đống Đa, Hà Nội', N'02438515380', N'02438515381', N'nxblaodong@yahoo.com', N'http://www.nxblaodong.com.vn')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Fax], [Email], [Website]) VALUES (6, N'NXB Thông tin và Truyền thông', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Fax], [Email], [Website]) VALUES (7, N'NXB Giáo dục Việt Nam', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Fax], [Email], [Website]) VALUES (8, N'NXB Phụ nữ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Fax], [Email], [Website]) VALUES (9, N'NXB Lao động xã hội', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Fax], [Email], [Website]) VALUES (10, N'NXB Thanh Niên', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Fax], [Email], [Website]) VALUES (11, N'NXB Thế giới', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Fax], [Email], [Website]) VALUES (12, N'NXB Văn hóa-Văn nghệ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Fax], [Email], [Website]) VALUES (13, N'NXB Hà Nội', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Fax], [Email], [Website]) VALUES (14, N'NXB Văn học', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Fax], [Email], [Website]) VALUES (15, N'Báo Sinh Viên VN - Hoa Học Trò', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Fax], [Email], [Website]) VALUES (16, N'NXB Hội nhà văn', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Fax], [Email], [Website]) VALUES (17, N'NXB Tri thức', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [SDT], [Fax], [Email], [Website]) VALUES (18, N'NXB Đại học Quốc gia TP. HCM', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[NhaXuatBan] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (3, N'Doraemon truyện ngắn (tập 3)', 1, 1, CAST(N'1969-12-01' AS Date), N'TT', 98, 20000, N'/images/SanPham/doraemon-n-3.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (4, N'Doraemon truyện ngắn (tập 4)', 1, 1, CAST(N'1969-12-01' AS Date), N'TT', 99, 20000, N'/images/SanPham/doraemon-n-4.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (6, N'Luật Viễn Thông', 6, 6, CAST(N'2011-01-01' AS Date), N'CTPL', 99, 25000, N'/images/SanPham/luatvienthong.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (7, N'Thực thi luật và chính sách', 7, 6, CAST(N'2010-01-01' AS Date), N'CTPL', 200, 42000, N'/images/SanPham/ttlvcsbvmttVN.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (8, N'Dấu ấn Việt Nam trên Biển Đông', 8, 6, CAST(N'2012-01-01' AS Date), N'CTPL', 50, 56000, N'/images/SanPham/dauanVNtrenbiendong.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (9, N'Những điều cần biết', 9, 6, CAST(N'2012-01-01' AS Date), N'CTPL', 48, 150000, N'/images/SanPham/ndcbvcdcsdvcb.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (10, N'Toán lớp 9 tập 1', 10, 7, CAST(N'2018-02-01' AS Date), N'SGK', 200, 22000, N'/images/SanPham/toan9tap1.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (11, N'Toán lớp 9 tập 2', 10, 7, CAST(N'2010-01-01' AS Date), N'SGK', 200, 22000, N'/images/SanPham/toan9tap2.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (12, N'Hóa lớp 9', 10, 7, CAST(N'2010-01-01' AS Date), N'SGK', 197, 21000, N'/images/SanPham/hoa9.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (13, N'Vật lý lớp 9', 10, 7, CAST(N'2010-01-01' AS Date), N'SGK', 250, 17000, N'/images/SanPham/vatly9.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (14, N'Cẩm Nang Giáo Dục Giới Tính', 11, 8, CAST(N'2010-01-01' AS Date), N'GD', 150, 128000, N'/images/SanPham/camnanggdgt.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (15, N'11 Lời Khuyên Dành Cho Thế Hệ Trẻ Của Bill Gates', 12, 9, CAST(N'2019-08-02' AS Date), N'GD', 49, 210000, N'/images/SanPham/11loikhuyenbillgates.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (16, N'Giáo trình Thiết bị máy công nghiệp và bảo trì', 13, 5, CAST(N'2019-08-02' AS Date), N'KHCN', 100, 40000, N'/images/SanPham/giaotrinhthietbimaycn.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (17, N'Mô Hình Lấy Bệnh Nhân Làm Trung Tâm', 14, 5, CAST(N'2019-08-02' AS Date), N'KHCN', 60, 70000, N'/images/SanPham/mohinhlaybenhnhanlamtrungtam.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (18, N'Vật Liệu Và Thiết Bị NANO', 15, 3, CAST(N'2019-08-02' AS Date), N'KHCN', 120, 172000, N'/images/SanPham/vatlieuvathietbinano.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (19, N'Khúc Tráng Ca Thành Cổ', 16, 10, CAST(N'2017-10-01' AS Date), N'LS', 40, 122000, N'/images/SanPham/khuctrangcathanhco.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (20, N'Vua Gia Long', 17, 11, CAST(N'2019-01-01' AS Date), N'LS', 20, 250000, N'/images/SanPham/vuagialong.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (21, N'Những Sự Kiện Lịch Sử Việt Nam Tiêu Biểu Thế Kỷ XX', 18, 12, CAST(N'2019-01-01' AS Date), N'LS', 70, 200000, N'/images/SanPham/nhungsukienlsvntkxx.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (22, N'Lịch Sử Việt Nam Từ Nguồn Gốc Đến Cuối Thế Kỷ XIX', 19, 13, CAST(N'2019-01-01' AS Date), N'LS', 60, 310000, N'/images/SanPham/lsvntngdcuoitkxix.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (23, N'Nhân tố Enzyme - Phương Thức Sống Lành Mạnh', 20, 11, CAST(N'2019-01-01' AS Date), N'SK', 50, 166000, N'/images/SanPham/nhantoenzyme.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (24, N'Suối Nguồn Tươi Trẻ', 21, 3, CAST(N'2019-01-01' AS Date), N'SK', 50, 111000, N'/images/SanPham/suoinguontuoitre.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (25, N'Ăn Lành Sống Mạnh', 22, 8, CAST(N'2016-02-01' AS Date), N'SK', 52, 127000, N'/images/SanPham/anlanhsongmanh.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (26, N'Tớ Là Mèo Pusheen', 23, 1, CAST(N'2019-01-01' AS Date), N'TT', 199, 27000, N'/images/SanPham/tolameopusheen.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (27, N'Shin - Cậu Bé Bút Chì Tập 23', 24, 1, CAST(N'2019-01-01' AS Date), N'TT', 100, 20000, N'/images/SanPham/shin-ngan-23.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (28, N'Dế Mèn Phiêu Lưu Ký', 25, 1, CAST(N'2019-01-01' AS Date), N'STN', 60, 42000, N'/images/SanPham/demenphieuluuky.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (29, N'Những Đòn Tâm Lý Trong Thuyết Phục', 26, 5, CAST(N'2019-01-01' AS Date), N'TLTG', 50, 110000, N'/images/SanPham/nhungdontamlytrongthuyetphuc.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (30, N'Hành trình về phương Đông', 27, 11, CAST(N'2019-01-01' AS Date), N'TLTG', 20, 187000, N'/images/SanPham/hanhtrinhvephuongdong.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (31, N'Đường mây qua xứ tuyết', 28, 3, CAST(N'2020-01-01' AS Date), N'TLTG', 40, 125000, N'/images/SanPham/duongmayquaxutuyet.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (32, N'Cổ Học Tinh Hoa', 29, 14, CAST(N'2018-01-01' AS Date), N'TLTG', 25, 95000, N'/images/SanPham/cohoctinhhoa.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (33, N'Lớp Học Mật Ngữ', 30, 15, CAST(N'2020-01-01' AS Date), N'TT', 40, 30000, N'/images/SanPham/lophocmatngu.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (34, N'Nhật Ký Chú Bé Nhút Nhát', 31, 14, CAST(N'2020-01-01' AS Date), N'TT', 50, 80000, N'/images/SanPham/nhatkychubenhutnhat.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (35, N'Hoàng Tử Bé', 32, 16, CAST(N'2019-01-01' AS Date), N'TT', 50, 32000, N'/images/SanPham/hoangtube.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (36, N'Tiếu ngạo giang hồ', 33, 14, CAST(N'2019-01-01' AS Date), N'TTH', 40, 250000, N'/images/SanPham/tieungaogiangho.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (37, N'Ỷ Thiên Đồ Long Ký', 33, 14, CAST(N'2018-01-01' AS Date), N'TTH', 40, 210000, N'/images/SanPham/ythiendolongky.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (38, N'MÉO - TIỂU THUYẾT 12 CHÒM SAO - TẬP 2', 34, 11, CAST(N'2020-01-01' AS Date), N'TTH', 30, 50000, N'/images/SanPham/meo-tieuthuyet12chomsao-2.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (39, N'MÉO - TIỂU THUYẾT 12 CHÒM SAO - TẬP 1', 34, 11, CAST(N'2020-01-01' AS Date), N'TTH', 30, 50000, N'/images/SanPham/meo-tieuthuyet12chomsao-1.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (40, N'8 GIỜ 8 PHÚT 8 GIÂY', 35, 3, CAST(N'2020-01-01' AS Date), N'TTH', 25, 94000, N'/images/SanPham/8gio8phut8giay.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (41, N'Tiếng Gọi Của Hoang Dã ', 36, 14, CAST(N'2019-01-01' AS Date), N'VHNT', 40, 115000, N'/images/SanPham/tienggoicuahoangda.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (42, N'Nanh Trắng', 36, 14, CAST(N'2019-01-01' AS Date), N'VHNT', 29, 150000, N'/images/SanPham/nanhtrang.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (43, N'NHỮNG CON CHIM ẨN MÌNH CHỜ CHẾT', 37, 14, CAST(N'2018-01-01' AS Date), N'VHNT', 30, 127000, N'/images/SanPham/nhungconchimanminhchochet.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (44, N'HỒI ỨC MỘT NGÀY KHÁC', 38, 14, CAST(N'2019-01-01' AS Date), N'VHNT', 35, 86000, N'/images/SanPham/hoiucmotngaykhac.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (45, N'Vàng son trên giấy gấm', 39, 11, CAST(N'2019-01-01' AS Date), N'VHXH', 40, 77000, N'/images/SanPham/vangsontrengiaygam.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (46, N'Xã hội Việt Nam', 40, 17, CAST(N'2016-01-01' AS Date), N'VHXH', 30, 59000, N'/images/SanPham/xahoivietnam.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (47, N'Tìm trong di sản văn hóa phương Nam', 41, 12, CAST(N'2016-01-01' AS Date), N'VHXH', 20, 84000, N'/images/SanPham/timtrongdisanvhphuongnam.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (48, N'Di dân trẻ tại Thành phố Hồ Chí Minh', 42, 18, CAST(N'2016-01-01' AS Date), N'VHXH', 60, 72000, N'/images/SanPham/didantretaitphcm.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (49, N'Doraemon truyện ngắn (tập 1)', 1, 1, CAST(N'1969-12-01' AS Date), N'TT', 96, 20000, N'/images/SanPham/doraemon-n-1.png')
INSERT [dbo].[SanPham] ([MaSach], [TuaSach], [TacGia], [NhaXuatBan], [NgayXuatBan], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (50, N'Doraemon truyện ngắn (tập 2)', 1, 1, CAST(N'1969-12-01' AS Date), N'TT', 94, 20000, N'/images/SanPham/doraemon-n-2.png')
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[TacGia] ON 

INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (1, N'Fujiko Fujio', CAST(N'1933-12-01' AS Date), N'Nhật Bản')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (2, N'Aoyama Yoshimasa', CAST(N'1963-06-21' AS Date), N'Nhật Bản')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (3, N'Nguyễn Nhật Ánh', CAST(N'1955-05-07' AS Date), N'Việt Nam')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (4, N'Trang Hạ', CAST(N'1975-11-30' AS Date), N'Việt Nam')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (5, N'Xuân Diệu', CAST(N'1916-02-02' AS Date), N'Việt Nam')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (6, N'Bộ Thông tin và Truyền thông', NULL, N'Việt Nam')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (7, N'PGS. TS. Nguyễn Đức Khiển – KS. Phạm Văn Đức', NULL, N'Việt Nam')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (8, N'TS. Trần Công Trục', NULL, N'Việt Nam')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (9, N'TS. Nguyễn An Tiêm', NULL, N'Việt Nam')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (10, N'Bộ giáo dục và đào tạo', NULL, N'Việt Nam')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (11, N'ThS-BS-Nguyễn Lan Hải', NULL, N'Việt Nam')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (12, N'Nguyễn Gia Linh', NULL, N'Việt Nam')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (13, N'Tạ Thị Ngọc Dung', NULL, N'Việt Nam')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (14, N'Charles Kenney', NULL, N'Hoa Kỳ')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (15, N'Trương Văn Tân', NULL, N'Việt Nam')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (16, N'Đình Phan', NULL, N'Việt Nam')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (17, N'Marcel Gaultier', NULL, N'Canada')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (18, N'Nguyễn Ngọc Thanh', NULL, N'Việt Nam')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (19, N'Đào Duy Anh', NULL, N'Việt Nam')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (20, N'Hiromi Shinya', NULL, N'Nhật Bản')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (21, N' Peter Kelder', NULL, N'Hà Lan')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (22, N'Dr Sarah Brewer', NULL, N'Vương Quốc Anh')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (23, N'Claire Belton', NULL, N'Hoa Kỳ')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (24, N'Yoshito Usui', NULL, N'Nhật Bản')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (25, N'Tô Hoài', NULL, N'Việt Nam')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (26, N'Robert B. Cialdini ', NULL, N'Hoa Kỳ')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (27, N'Baird T. Spalding', NULL, N'Hoa Kỳ')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (28, N'Nguyên Phong', NULL, N'Việt Nam')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (29, N'Ôn Như Nguyễn Văn Ngọc', NULL, N'Việt Nam')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (30, N'B.R.O Group', NULL, N'Việt Nam')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (31, N'
Jeff Kinney

', NULL, N'Hoa Kỳ')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (32, N'Antoine De Saint-Exupéry', NULL, N'Pháp')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (33, N'
Kim Dung
', NULL, N'Trung Quốc')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (34, N'
Tiên Sắc Xám
', NULL, N'Việt Nam')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (35, N'
Valentine Vũ
', NULL, N'Việt Nam')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (36, N'
Jack London
', NULL, N'Hoa Kỳ')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (37, N'
Colleen Mccullough
', NULL, N'Úc')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (38, N'
Harold Robbins
', NULL, N'Hoa Kỳ')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (39, N'Nguyễn Xuân Diện', NULL, N'Việt Nam')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (40, N'Lương Đức Thiệp', NULL, N'Việt Nam')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (41, N'Nguyễn Đông Triều', NULL, N'Việt Nam')
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [NgaySinh], [QuocTich]) VALUES (42, N'Nguyễn Thị Hồng Xoan ', NULL, N'Việt Nam')
SET IDENTITY_INSERT [dbo].[TacGia] OFF
GO
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Role], [Email], [Latest_Login], [block]) VALUES (N'anhdo', N'123', N'user', N'anh@gmail.com', CAST(N'2020-12-14T20:15:57.047' AS DateTime), 0)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Role], [Email], [Latest_Login], [block]) VALUES (N'binhpham', N'123', N'user', N'binh@gmail.com', CAST(N'2020-12-15T22:22:07.433' AS DateTime), 0)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Role], [Email], [Latest_Login], [block]) VALUES (N'chienphung', N'123', N'user', N'chien@gmail.com', CAST(N'2020-12-09T15:26:46.430' AS DateTime), 0)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Role], [Email], [Latest_Login], [block]) VALUES (N'danhnguyen', N'123', N'user', N'danh@gmail.com', CAST(N'2020-12-15T17:34:03.127' AS DateTime), 0)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Role], [Email], [Latest_Login], [block]) VALUES (N'ducphung', N'1', N'admin', N'duc@gmail.com', CAST(N'2020-12-15T19:29:14.317' AS DateTime), 0)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Role], [Email], [Latest_Login], [block]) VALUES (N'hieubui', N'123', N'user', N'hieu@gmail.com', CAST(N'2020-12-15T15:43:11.050' AS DateTime), 0)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Role], [Email], [Latest_Login], [block]) VALUES (N'tamhuynh', N'1', N'admin', N'tam@gmail.com', CAST(N'2020-12-15T21:55:44.083' AS DateTime), 0)
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_TaiKhoan] FOREIGN KEY([UsernameAD])
REFERENCES [dbo].[TaiKhoan] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_TaiKhoan]
GO
ALTER TABLE [dbo].[DanhGiaSach]  WITH CHECK ADD  CONSTRAINT [FK_DanhGiaSach_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DanhGiaSach] CHECK CONSTRAINT [FK_DanhGiaSach_KhachHang]
GO
ALTER TABLE [dbo].[DanhGiaSach]  WITH CHECK ADD  CONSTRAINT [FK_DanhGiaSach_SanPham] FOREIGN KEY([MaSach])
REFERENCES [dbo].[SanPham] ([MaSach])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DanhGiaSach] CHECK CONSTRAINT [FK_DanhGiaSach_SanPham]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_HoaDon1] FOREIGN KEY([MaDH])
REFERENCES [dbo].[HoaDon] ([MaHD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_HoaDon1]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_KhachHang]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_SanPham] FOREIGN KEY([MaSach])
REFERENCES [dbo].[SanPham] ([MaSach])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_SanPham]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_TaiKhoan] FOREIGN KEY([UsernameKH])
REFERENCES [dbo].[TaiKhoan] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_TaiKhoan]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSach] FOREIGN KEY([TheLoai])
REFERENCES [dbo].[LoaiSach] ([MaLoai])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSach]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaXuatBan] FOREIGN KEY([NhaXuatBan])
REFERENCES [dbo].[NhaXuatBan] ([MaNXB])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaXuatBan]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_TacGia] FOREIGN KEY([TacGia])
REFERENCES [dbo].[TacGia] ([MaTacGia])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_TacGia]
GO
USE [master]
GO
ALTER DATABASE [NHASACH] SET  READ_WRITE 
GO
