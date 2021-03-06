USE [master]
GO
/****** Object:  Database [ClothingProject]    Script Date: 3/16/2018 10:16:24 PM ******/
CREATE DATABASE [ClothingProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ClothingProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ClothingProject.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ClothingProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ClothingProject_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ClothingProject] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClothingProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClothingProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ClothingProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ClothingProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ClothingProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ClothingProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [ClothingProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ClothingProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ClothingProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ClothingProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ClothingProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ClothingProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ClothingProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ClothingProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ClothingProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ClothingProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ClothingProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ClothingProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ClothingProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ClothingProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ClothingProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ClothingProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ClothingProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ClothingProject] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ClothingProject] SET  MULTI_USER 
GO
ALTER DATABASE [ClothingProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ClothingProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ClothingProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ClothingProject] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ClothingProject] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ClothingProject]
GO
/****** Object:  Table [dbo].[Accessory]    Script Date: 3/16/2018 10:16:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accessory](
	[AccessoryID] [int] IDENTITY(1,1) NOT NULL,
	[AccessoryName] [nvarchar](200) NOT NULL,
	[AccessoryPhoto] [nvarchar](300) NOT NULL,
	[AccessoryColor] [nvarchar](200) NOT NULL,
	[SeasonID] [int] NOT NULL,
	[OccassionID] [int] NOT NULL,
 CONSTRAINT [PK_Accessory] PRIMARY KEY CLUSTERED 
(
	[AccessoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bottom]    Script Date: 3/16/2018 10:16:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bottom](
	[BottomID] [int] IDENTITY(1,1) NOT NULL,
	[BottomName] [nvarchar](200) NOT NULL,
	[BottomPhoto] [nvarchar](300) NOT NULL,
	[BottomColor] [nvarchar](200) NOT NULL,
	[SeasonID] [int] NOT NULL,
	[OccassionID] [int] NOT NULL,
 CONSTRAINT [PK_Bottom] PRIMARY KEY CLUSTERED 
(
	[BottomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Occassion]    Script Date: 3/16/2018 10:16:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Occassion](
	[OccassionID] [int] IDENTITY(1,1) NOT NULL,
	[OccassionType] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Occassion] PRIMARY KEY CLUSTERED 
(
	[OccassionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Outfit]    Script Date: 3/16/2018 10:16:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Outfit](
	[OutfitID] [int] IDENTITY(1,1) NOT NULL,
	[OutfitName] [nvarchar](200) NOT NULL,
	[TopID] [int] NOT NULL,
	[BottomID] [int] NOT NULL,
	[ShoeID] [int] NOT NULL,
	[AccessoryID] [int] NOT NULL,
	[SeasonID] [int] NOT NULL,
	[OccassionID] [int] NOT NULL,
 CONSTRAINT [PK_Outfit] PRIMARY KEY CLUSTERED 
(
	[OutfitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Season]    Script Date: 3/16/2018 10:16:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Season](
	[SeasonID] [int] IDENTITY(1,1) NOT NULL,
	[Season] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Season] PRIMARY KEY CLUSTERED 
(
	[SeasonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shoe]    Script Date: 3/16/2018 10:16:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shoe](
	[ShoeID] [int] IDENTITY(1,1) NOT NULL,
	[ShoeName] [nvarchar](200) NOT NULL,
	[ShoePhoto] [nvarchar](300) NOT NULL,
	[ShoeColor] [nvarchar](200) NOT NULL,
	[SeasonID] [int] NOT NULL,
	[OccassionID] [int] NOT NULL,
 CONSTRAINT [PK_Shoe] PRIMARY KEY CLUSTERED 
(
	[ShoeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Top]    Script Date: 3/16/2018 10:16:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Top](
	[TopID] [int] IDENTITY(1,1) NOT NULL,
	[TopName] [nvarchar](200) NOT NULL,
	[TopPhoto] [nvarchar](300) NOT NULL,
	[TopColor] [nvarchar](200) NOT NULL,
	[SeasonID] [int] NOT NULL,
	[OccassionID] [int] NOT NULL,
 CONSTRAINT [PK_Top] PRIMARY KEY CLUSTERED 
(
	[TopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Accessory] ON 

INSERT [dbo].[Accessory] ([AccessoryID], [AccessoryName], [AccessoryPhoto], [AccessoryColor], [SeasonID], [OccassionID]) VALUES (1, N'Red Earrings', N'/Content/images/accimages/earrings.jpg', N'Red', 2, 4)
INSERT [dbo].[Accessory] ([AccessoryID], [AccessoryName], [AccessoryPhoto], [AccessoryColor], [SeasonID], [OccassionID]) VALUES (2, N'Winter Hat', N'/Content/images/accimages/hat.jpg', N'Gret', 1, 1)
INSERT [dbo].[Accessory] ([AccessoryID], [AccessoryName], [AccessoryPhoto], [AccessoryColor], [SeasonID], [OccassionID]) VALUES (3, N'Sunglasses', N'/Content/images/accimages/sunglasses.jpg', N'Pink', 3, 3)
INSERT [dbo].[Accessory] ([AccessoryID], [AccessoryName], [AccessoryPhoto], [AccessoryColor], [SeasonID], [OccassionID]) VALUES (4, N'Necklace', N'/Content/images/accimages/necklace.jpg', N'Blue', 2, 4)
INSERT [dbo].[Accessory] ([AccessoryID], [AccessoryName], [AccessoryPhoto], [AccessoryColor], [SeasonID], [OccassionID]) VALUES (5, N'Leaf Earrings', N'/Content/images/accimages/earrings2.jpg', N'Silver', 4, 4)
INSERT [dbo].[Accessory] ([AccessoryID], [AccessoryName], [AccessoryPhoto], [AccessoryColor], [SeasonID], [OccassionID]) VALUES (6, N'Belt', N'/Content/images/accimages/belt.jpg', N'Brown', 3, 1)
INSERT [dbo].[Accessory] ([AccessoryID], [AccessoryName], [AccessoryPhoto], [AccessoryColor], [SeasonID], [OccassionID]) VALUES (7, N'Colorful Earrings', N'/Content/images/accimages/earrings3.jpg', N'Multicolor', 3, 1)
INSERT [dbo].[Accessory] ([AccessoryID], [AccessoryName], [AccessoryPhoto], [AccessoryColor], [SeasonID], [OccassionID]) VALUES (8, N'Bracelet', N'/Content/images/accimages/bracelet.jpg', N'Silver', 1, 4)
SET IDENTITY_INSERT [dbo].[Accessory] OFF
SET IDENTITY_INSERT [dbo].[Bottom] ON 

INSERT [dbo].[Bottom] ([BottomID], [BottomName], [BottomPhoto], [BottomColor], [SeasonID], [OccassionID]) VALUES (1, N'Hiking Zip Off Pants', N'/Content/images/bottomimages/zipoff.jpg', N'Grey', 4, 3)
INSERT [dbo].[Bottom] ([BottomID], [BottomName], [BottomPhoto], [BottomColor], [SeasonID], [OccassionID]) VALUES (2, N'Jeans', N'/Content/images/bottomimages/jeans.jpg', N'Dark Blue', 1, 1)
INSERT [dbo].[Bottom] ([BottomID], [BottomName], [BottomPhoto], [BottomColor], [SeasonID], [OccassionID]) VALUES (3, N'Leggings', N'/Content/images/bottomimages/leggings.jpg', N'Grey', 4, 5)
INSERT [dbo].[Bottom] ([BottomID], [BottomName], [BottomPhoto], [BottomColor], [SeasonID], [OccassionID]) VALUES (4, N'Skirt', N'/Content/images/bottomimages/skirt.jpg', N'Green', 3, 4)
INSERT [dbo].[Bottom] ([BottomID], [BottomName], [BottomPhoto], [BottomColor], [SeasonID], [OccassionID]) VALUES (5, N'Capris', N'/Content/images/bottomimages/capris.jpg', N'Black', 2, 3)
INSERT [dbo].[Bottom] ([BottomID], [BottomName], [BottomPhoto], [BottomColor], [SeasonID], [OccassionID]) VALUES (6, N'Corduroys', N'/Content/images/bottomimages/corduroy.jpg', N'Maroon', 1, 1)
INSERT [dbo].[Bottom] ([BottomID], [BottomName], [BottomPhoto], [BottomColor], [SeasonID], [OccassionID]) VALUES (7, N'Shorts', N'/Content/images/bottomimages/jeanshort.jpg', N'Blue', 3, 1)
INSERT [dbo].[Bottom] ([BottomID], [BottomName], [BottomPhoto], [BottomColor], [SeasonID], [OccassionID]) VALUES (8, N'Long Skirt', N'/Content/images/bottomimages/longskirt.jpg', N'Brown', 3, 1)
SET IDENTITY_INSERT [dbo].[Bottom] OFF
SET IDENTITY_INSERT [dbo].[Occassion] ON 

INSERT [dbo].[Occassion] ([OccassionID], [OccassionType]) VALUES (1, N'Casual')
INSERT [dbo].[Occassion] ([OccassionID], [OccassionType]) VALUES (3, N'Active')
INSERT [dbo].[Occassion] ([OccassionID], [OccassionType]) VALUES (4, N'Dressy Casual')
INSERT [dbo].[Occassion] ([OccassionID], [OccassionType]) VALUES (5, N'Loungewear')
SET IDENTITY_INSERT [dbo].[Occassion] OFF
SET IDENTITY_INSERT [dbo].[Outfit] ON 

INSERT [dbo].[Outfit] ([OutfitID], [OutfitName], [TopID], [BottomID], [ShoeID], [AccessoryID], [SeasonID], [OccassionID]) VALUES (1, N'Summer Evening Out', 3, 3, 3, 4, 3, 4)
INSERT [dbo].[Outfit] ([OutfitID], [OutfitName], [TopID], [BottomID], [ShoeID], [AccessoryID], [SeasonID], [OccassionID]) VALUES (2, N'Gone Hiking', 4, 1, 4, 3, 3, 3)
INSERT [dbo].[Outfit] ([OutfitID], [OutfitName], [TopID], [BottomID], [ShoeID], [AccessoryID], [SeasonID], [OccassionID]) VALUES (3, N'Winter Around Town', 2, 2, 4, 2, 1, 1)
INSERT [dbo].[Outfit] ([OutfitID], [OutfitName], [TopID], [BottomID], [ShoeID], [AccessoryID], [SeasonID], [OccassionID]) VALUES (4, N'Casual Saturday', 1, 2, 2, 1, 4, 1)
INSERT [dbo].[Outfit] ([OutfitID], [OutfitName], [TopID], [BottomID], [ShoeID], [AccessoryID], [SeasonID], [OccassionID]) VALUES (5, N'Snazzy', 5, 6, 7, 5, 4, 1)
INSERT [dbo].[Outfit] ([OutfitID], [OutfitName], [TopID], [BottomID], [ShoeID], [AccessoryID], [SeasonID], [OccassionID]) VALUES (6, N'Chillin''', 6, 3, 8, 2, 2, 5)
INSERT [dbo].[Outfit] ([OutfitID], [OutfitName], [TopID], [BottomID], [ShoeID], [AccessoryID], [SeasonID], [OccassionID]) VALUES (7, N'Seasonal Picnic', 6, 7, 3, 7, 3, 1)
INSERT [dbo].[Outfit] ([OutfitID], [OutfitName], [TopID], [BottomID], [ShoeID], [AccessoryID], [SeasonID], [OccassionID]) VALUES (8, N'Snow Day', 7, 1, 5, 2, 1, 3)
INSERT [dbo].[Outfit] ([OutfitID], [OutfitName], [TopID], [BottomID], [ShoeID], [AccessoryID], [SeasonID], [OccassionID]) VALUES (9, N'Looking Nice', 8, 2, 7, 1, 4, 4)
INSERT [dbo].[Outfit] ([OutfitID], [OutfitName], [TopID], [BottomID], [ShoeID], [AccessoryID], [SeasonID], [OccassionID]) VALUES (10, N'Go With The Flow', 4, 8, 3, 3, 3, 1)
INSERT [dbo].[Outfit] ([OutfitID], [OutfitName], [TopID], [BottomID], [ShoeID], [AccessoryID], [SeasonID], [OccassionID]) VALUES (11, N'Out For The Afternoon', 6, 4, 6, 8, 2, 1)
INSERT [dbo].[Outfit] ([OutfitID], [OutfitName], [TopID], [BottomID], [ShoeID], [AccessoryID], [SeasonID], [OccassionID]) VALUES (12, N'Work Out', 4, 5, 1, 3, 3, 3)
INSERT [dbo].[Outfit] ([OutfitID], [OutfitName], [TopID], [BottomID], [ShoeID], [AccessoryID], [SeasonID], [OccassionID]) VALUES (13, N'Sweater Weather', 5, 2, 7, 6, 4, 1)
INSERT [dbo].[Outfit] ([OutfitID], [OutfitName], [TopID], [BottomID], [ShoeID], [AccessoryID], [SeasonID], [OccassionID]) VALUES (14, N'Hippy', 8, 8, 3, 7, 2, 1)
SET IDENTITY_INSERT [dbo].[Outfit] OFF
SET IDENTITY_INSERT [dbo].[Season] ON 

INSERT [dbo].[Season] ([SeasonID], [Season]) VALUES (1, N'Winter')
INSERT [dbo].[Season] ([SeasonID], [Season]) VALUES (2, N'Spring')
INSERT [dbo].[Season] ([SeasonID], [Season]) VALUES (3, N'Summer')
INSERT [dbo].[Season] ([SeasonID], [Season]) VALUES (4, N'Fall')
SET IDENTITY_INSERT [dbo].[Season] OFF
SET IDENTITY_INSERT [dbo].[Shoe] ON 

INSERT [dbo].[Shoe] ([ShoeID], [ShoeName], [ShoePhoto], [ShoeColor], [SeasonID], [OccassionID]) VALUES (1, N'Running Shoes', N'/Content/images/shoesimages/runningshoes.jpg', N'Teal', 3, 3)
INSERT [dbo].[Shoe] ([ShoeID], [ShoeName], [ShoePhoto], [ShoeColor], [SeasonID], [OccassionID]) VALUES (2, N'Flats', N'/Content/images/shoesimages/flats.jpg', N'Black', 2, 4)
INSERT [dbo].[Shoe] ([ShoeID], [ShoeName], [ShoePhoto], [ShoeColor], [SeasonID], [OccassionID]) VALUES (3, N'Sandals', N'/Content/images/shoesimages/sandals.jpg', N'white', 3, 4)
INSERT [dbo].[Shoe] ([ShoeID], [ShoeName], [ShoePhoto], [ShoeColor], [SeasonID], [OccassionID]) VALUES (4, N'Hiking Boots', N'/Content/images/shoesimages/hikingboots.jpg', N'Brown', 1, 3)
INSERT [dbo].[Shoe] ([ShoeID], [ShoeName], [ShoePhoto], [ShoeColor], [SeasonID], [OccassionID]) VALUES (5, N'Ski Boots', N'/Content/images/shoesimages/skiboot.jpg', N'Blue', 1, 3)
INSERT [dbo].[Shoe] ([ShoeID], [ShoeName], [ShoePhoto], [ShoeColor], [SeasonID], [OccassionID]) VALUES (6, N'High Heels', N'/Content/images/shoesimages/highheels.jpg', N'Yellow', 2, 4)
INSERT [dbo].[Shoe] ([ShoeID], [ShoeName], [ShoePhoto], [ShoeColor], [SeasonID], [OccassionID]) VALUES (7, N'Tall Boots', N'/Content/images/shoesimages/blackboots.jpg', N'Black', 4, 4)
INSERT [dbo].[Shoe] ([ShoeID], [ShoeName], [ShoePhoto], [ShoeColor], [SeasonID], [OccassionID]) VALUES (8, N'Rain Boots', N'/Content/images/shoesimages/rainboot.jpg', N'Blue', 2, 3)
SET IDENTITY_INSERT [dbo].[Shoe] OFF
SET IDENTITY_INSERT [dbo].[Top] ON 

INSERT [dbo].[Top] ([TopID], [TopName], [TopPhoto], [TopColor], [SeasonID], [OccassionID]) VALUES (1, N'Flannel Button Up', N'/Content/images/topimages/plaid.jpg', N'Tones of Red', 4, 1)
INSERT [dbo].[Top] ([TopID], [TopName], [TopPhoto], [TopColor], [SeasonID], [OccassionID]) VALUES (2, N'Down Coat', N'/Content/images/topimages/downcoat.jpg', N'Blue', 1, 3)
INSERT [dbo].[Top] ([TopID], [TopName], [TopPhoto], [TopColor], [SeasonID], [OccassionID]) VALUES (3, N'Dress', N'/Content/images/topimages/dress.jpg', N'Green', 3, 4)
INSERT [dbo].[Top] ([TopID], [TopName], [TopPhoto], [TopColor], [SeasonID], [OccassionID]) VALUES (4, N'Tank Top', N'/Content/images/topimages/tanktop.jpg', N'Black', 3, 3)
INSERT [dbo].[Top] ([TopID], [TopName], [TopPhoto], [TopColor], [SeasonID], [OccassionID]) VALUES (5, N'Sweater', N'/Content/images/topimages/sweater.jpg', N'Beige', 1, 1)
INSERT [dbo].[Top] ([TopID], [TopName], [TopPhoto], [TopColor], [SeasonID], [OccassionID]) VALUES (6, N'T-shirt', N'/Content/images/topimages/tshirt.jpg', N'Black', 3, 5)
INSERT [dbo].[Top] ([TopID], [TopName], [TopPhoto], [TopColor], [SeasonID], [OccassionID]) VALUES (7, N'Raincoat', N'/Content/images/topimages/raincoat.jpg', N'Blue', 2, 3)
INSERT [dbo].[Top] ([TopID], [TopName], [TopPhoto], [TopColor], [SeasonID], [OccassionID]) VALUES (8, N'Blouse', N'/Content/images/topimages/blouse.jpg', N'Orange', 2, 4)
SET IDENTITY_INSERT [dbo].[Top] OFF
ALTER TABLE [dbo].[Accessory]  WITH CHECK ADD  CONSTRAINT [FK_Accessory_Occassion] FOREIGN KEY([OccassionID])
REFERENCES [dbo].[Occassion] ([OccassionID])
GO
ALTER TABLE [dbo].[Accessory] CHECK CONSTRAINT [FK_Accessory_Occassion]
GO
ALTER TABLE [dbo].[Accessory]  WITH CHECK ADD  CONSTRAINT [FK_Accessory_Season] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[Season] ([SeasonID])
GO
ALTER TABLE [dbo].[Accessory] CHECK CONSTRAINT [FK_Accessory_Season]
GO
ALTER TABLE [dbo].[Bottom]  WITH CHECK ADD  CONSTRAINT [FK_Bottom_Occassion] FOREIGN KEY([OccassionID])
REFERENCES [dbo].[Occassion] ([OccassionID])
GO
ALTER TABLE [dbo].[Bottom] CHECK CONSTRAINT [FK_Bottom_Occassion]
GO
ALTER TABLE [dbo].[Bottom]  WITH CHECK ADD  CONSTRAINT [FK_Bottom_Season] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[Season] ([SeasonID])
GO
ALTER TABLE [dbo].[Bottom] CHECK CONSTRAINT [FK_Bottom_Season]
GO
ALTER TABLE [dbo].[Outfit]  WITH CHECK ADD  CONSTRAINT [FK_Outfit_Accessory] FOREIGN KEY([AccessoryID])
REFERENCES [dbo].[Accessory] ([AccessoryID])
GO
ALTER TABLE [dbo].[Outfit] CHECK CONSTRAINT [FK_Outfit_Accessory]
GO
ALTER TABLE [dbo].[Outfit]  WITH CHECK ADD  CONSTRAINT [FK_Outfit_Bottom] FOREIGN KEY([BottomID])
REFERENCES [dbo].[Bottom] ([BottomID])
GO
ALTER TABLE [dbo].[Outfit] CHECK CONSTRAINT [FK_Outfit_Bottom]
GO
ALTER TABLE [dbo].[Outfit]  WITH CHECK ADD  CONSTRAINT [FK_Outfit_Occassion] FOREIGN KEY([OccassionID])
REFERENCES [dbo].[Occassion] ([OccassionID])
GO
ALTER TABLE [dbo].[Outfit] CHECK CONSTRAINT [FK_Outfit_Occassion]
GO
ALTER TABLE [dbo].[Outfit]  WITH CHECK ADD  CONSTRAINT [FK_Outfit_Season] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[Season] ([SeasonID])
GO
ALTER TABLE [dbo].[Outfit] CHECK CONSTRAINT [FK_Outfit_Season]
GO
ALTER TABLE [dbo].[Outfit]  WITH CHECK ADD  CONSTRAINT [FK_Outfit_Shoe] FOREIGN KEY([ShoeID])
REFERENCES [dbo].[Shoe] ([ShoeID])
GO
ALTER TABLE [dbo].[Outfit] CHECK CONSTRAINT [FK_Outfit_Shoe]
GO
ALTER TABLE [dbo].[Outfit]  WITH CHECK ADD  CONSTRAINT [FK_Outfit_Top] FOREIGN KEY([TopID])
REFERENCES [dbo].[Top] ([TopID])
GO
ALTER TABLE [dbo].[Outfit] CHECK CONSTRAINT [FK_Outfit_Top]
GO
ALTER TABLE [dbo].[Shoe]  WITH CHECK ADD  CONSTRAINT [FK_Shoe_Occassion] FOREIGN KEY([OccassionID])
REFERENCES [dbo].[Occassion] ([OccassionID])
GO
ALTER TABLE [dbo].[Shoe] CHECK CONSTRAINT [FK_Shoe_Occassion]
GO
ALTER TABLE [dbo].[Shoe]  WITH CHECK ADD  CONSTRAINT [FK_Shoe_Season] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[Season] ([SeasonID])
GO
ALTER TABLE [dbo].[Shoe] CHECK CONSTRAINT [FK_Shoe_Season]
GO
ALTER TABLE [dbo].[Top]  WITH CHECK ADD  CONSTRAINT [FK_Top_Occassion] FOREIGN KEY([OccassionID])
REFERENCES [dbo].[Occassion] ([OccassionID])
GO
ALTER TABLE [dbo].[Top] CHECK CONSTRAINT [FK_Top_Occassion]
GO
ALTER TABLE [dbo].[Top]  WITH CHECK ADD  CONSTRAINT [FK_Top_Season] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[Season] ([SeasonID])
GO
ALTER TABLE [dbo].[Top] CHECK CONSTRAINT [FK_Top_Season]
GO
USE [master]
GO
ALTER DATABASE [ClothingProject] SET  READ_WRITE 
GO
