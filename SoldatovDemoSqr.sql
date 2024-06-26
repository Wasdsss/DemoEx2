USE [master]
GO
/****** Object:  Database [SoldatovDemo2]    Script Date: 27.04.2024 20:13:46 ******/
CREATE DATABASE [SoldatovDemo2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SoldatovDemo2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\SoldatovDemo2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SoldatovDemo2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\SoldatovDemo2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SoldatovDemo2] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SoldatovDemo2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SoldatovDemo2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SoldatovDemo2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SoldatovDemo2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SoldatovDemo2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SoldatovDemo2] SET ARITHABORT OFF 
GO
ALTER DATABASE [SoldatovDemo2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SoldatovDemo2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SoldatovDemo2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SoldatovDemo2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SoldatovDemo2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SoldatovDemo2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SoldatovDemo2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SoldatovDemo2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SoldatovDemo2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SoldatovDemo2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SoldatovDemo2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SoldatovDemo2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SoldatovDemo2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SoldatovDemo2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SoldatovDemo2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SoldatovDemo2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SoldatovDemo2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SoldatovDemo2] SET RECOVERY FULL 
GO
ALTER DATABASE [SoldatovDemo2] SET  MULTI_USER 
GO
ALTER DATABASE [SoldatovDemo2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SoldatovDemo2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SoldatovDemo2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SoldatovDemo2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SoldatovDemo2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SoldatovDemo2', N'ON'
GO
ALTER DATABASE [SoldatovDemo2] SET QUERY_STORE = OFF
GO
USE [SoldatovDemo2]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SoldatovDemo2]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 27.04.2024 20:13:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [varchar](10) NOT NULL,
	[ProductName] [varchar](100) NOT NULL,
	[ProductMeasurementUnit] [varchar](30) NOT NULL,
	[ProductCost] [decimal](10, 2) NOT NULL,
	[MaxDiscount] [tinyint] NOT NULL,
	[ProductManufacturer] [varchar](20) NOT NULL,
	[ProducrSupplier] [varchar](20) NOT NULL,
	[ProductCategory] [varchar](20) NOT NULL,
	[CurrentDiscount] [tinyint] NOT NULL,
	[ProductQuantityinStock] [tinyint] NOT NULL,
	[ProductDescription] [varchar](255) NOT NULL,
	[ProductPhoto] [varchar](20) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Select_Products]    Script Date: 27.04.2024 20:13:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[Select_Products]
