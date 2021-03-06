USE [master]
GO
/****** Object:  Database [SaleOnline]    Script Date: 5/7/2018 6:21:43 PM ******/
CREATE DATABASE [SaleOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SaleOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\SaleOnline.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SaleOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\SaleOnline_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SaleOnline] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SaleOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SaleOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SaleOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SaleOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SaleOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SaleOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [SaleOnline] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SaleOnline] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SaleOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SaleOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SaleOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SaleOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SaleOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SaleOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SaleOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SaleOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SaleOnline] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SaleOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SaleOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SaleOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SaleOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SaleOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SaleOnline] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SaleOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SaleOnline] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SaleOnline] SET  MULTI_USER 
GO
ALTER DATABASE [SaleOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SaleOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SaleOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SaleOnline] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [SaleOnline]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 5/7/2018 6:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 5/7/2018 6:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[UserName] [nvarchar](30) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[Role] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Accounts] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/7/2018 6:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](25) NOT NULL,
	[Description] [ntext] NULL,
 CONSTRAINT [PK_dbo.Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 5/7/2018 6:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [nvarchar](30) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[ContactName] [nvarchar](30) NULL,
	[Address] [nvarchar](100) NULL,
	[Phone] [nvarchar](24) NULL,
 CONSTRAINT [PK_dbo.Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 5/7/2018 6:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[FeedId] [int] IDENTITY(1,1) NOT NULL,
	[FeedTitle] [nvarchar](100) NULL,
	[FeedContent] [nvarchar](max) NULL,
	[FeedDate] [datetime] NOT NULL,
	[CustomerID] [nvarchar](30) NULL,
 CONSTRAINT [PK_dbo.Feedbacks] PRIMARY KEY CLUSTERED 
(
	[FeedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 5/7/2018 6:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[OrderID] [nvarchar](30) NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [smallint] NOT NULL,
 CONSTRAINT [PK_dbo.Order_Detail] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/7/2018 6:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [nvarchar](30) NOT NULL,
	[CustomerID] [nvarchar](30) NULL,
	[OrderDate] [datetime] NOT NULL,
	[RequiredDate] [datetime] NOT NULL,
	[ShippedDate] [datetime] NOT NULL,
	[Freight] [money] NOT NULL,
	[ShipAddress] [nvarchar](60) NULL,
 CONSTRAINT [PK_dbo.Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/7/2018 6:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](40) NOT NULL,
	[SupplierID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[ProductImage] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 5/7/2018 6:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[Address] [nvarchar](60) NULL,
	[Phone] [nvarchar](24) NULL,
 CONSTRAINT [PK_dbo.Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201805070823380_Son', N'DA.Migrations.Configuration', 0x1F8B0800000000000400E55DDB6EE4B8117D0F907F10F49404B36EDB73C1C6E8DE85D31E0746D663C7ED59E46D404B745B595D7A25B66323D82FDB877C527E21D48D7752A49A7DD909E6A52D92C562D561B1586471FEFBEB7FA6DFBF6469F00CCB2A29F2597872741C06308F8A38C997B3708D1EBFF936FCFEBBDFFF6EFA31CE5E821FFB7A6FEB7AB8655ECDC2278456679349153DC10C544759129545553CA2A3A8C826202E26A7C7C77F9E9C9C4C202611625A4130BD5BE728C960F307FE735EE4115CA13548AF8B18A655F71D972C1AAAC12790C16A0522380B2FCEC3E03C4D00EE7901D3C73000795E2080305F679F2BB84065912F172BFC01A4F7AF2B88EB3D82B4821DBF67B4BA2DEBC7A735EB13DAB02715AD2B54648E044FDE76B29888CD47493424B2C2D2FA88A58A5EEB5137129B85E7515460518781D8D7D93C2DEB7AB3F0B6FC6723F4A3AEEE9BA0FFF286E81BC3A2FEF72698AF53B42EE12C876B54025CE376FD9026D1DFE0EB7DF113CC67F93A4D598E304FB88CFB803FDD96C50A96E8F50E3E767C62C595F5AF3098F0AD276273D2586AD90E07EB1F43370CAEC1CB0F305FA2270C568CD5CBE405C6FD870E0F9FF304031DB741E51AFFF909F30E1E5248CA27C68E6F4155FDAB286343C7EFED3A36F77357A4A6C1E19FCE9D4C27142846F8CC0182CBA27CB5C24F5F792F00EA3BBFBA708710DBB61DD3558EDE9E2A10C18C7F818A12FE15E6B0C4ADE35B80102CB101B88A6123C421ADF67D0E40F7F4FD36A07B01ABA84C56ADCDF18A2CDCD727F09C2C1B198913A62CE27584AA30B8836953A17A4A56AD153FEA0ABF50C45D964556639F3424655FEE41B984D8A8DD179A0A8B625D466341DF51B3C27C57772F90EFFA1E8378A6E9AE00DF753980F7775B31D58BF56A9526B01C1EAFDDA4DD94CEDFD7A093D92654B04CD06D9944449E17304A329086188CF857E7D07D1B068B08D444DD7BE8619281A5496927C73ED6B9FD18256A6F36354ABDCDD11AA5DE6AD9B27653C6B0FC7201114852B5D1646B7C21668BF2A82A978CA7B292CA809A78ED6798518CB4922CC6BE4C2B46524125466BDBCE0ED6CAC0B30DF662E51B06641BEF7B4520DDECDA8BF6B7127D2AF203B0990ADB7EF261988AD90A1866BF6025C4C9CF156BE63E5FC775EA13BBE3CB408916C068C5C65B01FBE97F48F3FE7067F2BC91A69FAECD3D3523BCC0739F4C62FCFB3EC9DC79BE833FAF9312C65E882D30EE579E685D9630593EA1AD59A99AD7F3382E615519B4F56194B6F4BE56871083A9A0554423D19768CC0329DE9697E56467D53CAA6DF1B8C00C91934D60A6ABBC9FC00C63169C03331E4DCA8146F7E6458EC0E0B6D88BD91C9EEF7E3672B74F8D23A68F69BDF36A552E218C1F40F4937AF2F6A54ACB22154A0E925CC3D53D6A26BDC9B058983CB5DB6664C9DA92F423B4B2247DE5BD5892BAF3ABD8DD8AF4ED7615E9AAFBBB4F90316AEF67A6D53DD50604E6C87FC844D19717D7668B7EE238CFC3D144886BBBDE888C9A8F344862311FFBCA7B998F6C54D5754EDA47643D1EB914D90AE443272EDB89406FCBD7DEEFD26B75A26315F5D39DE84861419B39755E55459434FCF08CD2402E3FC08F791C0C45755B913203C382C5132BC1EC45988759F827496E06B264BC942C0D32F3744F42712ADEE41730850806E7517BEB600EAA08C48AC373CC01FF05CF5E58D6D305A478E1A8B03D4872244FF5248F92154807B817DA399ECBD6FC919EC4920BB882793DAF07F4B2390BA427417443929A4E189899D1272F303A9C18561B0A14EAB1D903D0E0E9320824EB1F4FF8F8E8E844A23D0A495A36ACF4A8DD493A41492BE3CD79D80196843D834EDFBA980955761703B587906E4FB24BFCA879D82178D472FD0D21870F639975AD89690D60C8EB7A6566498141FE806F08DD1B8050291C1B20E80FF45C61A814C6862CEC0C88C2A19059EDBA13A2B17A1FA0AFC095C6E9DBBF73661A800D16B467C62300A956D3C65CEC0093D26665C89397EF2B78D920C81B224A966EA40E0D833AEE6D34AF8F228CDA20887AD99C05EFE86B37AD4DE03FC961D93301527893A7F84B13D17B51DD3FFC5CC12E0654755B75114F35E50544FCED6FBC3FA71BE50E4CE462B804499E44B7794AA08A08DDB20E50A181028906992C032484F337890EBF00D810D35219164AE7CB2965429CE00122CCB98544846EF10688F4D05511A1F64220C2E052521173D78DA9A6BB0F274E168B400A19018B0A69D659844E18422C48450BC70FD642108A70B02C89812DBDE5A69E190283068330F4DB78561A149D1B0B433CA2922561DA90DA6C4919C6FB596910806613BAD5D10B96472702C3CECA7A6F354618EA2D914889F2EF492AE2A52E9D584C7EBEBDA76F3B1C7BDFDEC20E8D908D1CF4D65B51B5AF69E76D8EB5A2927FC91062D6126B39F42178E2CD90B2E9A44DDDEB3E4C279A1CBFE93558AD927CC9E4FC755F82459BF037FF66E19E1997B5342611371545DF8BF4848A122CA1505A1F19C5F032292B7401107800F551C93CCEA46AB2EFA659B5FBFE04F74CD65BBF94F70DEADFDD35F973E2BBC9BE6D57FD120F26AB7DE3E6C48C51B1B66550675A821494E27D59925D372FD275969BB3F54C94E8851A9612FD6A4FA94D8863A9B45F640AD3892010C9B997242DED8F78CD59E99571471C35AB73AC2C54AB6FAA93237B2EC24AD3745E324C4D460B5F624F914B086109720507A37562871D75AE59192D54AE6DA99D8334CAC24D427DF0659096AC6EAEC09E1EBB0967C99936E77A6A7EB14DEFF4B3B4E8577B4A4CFE016750E967670D74D9592A85B6255FED8C1BF2B88DD38E8B17B8CF3D73739D8049E09D15AE361A3FAC7A1F13D92724DD27CA3EA1330E3363C1B27B94B0478E9C11341C450E70D5DE0094F86A3F3BB8705CDE05E7CA71250ECB079B7CC1AD1F6C813D3D9280C1D2221FDDF82297BF44BE48C1C1CC0B1A3D71F55C3501201BCF55DB7437C0F6B733E12EF3738CB105F6F494C03180463BC2F65A2037BC2745B6640B9CBD008FC63F1D814742E5EEC0D337D55A85EE2A39671494D7D287A87417C44542DD67375AE40AB8488D14B8D1938D28FDBAEDD5674FF0A3B12F47F8E9827816F0D337DDD11E89BD0FCD5B2BA6E0FFD85A49C14DB10AE99D04398560E6B40B2C0EBF6A26451ADB2A75C667F19CC44D94F1B542303BAA2B1C2D7E4EE758E3F5DCEE2B5C833C7984156A2FF587A7C727A7C2436987F368D9A4AAE254119855BC5CC6AB6BC78F89E5CFA08C9E4029E5A66C984DA8A4FB9EA3EBFA34584FF20F1978F9A39990FBF35F2394E0F741AEA446FA60FEC7C8E77C06355EBFC2B5F9135BDDAD0E2F9A515F9BDBF9B3515B510B17403468E59DFB3C94D38E12E5E38857790C5F66E1BF9B6667C1D53FBED0966F8266CB7B161C07BF787841CA9601DA722306C4E7499AEE377D782AC3ABF3683D73AF4B2915DD244BBA5946D5F4DB8281D447010FF9711F2A640BDC756D79D06DB81A2ACD88052FA4E14653C0137CC5995465204D87A793E32335FE40B5014C3653B79CF0EB0440DADC1283A39E9089F16FE4EB0999D1C4144FC88CA6253C21330EE48A776294B0F830A001F7874DC6B89C5E9F1A3970DF5FF1708805C723DE09F1B52473B9C96A37FB9D2710A9037BBB7C65622B8EB1F4B0842FD528DE9170F096D4F4BCD8B0FD2F1DEEEF368CC09CDF9714B6B357961F4FF0B529F3B1BEECD2DC6CF0BC00BD5CBFEBC47FE92AE8B88CA551E941865B6D2E71A360443ED0D7F64000BD893F36EF5A4E2618F9B8C03828E88F895DFC392728184E085DFB3C9C047F9F40E8929EDC1F07F8CD40407771E760F5EF90A6BFE78CFC3EE36E0F39F83B4EB7D7DE1574EAF4D012EC1DDC81AF10472E6E82E176E536B164ECF69052E369CED3AE93D6F7E9DC1A2E80B86CF4B6E6DC1E4472BB9C47252A5099B86ECA5B6FEF47CCC2F8A1C0DA6EF77034DF7D28819B6CB9A40E6891AA0743A6B1D807819DD4052951F570AB4B4614E9F3D651EA842F56F5E49E31AF4F98D7D2B7D005715A655D9022A52EB499BE621774532375418B545D68B3B2B589F8C63C7C5517FAACCB5DA4E98B13814F25B3C82855A5A27AC8A3F59E842FA28CBF796C1AA8081EFEEAA8AF746A2F29F6E307C94D6F2667C1D7F0B691433FCCAEC1CDD4A5F2F81AB0F7F47887F9B697614B6EE26699EFA23DE56FCC6EDF303924B6CB773CB1FFC4FCFFB6D87DAB92252551FF6FB7398C38CF89D4B9CA1F8BDE891338EAAB0881EE6BACC118BB55E7254A1E4184707104ABAA79FAF74790AE71958FD9038CAFF29B355AAD111E32CC1E52CEBAD78EA0A9FF267B9FE7797AD3DCAEA97C0C01B399D4674437F95FD6491A13BE2F15D72734246A0FB33BEEA87589EA638FE52BA124FFDF503A429DF888637C0FB3558A895537F9023CC331BC7DAEE00F7009A2D7FEAAAE9EC8B02278B14F2F12B02C41567534687BFC27C6709CBD7CF73F79F5ED50E6790000, N'6.1.3-40302')
INSERT [dbo].[Accounts] ([UserName], [Password], [Role]) VALUES (N'di', N'0000', N'User')
INSERT [dbo].[Accounts] ([UserName], [Password], [Role]) VALUES (N'min', N'0000', N' Admin')
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (1, N'Casio', NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (2, N'Timex', NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (3, N'Citizen', NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
INSERT [dbo].[Customers] ([CustomerID], [Password], [ContactName], [Address], [Phone]) VALUES (N'', NULL, NULL, NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [Password], [ContactName], [Address], [Phone]) VALUES (N'1', N'1234', N'Di', N'19 Nguyễn Thái Sơn p4 ', N'0123465788')
INSERT [dbo].[Customers] ([CustomerID], [Password], [ContactName], [Address], [Phone]) VALUES (N'2', N'0000', N'Di1', N'22 Lê Lợi quận 4', N'0165445003')
INSERT [dbo].[Order_Detail] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (N'min_2018050701', 15, 140.0000, 2)
INSERT [dbo].[Order_Detail] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (N'min_2018050701', 30, 460.0000, 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress]) VALUES (N'min_2018050701', N'1', CAST(0x0000A8D901232504 AS DateTime), CAST(0x0000A8D901232504 AS DateTime), CAST(0x0000A8DC01232504 AS DateTime), 0.0000, N'')
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Quantity], [UnitPrice], [ProductImage], [Description]) VALUES (1, N'Casio W-217H-1AVDF', 1, 1, 8, 650.0000, N'W-217H-1AVDF-000.jpg', N'Dây Nhựa - Chống Nước 50m - Pin 7 Năm, Size mặt 43,1 x 41,2 x 10,5 mm')
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Quantity], [UnitPrice], [ProductImage], [Description]) VALUES (15, N'Casio AEQ-100W-2AVDF World Time', 1, 1, 5, 140.0000, N'AEQ-110W-1BVDF.jpg', N'Đồng hồ Casio AEQ-100W-2AVDF thuộc dòng đồng hồ World Time ( Giờ thế giới) cập nhật theo hơn 29 múi giờ của 30 thành phố trên thế giới giúp bạn có thể cập nhật thời gian một cách dễ dàng.')
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Quantity], [UnitPrice], [ProductImage], [Description]) VALUES (17, N'Casio LA670WEM-7', 1, 1, 6, 1019.0000, N'LA670WEM-7.jpg', N'
Đồng Hồ Nữ Casio LA670WEM-7 điện tử dây đeo kim loại dạng lưới cao cấp thiết kế mới nhất 2018 thiết kế giữa cổ điển nhưng không kém phần tinh tế.

Đồng hồ Casio LA670WEM-7 dây đeo kim loại dành cho phái đẹp với thiết kế cá tính, với hơn 70 thập kỷ hình thành và phát triển những mẫu đồng hồ Casio ra đời luôn được mọi người yêu thích và đón nhận, không chỉ các bạn nam mà các bạn nữ cũng có nhu cầu làm đẹp chính vì vậy chiếc đồng hồ nữ này rất phù hợp với những bạn nữ cá tính.')
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Quantity], [UnitPrice], [ProductImage], [Description]) VALUES (18, N'Casio Sheen SHE-3052D-7AUDR', 1, 1, 3, 3700.0000, N'SHE-3052D-7AUDR-0.jpg', N'Đồng Hồ Nữ Casio Sheen SHE-3052D-7AUDR dây đeo kim loại, mặt số khảm trai cùng vạch giờ bằng pha lê Swarovski® lấp lánh, size mặt 33,2mm')
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Quantity], [UnitPrice], [ProductImage], [Description]) VALUES (19, N'Casio MTP-V300G-7AUDF', 1, 1, 6, 1900.0000, N'600-1.jpg', N'Chất lượng của Đồng hồ nam Casio MTP-V300G-7AUDF đạt các tiêu chuẩn của hãng đồng hồ Casio: khả năng chống nước, chống va đập, chầy xước, độ chính xác +-20 giây/tháng, vỏ và dây đeo làm từ thép chống gì 316l (inox cao cấp) bền bỉ với thời gian. Với mặt đồng hồ 6 kim thì người đeo dễ dàng nắm bắt thời gian của mình một cách chính xác tuyệt đối và hoàn hảo nhất. Thiết kế mặt kính cường lực mang lại cho chiếc đồng hồ sự sáng bóng và bền màu nhất')
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Quantity], [UnitPrice], [ProductImage], [Description]) VALUES (20, N'TIMEX NAM EXPEDITION SCOUT TW4B01800', 2, 2, 10, 1670.0000, N'TW4B01800-220x286.jpg', N'Đồng hồ Timex nam Expedition Scout TW4B01800 dây da nâu là một trong những item bán chạy nhất của Timex nằm trong bộ sưu tập Expedition nổi tiếng. Mang phong cách vừa cổ điển pha lẫn sự sắc sảo và tinh tế đi kèm tính năng Chronograph hiện đại, phụ kiện này vô cùng thích hợp cho những chàng trai công sở.')
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Quantity], [UnitPrice], [ProductImage], [Description]) VALUES (21, N'TIMEX NỮ ORIGINALS CLASSIC ROUND T2N791', 2, 2, 7, 1530.0000, N'T2N791-768x768.jpg', N'Đồng hồ Timex nữ Originals Classic Round T2N791 dây da trắng chính là item được săn đón khá nhiều nằm trong bộ sưu tập Originals của đồng hồ Timex. Với thiết kế đơn giản, màu sắc tinh tế, trả trung, hứa hẹn sẽ là món phụ kiện bắt mắt dành cho các bạn nữ cá tính và năng động.')
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Quantity], [UnitPrice], [ProductImage], [Description]) VALUES (22, N'TIMEX NỮ ASHLAND TW2P80500', 2, 2, 6, 167.0000, N'TW2P80500-768x922.png', N'Được chế tạo dựa trên công nghệ tiên tiến mang đến độ chính xác cao, đồng hồ Timex nữ Ashland TW2P80500 dây kim loại bạc giúp người sử dụng luôn cảm thấy an tâm. Với Timex, giờ đây, quỹ thời gian của bạn sẽ được quản lý khoa học và hợp lý hơn.')
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Quantity], [UnitPrice], [ProductImage], [Description]) VALUES (23, N'TIMEX NAM TAFT STREET T2P390', 2, 2, 5, 180.0000, N'T2P390-768x768.jpg', N'Với kiểu dáng nam tính, mạnh mẽ, chiếc Timex Elevated Classic T2P390 là phụ kiện thời trang không thể thiếu của những anh chàng lịch lãm. Mặt đồng hồ và dây đeo cùng tông màu được làm bằng thép không gỉ. Đồng hồ hiển thị chữ số Ả Rập đầy đủ 24 giờ. Đặc biệt đồng hồ chuyển động theo công nghệ Analog thạch anh với bề mặt bọc khoáng tinh thể chống trầy xước. Ở hướng 3:00 còn có cửa sổ hiển thị ngày tháng. Điểm đặc biệt ở chiếc đồng hồ này là có khả năng chống thấm nước ở độ sâu 50m nên thích hợp để diện khi đi bơi hay tắm biển.')
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Quantity], [UnitPrice], [ProductImage], [Description]) VALUES (25, N'TIMEX NAM ORIGINALS WEEKENDER TW2P62100', 2, 2, 9, 203.0000, N'TW2P62100-768x768.jpg', N'Đồng hồ Timex nam Originals Weekender Chronograph TW2P62100 dây da xanh nằm trong bộ sưu tập Weekender Chronograph nổi tiếng kỷ niệm 160 thành lập thương hiệu Timex. Với thiết kế bản to, hiển thị vạch ký tự trên nền mặt đồng hồ đầy cá tính, đây ắt hẳn là item yêu thích của những anh chàng yêu thích đồng hồ kim loại, có phong cách thời trang phóng khoáng, cá tính, sang trọng và đầy bản lĩnh.')
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Quantity], [UnitPrice], [ProductImage], [Description]) VALUES (26, N'Citizen EJ6134-50A Quartz ', 3, 3, 7, 390.0000, N'EJ6134-50A-0.jpg', N'Đồng hồ nữ Citizen EJ6134-50A dây đeo kim loại cao cấp viền mặt đính đá SWAROVSKI, chính hãng được sản xuất tại Nhật Bản.

Đồng hồ Citizen EJ6134-50A với những nét tinh tế, quyến rũ từ bộ sưu tập Citizen Ladies cao cấp. Bộ sưu tập là những sản phẩm thực sự tinh xảo với những đường nét và chi tiết thiết kế cùng chất liệu đặc biệt dành riêng cho nữ giới tạo nên vẻ mềm mại đặc biệt, thực sự thời trang')
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Quantity], [UnitPrice], [ProductImage], [Description]) VALUES (27, N'Citizen AN3614-54A Quartz', 3, 3, 8, 560.0000, N'AN3614-54A-0.jpg', N'Đồng hồ nam Citizen AN3614-54A Quartz được kết hợp độc đáo giữa thép không gỉ với công nghệ mạ vàng số 1 thụy Sĩ hiện nay tạo nên sản phẩm siêu hot dành cho phái mạnh.

Công nghệ vàng và bạc kết hợp với thiết kế của chiếc đồng hồ này, với sự quay số dễ đọc với các dấu hiệu vàng, viền nổi màu bạc và các điểm nhấn vàng trang trí cho ban nhạc. Thêm vào sự quyến rũ quyến rũ của nó, phần này sử dụng một chiếc Chronograph chính xác trong vòng một giây trong 12 giờ để đảm bảo rằng phong cách của bạn được kết hợp bằng hiệu suất.')
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Quantity], [UnitPrice], [ProductImage], [Description]) VALUES (28, N'Citizen NP1010-01L', 3, 3, 5, 870.0000, N'NP1010-01L(1).jpg', N'Đồng hồ Citizen Automatic hay còn gọi là đồng hồ Citizen cơ luôn được xem là người hùng thầm lặng của thương hiệu đồng hồ Citizen. Đồng hồ automatic của Citizen luôn là sự kết hợp tinh tế của 2 phong cách cổ xưa và hiện đại, chúng luôn là những sản phẩm được chờ đợi nhiều nhất trong phân khúc đồng hồ cơ  giá bình dân.')
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Quantity], [UnitPrice], [ProductImage], [Description]) VALUES (29, N'Citizen PD7164-09A', 3, 3, 8, 820.0000, N'PD7164-09A(1).jpg', N'Chúng tôi xin giới thiệu tới các tín đồ thời trang mẫu sản phẩm đồng hồ nữ Citizen PD7164-09A cao cấp, thiết kế độc đáo đẹp mắt dành riêng cho phái nữ.

Đồng hồ Citizen PD7164-09A nằm trong BST Citizen dây da được nhiều giới trẻ ưa chuộng hiện nay. Thiết kế kiểu dáng trẻ trung, đơn giản tinh tế phù hợp với mọi trang phục. Chất liệu dây da thuộc mềm mại, qua xử lý đánh bóng có độ bền cao và thoải mái khi đeo tay.')
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Quantity], [UnitPrice], [ProductImage], [Description]) VALUES (30, N'Citizen BM6774-51C', 3, 3, 8, 460.0000, N'Citizen BM6774-51C.jpg', N'Sự đơn giản chính là điểm nhấn trong thiết kế của dòng sản phẩm đồng hồ nam này. Vỏ và dây đồng hồ được làm từ chất liệu thép không gỉ cao cấp, luôn giữ được độ sáng bóng, không thấm mồ hôi. Các mắt xích của dây đeo chắc chắn, được liên kết một cách chặt chẽ, chốt cài gập 1 lần. Nổi bật hơn là 2 đường mắt xích ở giữa dây đeo được mạ vàng càng làm tăng thêm vẻ sang trọng cho chiếc đồng hồ.')
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address], [Phone]) VALUES (1, N'Casio VN', N'12 Cao Thắng quận 3 TPHCM', N'02349855')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address], [Phone]) VALUES (2, N'Timex VN', N'19 Nguyễn Văn Bảo quận Gò Vấp TPHCM', N'02487944')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address], [Phone]) VALUES (3, N'Citizen VN', N'28 Vương Gia Khải quận 1 TPHCM', N'02281100')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CustomerID]    Script Date: 5/7/2018 6:21:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_CustomerID] ON [dbo].[Feedbacks]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_OrderID]    Script Date: 5/7/2018 6:21:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderID] ON [dbo].[Order_Detail]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductID]    Script Date: 5/7/2018 6:21:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductID] ON [dbo].[Order_Detail]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CustomerID]    Script Date: 5/7/2018 6:21:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_CustomerID] ON [dbo].[Orders]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategoryID]    Script Date: 5/7/2018 6:21:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_CategoryID] ON [dbo].[Products]
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SupplierID]    Script Date: 5/7/2018 6:21:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_SupplierID] ON [dbo].[Products]
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Feedbacks_dbo.Customers_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Feedbacks] CHECK CONSTRAINT [FK_dbo.Feedbacks_dbo.Customers_CustomerID]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Order_Detail_dbo.Orders_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_dbo.Order_Detail_dbo.Orders_OrderID]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Order_Detail_dbo.Products_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_dbo.Order_Detail_dbo.Products_ProductID]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Orders_dbo.Customers_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_dbo.Orders_dbo.Customers_CustomerID]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Products_dbo.Categories_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_dbo.Products_dbo.Categories_CategoryID]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Products_dbo.Suppliers_SupplierID] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_dbo.Products_dbo.Suppliers_SupplierID]
GO
USE [master]
GO
ALTER DATABASE [SaleOnline] SET  READ_WRITE 
GO
