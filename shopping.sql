USE [master]
GO
/****** Object:  Database [Shopping]    Script Date: 4/5/2023 1:40:47 AM ******/
CREATE DATABASE [Shopping]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Shopping', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Shopping.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Shopping_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Shopping_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Shopping] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shopping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Shopping] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Shopping] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Shopping] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Shopping] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Shopping] SET ARITHABORT OFF 
GO
ALTER DATABASE [Shopping] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Shopping] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Shopping] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Shopping] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Shopping] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Shopping] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Shopping] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Shopping] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Shopping] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Shopping] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Shopping] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Shopping] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Shopping] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Shopping] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Shopping] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Shopping] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Shopping] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Shopping] SET RECOVERY FULL 
GO
ALTER DATABASE [Shopping] SET  MULTI_USER 
GO
ALTER DATABASE [Shopping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Shopping] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Shopping] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Shopping] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Shopping] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Shopping] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Shopping', N'ON'
GO
ALTER DATABASE [Shopping] SET QUERY_STORE = ON
GO
ALTER DATABASE [Shopping] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Shopping]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 4/5/2023 1:40:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaChiTietDh] [int] IDENTITY(1,1) NOT NULL,
	[GiaTien] [float] NULL,
	[SoLuong] [int] NULL,
	[TrangThai] [bit] NULL,
	[MaDh] [int] NULL,
	[MaSp] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTietDh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhGia]    Script Date: 4/5/2023 1:40:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGia](
	[MaYt] [int] IDENTITY(1,1) NOT NULL,
	[SoSao] [int] NULL,
	[MaSp] [int] NULL,
	[MaKh] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaYt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 4/5/2023 1:40:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDh] [int] IDENTITY(1,1) NOT NULL,
	[DiaChi] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[NgayMua] [varchar](255) NULL,
	[SoDienThoai] [varchar](255) NULL,
	[TenKh] [varchar](255) NULL,
	[TongTien] [float] NULL,
	[TrangThai] [bit] NULL,
	[MaKh] [int] NULL,
	[MaTt] [int] NULL,
	[MaVc] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 4/5/2023 1:40:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKh] [int] IDENTITY(1,1) NOT NULL,
	[TenKh] [nvarchar](100) NULL,
	[TenTk] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[SoDienThoai] [int] NULL,
	[Email] [nvarchar](100) NULL,
	[TrangThai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 4/5/2023 1:40:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNcc] [int] IDENTITY(1,1) NOT NULL,
	[TenNcc] [nvarchar](50) NULL,
	[TrangThai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNcc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhomSanPham]    Script Date: 4/5/2023 1:40:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomSanPham](
	[MaNhomSp] [int] IDENTITY(1,1) NOT NULL,
	[TenNhomSp] [nvarchar](100) NULL,
	[TrangThai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhomSp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuangCao]    Script Date: 4/5/2023 1:40:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuangCao](
	[MaQc] [int] NOT NULL,
	[Anh] [varchar](255) NULL,
	[Gia] [float] NULL,
	[Mota] [varchar](255) NULL,
	[NhaSanXuat] [varchar](255) NULL,
	[TenQc] [varchar](255) NULL,
	[TrangThai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaQc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuanTri]    Script Date: 4/5/2023 1:40:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuanTri](
	[MaQt] [int] NOT NULL,
	[MatKhau] [varchar](255) NULL,
	[TaiKhoan] [varchar](255) NULL,
	[TenQt] [varchar](255) NULL,
	[TrangThai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaQt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 4/5/2023 1:40:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSp] [int] IDENTITY(1,1) NOT NULL,
	[TenSp] [nvarchar](100) NULL,
	[Anh] [nvarchar](max) NULL,
	[Gia] [float] NULL,
	[MaNcc] [int] NULL,
	[Mota] [nvarchar](max) NULL,
	[TrangThai] [bit] NULL,
	[MaNhomSp] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThanhToan]    Script Date: 4/5/2023 1:40:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhToan](
	[MaTt] [int] NOT NULL,
	[Mota] [varchar](255) NULL,
	[TenTt] [varchar](255) NULL,
	[TrangThai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UaThich]    Script Date: 4/5/2023 1:40:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UaThich](
	[MaUt] [int] IDENTITY(1,1) NOT NULL,
	[MaKh] [int] NULL,
	[MaSp] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaUt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VanChuyen]    Script Date: 4/5/2023 1:40:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VanChuyen](
	[MaVc] [int] NOT NULL,
	[Gia] [float] NULL,
	[Mota] [varchar](255) NULL,
	[TenVc] [varchar](255) NULL,
	[TrangThai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaVc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKh], [TenKh], [TenTk], [MatKhau], [DiaChi], [SoDienThoai], [Email], [TrangThai]) VALUES (6, N'Khanh Bang', N'khbang12', N'khang123', N'quan 9', 912323123, N'phamkhanhbang1592002@gmail.com', 1)