AS
SELECT [ProductName] AS [Наименование], [ProductCost] AS [Цена], [MaxDiscount] AS [максимальная скидка], [ProductManufacturer] AS [Производитель], [ProductCategory] AS [Категория], [CurrentDiscount] AS [Скидка], [ProductQuantityinStock] AS [Количество на складе], [ProductDescription] AS [Описание]
FROM [dbo].[Product]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 27.04.2024 20:13:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[pickuppoint_id] [int] NOT NULL,
	[OrderStatus] [tinyint] NOT NULL,
	[OrderCode] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Product]    Script Date: 27.04.2024 20:13:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Product](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [varchar](10) NOT NULL,
	[Quantity] [tinyint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupPoint]    Script Date: 27.04.2024 20:13:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupPoint](
	[PickupPointID] [int] NOT NULL,
	[PostalCode] [int] NOT NULL,
	[City] [varchar](20) NOT NULL,
	[Street] [varchar](20) NOT NULL,
	[Build] [tinyint] NOT NULL,
 CONSTRAINT [PK_PickupPoint_1] PRIMARY KEY CLUSTERED 
(
	[PickupPointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 27.04.2024 20:13:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](15) NOT NULL,
 CONSTRAINT [PK__Role__8AFACE3A3AE13798] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 27.04.2024 20:13:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] NOT NULL,
	[role_id] [int] NOT NULL,
	[UserSurname] [varchar](30) NOT NULL,
	[UserName] [varchar](30) NOT NULL,
	[UserPatronymic] [varchar](30) NOT NULL,
	[UserLogin] [varchar](20) NOT NULL,
	[UserPassword] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Лист1$_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Order] ([OrderID], [user_id], [pickuppoint_id], [OrderStatus], [OrderCode], [OrderDate], [OrderDeliveryDate]) VALUES (1, 7, 18, 1, 401, CAST(N'2022-05-15T00:00:00.000' AS DateTime), CAST(N'2022-05-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [user_id], [pickuppoint_id], [OrderStatus], [OrderCode], [OrderDate], [OrderDeliveryDate]) VALUES (2, 8, 20, 1, 402, CAST(N'2022-05-16T00:00:00.000' AS DateTime), CAST(N'2022-05-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [user_id], [pickuppoint_id], [OrderStatus], [OrderCode], [OrderDate], [OrderDeliveryDate]) VALUES (3, 9, 20, 2, 403, CAST(N'2022-05-17T00:00:00.000' AS DateTime), CAST(N'2022-05-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [user_id], [pickuppoint_id], [OrderStatus], [OrderCode], [OrderDate], [OrderDeliveryDate]) VALUES (4, 10, 22, 1, 404, CAST(N'2022-05-18T00:00:00.000' AS DateTime), CAST(N'2022-05-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [user_id], [pickuppoint_id], [OrderStatus], [OrderCode], [OrderDate], [OrderDeliveryDate]) VALUES (5, 1, 22, 1, 405, CAST(N'2022-05-19T00:00:00.000' AS DateTime), CAST(N'2022-05-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [user_id], [pickuppoint_id], [OrderStatus], [OrderCode], [OrderDate], [OrderDeliveryDate]) VALUES (6, 2, 16, 1, 406, CAST(N'2022-05-19T00:00:00.000' AS DateTime), CAST(N'2022-05-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [user_id], [pickuppoint_id], [OrderStatus], [OrderCode], [OrderDate], [OrderDeliveryDate]) VALUES (7, 3, 16, 2, 407, CAST(N'2022-05-21T00:00:00.000' AS DateTime), CAST(N'2022-05-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [user_id], [pickuppoint_id], [OrderStatus], [OrderCode], [OrderDate], [OrderDeliveryDate]) VALUES (8, 4, 18, 2, 408, CAST(N'2022-05-22T00:00:00.000' AS DateTime), CAST(N'2022-05-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [user_id], [pickuppoint_id], [OrderStatus], [OrderCode], [OrderDate], [OrderDeliveryDate]) VALUES (9, 5, 24, 1, 409, CAST(N'2022-05-23T00:00:00.000' AS DateTime), CAST(N'2022-05-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Order] ([OrderID], [user_id], [pickuppoint_id], [OrderStatus], [OrderCode], [OrderDate], [OrderDeliveryDate]) VALUES (10, 6, 24, 2, 410, CAST(N'2022-05-24T00:00:00.000' AS DateTime), CAST(N'2022-05-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Order_Product] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (1, N'А112Т4', 2)
INSERT [dbo].[Order_Product] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (2, N'F746E6', 3)
INSERT [dbo].[Order_Product] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (3, N'D648N7', 10)
INSERT [dbo].[Order_Product] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (4, N'F937G4', 1)
INSERT [dbo].[Order_Product] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (5, N'N483G5', 10)
INSERT [dbo].[Order_Product] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (6, N'G480F5', 2)
INSERT [dbo].[Order_Product] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (7, N'V312R4', 1)
INSERT [dbo].[Order_Product] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (8, N'G522B5', 3)
INSERT [dbo].[Order_Product] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (9, N'F047J7', 1)
INSERT [dbo].[Order_Product] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (10, N'N836R5', 5)
INSERT [dbo].[Order_Product] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (1, N'G598Y6', 2)
INSERT [dbo].[Order_Product] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (2, N'D830R5', 3)
INSERT [dbo].[Order_Product] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (3, N'F735B6', 10)
INSERT [dbo].[Order_Product] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (4, N'E324U7', 1)
INSERT [dbo].[Order_Product] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (5, N'D038G6', 10)
INSERT [dbo].[Order_Product] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (6, N'C324S5', 2)
INSERT [dbo].[Order_Product] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (7, N'J4DF5E', 1)
INSERT [dbo].[Order_Product] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (8, N'K432G6', 3)
INSERT [dbo].[Order_Product] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (9, N'S374B5', 1)
INSERT [dbo].[Order_Product] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (10, N'D927K3', 5)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (1, 344288, N'Дубна', N'Чехова', 1)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (2, 614164, N'Дубна', N'Степная', 30)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (3, 394242, N'Дубна', N'Коммунистическая', 43)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (4, 660540, N'Дубна', N'Солнечная', 25)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (5, 125837, N'Дубна', N'Шоссейная', 40)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (6, 125703, N'Дубна', N'Партизанская', 49)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (7, 625283, N'Дубна', N'Победы', 46)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (8, 614611, N'Дубна', N'Молодежная', 50)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (9, 454311, N'Дубна', N'Новая', 19)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (10, 660007, N'Дубна', N'Октябрьская', 19)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (11, 603036, N'Дубна', N'Садовая', 4)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (12, 450983, N'Дубна', N'Комсомольская', 26)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (13, 394782, N'Дубна', N'Чехова', 3)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (14, 603002, N'Дубна', N'Дзержинского', 28)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (15, 450558, N'Дубна', N'Набережная', 30)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (16, 394060, N'Дубна', N'Фрунзе', 43)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (17, 410661, N'Дубна', N'Школьная', 50)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (18, 625590, N'Дубна', N'Коммунистическая', 20)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (19, 625683, N'Дубна', N'8 Марта', 18)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (20, 400562, N'Дубна', N'Зеленая', 32)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (21, 614510, N'Дубна', N'Маяковского', 47)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (22, 410542, N'Дубна', N'Светлая', 46)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (23, 620839, N'Дубна', N'Цветочная', 8)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (24, 443890, N'Дубна', N'Коммунистическая', 1)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (25, 603379, N'Дубна', N'Спортивная', 46)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (26, 603721, N'Дубна', N'Гоголя', 41)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (27, 410172, N'Дубна', N'Северная', 13)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (28, 420151, N'Дубна', N'Вишневая', 32)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (29, 125061, N'Дубна', N'Подгорная', 8)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (30, 630370, N'Дубна', N'Шоссейная', 24)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (31, 614753, N'Дубна', N'Полевая', 35)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (32, 426030, N'Дубна', N'Маяковского', 44)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (33, 450375, N'Дубна', N'Клубная', 44)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (34, 625560, N'Дубна', N'Некрасова', 12)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (35, 630201, N'Дубна', N'Комсомольская', 17)
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [City], [Street], [Build]) VALUES (36, 190949, N'Дубна', N'Мичурина', 26)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'B538G6', N'Спортивный костюм', N'шт.', CAST(839.00 AS Decimal(10, 2)), 5, N'playToday', N'Спортмастер', N'Одежда', 3, 17, N'Спортивный костюм playToday (футболка + шорты)', N'B538G6.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'C324S5', N'Шлем', N'шт.', CAST(4000.00 AS Decimal(10, 2)), 10, N'Salomon', N'Декатлон', N'Спортивный инвентарь', 5, 16, N'Шлем г.л./сноуб. Salomon Grom р.:KS черный (L40836800)', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'D038G6', N'Лыжный комплект', N'шт.', CAST(3000.00 AS Decimal(10, 2)), 30, N'Nordway', N'Декатлон', N'Спортивный инвентарь', 4, 23, N'Лыжный комплект беговые NORDWAY XC Classic, 45-45-45мм, 160см', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'D648N7', N'Набор для хоккея', N'шт.', CAST(350.00 AS Decimal(10, 2)), 10, N'Совтехстром', N'Декатлон', N'Спортивный инвентарь', 4, 7, N'Набор для хоккея Совтехстром', N'D648N7.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'D830R5', N'Тренажер прыжков', N'шт.', CAST(1120.00 AS Decimal(10, 2)), 15, N'Moby Kids', N'Спортмастер', N'Спортивный инвентарь', 4, 8, N'Тренажер для прыжков Moby Kids Moby-Jumper со счетчиком', N'D830R5.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'D893W4', N'Мяч', N'шт.', CAST(900.00 AS Decimal(10, 2)), 5, N'Demix', N'Спортмастер', N'Спортивный инвентарь', 2, 5, N'Мяч футбольный DEMIX 1STLS1JWWW, универсальный, 4-й размер, белый/зеленый', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'D927K3', N'Перчатки ', N'шт.', CAST(660.00 AS Decimal(10, 2)), 15, N'Starfit', N'Декатлон', N'Спортивный инвентарь', 4, 3, N'Перчатки Starfit SU-125 атлетические S черный', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'E324U7', N'Велотренажер', N'шт.', CAST(6480.00 AS Decimal(10, 2)), 25, N'DFC', N'Спортмастер', N'Спортивный инвентарь', 5, 5, N'Велотренажер двойной DFC B804 dual bike', N'E324U7.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'F047J7', N'Коврик', N'шт.', CAST(720.00 AS Decimal(10, 2)), 15, N'Bradex', N'Спортмастер', N'Спортивный инвентарь', 5, 11, N'Коврик Bradex для мягкой йоги дл.:1730мм ш.:610мм т.:3мм серый', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'F687G5', N'Защита голени', N'шт.', CAST(1900.00 AS Decimal(10, 2)), 15, N'Green Hill', N'Спортмастер', N'Спортивный инвентарь', 4, 6, N'Защита голени GREEN HILL Panther, L, синий/черный', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'F735B6', N'Игровой набор', N'шт.', CAST(320.00 AS Decimal(10, 2)), 15, N'Совтехстром', N'Декатлон', N'Спортивный инвентарь', 2, 9, N'Игровой набор Совтехстром Кегли и шары', N'F735B6.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'F746E6', N'Шведская стенка', N'шт.', CAST(9900.00 AS Decimal(10, 2)), 10, N'ROMANA Next', N'Декатлон', N'Спортивный инвентарь', 3, 5, N'Шведская стенка ROMANA Next, pastel', N'F746E6.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'F937G4', N'Игровой набор', N'шт.', CAST(480.00 AS Decimal(10, 2)), 10, N'Abtoys', N'Спортмастер', N'Спортивный инвентарь', 4, 12, N'Набор Abtoys Бадминтон и теннис ', N'F937G4.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'G403T5', N'Тюбинг', N'шт.', CAST(1450.00 AS Decimal(10, 2)), 15, N'Nordway', N'Спортмастер', N'Спортивный инвентарь', 4, 13, N'Тюбинг Nordway, 73 см', N'G403T5.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'G480F5', N'Ролики', N'шт.', CAST(1600.00 AS Decimal(10, 2)), 15, N'Ridex', N'Спортмастер', N'Спортивный инвентарь', 4, 7, N'Коньки роликовые Ridex Cricket жен. ABEC 3 кол.:72мм р.:39-42 синий', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'G522B5', N'Ласты', N'шт.', CAST(1980.00 AS Decimal(10, 2)), 15, N'Colton', N'Декатлон', N'Спортивный инвентарь', 3, 6, N'Ласты Colton CF-02 для плавания р.:33-34 серый/голубой', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'G598Y6', N'Спортивный мат', N'шт.', CAST(2390.00 AS Decimal(10, 2)), 15, N'Perfetto Sport', N'Декатлон', N'Спортивный инвентарь', 2, 16, N'Спортивный мат 100x100x10 см Perfetto Sport № 3 бежевый', N'G598Y6.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'G873H4', N'Велосипед', N'шт.', CAST(14930.00 AS Decimal(10, 2)), 5, N'SKIF', N'Спортмастер', N'Спортивный инвентарь', 4, 6, N'Велосипед SKIF 29 Disc (2021), горный (взрослый), рама: 17", колеса: 29", темно-серый', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'J4DF5E', N'Насос', N'шт.', CAST(300.00 AS Decimal(10, 2)), 5, N'Molten', N'Спортмастер', N'Спортивный инвентарь', 4, 12, N'Насос Molten HP-18-B для мячей мультиколор', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'J532D4', N'Перчатки для карате', N'шт.', CAST(1050.00 AS Decimal(10, 2)), 15, N'Green Hill', N'Спортмастер', N'Спортивный инвентарь', 3, 5, N'Перчатки для каратэ Green Hill KMС-6083 L красный', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'K432G6', N'Шапочка для плавания', N'шт.', CAST(440.00 AS Decimal(10, 2)), 25, N'Atemi', N'Декатлон', N'Спортивный инвентарь', 5, 17, N'Шапочка для плавания Atemi PU 140 ткань с покрытием желтый', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'K937A5', N'Гиря', N'шт.', CAST(890.00 AS Decimal(10, 2)), 5, N'Starfit', N'Декатлон', N'Спортивный инвентарь', 4, 10, N'Гиря Starfit ГМБ4 мягкое 4кг синий/оранжевый', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'N483G5', N'Клюшка', N'шт.', CAST(1299.00 AS Decimal(10, 2)), 10, N'Nordway', N'Декатлон', N'Спортивный инвентарь', 3, 4, N'Клюшка Nordway NDW300 (2019/2020) SR лев. 19 150см', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'N836R5', N'Коньки', N'шт.', CAST(2000.00 AS Decimal(10, 2)), 10, N'Atemi', N'Декатлон', N'Спортивный инвентарь', 3, 16, N'Коньки ATEMI AKSK01DXS, раздвижные, прогулочные, унисекс, 27-30, черный/зеленый', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'N892G6', N'Очки для плавания', N'шт.', CAST(500.00 AS Decimal(10, 2)), 5, N'Atemi', N'Декатлон', N'Спортивный инвентарь', 5, 14, N'Очки для плавания Atemi N8401 синий', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'S374B5', N'Ролик для йоги', N'шт.', CAST(700.00 AS Decimal(10, 2)), 10, N'Bradex', N'Спортмастер', N'Спортивный инвентарь', 3, 12, N'Ролик для йоги Bradex Туба d=14см ш.:33см оранжевый', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'V312R4', N'Мяч', N'шт.', CAST(4150.00 AS Decimal(10, 2)), 20, N'Mikasa', N'Декатлон', N'Спортивный инвентарь', 2, 5, N'Мяч волейбольный MIKASA VT370W, для зала, 5-й размер, желтый/синий', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'V392H7', N'Степ-платформа', N'шт.', CAST(4790.00 AS Decimal(10, 2)), 10, N'Starfit', N'Спортмастер', N'Спортивный инвентарь', 3, 15, N'Степ-платформа Starfit SP-204 серый/черный', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'V423D4', N'Штанга', N'шт.', CAST(5600.00 AS Decimal(10, 2)), 10, N'Starfit', N'Декатлон', N'Спортивный инвентарь', 3, 8, N'Штанга Starfit BB-401 30кг пласт. черный ', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductMeasurementUnit], [ProductCost], [MaxDiscount], [ProductManufacturer], [ProducrSupplier], [ProductCategory], [CurrentDiscount], [ProductQuantityinStock], [ProductDescription], [ProductPhoto]) VALUES (N'А112Т4', N'Боксерская груша', N'шт.', CAST(778.00 AS Decimal(10, 2)), 30, N'X-Match', N'Спортмастер', N'Спортивный инвентарь', 5, 6, N'Боксерская груша X-Match черная', N'А112Т4.jpg')
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Администратор')
SET IDENTITY_INSERT [dbo].[Role] OFF
INSERT [dbo].[User] ([UserID], [role_id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (1, 3, N'Пахомова', N'Аиша', N'Анатольевна', N'm4ic8j5qgstw@gmail.c', N'2L6KZG')
INSERT [dbo].[User] ([UserID], [role_id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (2, 3, N'Жуков', N'Роман', N'Богданович', N'd43zfg9tlsyv@gmail.c', N'uzWC67')
INSERT [dbo].[User] ([UserID], [role_id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (3, 3, N'Киселева', N'Анастасия', N'Максимовна', N'8ohgisf6k45w@outlook', N'8ntwUp')
INSERT [dbo].[User] ([UserID], [role_id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (4, 2, N'Григорьева', N'Арина', N'Арсентьевна', N'hi1brwj46czx@mail.co', N'YOyhfR')
INSERT [dbo].[User] ([UserID], [role_id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (5, 2, N'Иванов', N'Лев', N'Михайлович', N'fvkbcamhlj52@gmail.c', N'RSbvHv')
INSERT [dbo].[User] ([UserID], [role_id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (6, 2, N'Григорьев', N'Лев', N'Давидович', N'9qxnce8jwruv@gmail.c', N'rwVDh9')
INSERT [dbo].[User] ([UserID], [role_id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (7, 1, N'Поляков', N'Степан', N'Егорович', N'dotiex942p1r@gmail.c', N'LdNyos')
INSERT [dbo].[User] ([UserID], [role_id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (8, 1, N'Леонова', N'Алиса', N'Кирилловна', N'n0bmi2h1xral@tutanot', N'gynQMT')
INSERT [dbo].[User] ([UserID], [role_id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (9, 1, N'Яковлев', N'Платон', N'Константинович', N'sfm3t278kdvz@yahoo.c', N'AtnDjr')
INSERT [dbo].[User] ([UserID], [role_id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (10, 1, N'Ковалева', N'Ева', N'Яковлевна', N'ilb8rdut0v7e@mail.co', N'JlFRCZ')
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickupPoint] FOREIGN KEY([pickuppoint_id])
REFERENCES [dbo].[PickupPoint] ([PickupPointID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickupPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Order_Product]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[Order_Product] CHECK CONSTRAINT [FK_Order_Product_Order]
GO
ALTER TABLE [dbo].[Order_Product]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product_Product] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[Order_Product] CHECK CONSTRAINT [FK_Order_Product_Product]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
/****** Object:  StoredProcedure [dbo].[Authorization]    Script Date: 27.04.2024 20:13:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Authorization]

@login varchar(20),
@password varchar(15)

AS
BEGIN
	SELECT * FROM [dbo].[User]
	WHERE UserLogin=@login and UserPassword=@password
END
GO
USE [master]
GO
ALTER DATABASE [SoldatovDemo2] SET  READ_WRITE 
GO
