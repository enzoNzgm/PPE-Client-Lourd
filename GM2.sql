USE [master]
GO
/****** Object:  Database [GM]    Script Date: 01/06/2023 14:41:58 ******/
CREATE DATABASE [GM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\GM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\GM_log.ldf' , SIZE = 1536KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [GM] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GM] SET ARITHABORT OFF 
GO
ALTER DATABASE [GM] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GM] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GM] SET  MULTI_USER 
GO
ALTER DATABASE [GM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GM] SET QUERY_STORE = OFF
GO
USE [GM]
GO
/****** Object:  Table [dbo].[CLIENT]    Script Date: 01/06/2023 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENT](
	[ID_CLIENT] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](50) NOT NULL,
	[Adresse] [varchar](50) NOT NULL,
	[Mail] [varchar](50) NULL,
	[Tel] [varchar](20) NOT NULL,
 CONSTRAINT [CLIENT_PK] PRIMARY KEY CLUSTERED 
(
	[ID_CLIENT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INTERVENTION]    Script Date: 01/06/2023 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INTERVENTION](
	[ID_INTER] [int] IDENTITY(1,1) NOT NULL,
	[DATE_INTER] [date] NOT NULL,
	[Commentaire] [text] NULL,
	[ID_TECH] [int] NOT NULL,
	[ID_MAT] [int] NOT NULL,
 CONSTRAINT [INTERVENTION_PK] PRIMARY KEY CLUSTERED 
(
	[ID_INTER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MATERIEL]    Script Date: 01/06/2023 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MATERIEL](
	[ID_MAT] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](50) NOT NULL,
	[NoSerie] [varchar](50) NOT NULL,
	[Date_install] [date] NOT NULL,
	[MTBF] [int] NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Marque] [varchar](50) NOT NULL,
	[ID_CLIENT] [int] NOT NULL,
 CONSTRAINT [MATERIEL_PK] PRIMARY KEY CLUSTERED 
(
	[ID_MAT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TECHNICIEN]    Script Date: 01/06/2023 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TECHNICIEN](
	[ID_TECH] [int] IDENTITY(1,1) NOT NULL,
	[NOM] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TECHNICIEN] PRIMARY KEY CLUSTERED 
(
	[ID_TECH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utilisateur]    Script Date: 01/06/2023 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utilisateur](
	[ID_USER] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Pwd] [varchar](500) NOT NULL,
	[Date_Last_Change] [date] NOT NULL,
 CONSTRAINT [Utilisateur_PK] PRIMARY KEY CLUSTERED 
(
	[ID_USER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CLIENT] ON 

INSERT [dbo].[CLIENT] ([ID_CLIENT], [Nom], [Adresse], [Mail], [Tel]) VALUES (2, N'Boulanger', N'88 place Monge 2', N'miam', N'01 54 82 55 11')
INSERT [dbo].[CLIENT] ([ID_CLIENT], [Nom], [Adresse], [Mail], [Tel]) VALUES (19, N'Galeries77', N'', N'gl88@qdoisd,fis.comco', N'')
INSERT [dbo].[CLIENT] ([ID_CLIENT], [Nom], [Adresse], [Mail], [Tel]) VALUES (22, N'Syebel', N'tres loin', N'mail@siebel.com', N'0666666841645715')
INSERT [dbo].[CLIENT] ([ID_CLIENT], [Nom], [Adresse], [Mail], [Tel]) VALUES (24, N'Thibault', N'tibostreet', N'steph@ffff.com', N'06 55 22 01 01')
INSERT [dbo].[CLIENT] ([ID_CLIENT], [Nom], [Adresse], [Mail], [Tel]) VALUES (26, N'Toalfgjg', N'crderic adress', N'bb', N'')
INSERT [dbo].[CLIENT] ([ID_CLIENT], [Nom], [Adresse], [Mail], [Tel]) VALUES (30, N'retuirnui', N'185546 loin', N'non@dsd.com', N'54725045')
SET IDENTITY_INSERT [dbo].[CLIENT] OFF
GO
SET IDENTITY_INSERT [dbo].[INTERVENTION] ON 

INSERT [dbo].[INTERVENTION] ([ID_INTER], [DATE_INTER], [Commentaire], [ID_TECH], [ID_MAT]) VALUES (3, CAST(N'2018-11-24' AS Date), N'aaaaaf', 3, 4)
INSERT [dbo].[INTERVENTION] ([ID_INTER], [DATE_INTER], [Commentaire], [ID_TECH], [ID_MAT]) VALUES (9, CAST(N'2022-06-22' AS Date), N'le commentazhi qs
qsjgqskjgk', 3, 4)
INSERT [dbo].[INTERVENTION] ([ID_INTER], [DATE_INTER], [Commentaire], [ID_TECH], [ID_MAT]) VALUES (10, CAST(N'2029-08-30' AS Date), N'le comment', 4, 1)
INSERT [dbo].[INTERVENTION] ([ID_INTER], [DATE_INTER], [Commentaire], [ID_TECH], [ID_MAT]) VALUES (12, CAST(N'2008-10-06' AS Date), N'cool alors', 1, 1)
INSERT [dbo].[INTERVENTION] ([ID_INTER], [DATE_INTER], [Commentaire], [ID_TECH], [ID_MAT]) VALUES (13, CAST(N'2050-12-23' AS Date), N'loin', 2, 4)
INSERT [dbo].[INTERVENTION] ([ID_INTER], [DATE_INTER], [Commentaire], [ID_TECH], [ID_MAT]) VALUES (14, CAST(N'2023-04-12' AS Date), N'd', 3, 20)
INSERT [dbo].[INTERVENTION] ([ID_INTER], [DATE_INTER], [Commentaire], [ID_TECH], [ID_MAT]) VALUES (15, CAST(N'2023-04-19' AS Date), N'cool alors', 1, 17)
INSERT [dbo].[INTERVENTION] ([ID_INTER], [DATE_INTER], [Commentaire], [ID_TECH], [ID_MAT]) VALUES (16, CAST(N'2023-04-19' AS Date), N'fdbxc', 2, 19)
INSERT [dbo].[INTERVENTION] ([ID_INTER], [DATE_INTER], [Commentaire], [ID_TECH], [ID_MAT]) VALUES (17, CAST(N'2023-04-21' AS Date), N'sdhxc', 1, 17)
INSERT [dbo].[INTERVENTION] ([ID_INTER], [DATE_INTER], [Commentaire], [ID_TECH], [ID_MAT]) VALUES (18, CAST(N'2023-04-21' AS Date), N'coool', 2, 17)
INSERT [dbo].[INTERVENTION] ([ID_INTER], [DATE_INTER], [Commentaire], [ID_TECH], [ID_MAT]) VALUES (19, CAST(N'2023-05-11' AS Date), N'gdgq', 2, 4)
INSERT [dbo].[INTERVENTION] ([ID_INTER], [DATE_INTER], [Commentaire], [ID_TECH], [ID_MAT]) VALUES (20, CAST(N'2023-05-25' AS Date), N'', 3, 4)
INSERT [dbo].[INTERVENTION] ([ID_INTER], [DATE_INTER], [Commentaire], [ID_TECH], [ID_MAT]) VALUES (21, CAST(N'2023-06-01' AS Date), N'cool alors', 3, 19)
INSERT [dbo].[INTERVENTION] ([ID_INTER], [DATE_INTER], [Commentaire], [ID_TECH], [ID_MAT]) VALUES (22, CAST(N'2023-06-01' AS Date), N'bien mangé ????', 4, 4)
SET IDENTITY_INSERT [dbo].[INTERVENTION] OFF
GO
SET IDENTITY_INSERT [dbo].[MATERIEL] ON 

INSERT [dbo].[MATERIEL] ([ID_MAT], [Nom], [NoSerie], [Date_install], [MTBF], [Type], [Marque], [ID_CLIENT]) VALUES (1, N'Souris G4', N'0540560653', CAST(N'2012-02-13' AS Date), 10, N'SOURIS', N'Logitech', 2)
INSERT [dbo].[MATERIEL] ([ID_MAT], [Nom], [NoSerie], [Date_install], [MTBF], [Type], [Marque], [ID_CLIENT]) VALUES (4, N'UC771447', N'426054', CAST(N'2022-05-11' AS Date), 1, N'UC', N'HP', 2)
INSERT [dbo].[MATERIEL] ([ID_MAT], [Nom], [NoSerie], [Date_install], [MTBF], [Type], [Marque], [ID_CLIENT]) VALUES (17, N'pppp', N'pppp', CAST(N'2005-05-12' AS Date), 20, N'pmp', N'pmp', 22)
INSERT [dbo].[MATERIEL] ([ID_MAT], [Nom], [NoSerie], [Date_install], [MTBF], [Type], [Marque], [ID_CLIENT]) VALUES (19, N'GALOP', N'5178575', CAST(N'2065-04-10' AS Date), 14, N'14', N'fdhdfh', 19)
INSERT [dbo].[MATERIEL] ([ID_MAT], [Nom], [NoSerie], [Date_install], [MTBF], [Type], [Marque], [ID_CLIENT]) VALUES (20, N'printer ter', N'5654896548545', CAST(N'2110-04-11' AS Date), 50, N'oui', N'oui', 19)
SET IDENTITY_INSERT [dbo].[MATERIEL] OFF
GO
SET IDENTITY_INSERT [dbo].[TECHNICIEN] ON 

INSERT [dbo].[TECHNICIEN] ([ID_TECH], [NOM]) VALUES (1, N'NESTOR')
INSERT [dbo].[TECHNICIEN] ([ID_TECH], [NOM]) VALUES (2, N'BALOUME')
INSERT [dbo].[TECHNICIEN] ([ID_TECH], [NOM]) VALUES (3, N'PERLE')
INSERT [dbo].[TECHNICIEN] ([ID_TECH], [NOM]) VALUES (4, N'KRAPOUTO')
SET IDENTITY_INSERT [dbo].[TECHNICIEN] OFF
GO
SET IDENTITY_INSERT [dbo].[Utilisateur] ON 

INSERT [dbo].[Utilisateur] ([ID_USER], [Login], [Pwd], [Date_Last_Change]) VALUES (1, N'admin', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', CAST(N'2023-05-10' AS Date))
INSERT [dbo].[Utilisateur] ([ID_USER], [Login], [Pwd], [Date_Last_Change]) VALUES (2, N'toto', N'd1c7c99c6e2e7b311f51dd9d19161a5832625fb21f35131fba6da62513f0c099', CAST(N'2021-05-18' AS Date))
INSERT [dbo].[Utilisateur] ([ID_USER], [Login], [Pwd], [Date_Last_Change]) VALUES (3, N'Fatiba', N'6ff360d3c646fcbf59faad9cb821c676ea4eef8c264edea4047d6b53db99dcb7', CAST(N'1788-12-25' AS Date))
INSERT [dbo].[Utilisateur] ([ID_USER], [Login], [Pwd], [Date_Last_Change]) VALUES (4, N'toto01', N'ljgnkjhnkjgkjgnkj', CAST(N'2023-05-24' AS Date))
INSERT [dbo].[Utilisateur] ([ID_USER], [Login], [Pwd], [Date_Last_Change]) VALUES (7, N'stephane', N'215216cdbf5f80ea1c742537ca523051b6685b191e6a8cbc363b167f234e4130', CAST(N'2022-05-24' AS Date))
INSERT [dbo].[Utilisateur] ([ID_USER], [Login], [Pwd], [Date_Last_Change]) VALUES (8, N'aaaaz', N'EFD948086411AC1669262B79786E5E49F27258077988305880B4E4B3802B100A', CAST(N'2023-04-30' AS Date))
INSERT [dbo].[Utilisateur] ([ID_USER], [Login], [Pwd], [Date_Last_Change]) VALUES (9, N'zegsd', N'B0E2F12B96BE50C9B096321673B4F60ABD926D044C703CC0EDD9435942BC5372', CAST(N'2023-04-02' AS Date))
INSERT [dbo].[Utilisateur] ([ID_USER], [Login], [Pwd], [Date_Last_Change]) VALUES (11, N'goldorak', N'36be63af7301648bf2f1bfdd6f127a286c5ee2021927d237fe73fc063a7d9a51', CAST(N'2023-05-25' AS Date))
SET IDENTITY_INSERT [dbo].[Utilisateur] OFF
GO
ALTER TABLE [dbo].[INTERVENTION]  WITH CHECK ADD  CONSTRAINT [FK_INTERVENTION_MATERIEL] FOREIGN KEY([ID_MAT])
REFERENCES [dbo].[MATERIEL] ([ID_MAT])
GO
ALTER TABLE [dbo].[INTERVENTION] CHECK CONSTRAINT [FK_INTERVENTION_MATERIEL]
GO
ALTER TABLE [dbo].[INTERVENTION]  WITH CHECK ADD  CONSTRAINT [FK_INTERVENTION_TECHNICIEN] FOREIGN KEY([ID_TECH])
REFERENCES [dbo].[TECHNICIEN] ([ID_TECH])
GO
ALTER TABLE [dbo].[INTERVENTION] CHECK CONSTRAINT [FK_INTERVENTION_TECHNICIEN]
GO
ALTER TABLE [dbo].[MATERIEL]  WITH CHECK ADD  CONSTRAINT [FK_MATERIEL_CLIENT] FOREIGN KEY([ID_CLIENT])
REFERENCES [dbo].[CLIENT] ([ID_CLIENT])
GO
ALTER TABLE [dbo].[MATERIEL] CHECK CONSTRAINT [FK_MATERIEL_CLIENT]
GO
/****** Object:  StoredProcedure [dbo].[AffInter]    Script Date: 01/06/2023 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AffInter] 
	@Beginning_Date Date, @Ending_Date Date 
AS
BEGIN
	select * from INTERVENTION WHERE 
		DATE_INTER Between @Beginning_Date And @Ending_Date 
END
GO
/****** Object:  StoredProcedure [dbo].[check_pwd]    Script Date: 01/06/2023 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[check_pwd]
	@datelastchage date, @lelogin varchar(50)	
AS
BEGIN
    select DATEDIFF(month, @datelastchage, GETDATE()) from Utilisateur where login = @lelogin  
END
GO
/****** Object:  StoredProcedure [dbo].[Emrecan_Proc]    Script Date: 01/06/2023 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Emrecan_Proc]
	@Prenom Varchar(50), 
	@Age Int
AS
BEGIN
    -- Insert statements for procedure here
	SELECT * from CLIENT where Nom= @Prenom and ID_CLIENT = @Age
END
GO
USE [master]
GO
ALTER DATABASE [GM] SET  READ_WRITE 
GO