INSERT [dbo].[KhachHang] ([MaKh], [TenKh], [TenTk], [MatKhau], [DiaChi], [SoDienThoai], [Email], [TrangThai]) VALUES (7, N'Khánh Băng', N'khbang159', N'khbang159', N'quận 9', 865486537, N'phamkhanhbnag159@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([MaNcc], [TenNcc], [TrangThai]) VALUES (1, N'Kim đồng', 1)
INSERT [dbo].[NhaCungCap] ([MaNcc], [TenNcc], [TrangThai]) VALUES (2, N'Xã việt', 1)
INSERT [dbo].[NhaCungCap] ([MaNcc], [TenNcc], [TrangThai]) VALUES (3, N'Hòa binh', 1)
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
GO
SET IDENTITY_INSERT [dbo].[NhomSanPham] ON 

INSERT [dbo].[NhomSanPham] ([MaNhomSp], [TenNhomSp], [TrangThai]) VALUES (1, N'Gấu Teddy', 1)
INSERT [dbo].[NhomSanPham] ([MaNhomSp], [TenNhomSp], [TrangThai]) VALUES (2, N'Gấu Bông Cặp', 1)
INSERT [dbo].[NhomSanPham] ([MaNhomSp], [TenNhomSp], [TrangThai]) VALUES (3, N'Gấu Bông Tốt Nghiệp', 1)
SET IDENTITY_INSERT [dbo].[NhomSanPham] OFF
GO
INSERT [dbo].[QuangCao] ([MaQc], [Anh], [Gia], [Mota], [NhaSanXuat], [TenQc], [TrangThai]) VALUES (1, N'https://teddy.vn/wp-content/uploads/2022/08/Banner-teddy-1.jpg', 200000, N'Teddy with love', N'Kim Dong', N'Teddy with love', 1)
INSERT [dbo].[QuangCao] ([MaQc], [Anh], [Gia], [Mota], [NhaSanXuat], [TenQc], [TrangThai]) VALUES (2, N'https://teddy.vn/wp-content/uploads/2022/08/Banner-teddy-2.jpg', 300000, N'teddy bears come to your home', N'Kim Dong', N'teddy bears come to your home', 1)
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSp], [TenSp], [Anh], [Gia], [MaNcc], [Mota], [TrangThai], [MaNhomSp]) VALUES (1, N'Gấu Bông Nơ', N'https://shopquatructuyen.com/wp-content/uploads/2019/04/gau-bong-trang-deo-no-4.jpg', 389000, 1, N'...', 1, 1)
INSERT [dbo].[SanPham] ([MaSp], [TenSp], [Anh], [Gia], [MaNcc], [Mota], [TrangThai], [MaNhomSp]) VALUES (2, N'Gấu Bông Bụng Tim', N'http://dienhoaviolet.com/image/gau-bong-cao-cap-mau-mau-nau-bung-tim-love-15788j.jpg', 430000, 1, N'...', 1, 1)
INSERT [dbo].[SanPham] ([MaSp], [TenSp], [Anh], [Gia], [MaNcc], [Mota], [TrangThai], [MaNhomSp]) VALUES (3, N'Gấu Bông Áo Hoodie', N'https://salt.tikicdn.com/ts/product/9d/eb/f4/8b207b785a720822971cdfd58136f140.jpg', 500000, 1, N'...', 1, 1)
INSERT [dbo].[SanPham] ([MaSp], [TenSp], [Anh], [Gia], [MaNcc], [Mota], [TrangThai], [MaNhomSp]) VALUES (4, N'Gấu Bông Áo Len Cao Cấp CHOCO', N'https://hoaviolet.com/image/gau-bong-ao-len-cao-cap-teddy-choco-15781j.jpg', 950000, 1, N'...', 1, 1)
INSERT [dbo].[SanPham] ([MaSp], [TenSp], [Anh], [Gia], [MaNcc], [Mota], [TrangThai], [MaNhomSp]) VALUES (5, N'Gấu Teddy Ôm Tim Hug Me!', N'https://gausaigon.com/wp-content/uploads/2018/01/gau-teddy-long-chi-nau-om-tim-hug-me.jpg.webp', 295000, 1, N'...', 1, 1)
INSERT [dbo].[SanPham] ([MaSp], [TenSp], [Anh], [Gia], [MaNcc], [Mota], [TrangThai], [MaNhomSp]) VALUES (6, N'Gấu Bông Ngực Hồng', N'https://locat.com.vn/hinh-hoa-tuoi/gau-bong/11709_gau-nguc-tim-hong.jpg', 317000, 1, N'...', 1, 1)
INSERT [dbo].[SanPham] ([MaSp], [TenSp], [Anh], [Gia], [MaNcc], [Mota], [TrangThai], [MaNhomSp]) VALUES (7, N'Gấu Bông Ôm Tim Vàng', N'https://thubongthiennga.com/uploads/news/topics/gau-bong-om-tim.jpg', 499000, 2, N'...', 1, 1)
INSERT [dbo].[SanPham] ([MaSp], [TenSp], [Anh], [Gia], [MaNcc], [Mota], [TrangThai], [MaNhomSp]) VALUES (8, N'Gấu Bông Cô Dâu Chú Rể', N'https://lzd-img-global.slatic.net/g/p/07452d12c3494ba3f3cfe028a83bbb4c.jpg_720x720q80.jpg_.webp', 599000, 3, N'...', 1, 2)
INSERT [dbo].[SanPham] ([MaSp], [TenSp], [Anh], [Gia], [MaNcc], [Mota], [TrangThai], [MaNhomSp]) VALUES (9, N'Gấu Bông Cặp Áo Nhung', N'https://hoaviolet.com/image/gau-bong-cap-cao-cap-mau-trang-ao-nhung-hong-15893j.jpg', 300000, 1, N'...', 1, 2)
INSERT [dbo].[SanPham] ([MaSp], [TenSp], [Anh], [Gia], [MaNcc], [Mota], [TrangThai], [MaNhomSp]) VALUES (10, N'Gấu Bông Cô Dâu Chú Rể Đầm Xòe', N'https://hoaviolet.com/image/gau-bong-co-dau-chu-re-dam-xoe-15902j.jpg', 400000, 1, N'...', 1, 2)
INSERT [dbo].[SanPham] ([MaSp], [TenSp], [Anh], [Gia], [MaNcc], [Mota], [TrangThai], [MaNhomSp]) VALUES (11, N'Gấu Bông Cặp Cao Cấp Áo Sọc', N'https://hoaviolet.com/image/gau-bong-cap-cao-cap-mau-trang-ao-soc-15899j.jpg', 399000, 1, N'...', 1, 2)
INSERT [dbo].[SanPham] ([MaSp], [TenSp], [Anh], [Gia], [MaNcc], [Mota], [TrangThai], [MaNhomSp]) VALUES (12, N'Gấu Bông Cặp Trắng Nâu', N'https://hoaviolet.com/image/gau-bong-cap-cao-cap-long-xoan-mau-trangnau-15897j.jpg', 499000, 1, N'...', 1, 2)
INSERT [dbo].[SanPham] ([MaSp], [TenSp], [Anh], [Gia], [MaNcc], [Mota], [TrangThai], [MaNhomSp]) VALUES (13, N'Gấu Bông Tốt Nghiệp Cử Nhân', N'https://salt.tikicdn.com/cache/750x750/ts/product/fa/c7/c1/34004cfb3e0fffb754a2471c8062dbff.jpg.webp', 500000, 2, N'...', 1, 3)
INSERT [dbo].[SanPham] ([MaSp], [TenSp], [Anh], [Gia], [MaNcc], [Mota], [TrangThai], [MaNhomSp]) VALUES (14, N'Gấu Bông Tốt Nghiệp Trắng', N'https://stc.subi.vn/image/w/1/210426/gau-bong-tot-nghiep-1_900x540.jpg', 300000, 2, N'...', 1, 3)
INSERT [dbo].[SanPham] ([MaSp], [TenSp], [Anh], [Gia], [MaNcc], [Mota], [TrangThai], [MaNhomSp]) VALUES (15, N'Gấu Bông Tốt Nghiệp Normal', N'https://stc.subi.vn/image/w/1/210426/gau-bong-tot-nghiep-2_900x540.jpg', 250000, 2, N'...', 1, 3)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_fhsyq8lks6ahebmqn4dlrylcy] FOREIGN KEY([MaDh])
REFERENCES [dbo].[DonHang] ([MaDh])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_fhsyq8lks6ahebmqn4dlrylcy]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_pshkmc5k80pv31mvloksed6vl] FOREIGN KEY([MaSp])
REFERENCES [dbo].[SanPham] ([MaSp])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_pshkmc5k80pv31mvloksed6vl]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD FOREIGN KEY([MaKh])
REFERENCES [dbo].[KhachHang] ([MaKh])
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD FOREIGN KEY([MaSp])
REFERENCES [dbo].[SanPham] ([MaSp])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_gfv87oxxoidkhqo3fqexpo3dh] FOREIGN KEY([MaTt])
REFERENCES [dbo].[ThanhToan] ([MaTt])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_gfv87oxxoidkhqo3fqexpo3dh]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_jtnu9jofx9o3gsd0ka1qjtfq8] FOREIGN KEY([MaVc])
REFERENCES [dbo].[VanChuyen] ([MaVc])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_jtnu9jofx9o3gsd0ka1qjtfq8]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_mfnl6pcljke5321thamxg7pi0] FOREIGN KEY([MaKh])
REFERENCES [dbo].[KhachHang] ([MaKh])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_mfnl6pcljke5321thamxg7pi0]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaNcc])
REFERENCES [dbo].[NhaCungCap] ([MaNcc])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaNhomSp])
REFERENCES [dbo].[NhomSanPham] ([MaNhomSp])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_qlnwjn6iwav3s1xen3tugfiuf] FOREIGN KEY([MaNhomSp])
REFERENCES [dbo].[NhomSanPham] ([MaNhomSp])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_qlnwjn6iwav3s1xen3tugfiuf]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_rryfshknb5yx7y7tq3p8avam2] FOREIGN KEY([MaNcc])
REFERENCES [dbo].[NhaCungCap] ([MaNcc])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_rryfshknb5yx7y7tq3p8avam2]
GO
ALTER TABLE [dbo].[UaThich]  WITH CHECK ADD  CONSTRAINT [FK_kcamex0g8cnhi1tskin8hjfwx] FOREIGN KEY([MaKh])
REFERENCES [dbo].[KhachHang] ([MaKh])
GO
ALTER TABLE [dbo].[UaThich] CHECK CONSTRAINT [FK_kcamex0g8cnhi1tskin8hjfwx]
GO
ALTER TABLE [dbo].[UaThich]  WITH CHECK ADD  CONSTRAINT [FK_rw9g2e1mk95cpovbhqq9u3pbf] FOREIGN KEY([MaSp])
REFERENCES [dbo].[SanPham] ([MaSp])
GO
ALTER TABLE [dbo].[UaThich] CHECK CONSTRAINT [FK_rw9g2e1mk95cpovbhqq9u3pbf]
GO
USE [master]
GO
ALTER DATABASE [Shopping] SET  READ_WRITE 
GO
