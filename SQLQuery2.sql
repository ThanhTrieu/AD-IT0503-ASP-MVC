USE [TrainingFPT]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/26/2024 4:03:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[PosterImage] [varchar](max) NOT NULL,
	[ParentId] [int] NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 3/26/2024 4:03:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[NameCourse] [varchar](50) NOT NULL,
	[Description] [varchar](200) NOT NULL,
	[Image] [varchar](max) NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[LikeCourse] [int] NULL,
	[StarCourse] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/26/2024 4:03:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](200) NULL,
	[Status] [varchar](50) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topics]    Script Date: 3/26/2024 4:03:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topics](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameTopic] [varchar](200) NOT NULL,
	[CouresId] [int] NOT NULL,
	[Description] [varchar](200) NOT NULL,
	[Video] [varchar](max) NULL,
	[Audio] [varchar](max) NULL,
	[DocumentTopic] [varchar](max) NULL,
	[LikeTopic] [int] NULL,
	[StarTopic] [int] NULL,
	[Status] [varchar](50) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_Topics] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TraineeCourse]    Script Date: 3/26/2024 4:03:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TraineeCourse](
	[UserId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainerTopic]    Script Date: 3/26/2024 4:03:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainerTopic](
	[UserId] [int] NOT NULL,
	[TopicId] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/26/2024 4:03:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Address] [varchar](200) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[ExtraCode] [varchar](50) NOT NULL,
	[Avatar] [varchar](max) NULL,
	[Education] [varchar](200) NULL,
	[ProgramingLang] [varchar](50) NULL,
	[ToeicScore] [int] NULL,
	[Skills] [varchar](max) NULL,
	[IPClient] [varchar](50) NULL,
	[LastLogin] [datetime] NULL,
	[LastLogout] [datetime] NULL,
	[Status] [varchar](50) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [DF_Categories_ParentId]  DEFAULT ((0)) FOR [ParentId]
GO
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [DF_Categories_Status]  DEFAULT ('Active') FOR [Status]
GO
ALTER TABLE [dbo].[Courses] ADD  CONSTRAINT [DF_Courses_Status]  DEFAULT ('Active') FOR [Status]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_Status]  DEFAULT ('Active') FOR [Status]
GO
ALTER TABLE [dbo].[Topics] ADD  CONSTRAINT [DF_Topics_Status]  DEFAULT ('Active') FOR [Status]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Status]  DEFAULT ('Active') FOR [Status]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Categories]
GO
ALTER TABLE [dbo].[Topics]  WITH CHECK ADD  CONSTRAINT [FK_Topics_Courses] FOREIGN KEY([CouresId])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[Topics] CHECK CONSTRAINT [FK_Topics_Courses]
GO
ALTER TABLE [dbo].[TraineeCourse]  WITH CHECK ADD  CONSTRAINT [FK_TraineeCourse_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[TraineeCourse] CHECK CONSTRAINT [FK_TraineeCourse_Courses]
GO
ALTER TABLE [dbo].[TraineeCourse]  WITH CHECK ADD  CONSTRAINT [FK_TraineeCourse_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[TraineeCourse] CHECK CONSTRAINT [FK_TraineeCourse_Users]
GO
ALTER TABLE [dbo].[TrainerTopic]  WITH CHECK ADD  CONSTRAINT [FK_TrainerTopic_Topics] FOREIGN KEY([TopicId])
REFERENCES [dbo].[Topics] ([Id])
GO
ALTER TABLE [dbo].[TrainerTopic] CHECK CONSTRAINT [FK_TrainerTopic_Topics]
GO
ALTER TABLE [dbo].[TrainerTopic]  WITH CHECK ADD  CONSTRAINT [FK_TrainerTopic_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[TrainerTopic] CHECK CONSTRAINT [FK_TrainerTopic_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
