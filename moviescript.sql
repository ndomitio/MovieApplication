USE [master]
GO
/****** Object:  Database [MoviesDB]    Script Date: 3/12/2018 3:07:58 PM ******/
CREATE DATABASE [MoviesDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MoviesDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MoviesDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MoviesDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MoviesDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MoviesDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MoviesDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MoviesDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MoviesDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MoviesDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MoviesDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MoviesDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MoviesDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MoviesDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MoviesDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MoviesDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MoviesDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MoviesDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MoviesDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MoviesDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MoviesDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MoviesDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MoviesDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MoviesDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MoviesDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MoviesDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MoviesDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MoviesDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MoviesDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MoviesDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MoviesDB] SET  MULTI_USER 
GO
ALTER DATABASE [MoviesDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MoviesDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MoviesDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MoviesDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MoviesDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MoviesDB]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 3/12/2018 3:07:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](20) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Movies]    Script Date: 3/12/2018 3:07:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Director] [nvarchar](100) NOT NULL,
	[Genre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rentals]    Script Date: 3/12/2018 3:07:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rentals](
	[RentalID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[MovieID] [int] NOT NULL,
	[DateRented] [datetime] NOT NULL,
 CONSTRAINT [PK_Rentals] PRIMARY KEY CLUSTERED 
(
	[RentalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Phone]) VALUES (1, N'Nick', N'Domitio', N'123456789')
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([MovieID], [Title], [Director], [Genre]) VALUES (1, N'Birds', N'Hitchcock', N'Suspense')
SET IDENTITY_INSERT [dbo].[Movies] OFF
SET IDENTITY_INSERT [dbo].[Rentals] ON 

INSERT [dbo].[Rentals] ([RentalID], [CustomerID], [MovieID], [DateRented]) VALUES (1, 1, 1, CAST(N'2018-03-12 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Rentals] OFF
ALTER TABLE [dbo].[Rentals]  WITH CHECK ADD  CONSTRAINT [FK_Rentals_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Rentals] CHECK CONSTRAINT [FK_Rentals_Customers]
GO
ALTER TABLE [dbo].[Rentals]  WITH CHECK ADD  CONSTRAINT [FK_Rentals_Movies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[Rentals] CHECK CONSTRAINT [FK_Rentals_Movies]
GO
USE [master]
GO
ALTER DATABASE [MoviesDB] SET  READ_WRITE 
GO
