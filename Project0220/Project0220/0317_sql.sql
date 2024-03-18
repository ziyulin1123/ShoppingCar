USE [master]
GO
/****** Object:  Database [ECommerceDB]    Script Date: 2024/3/17 下午 07:14:52 ******/
CREATE DATABASE [ECommerceDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ECommerceDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ECommerceDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ECommerceDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ECommerceDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ECommerceDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ECommerceDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ECommerceDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ECommerceDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ECommerceDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ECommerceDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ECommerceDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ECommerceDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ECommerceDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ECommerceDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ECommerceDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ECommerceDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ECommerceDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ECommerceDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ECommerceDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ECommerceDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ECommerceDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ECommerceDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ECommerceDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ECommerceDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ECommerceDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ECommerceDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ECommerceDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ECommerceDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ECommerceDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ECommerceDB] SET  MULTI_USER 
GO
ALTER DATABASE [ECommerceDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ECommerceDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ECommerceDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ECommerceDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ECommerceDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ECommerceDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ECommerceDB', N'ON'
GO
ALTER DATABASE [ECommerceDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [ECommerceDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ECommerceDB]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2024/3/17 下午 07:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 2024/3/17 下午 07:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[Gender] [nvarchar](10) NULL,
	[MobilePhoneNumber] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[Address_City] [nvarchar](50) NULL,
	[Address_Dist] [nvarchar](50) NULL,
	[Address] [nvarchar](255) NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Admin] [bit] NULL,
	[Subscribe] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2024/3/17 下午 07:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [int] NULL,
	[Discount] [decimal](3, 2) NULL,
	[Amount]  AS (([Quantity]*[UnitPrice])*[Discount]),
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2024/3/17 下午 07:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[OrderDate] [datetime] NULL,
	[TotalAmount] [int] NULL,
	[PaymentMethod] [nvarchar](50) NOT NULL,
	[Carrier] [nvarchar](50) NOT NULL,
	[ShippingDate] [date] NULL,
	[PostalCode] [nvarchar](10) NOT NULL,
	[ShippingAddress] [nvarchar](100) NOT NULL,
	[Consignee] [nvarchar](100) NOT NULL,
	[ContactPhone] [nvarchar](20) NOT NULL,
	[Status] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2024/3/17 下午 07:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[UnitPrice] [int] NULL,
	[UnitInStock] [int] NULL,
	[Image1] [nvarchar](100) NOT NULL,
	[Image2] [nvarchar](100) NULL,
	[Image3] [nvarchar](100) NULL,
	[Image4] [nvarchar](100) NULL,
	[Color1] [nvarchar](20) NOT NULL,
	[Color2] [nvarchar](20) NULL,
	[Length] [nvarchar](10) NULL,
	[Width] [nvarchar](10) NULL,
	[Height] [nvarchar](10) NULL,
	[Description] [nvarchar](200) NULL,
	[SpecialZoneType] [nvarchar](20) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 2024/3/17 下午 07:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](100) NULL,
	[ContactName] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrackLists]    Script Date: 2024/3/17 下午 07:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrackLists](
	[TrackID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TrackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (1, N'沙發/桌子/椅子')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (2, N'五斗櫃/鞋櫃/書櫃/邊桌')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (3, N'床具')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (4, N'照明/家居紡織品/家居裝飾')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (5, N'衛浴用品')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DateOfBirth], [Gender], [MobilePhoneNumber], [Email], [Address_City], [Address_Dist], [Address], [Username], [Password], [Admin], [Subscribe]) VALUES (1, N'湯子同', CAST(N'1990-01-01' AS Date), N'男', N'0912345678', N'zhangsan@gmail.com', N'台北市', N'大安區', N'信義路150號', N'zhangsan', N'abc123', 1, 0)
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DateOfBirth], [Gender], [MobilePhoneNumber], [Email], [Address_City], [Address_Dist], [Address], [Username], [Password], [Admin], [Subscribe]) VALUES (2, N'李珊妮', CAST(N'1985-02-15' AS Date), N'女', N'0923456789', N'a0983984816@gmail.com', N'新北市', N'中和區', N'中正路200號', N'lisi', N'def456', 0, 1)
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DateOfBirth], [Gender], [MobilePhoneNumber], [Email], [Address_City], [Address_Dist], [Address], [Username], [Password], [Admin], [Subscribe]) VALUES (3, N'王小虎', CAST(N'1995-03-20' AS Date), N'男', N'0934567891', N'wangwu@gmail.com', N'桃園市', N'龜山區', N'文化路300號', N'wangwu', N'ghi789', 0, 1)
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DateOfBirth], [Gender], [MobilePhoneNumber], [Email], [Address_City], [Address_Dist], [Address], [Username], [Password], [Admin], [Subscribe]) VALUES (4, N'張三', CAST(N'1988-04-25' AS Date), N'男', N'0945678912', N'zhangsan2@gmail.com', N'新竹市', N'東區', N'光復路400號', N'zhangsan2', N'jkl012', 0, 1)
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DateOfBirth], [Gender], [MobilePhoneNumber], [Email], [Address_City], [Address_Dist], [Address], [Username], [Password], [Admin], [Subscribe]) VALUES (5, N'劉芳', CAST(N'1992-05-30' AS Date), N'女', N'0956789123', N'liufang@gmail.com', N'台中市', N'西屯區', N'忠明路53號', N'liufang', N'mno345', 0, 1)
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DateOfBirth], [Gender], [MobilePhoneNumber], [Email], [Address_City], [Address_Dist], [Address], [Username], [Password], [Admin], [Subscribe]) VALUES (6, N'陳大雄', CAST(N'1983-06-05' AS Date), N'男', N'0967891234', N'chendaxiong@gmail.com', N'高雄市', N'鹽埕區', N'愛國路45號', N'chendaxiong', N'pqr678', 0, 1)
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DateOfBirth], [Gender], [MobilePhoneNumber], [Email], [Address_City], [Address_Dist], [Address], [Username], [Password], [Admin], [Subscribe]) VALUES (7, N'吳美美', CAST(N'1998-07-10' AS Date), N'女', N'0978912345', N'wumeimei@gmail.com', N'基隆市', N'七堵區', N'德五路100號', N'wumeimei', N'stu901', 0, 1)
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DateOfBirth], [Gender], [MobilePhoneNumber], [Email], [Address_City], [Address_Dist], [Address], [Username], [Password], [Admin], [Subscribe]) VALUES (8, N'黃小龍', CAST(N'1980-08-15' AS Date), N'男', N'0989123456', N'huangxiaolong@gmail.com', N'新竹市', N'北區', N'中山路80號', N'huangxiaolong', N'vwx234', 0, 1)
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DateOfBirth], [Gender], [MobilePhoneNumber], [Email], [Address_City], [Address_Dist], [Address], [Username], [Password], [Admin], [Subscribe]) VALUES (9, N'鄭美玲', CAST(N'1989-09-20' AS Date), N'女', N'0991234567', N'zhengmeiling@gmail.com', N'彰化市', N'南區', N'公園路99號', N'zhengmeiling', N'yz901', 0, 1)
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [DateOfBirth], [Gender], [MobilePhoneNumber], [Email], [Address_City], [Address_Dist], [Address], [Username], [Password], [Admin], [Subscribe]) VALUES (10, N'林小明', CAST(N'1993-10-25' AS Date), N'男', N'0912345678', N'linxiaoming@gmail.com', N'嘉義市', N'西區', N'中正路102號', N'linxiaoming', N'234abc', 0, 1)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (1, 1, 2, 2, 7490, CAST(1.00 AS Decimal(3, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (2, 1, 3, 1, 12900, CAST(1.00 AS Decimal(3, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (3, 1, 4, 3, 38000, CAST(1.00 AS Decimal(3, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (4, 2, 1, 1, 29900, CAST(1.00 AS Decimal(3, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (5, 2, 3, 1, 12900, CAST(1.00 AS Decimal(3, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (6, 2, 6, 2, 33000, CAST(1.00 AS Decimal(3, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (7, 2, 8, 3, 399, CAST(1.00 AS Decimal(3, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (8, 2, 7, 2, 990, CAST(1.00 AS Decimal(3, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (9, 3, 7, 1, 990, CAST(1.00 AS Decimal(3, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (10, 3, 8, 4, 399, CAST(1.00 AS Decimal(3, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (11, 4, 1, 6, 29900, CAST(1.00 AS Decimal(3, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (12, 4, 5, 8, 4500, CAST(1.00 AS Decimal(3, 2)))
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [TotalAmount], [PaymentMethod], [Carrier], [ShippingDate], [PostalCode], [ShippingAddress], [Consignee], [ContactPhone], [Status]) VALUES (1, 7, CAST(N'2024-03-07T00:09:00.000' AS DateTime), 141880, N'信用卡', N'大榮貨運', CAST(N'2024-03-09' AS Date), N'206', N'基隆市七堵區德五路100號', N'吳美美', N'0978912345', N'已簽收')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [TotalAmount], [PaymentMethod], [Carrier], [ShippingDate], [PostalCode], [ShippingAddress], [Consignee], [ContactPhone], [Status]) VALUES (2, 4, CAST(N'2024-03-09T14:11:00.000' AS DateTime), 111977, N'轉帳', N'新竹貨運', CAST(N'2024-03-11' AS Date), N'360', N'苗栗縣苗栗市中正路九段900號', N'許婷婷', N'0990123455', N'已簽收')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [TotalAmount], [PaymentMethod], [Carrier], [ShippingDate], [PostalCode], [ShippingAddress], [Consignee], [ContactPhone], [Status]) VALUES (3, 2, CAST(N'2024-03-11T06:14:00.000' AS DateTime), 2586, N'信用卡', N'公司配送', CAST(N'2024-03-12' AS Date), N'407', N'台中市西屯區惠來路三段300號', N'林志偉', N'0934567890', N'已簽收')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [TotalAmount], [PaymentMethod], [Carrier], [ShippingDate], [PostalCode], [ShippingAddress], [Consignee], [ContactPhone], [Status]) VALUES (4, 4, CAST(N'2024-03-12T21:16:00.000' AS DateTime), 215400, N'轉帳', N'新竹貨運', CAST(N'2024-03-15' AS Date), N'300', N'新竹市東區光復路400號', N'張三', N'0945678912', N'配送中')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [UnitPrice], [UnitInStock], [Image1], [Image2], [Image3], [Image4], [Color1], [Color2], [Length], [Width], [Height], [Description], [SpecialZoneType], [CreatedAt]) VALUES (1, N'ÄPPLARYD三人座沙發', 1, 1, 29900, 10, N'A00011.jpg', N'A00011-1.jpg', N'A00012.jpg', NULL, N'深藍色', N'紅棕色', N'231', N'93', N'47', N'這款沙發具有輕鬆時尚和簡潔的外觀，配有剪裁精美的軟布套和舒適的筒型彈簧。纖細的椅腳強化了穩固透氣外觀

簡潔和諧的線條與富有表現力的外型相互結合，在沙發上放上靠墊和萬用毯，讓它變得更個性化

ÄPPLARYD沙發超級舒適，配有柔軟的沙發套和蓬鬆的靠枕，以及可貼合身體和承托各種姿勢的筒型彈簧，無論是坐著或是放鬆身軀躺下來也很舒適

備有不同尺寸和外形，大、小空間都合適。', N'新品', CAST(N'2024-03-06T09:16:55.627' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [UnitPrice], [UnitInStock], [Image1], [Image2], [Image3], [Image4], [Color1], [Color2], [Length], [Width], [Height], [Description], [SpecialZoneType], [CreatedAt]) VALUES (2, N'單人沙發床', 1, 1, 7490, 10, N'A00100.jpg', NULL, NULL, NULL, N'深藍色', NULL, N'80', N'100', N'87', NULL, N'新品', CAST(N'2024-03-06T11:37:15.997' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [UnitPrice], [UnitInStock], [Image1], [Image2], [Image3], [Image4], [Color1], [Color2], [Length], [Width], [Height], [Description], [SpecialZoneType], [CreatedAt]) VALUES (3, N'旋轉椅', 1, 1, 12900, 10, N'A00300.jpg', NULL, NULL, NULL, N'金棕色', NULL, N'66', N'99', N'892', NULL, N'新品', CAST(N'2024-03-06T11:37:15.997' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [UnitPrice], [UnitInStock], [Image1], [Image2], [Image3], [Image4], [Color1], [Color2], [Length], [Width], [Height], [Description], [SpecialZoneType], [CreatedAt]) VALUES (4, N'中世紀風格五斗櫃', 2, 2, 38000, 10, N'B00010.jpg', N'B00010-1.jpg', N'B00010-2.jpg', NULL, N'棕色', NULL, N'153', N'51', N'91', NULL, N'四月專屬', CAST(N'2024-03-06T13:36:28.663' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [UnitPrice], [UnitInStock], [Image1], [Image2], [Image3], [Image4], [Color1], [Color2], [Length], [Width], [Height], [Description], [SpecialZoneType], [CreatedAt]) VALUES (5, N'胡桃木實木床頭櫃', 2, 2, 4500, 10, N'B00290.jpg', N'B00290-2.jpg', N'B00290-3.jpg', NULL, N'棕色', NULL, N'35', N'42', N'52', NULL, N'新品', CAST(N'2024-03-06T13:36:28.663' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [UnitPrice], [UnitInStock], [Image1], [Image2], [Image3], [Image4], [Color1], [Color2], [Length], [Width], [Height], [Description], [SpecialZoneType], [CreatedAt]) VALUES (6, N'四門衣櫃組合', 2, 2, 33000, 10, N'B00330.jpg', NULL, NULL, NULL, N'白色', NULL, N'198', N'65', N'240', NULL, N'新品', CAST(N'2024-03-06T13:45:20.393' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [UnitPrice], [UnitInStock], [Image1], [Image2], [Image3], [Image4], [Color1], [Color2], [Length], [Width], [Height], [Description], [SpecialZoneType], [CreatedAt]) VALUES (7, N'透明玻璃吊燈', 4, 4, 990, 10, N'D00080.jpg', NULL, NULL, NULL, N'灰色', NULL, N'22', NULL, N'32', NULL, N'新品', CAST(N'2024-03-06T13:59:11.007' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [UnitPrice], [UnitInStock], [Image1], [Image2], [Image3], [Image4], [Color1], [Color2], [Length], [Width], [Height], [Description], [SpecialZoneType], [CreatedAt]) VALUES (8, N'靠枕套', 4, 4, 399, 10, N'D00442.jpg', NULL, NULL, NULL, N'米灰色', NULL, N'50', N'50', NULL, NULL, N'新品', CAST(N'2024-03-06T14:03:29.560' AS DateTime))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Phone], [Email]) VALUES (1, N'家居裝飾有限公司', N'陳明杰', N'02-12345678', N'chen@example.com')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Phone], [Email]) VALUES (2, N'現代家具製造廠', N'王志豪', N'03-23456789', N'wang@example.com')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Phone], [Email]) VALUES (3, N'家具天地有限公司', N'張佩琪', N'04-34567890', N'zhang@example.com')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Phone], [Email]) VALUES (4, N'家居樂園裝飾公司', N'李雅婷', N'05-45678901', N'li@example.com')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Phone], [Email]) VALUES (5, N'家佳精品有限公司', N'林慧娟', N'06-56789012', N'lin@example.com')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__536C85E47BFF5D0B]    Script Date: 2024/3/17 下午 07:14:53 ******/
ALTER TABLE [dbo].[Customers] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[TrackLists]  WITH CHECK ADD  CONSTRAINT [FK_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[TrackLists] CHECK CONSTRAINT [FK_CustomerID]
GO
ALTER TABLE [dbo].[TrackLists]  WITH CHECK ADD  CONSTRAINT [FK_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[TrackLists] CHECK CONSTRAINT [FK_ProductID]
GO
USE [master]
GO
ALTER DATABASE [ECommerceDB] SET  READ_WRITE 
GO
