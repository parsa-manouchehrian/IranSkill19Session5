USE [master]
GO
/****** Object:  Database [Snapp]    Script Date: 2/23/2022 8:58:12 PM ******/
CREATE DATABASE [Snapp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Snapp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Snapp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Snapp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Snapp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Snapp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Snapp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Snapp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Snapp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Snapp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Snapp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Snapp] SET ARITHABORT OFF 
GO
ALTER DATABASE [Snapp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Snapp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Snapp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Snapp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Snapp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Snapp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Snapp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Snapp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Snapp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Snapp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Snapp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Snapp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Snapp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Snapp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Snapp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Snapp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Snapp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Snapp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Snapp] SET  MULTI_USER 
GO
ALTER DATABASE [Snapp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Snapp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Snapp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Snapp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Snapp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Snapp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Snapp] SET QUERY_STORE = OFF
GO
USE [Snapp]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 2/23/2022 8:58:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[GroupID] [int] NOT NULL,
	[RestaurnatID] [int] NOT NULL,
	[CoverImage] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_Food] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodGroup]    Script Date: 2/23/2022 8:58:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PicAddress] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_FoodGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 2/23/2022 8:58:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FoodID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2/23/2022 8:58:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[RestaurantID] [int] NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[SubmitDateTime] [datetime] NOT NULL,
	[Coupon] [nvarchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restaurant]    Script Date: 2/23/2022 8:58:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurant](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[LogoImage] [nvarchar](max) NULL,
	[CoverImage] [nvarchar](max) NULL,
	[Rate] [float] NULL,
	[IsRestaurant] [bit] NULL,
 CONSTRAINT [PK_Restaurant] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/23/2022 8:58:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [nvarchar](50) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Food] ON 
GO
INSERT [dbo].[Food] ([ID], [Name], [GroupID], [RestaurnatID], [CoverImage], [Price]) VALUES (1, N'Food1', 1, 1, N'7.png', 10)
GO
INSERT [dbo].[Food] ([ID], [Name], [GroupID], [RestaurnatID], [CoverImage], [Price]) VALUES (2, N'Food2', 1, 2, N'7.png', 10)
GO
INSERT [dbo].[Food] ([ID], [Name], [GroupID], [RestaurnatID], [CoverImage], [Price]) VALUES (3, N'Food3', 2, 1, N'2.png', 5)
GO
SET IDENTITY_INSERT [dbo].[Food] OFF
GO
SET IDENTITY_INSERT [dbo].[FoodGroup] ON 
GO
INSERT [dbo].[FoodGroup] ([ID], [Name], [PicAddress]) VALUES (1, N'Group1', N'1.png')
GO
INSERT [dbo].[FoodGroup] ([ID], [Name], [PicAddress]) VALUES (2, N'Group2', N'11.png')
GO
INSERT [dbo].[FoodGroup] ([ID], [Name], [PicAddress]) VALUES (3, N'Group3', N'10.png')
GO
INSERT [dbo].[FoodGroup] ([ID], [Name], [PicAddress]) VALUES (4, N'Group4', N'13png')
GO
SET IDENTITY_INSERT [dbo].[FoodGroup] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItem] ON 
GO
INSERT [dbo].[OrderItem] ([ID], [FoodID], [OrderID]) VALUES (1, 1, 2)
GO
INSERT [dbo].[OrderItem] ([ID], [FoodID], [OrderID]) VALUES (2, 2, 2)
GO
INSERT [dbo].[OrderItem] ([ID], [FoodID], [OrderID]) VALUES (3, 1, 2)
GO
INSERT [dbo].[OrderItem] ([ID], [FoodID], [OrderID]) VALUES (4, 1, 3)
GO
INSERT [dbo].[OrderItem] ([ID], [FoodID], [OrderID]) VALUES (5, 1, 3)
GO
SET IDENTITY_INSERT [dbo].[OrderItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([ID], [UserID], [RestaurantID], [Address], [SubmitDateTime], [Coupon]) VALUES (2, 1, 1, N'wow', CAST(N'2022-02-23T20:47:50.393' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([ID], [UserID], [RestaurantID], [Address], [SubmitDateTime], [Coupon]) VALUES (3, 1, 1, N'asdasd', CAST(N'2022-02-23T20:54:47.527' AS DateTime), N'asdasd')
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Restaurant] ON 
GO
INSERT [dbo].[Restaurant] ([ID], [Name], [Address], [City], [Description], [LogoImage], [CoverImage], [Rate], [IsRestaurant]) VALUES (1, N'Rest1', N'1260', N'Vacnouver', N'Good one', N'9.png', N'9.png', 4, 1)
GO
INSERT [dbo].[Restaurant] ([ID], [Name], [Address], [City], [Description], [LogoImage], [CoverImage], [Rate], [IsRestaurant]) VALUES (2, N'Rest12', N'1260', N'Karaj', N'Very Good', N'9.png', N'9.png', 4, 1)
GO
INSERT [dbo].[Restaurant] ([ID], [Name], [Address], [City], [Description], [LogoImage], [CoverImage], [Rate], [IsRestaurant]) VALUES (3, N'Rest134', N'1260', N'Tehran', N'Good one', N'9.png', N'9.png', 4, 0)
GO
INSERT [dbo].[Restaurant] ([ID], [Name], [Address], [City], [Description], [LogoImage], [CoverImage], [Rate], [IsRestaurant]) VALUES (4, N'Rest1425', N'1260', N'Mashhad', N'Good one', N'9.png', N'9.png', 4, 1)
GO
SET IDENTITY_INSERT [dbo].[Restaurant] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([ID], [Firstname], [Lastname], [Phone], [Password]) VALUES (1, N'Parsa', N'Manouchehrian', N'6043545156', N'123')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD  CONSTRAINT [FK_Food_FoodGroup] FOREIGN KEY([GroupID])
REFERENCES [dbo].[FoodGroup] ([ID])
GO
ALTER TABLE [dbo].[Food] CHECK CONSTRAINT [FK_Food_FoodGroup]
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD  CONSTRAINT [FK_Food_Restaurant] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Restaurant] ([ID])
GO
ALTER TABLE [dbo].[Food] CHECK CONSTRAINT [FK_Food_Restaurant]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Food] FOREIGN KEY([FoodID])
REFERENCES [dbo].[Food] ([ID])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Food]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Restaurant] FOREIGN KEY([RestaurantID])
REFERENCES [dbo].[Restaurant] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Restaurant]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
USE [master]
GO
ALTER DATABASE [Snapp] SET  READ_WRITE 
GO
