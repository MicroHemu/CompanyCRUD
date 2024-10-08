USE [master]
GO
/****** Object:  Database [Admin]    Script Date: 09-09-2024 18:55:11 ******/
CREATE DATABASE [Admin]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Admin', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Admin.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Admin_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Admin_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Admin] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Admin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Admin] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Admin] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Admin] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Admin] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Admin] SET ARITHABORT OFF 
GO
ALTER DATABASE [Admin] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Admin] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Admin] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Admin] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Admin] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Admin] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Admin] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Admin] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Admin] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Admin] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Admin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Admin] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Admin] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Admin] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Admin] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Admin] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Admin] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Admin] SET RECOVERY FULL 
GO
ALTER DATABASE [Admin] SET  MULTI_USER 
GO
ALTER DATABASE [Admin] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Admin] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Admin] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Admin] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Admin] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Admin] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Admin', N'ON'
GO
ALTER DATABASE [Admin] SET QUERY_STORE = OFF
GO
USE [Admin]
GO
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 09-09-2024 18:55:13 ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Keval]    Script Date: 09-09-2024 18:55:13 ******/
CREATE USER [Keval] FOR LOGIN [Keval] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [IIS APPPOOL\CheckJunkCharApp]    Script Date: 09-09-2024 18:55:13 ******/
CREATE USER [IIS APPPOOL\CheckJunkCharApp] FOR LOGIN [IIS APPPOOL\CheckJunkCharApp] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [dev]    Script Date: 09-09-2024 18:55:13 ******/
CREATE USER [dev] FOR LOGIN [dev] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DESKTOP-HRERGAG\Admin]    Script Date: 09-09-2024 18:55:13 ******/
CREATE USER [DESKTOP-HRERGAG\Admin] FOR LOGIN [DESKTOP-HRERGAG\Admin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [dev]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 09-09-2024 18:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](200) NULL,
	[IsActive] [bit] NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 09-09-2024 18:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[PermissionId] [int] IDENTITY(1,1) NOT NULL,
	[PermissionName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolePermissions]    Script Date: 09-09-2024 18:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePermissions](
	[RolePermissionId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[PermissionId] [int] NOT NULL,
	[IsChecked] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RolePermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 09-09-2024 18:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Companies] ON 

INSERT [dbo].[Companies] ([CompanyId], [CompanyName], [Address], [IsActive], [CreatedAt]) VALUES (7, N'MVPL', N'Ahmedabad', 1, CAST(N'2024-09-09T18:22:56.617' AS DateTime))
SET IDENTITY_INSERT [dbo].[Companies] OFF
GO
SET IDENTITY_INSERT [dbo].[Permissions] ON 

INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (1, N'Profile')
INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (2, N'Feedback')
INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (3, N'Dashboard')
SET IDENTITY_INSERT [dbo].[Permissions] OFF
GO
SET IDENTITY_INSERT [dbo].[RolePermissions] ON 

INSERT [dbo].[RolePermissions] ([RolePermissionId], [RoleId], [PermissionId], [IsChecked]) VALUES (1, 1, 1, 0)
INSERT [dbo].[RolePermissions] ([RolePermissionId], [RoleId], [PermissionId], [IsChecked]) VALUES (2, 1, 2, 0)
INSERT [dbo].[RolePermissions] ([RolePermissionId], [RoleId], [PermissionId], [IsChecked]) VALUES (3, 2, 1, 0)
INSERT [dbo].[RolePermissions] ([RolePermissionId], [RoleId], [PermissionId], [IsChecked]) VALUES (4, 2, 2, 0)
INSERT [dbo].[RolePermissions] ([RolePermissionId], [RoleId], [PermissionId], [IsChecked]) VALUES (5, 1, 3, 0)
INSERT [dbo].[RolePermissions] ([RolePermissionId], [RoleId], [PermissionId], [IsChecked]) VALUES (6, 2, 3, 0)
INSERT [dbo].[RolePermissions] ([RolePermissionId], [RoleId], [PermissionId], [IsChecked]) VALUES (16, 6, 1, 0)
INSERT [dbo].[RolePermissions] ([RolePermissionId], [RoleId], [PermissionId], [IsChecked]) VALUES (17, 6, 2, 0)
INSERT [dbo].[RolePermissions] ([RolePermissionId], [RoleId], [PermissionId], [IsChecked]) VALUES (18, 6, 3, 0)
SET IDENTITY_INSERT [dbo].[RolePermissions] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (1, N'User (basic access)')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (2, N'Console user')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (6, N'Admin')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
ALTER TABLE [dbo].[Companies] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Companies] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[RolePermissions] ADD  DEFAULT ((0)) FOR [IsChecked]
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissions_Permission] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[Permissions] ([PermissionId])
GO
ALTER TABLE [dbo].[RolePermissions] CHECK CONSTRAINT [FK_RolePermissions_Permission]
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissions_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[RolePermissions] CHECK CONSTRAINT [FK_RolePermissions_Role]
GO
/****** Object:  StoredProcedure [dbo].[CreateCompany]    Script Date: 09-09-2024 18:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateCompany]
    @CompanyName NVARCHAR(100),
    @Address NVARCHAR(200),
    @IsActive BIT
AS
BEGIN
    INSERT INTO Companies (CompanyName, Address, IsActive) 
    VALUES (@CompanyName, @Address, @IsActive);
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteCompany]    Script Date: 09-09-2024 18:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCompany]
    @CompanyId INT
AS
BEGIN
    DELETE FROM Companies WHERE CompanyId = @CompanyId;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetAllCompanies]    Script Date: 09-09-2024 18:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllCompanies]
AS
BEGIN
    SELECT * FROM Companies;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetCompanyById]    Script Date: 09-09-2024 18:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCompanyById]
    @CompanyId INT
AS
BEGIN
    SELECT * FROM Companies WHERE CompanyId = @CompanyId;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateCompany]    Script Date: 09-09-2024 18:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCompany]
    @CompanyId INT,
    @CompanyName NVARCHAR(100),
    @Address NVARCHAR(200),
    @IsActive BIT
AS
BEGIN
    UPDATE Companies
    SET CompanyName = @CompanyName, Address = @Address, IsActive = @IsActive
    WHERE CompanyId = @CompanyId;
END;
GO
USE [master]
GO
ALTER DATABASE [Admin] SET  READ_WRITE 
GO
