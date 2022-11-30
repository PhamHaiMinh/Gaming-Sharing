USE [GamingSharing]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 01/12/2022 00:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[aid] [int] NOT NULL,
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 01/12/2022 00:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[qid] [int] NOT NULL,
	[anid] [int] NOT NULL,
	[answer] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[anid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 01/12/2022 00:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[bid] [int] NOT NULL,
	[tittle] [varchar](58) NOT NULL,
	[body] [varchar](8000) NOT NULL,
	[create_time] [date] NOT NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[bid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 01/12/2022 00:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cid] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 01/12/2022 00:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[caid] [int] NOT NULL,
	[name] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[caid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category Detail]    Script Date: 01/12/2022 00:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category Detail](
	[attribute] [varchar](150) NOT NULL,
	[caid] [int] NOT NULL,
 CONSTRAINT [PK_Category Detail] PRIMARY KEY CLUSTERED 
(
	[attribute] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 01/12/2022 00:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[aid] [int] NOT NULL,
	[cid] [int] NOT NULL,
	[name] [varchar](150) NOT NULL,
	[gender] [bit] NOT NULL,
	[phone] [varchar](150) NOT NULL,
	[address1] [varchar](150) NOT NULL,
	[address2] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 01/12/2022 00:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[anid] [int] NOT NULL,
	[quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 01/12/2022 00:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[oid] [int] NOT NULL,
	[cid] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[create_time] [date] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 01/12/2022 00:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[pid] [int] NOT NULL,
	[name] [varchar](150) NOT NULL,
	[price] [int] NOT NULL,
	[view] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product Detail]    Script Date: 01/12/2022 00:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product Detail](
	[pid] [int] NOT NULL,
	[caid] [int] NOT NULL,
	[attribute] [varchar](150) NOT NULL,
	[value] [varchar](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 01/12/2022 00:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[qid] [int] NOT NULL,
	[question] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[qid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 01/12/2022 00:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[rid] [int] NOT NULL,
	[name] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role Detail]    Script Date: 01/12/2022 00:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role Detail](
	[rid] [int] NOT NULL,
	[authority] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Role Detail] PRIMARY KEY CLUSTERED 
(
	[authority] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 01/12/2022 00:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[aid] [int] NOT NULL,
	[sid] [int] NOT NULL,
	[name] [varchar](150) NOT NULL,
	[gender] [bit] NOT NULL,
	[phone] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff_Role]    Script Date: 01/12/2022 00:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff_Role](
	[aid] [int] NOT NULL,
	[rid] [int] NOT NULL,
	[authority] [varchar](150) NOT NULL,
	[active] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question] FOREIGN KEY([qid])
REFERENCES [dbo].[Question] ([qid])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Customer] FOREIGN KEY([cid])
REFERENCES [dbo].[Customer] ([cid])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Customer]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([pid])
REFERENCES [dbo].[Product] ([pid])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[Category Detail]  WITH CHECK ADD  CONSTRAINT [FK_Category Detail_Category] FOREIGN KEY([caid])
REFERENCES [dbo].[Category] ([caid])
GO
ALTER TABLE [dbo].[Category Detail] CHECK CONSTRAINT [FK_Category Detail_Category]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Account] FOREIGN KEY([aid])
REFERENCES [dbo].[Account] ([aid])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Account]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Answer] FOREIGN KEY([anid])
REFERENCES [dbo].[Answer] ([anid])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Answer]
GO
ALTER TABLE [dbo].[Product Detail]  WITH CHECK ADD  CONSTRAINT [FK_Product Detail_Category] FOREIGN KEY([caid])
REFERENCES [dbo].[Category] ([caid])
GO
ALTER TABLE [dbo].[Product Detail] CHECK CONSTRAINT [FK_Product Detail_Category]
GO
ALTER TABLE [dbo].[Product Detail]  WITH CHECK ADD  CONSTRAINT [FK_Product Detail_Category Detail] FOREIGN KEY([attribute])
REFERENCES [dbo].[Category Detail] ([attribute])
GO
ALTER TABLE [dbo].[Product Detail] CHECK CONSTRAINT [FK_Product Detail_Category Detail]
GO
ALTER TABLE [dbo].[Product Detail]  WITH CHECK ADD  CONSTRAINT [FK_Product Detail_Product] FOREIGN KEY([pid])
REFERENCES [dbo].[Product] ([pid])
GO
ALTER TABLE [dbo].[Product Detail] CHECK CONSTRAINT [FK_Product Detail_Product]
GO
ALTER TABLE [dbo].[Role Detail]  WITH CHECK ADD  CONSTRAINT [FK_Role Detail_Role] FOREIGN KEY([rid])
REFERENCES [dbo].[Role] ([rid])
GO
ALTER TABLE [dbo].[Role Detail] CHECK CONSTRAINT [FK_Role Detail_Role]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Account] FOREIGN KEY([aid])
REFERENCES [dbo].[Account] ([aid])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Account]
GO
ALTER TABLE [dbo].[Staff_Role]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Role_Account] FOREIGN KEY([aid])
REFERENCES [dbo].[Account] ([aid])
GO
ALTER TABLE [dbo].[Staff_Role] CHECK CONSTRAINT [FK_Staff_Role_Account]
GO
ALTER TABLE [dbo].[Staff_Role]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Role_Role] FOREIGN KEY([rid])
REFERENCES [dbo].[Role] ([rid])
GO
ALTER TABLE [dbo].[Staff_Role] CHECK CONSTRAINT [FK_Staff_Role_Role]
GO
ALTER TABLE [dbo].[Staff_Role]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Role_Role Detail] FOREIGN KEY([authority])
REFERENCES [dbo].[Role Detail] ([authority])
GO
ALTER TABLE [dbo].[Staff_Role] CHECK CONSTRAINT [FK_Staff_Role_Role Detail]
GO
