USE [SMMS_1]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 6/24/2025 1:43:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[BlogId] [int] IDENTITY(1,1) NOT NULL,
	[ManagerId] [int] NULL,
	[Title] [nvarchar](200) NULL,
	[Content] [nvarchar](max) NULL,
	[DatePosted] [date] NULL,
	[Thumbnail] [nvarchar](200) NULL,
	[Category] [int] NULL,
 CONSTRAINT [PK__Blog__54379E30CB7A40D6] PRIMARY KEY CLUSTERED 
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConsentForm]    Script Date: 6/24/2025 1:43:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsentForm](
	[ConsentFormId] [int] IDENTITY(1,1) NOT NULL,
	[FormId] [int] NULL,
	[ParentId] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK__ConsentF__D6F184C05D279FB1] PRIMARY KEY CLUSTERED 
(
	[ConsentFormId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConsultationForm]    Script Date: 6/24/2025 1:43:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsultationForm](
	[ConsultationFormId] [int] IDENTITY(1,1) NOT NULL,
	[ConsultationScheduleId] [int] NULL,
	[ParentId] [int] NULL,
	[Title] [nvarchar](200) NULL,
	[Content] [nvarchar](250) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK__Consulta__1F12164408C9A26A] PRIMARY KEY CLUSTERED 
(
	[ConsultationFormId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConsultationSchedule]    Script Date: 6/24/2025 1:43:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsultationSchedule](
	[ConsultationScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[NurseId] [int] NULL,
	[StudentId] [int] NULL,
	[Location] [nvarchar](250) NULL,
	[ConsultDate] [datetime] NULL,
 CONSTRAINT [PK__Consulta__E128EB77987609A5] PRIMARY KEY CLUSTERED 
(
	[ConsultationScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Form]    Script Date: 6/24/2025 1:43:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Form](
	[FormId] [int] IDENTITY(1,1) NOT NULL,
	[ManagerId] [int] NULL,
	[SentDate] [datetime] NULL,
	[ClassName] [nvarchar](50) NULL,
	[Title] [nvarchar](200) NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK__Form__FB05B7DDF1589932] PRIMARY KEY CLUSTERED 
(
	[FormId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HealthCheckResult]    Script Date: 6/24/2025 1:43:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HealthCheckResult](
	[HealthCheckupRecordId] [int] IDENTITY(1,1) NOT NULL,
	[HealthCheckScheduleId] [int] NULL,
	[NurseId] [int] NULL,
	[HealthProfileId] [int] NULL,
	[Status] [int] NULL,
	[Height] [float] NULL,
	[Weight] [float] NULL,
	[LeftVision] [nvarchar](10) NULL,
	[RightVision] [nvarchar](10) NULL,
	[Result] [nvarchar](150) NULL,
	[Note] [nvarchar](250) NULL,
 CONSTRAINT [PK__HealthCh__96C627663748BE55] PRIMARY KEY CLUSTERED 
(
	[HealthCheckupRecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HealthCheckSchedule]    Script Date: 6/24/2025 1:43:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HealthCheckSchedule](
	[HealthCheckScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[FormId] [int] NULL,
	[ManagerId] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[CheckDate] [datetime] NULL,
	[Location] [nvarchar](100) NULL,
	[Note] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[HealthCheckScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HealthProfile]    Script Date: 6/24/2025 1:43:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HealthProfile](
	[HealthProfileId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[BloodType] [nvarchar](5) NULL,
	[Allergies] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[HealthProfileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 6/24/2025 1:43:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[ManagerId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[PhoneNumber] [nvarchar](15) NULL,
	[Email] [nvarchar](100) NULL,
	[PasswordHash] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[ManagerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalEvent]    Script Date: 6/24/2025 1:43:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalEvent](
	[EventId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[NurseId] [int] NULL,
	[EventName] [nvarchar](100) NULL,
	[EventDate] [datetime] NULL,
	[Symptoms] [nvarchar](100) NULL,
	[ActionTaken] [nvarchar](100) NULL,
	[Note] [nvarchar](250) NULL,
 CONSTRAINT [PK__MedicalE__7944C810172200E4] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalInventory]    Script Date: 6/24/2025 1:43:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalInventory](
	[MedicalInventoryId] [int] IDENTITY(1,1) NOT NULL,
	[ManagerId] [int] NULL,
	[Quantity] [int] NULL,
	[MedicalName] [nvarchar](50) NULL,
	[Unit] [nvarchar](20) NULL,
	[ExpiryDate] [date] NULL,
	[DateAdded] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MedicalInventoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medications]    Script Date: 6/24/2025 1:43:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medications](
	[MedicationId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[MedicationName] [nvarchar](100) NULL,
	[PrescriptionId] [int] NULL,
	[Dosage] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[RemainingQuantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MedicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nurse]    Script Date: 6/24/2025 1:43:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nurse](
	[NurseId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[Username] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[PasswordHash] [nvarchar](256) NULL
PRIMARY KEY CLUSTERED 
(
	[NurseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parent]    Script Date: 6/24/2025 1:43:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parent](
	[ParentId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[PhoneNumber] [nvarchar](15) NULL,
	[Email] [nvarchar](100) NULL,
	[Address] [nvarchar](250) NULL,
	[PasswordHash] [nvarchar](256) NULL
PRIMARY KEY CLUSTERED 
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParentPrescription]    Script Date: 6/24/2025 1:43:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParentPrescription](
	[PrescriptionId] [int] IDENTITY(1,1) NOT NULL,
	[NurseId] [int] NULL,
	[SubmittedDate] [date] NULL,
	[Schedule] [nvarchar](100) NULL,
	[ParentNote] [nvarchar](100) NULL,
	[ParentId] [int] NULL,
	[PrescriptionFile] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[PrescriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 6/24/2025 1:43:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NULL,
	[FullName] [nvarchar](100) NULL,
	[StudentNumber] [nvarchar](100) NULL,
	[ClassName] [nvarchar](100) NULL,
	[DateOfBirth] [date] NULL,
	[Gender] [nvarchar](10) NULL,
	[PasswordHash] [nvarchar](256) NULL,
 CONSTRAINT [PK__Student__32C52B99EC604026] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VaccinationResult]    Script Date: 6/24/2025 1:43:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VaccinationResult](
	[VaccinationResultId] [int] IDENTITY(1,1) NOT NULL,
	[VaccinationScheduleId] [int] NULL,
	[HealthProfileId] [int] NULL,
	[NurseId] [int] NULL,
	[Status] [int] NULL,
	[DoseNumber] [int] NULL,
	[Note] [nvarchar](150) NULL,
 CONSTRAINT [PK__Vaccinat__12DE8FF986ABA0AD] PRIMARY KEY CLUSTERED 
(
	[VaccinationResultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VaccinationSchedule]    Script Date: 6/24/2025 1:43:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VaccinationSchedule](
	[VaccinationScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[FormId] [int] NULL,
	[ManagerId] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[ScheduleDate] [datetime] NULL,
	[Location] [nvarchar](100) NULL,
	[Note] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[VaccinationScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([BlogId], [ManagerId], [Title], [Content], [DatePosted], [Thumbnail], [Category]) VALUES (1, 1, N'Phòng chống bệnh tay chân miệng', N'Thông tin về cách phòng chống bệnh tay chân miệng trong trường học.', CAST(N'2024-01-05' AS Date), N'500d8730-279e-484b-81b4-1c33e32e5327.jpg', 1)
INSERT [dbo].[Blog] ([BlogId], [ManagerId], [Title], [Content], [DatePosted], [Thumbnail], [Category]) VALUES (2, 1, N'Dinh dưỡng học đường', N'Những lưu ý về chế độ dinh dưỡng cân bằng cho học sinh.', CAST(N'2024-01-15' AS Date), NULL, 3)
INSERT [dbo].[Blog] ([BlogId], [ManagerId], [Title], [Content], [DatePosted], [Thumbnail], [Category]) VALUES (3, 1, N'Tầm quan trọng của giấc ngủ', N'Bài viết về ảnh hưởng của giấc ngủ đối với sức khỏe và học tập.', CAST(N'2024-01-25' AS Date), NULL, 4)
INSERT [dbo].[Blog] ([BlogId], [ManagerId], [Title], [Content], [DatePosted], [Thumbnail], [Category]) VALUES (4, 1, N'Sơ cứu cơ bản tại trường', N'Hướng dẫn các bước sơ cứu ban đầu cho các tai nạn thường gặp.', CAST(N'2024-02-01' AS Date), NULL, 2)
INSERT [dbo].[Blog] ([BlogId], [ManagerId], [Title], [Content], [DatePosted], [Thumbnail], [Category]) VALUES (5, 1, N'Tâm lý học đường', N'Cách hỗ trợ tâm lý cho học sinh trong giai đoạn phát triển.', CAST(N'2024-02-10' AS Date), NULL, 3)
INSERT [dbo].[Blog] ([BlogId], [ManagerId], [Title], [Content], [DatePosted], [Thumbnail], [Category]) VALUES (6, 1, N'Phòng chống cúm mùa', N'Các biện pháp phòng ngừa và xử lý khi học sinh mắc cúm.', CAST(N'2024-02-20' AS Date), NULL, 4)
INSERT [dbo].[Blog] ([BlogId], [ManagerId], [Title], [Content], [DatePosted], [Thumbnail], [Category]) VALUES (7, 1, N'Bảo vệ mắt cho học sinh', N'Tư vấn về cách bảo vệ thị lực cho trẻ em trong thời đại số.', CAST(N'2024-03-01' AS Date), NULL, 4)
INSERT [dbo].[Blog] ([BlogId], [ManagerId], [Title], [Content], [DatePosted], [Thumbnail], [Category]) VALUES (8, 1, N'Vệ sinh cá nhân cho trẻ', N'Hướng dẫn các thói quen vệ sinh tốt cho học sinh.', CAST(N'2024-03-10' AS Date), NULL, 3)
INSERT [dbo].[Blog] ([BlogId], [ManagerId], [Title], [Content], [DatePosted], [Thumbnail], [Category]) VALUES (9, 1, N'Hoạt động thể chất và sức khỏe', N'Lợi ích của việc tập luyện thể dục thể thao thường xuyên.', CAST(N'2024-03-20' AS Date), NULL, 1)
INSERT [dbo].[Blog] ([BlogId], [ManagerId], [Title], [Content], [DatePosted], [Thumbnail], [Category]) VALUES (10, 1, N'Phòng chống bệnh lây qua đường hô hấp', N'Các biện pháp phòng ngừa các bệnh lây lan trong môi trường học đường.', CAST(N'2024-04-01' AS Date), NULL, 2)
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[ConsentForm] ON 

INSERT [dbo].[ConsentForm] ([ConsentFormId], [FormId], [ParentId], [Status]) VALUES (1, 12, 1, 2)
INSERT [dbo].[ConsentForm] ([ConsentFormId], [FormId], [ParentId], [Status]) VALUES (2, 11, 2, 3)
INSERT [dbo].[ConsentForm] ([ConsentFormId], [FormId], [ParentId], [Status]) VALUES (3, 6, 3, 2)
INSERT [dbo].[ConsentForm] ([ConsentFormId], [FormId], [ParentId], [Status]) VALUES (4, 1, 4, 1)
INSERT [dbo].[ConsentForm] ([ConsentFormId], [FormId], [ParentId], [Status]) VALUES (5, 9, 5, 1)
INSERT [dbo].[ConsentForm] ([ConsentFormId], [FormId], [ParentId], [Status]) VALUES (6, 3, 6, 1)
INSERT [dbo].[ConsentForm] ([ConsentFormId], [FormId], [ParentId], [Status]) VALUES (7, 10, 7, 1)
INSERT [dbo].[ConsentForm] ([ConsentFormId], [FormId], [ParentId], [Status]) VALUES (8, 4, 8, 1)
INSERT [dbo].[ConsentForm] ([ConsentFormId], [FormId], [ParentId], [Status]) VALUES (9, 5, 9, 2)
INSERT [dbo].[ConsentForm] ([ConsentFormId], [FormId], [ParentId], [Status]) VALUES (10, 7, 10, 3)
INSERT [dbo].[ConsentForm] ([ConsentFormId], [FormId], [ParentId], [Status]) VALUES (11, 2, 5, 3)
INSERT [dbo].[ConsentForm] ([ConsentFormId], [FormId], [ParentId], [Status]) VALUES (12, 12, 7, 1)
INSERT [dbo].[ConsentForm] ([ConsentFormId], [FormId], [ParentId], [Status]) VALUES (13, 14, 6, 1)
INSERT [dbo].[ConsentForm] ([ConsentFormId], [FormId], [ParentId], [Status]) VALUES (14, 14, 7, 1)
INSERT [dbo].[ConsentForm] ([ConsentFormId], [FormId], [ParentId], [Status]) VALUES (15, 14, 8, 3)
SET IDENTITY_INSERT [dbo].[ConsentForm] OFF
GO
SET IDENTITY_INSERT [dbo].[ConsultationForm] ON 

INSERT [dbo].[ConsultationForm] ([ConsultationFormId], [ConsultationScheduleId], [ParentId], [Title], [Content], [Status]) VALUES (1, 5, 1, N'Tư vấn về sức khỏe của bé Nguyễn An Bình', N'Bé An Bình thường xuyên bị ho vào ban đêm, muốn được tư vấn.', 1)
INSERT [dbo].[ConsultationForm] ([ConsultationFormId], [ConsultationScheduleId], [ParentId], [Title], [Content], [Status]) VALUES (2, 4, 2, N'Hỏi về chế độ ăn cho bé Trần Gia Bảo', N'Bé Gia Bảo kén ăn, xin tư vấn dinh dưỡng.', 1)
INSERT [dbo].[ConsultationForm] ([ConsultationFormId], [ConsultationScheduleId], [ParentId], [Title], [Content], [Status]) VALUES (3, 3, 3, N'Thắc mắc về dị ứng của bé Lê Thanh Tùng', N'Bé Thanh Tùng thường bị nổi mẩn đỏ khi ăn hải sản.', 1)
INSERT [dbo].[ConsultationForm] ([ConsultationFormId], [ConsultationScheduleId], [ParentId], [Title], [Content], [Status]) VALUES (4, 2, 4, N'Yêu cầu tư vấn tâm lý cho bé Phạm Quang Minh', N'Bé Quang Minh có vẻ căng thẳng khi đi học.', 3)
INSERT [dbo].[ConsultationForm] ([ConsultationFormId], [ConsultationScheduleId], [ParentId], [Title], [Content], [Status]) VALUES (5, 1, 1, N'Tư vấn về giấc ngủ của bé Hoàng Văn Đạt', N'Bé Đạt khó ngủ và hay thức giấc giữa đêm.', 2)
SET IDENTITY_INSERT [dbo].[ConsultationForm] OFF
GO
SET IDENTITY_INSERT [dbo].[ConsultationSchedule] ON 

INSERT [dbo].[ConsultationSchedule] ([ConsultationScheduleId], [NurseId], [StudentId], [Location], [ConsultDate]) VALUES (1, 1, 8, N'Phòng y tế trường A', CAST(N'2024-03-01T10:00:00.000' AS DateTime))
INSERT [dbo].[ConsultationSchedule] ([ConsultationScheduleId], [NurseId], [StudentId], [Location], [ConsultDate]) VALUES (2, 2, 4, N'Phòng y tế trường A', CAST(N'2024-03-05T14:30:00.000' AS DateTime))
INSERT [dbo].[ConsultationSchedule] ([ConsultationScheduleId], [NurseId], [StudentId], [Location], [ConsultDate]) VALUES (3, 3, 6, N'Phòng y tế trường B', CAST(N'2024-03-10T09:00:00.000' AS DateTime))
INSERT [dbo].[ConsultationSchedule] ([ConsultationScheduleId], [NurseId], [StudentId], [Location], [ConsultDate]) VALUES (4, 4, 7, N'Phòng y tế trường B', CAST(N'2024-03-15T11:00:00.000' AS DateTime))
INSERT [dbo].[ConsultationSchedule] ([ConsultationScheduleId], [NurseId], [StudentId], [Location], [ConsultDate]) VALUES (5, 5, 2, N'Phòng y tế trường A', CAST(N'2024-03-20T15:00:00.000' AS DateTime))
INSERT [dbo].[ConsultationSchedule] ([ConsultationScheduleId], [NurseId], [StudentId], [Location], [ConsultDate]) VALUES (6, 4, 1, N'Ở phòng tư vấn trong trường', CAST(N'2025-06-13T07:05:55.753' AS DateTime))
SET IDENTITY_INSERT [dbo].[ConsultationSchedule] OFF
GO
SET IDENTITY_INSERT [dbo].[Form] ON 

INSERT [dbo].[Form] ([FormId], [ManagerId], [SentDate], [ClassName], [Title], [Content], [CreatedAt], [Type]) VALUES (1, 1, CAST(N'2025-01-10T09:00:00.000' AS DateTime), N'1A', N'Thông báo tiêm chủng', N'Thông báo về lịch tiêm chủng vaccine cúm cho học sinh lớp 1A.', CAST(N'2025-01-10T09:00:00.000' AS DateTime), 1)
INSERT [dbo].[Form] ([FormId], [ManagerId], [SentDate], [ClassName], [Title], [Content], [CreatedAt], [Type]) VALUES (2, 1, CAST(N'2023-07-15T10:30:00.000' AS DateTime), N'7D', N'Kế hoạch kiểm tra sức khỏe định kỳ FALL', N'Kế hoạch chi tiết cho việc kiểm tra sức khỏe tổng quát định kỳ', CAST(N'2023-07-15T10:30:00.000' AS DateTime), 2)
INSERT [dbo].[Form] ([FormId], [ManagerId], [SentDate], [ClassName], [Title], [Content], [CreatedAt], [Type]) VALUES (3, 1, CAST(N'2025-02-01T14:00:00.000' AS DateTime), N'2C', N'Thông báo khám răng', N'Thông báo về buổi khám răng miễn phí cho học sinh lớp 2C.', CAST(N'2025-02-01T14:00:00.000' AS DateTime), 2)
INSERT [dbo].[Form] ([FormId], [ManagerId], [SentDate], [ClassName], [Title], [Content], [CreatedAt], [Type]) VALUES (4, 1, CAST(N'2024-01-01T09:15:00.000' AS DateTime), N'3B', N'Thông báo tiêm vaccine sởi', N'Thông báo tiêm vaccine sởi cho học sinh lớp 3B.', CAST(N'2024-01-01T09:15:00.000' AS DateTime), 1)
INSERT [dbo].[Form] ([FormId], [ManagerId], [SentDate], [ClassName], [Title], [Content], [CreatedAt], [Type]) VALUES (5, 1, CAST(N'2024-02-20T11:00:00.000' AS DateTime), N'Tất cả', N'Khảo sát ý kiến phụ huynh', N'Khảo sát về chất lượng dịch vụ y tế học đường.', CAST(N'2024-02-20T11:00:00.000' AS DateTime), 1)
INSERT [dbo].[Form] ([FormId], [ManagerId], [SentDate], [ClassName], [Title], [Content], [CreatedAt], [Type]) VALUES (6, 1, CAST(N'2025-06-01T10:00:00.000' AS DateTime), N'4D', N'Thông báo kiểm tra thị lực', N'Thông báo về buổi kiểm tra thị lực cho học sinh lớp 4D.', CAST(N'2025-06-01T10:00:00.000' AS DateTime), 2)
INSERT [dbo].[Form] ([FormId], [ManagerId], [SentDate], [ClassName], [Title], [Content], [CreatedAt], [Type]) VALUES (7, 1, CAST(N'2023-03-10T13:00:00.000' AS DateTime), N'5A', N'Thông báo tiêm vaccine bạch hầu', N'Thông báo tiêm vaccine bạch hầu cho học sinh lớp 5A.', CAST(N'2023-03-10T13:00:00.000' AS DateTime), 1)
INSERT [dbo].[Form] ([FormId], [ManagerId], [SentDate], [ClassName], [Title], [Content], [CreatedAt], [Type]) VALUES (8, 1, CAST(N'2024-03-20T09:45:00.000' AS DateTime), N'Tất cả', N'Thông báo về bệnh truyền nhiễm', N'Thông báo các biện pháp phòng chống dịch bệnh truyền nhiễm trong mùa.', CAST(N'2024-03-20T09:45:00.000' AS DateTime), 2)
INSERT [dbo].[Form] ([FormId], [ManagerId], [SentDate], [ClassName], [Title], [Content], [CreatedAt], [Type]) VALUES (9, 1, CAST(N'2023-09-28T10:10:00.000' AS DateTime), N'6B', N'Thông báo khám sức khỏe tổng quát', N'Chi tiết lịch khám sức khỏe tổng quát cho học sinh lớp 6B.', CAST(N'2023-09-28T10:10:00.000' AS DateTime), 2)
INSERT [dbo].[Form] ([FormId], [ManagerId], [SentDate], [ClassName], [Title], [Content], [CreatedAt], [Type]) VALUES (10, 1, CAST(N'2024-04-10T14:30:00.000' AS DateTime), N'Tất cả', N'Hội thảo sức khỏe sinh sản vị thành niên', N'Mời phụ huynh tham gia hội thảo về sức khỏe sinh sản cho học sinh cấp 2.', CAST(N'2024-04-10T14:30:00.000' AS DateTime), 2)
INSERT [dbo].[Form] ([FormId], [ManagerId], [SentDate], [ClassName], [Title], [Content], [CreatedAt], [Type]) VALUES (11, 1, CAST(N'2024-06-03T00:00:00.000' AS DateTime), N'4D', N'Thông báo khám sức khỏe lần IV', N'Học sinh cần đến trường sớm lúc 7h để khám sức khỏe', CAST(N'2024-06-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Form] ([FormId], [ManagerId], [SentDate], [ClassName], [Title], [Content], [CreatedAt], [Type]) VALUES (12, 1, CAST(N'2025-05-04T00:00:00.000' AS DateTime), N'2C', N'Kỳ tiêm chủng lần thứ 3 kỳ FALL', N'Nhiệt liệt chào mừng Virus đến, các em học sinh chuẩn bị tâm lý để tiêm.', CAST(N'2026-03-04T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Form] ([FormId], [ManagerId], [SentDate], [ClassName], [Title], [Content], [CreatedAt], [Type]) VALUES (13, NULL, CAST(N'2025-06-18T03:03:02.540' AS DateTime), N'5D', N'Tiêm Vaccine kỳ Spring 2025', N'Tiêm Vaccine để chống viruss, đề nghị các em bắt buộc có mặt', CAST(N'2025-06-18T03:03:02.540' AS DateTime), 1)
INSERT [dbo].[Form] ([FormId], [ManagerId], [SentDate], [ClassName], [Title], [Content], [CreatedAt], [Type]) VALUES (14, NULL, CAST(N'2025-06-20T14:08:41.513' AS DateTime), N'2C', N'Tiêm chủng cúm H8U7', N'Học sinh cần chuẩn bị tâm lý để tiêm.', CAST(N'2025-06-20T14:08:41.513' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Form] OFF
GO
SET IDENTITY_INSERT [dbo].[HealthCheckResult] ON 

INSERT [dbo].[HealthCheckResult] ([HealthCheckupRecordId], [HealthCheckScheduleId], [NurseId], [HealthProfileId], [Status], [Height], [Weight], [LeftVision], [RightVision], [Result], [Note]) VALUES (1, 1, 1, 1, 1, 120.5, 25.2, N'10/10', N'10/10', N'Bình thường', NULL)
INSERT [dbo].[HealthCheckResult] ([HealthCheckupRecordId], [HealthCheckScheduleId], [NurseId], [HealthProfileId], [Status], [Height], [Weight], [LeftVision], [RightVision], [Result], [Note]) VALUES (2, 1, 2, 2, 1, 135, 30.1, N'8/10', N'9/10', N'Cần theo dõi thị lực', N'Nên đi khám chuyên khoa mắt')
INSERT [dbo].[HealthCheckResult] ([HealthCheckupRecordId], [HealthCheckScheduleId], [NurseId], [HealthProfileId], [Status], [Height], [Weight], [LeftVision], [RightVision], [Result], [Note]) VALUES (3, 1, 3, 3, 1, 128, 27.5, N'10/10', N'10/10', N'Bình thường', NULL)
INSERT [dbo].[HealthCheckResult] ([HealthCheckupRecordId], [HealthCheckScheduleId], [NurseId], [HealthProfileId], [Status], [Height], [Weight], [LeftVision], [RightVision], [Result], [Note]) VALUES (4, 2, 4, 4, 1, NULL, N'Sâu răng nhẹ', N'Cần trám răng')
INSERT [dbo].[HealthCheckResult] ([HealthCheckupRecordId], [HealthCheckScheduleId], [NurseId], [HealthProfileId], [Status], [Height], [Weight], [LeftVision], [RightVision], [Result], [Note]) VALUES (5, 3, 5, 6, 1, NULL, NULL, N'7/10', N'8/10', N'Thị lực giảm nhẹ', N'Khuyên dùng kính phù hợp')
INSERT [dbo].[HealthCheckResult] ([HealthCheckupRecordId], [HealthCheckScheduleId], [NurseId], [HealthProfileId], [Status], [Height], [Weight], [LeftVision], [RightVision], [Result], [Note]) VALUES (6, 4, 1, 8, 1, 150.2, 45, N'10/10', N'10/10', N'Bình thường', NULL)
INSERT [dbo].[HealthCheckResult] ([HealthCheckupRecordId], [HealthCheckScheduleId], [NurseId], [HealthProfileId], [Status], [Height], [Weight], [LeftVision], [RightVision], [Result], [Note]) VALUES (7, 1, 2, 9, 1, 122.1, 26.5, N'10/10', N'10/10', N'Bình thường', NULL)
INSERT [dbo].[HealthCheckResult] ([HealthCheckupRecordId], [HealthCheckScheduleId], [NurseId], [HealthProfileId], [Status], [Height], [Weight], [LeftVision], [RightVision], [Result], [Note]) VALUES (8, 1, 3, 10, 1, 130.5, 28.9, N'9/10', N'9/10', N'Cần theo dõi thị lực', NULL)
INSERT [dbo].[HealthCheckResult] ([HealthCheckupRecordId], [HealthCheckScheduleId], [NurseId], [HealthProfileId], [Status], [Height], [Weight], [LeftVision], [RightVision], [Result], [Note]) VALUES (9, 2, 4, 11, 1, NULL, N'Bình thường', NULL)
INSERT [dbo].[HealthCheckResult] ([HealthCheckupRecordId], [HealthCheckScheduleId], [NurseId], [HealthProfileId], [Status], [Height], [Weight], [LeftVision], [RightVision], [Result], [Note]) VALUES (10, 3, 5, 12, 2, NULL, NULL, N'6/10', N'7/10', N'Thị lực kém', N'Cần đi khám mắt sớm')
INSERT [dbo].[HealthCheckResult] ([HealthCheckupRecordId], [HealthCheckScheduleId], [NurseId], [HealthProfileId], [Status], [Height], [Weight], [LeftVision], [RightVision], [Result], [Note]) VALUES (11, 4, 5, 99, 1, 130, 35, N'7/10', N'4/10', N'Bị cận', N'Cần cắt kính cho bé.')
INSERT [dbo].[HealthCheckResult] ([HealthCheckupRecordId], [HealthCheckScheduleId], [NurseId], [HealthProfileId], [Status], [Height], [Weight], [LeftVision], [RightVision], [Result], [Note]) VALUES (12, 3, 5, 98, 1, 130, 35, N'1/10', N'8/10', N'Mắt trái rất yếu', N'Cần cắt kính cho bé.')
INSERT [dbo].[HealthCheckResult] ([HealthCheckupRecordId], [HealthCheckScheduleId], [NurseId], [HealthProfileId], [Status], [Height], [Weight], [LeftVision], [RightVision], [Result], [Note]) VALUES (13, 3, 4, 97, 1, 130, 35, N'2/10', N'9/10', N'Mắt trái rất yếu', N'Cần cắt kính cho bé.')
SET IDENTITY_INSERT [dbo].[HealthCheckResult] OFF
GO
SET IDENTITY_INSERT [dbo].[HealthCheckSchedule] ON 

INSERT [dbo].[HealthCheckSchedule] ([HealthCheckScheduleId], [FormId], [ManagerId], [Name], [CheckDate], [Location], [Note]) VALUES (1, 2, 1, N'Kiểm tra sức khỏe học sinh toàn trường lần 1', CAST(N'2024-03-15T08:00:00.000' AS DateTime), N'Phòng y tế trường', N'Kiểm tra thể lực, thị lực, cân nặng, chiều cao')
INSERT [dbo].[HealthCheckSchedule] ([HealthCheckScheduleId], [FormId], [ManagerId], [Name], [CheckDate], [Location], [Note]) VALUES (2, 3, 1, N'Khám răng định kỳ lớp 2C', CAST(N'2024-03-20T09:00:00.000' AS DateTime), N'Phòng y tế trường', N'Kiểm tra sức khỏe răng miệng')
INSERT [dbo].[HealthCheckSchedule] ([HealthCheckScheduleId], [FormId], [ManagerId], [Name], [CheckDate], [Location], [Note]) VALUES (3, 6, 1, N'Kiểm tra thị lực lớp 4D', CAST(N'2024-03-25T10:00:00.000' AS DateTime), N'Phòng y tế trường', N'Kiểm tra thị lực bằng bảng đo mắt')
INSERT [dbo].[HealthCheckSchedule] ([HealthCheckScheduleId], [FormId], [ManagerId], [Name], [CheckDate], [Location], [Note]) VALUES (4, 9, 1, N'Khám sức khỏe tổng quát lớp 6B', CAST(N'2024-04-05T08:30:00.000' AS DateTime), N'Phòng y tế trường', N'Kiểm tra tổng thể sức khỏe')
SET IDENTITY_INSERT [dbo].[HealthCheckSchedule] OFF
GO
SET IDENTITY_INSERT [dbo].[HealthProfile] ON 

INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (1, 1, N'A+', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (2, 2, N'B-', N'Phấn hoa')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (3, 3, N'O+', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (4, 4, N'AB+', N'Hải sản')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (5, 5, N'A-', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (6, 6, N'B+', N'Lông động vật')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (7, 7, N'O-', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (8, 8, N'A+', N'Đậu phộng')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (9, 9, N'B-', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (10, 10, N'O+', N'Thuốc kháng sinh')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (11, 11, N'AB+', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (12, 12, N'A-', N'Bụi nhà')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (13, 13, N'B+', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (14, 14, N'O-', N'Sữa')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (15, 15, N'A+', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (16, 16, N'B-', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (17, 17, N'O+', N'Phấn hoa')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (18, 18, N'AB+', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (19, 19, N'A-', N'Hải sản')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (20, 20, N'B+', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (21, 21, N'O-', N'Lông động vật')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (22, 22, N'A+', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (23, 23, N'B-', N'Đậu phộng')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (24, 24, N'O+', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (25, 25, N'AB+', N'Thuốc kháng sinh')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (26, 26, N'A-', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (27, 27, N'B+', N'Bụi nhà')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (28, 28, N'O-', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (29, 29, N'A+', N'Sữa')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (30, 30, N'B-', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (31, 31, N'O+', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (32, 32, N'AB+', N'Phấn hoa')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (33, 33, N'A-', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (34, 34, N'B+', N'Hải sản')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (35, 35, N'O-', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (36, 36, N'A+', N'Lông động vật')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (37, 37, N'B-', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (38, 38, N'O+', N'Đậu phộng')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (39, 39, N'AB+', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (40, 40, N'A-', N'Thuốc kháng sinh')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (41, 41, N'B+', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (42, 42, N'O-', N'Bụi nhà')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (43, 43, N'A+', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (44, 44, N'B-', N'Sữa')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (45, 45, N'O+', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (46, 46, N'AB+', N'Phấn hoa')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (47, 47, N'A-', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (48, 48, N'B+', N'Hải sản')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (49, 49, N'O-', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (50, 50, N'A+', N'Lông động vật')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (51, 51, N'B-', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (52, 52, N'O+', N'Đậu phộng')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (53, 53, N'AB+', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (54, 54, N'A-', N'Thuốc kháng sinh')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (55, 55, N'B+', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (56, 56, N'O-', N'Bụi nhà')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (57, 57, N'A+', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (58, 58, N'B-', N'Sữa')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (59, 59, N'O+', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (60, 60, N'AB+', N'Phấn hoa')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (61, 61, N'A-', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (62, 62, N'B+', N'Hải sản')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (63, 63, N'O-', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (64, 64, N'A+', N'Lông động vật')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (65, 65, N'B-', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (66, 66, N'O+', N'Đậu phộng')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (67, 67, N'AB+', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (68, 68, N'A-', N'Thuốc kháng sinh')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (69, 69, N'B+', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (70, 70, N'O-', N'Bụi nhà')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (71, 71, N'A+', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (72, 72, N'B-', N'Sữa')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (73, 73, N'O+', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (74, 74, N'AB+', N'Phấn hoa')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (75, 75, N'A-', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (76, 76, N'B+', N'Hải sản')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (77, 77, N'O-', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (78, 78, N'A+', N'Lông động vật')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (79, 79, N'B-', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (80, 80, N'O+', N'Đậu phộng')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (81, 81, N'AB+', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (82, 82, N'A-', N'Thuốc kháng sinh')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (83, 83, N'B+', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (84, 84, N'O-', N'Bụi nhà')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (85, 85, N'A+', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (86, 86, N'B-', N'Sữa')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (87, 87, N'O+', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (88, 88, N'AB+', N'Phấn hoa')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (89, 89, N'A-', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (90, 90, N'B+', N'Hải sản')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (91, 91, N'O-', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (92, 92, N'A+', N'Lông động vật')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (93, 93, N'B-', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (94, 94, N'O+', N'Đậu phộng')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (95, 95, N'AB+', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (96, 96, N'A-', N'Thuốc kháng sinh')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (97, 97, N'B+', N'Không')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (98, 98, N'O-', N'Bụi nhà')
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (99, 99, N'A+', N'Không')
GO
INSERT [dbo].[HealthProfile] ([HealthProfileId], [StudentId], [BloodType], [Allergies]) VALUES (100, 100, N'B-', N'Sữa')
SET IDENTITY_INSERT [dbo].[HealthProfile] OFF
GO
SET IDENTITY_INSERT [dbo].[Manager] ON 

INSERT [dbo].[Manager] ([ManagerId], [FullName], [PhoneNumber], [Email], [PasswordHash]) VALUES (1, N'Nguyễn Văn A', N'0901112233', N'vana@gmail.com', N'e10adc3949ba59abbe56e057f20f883e')
SET IDENTITY_INSERT [dbo].[Manager] OFF
GO
SET IDENTITY_INSERT [dbo].[MedicalEvent] ON 

INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (1, 1, 1, N'Sự kiện 1', CAST(N'2024-03-01T09:30:00.000' AS DateTime), N'Sốt, ho', N'Cho uống hạ sốt, theo dõi', N'Liên hệ phụ huynh')
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (2, 2, 2, N'Sự kiện 2', CAST(N'2024-03-02T10:00:00.000' AS DateTime), N'Đau bụng', N'Nghỉ ngơi tại phòng y tế', N'Ăn uống không hợp vệ sinh')
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (3, 3, 3, N'Sự kiện 3', CAST(N'2024-03-03T11:15:00.000' AS DateTime), N'Chóng mặt', N'Cho uống nước đường', NULL)
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (4, 4, 4, N'Sự kiện 4', CAST(N'2024-03-04T14:00:00.000' AS DateTime), N'Ngã trầy xước', N'Sát trùng, băng bó', N'Ngã khi chơi đùa')
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (5, 5, 5, N'Sự kiện 5', CAST(N'2024-03-05T08:45:00.000' AS DateTime), N'Đau họng', N'Cho uống thuốc ho', N'Hẹn tái khám')
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (6, 6, 1, N'Sự kiện 6', CAST(N'2024-03-06T09:00:00.000' AS DateTime), N'Sổ mũi', N'Cho uống thuốc cảm', NULL)
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (7, 7, 2, N'Sự kiện 7', CAST(N'2024-03-07T10:30:00.000' AS DateTime), N'Nổi mẩn đỏ', N'Theo dõi, nghi dị ứng', N'Yêu cầu phụ huynh đưa đi khám')
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (8, 8, 3, N'Sự kiện 8', CAST(N'2024-03-08T13:00:00.000' AS DateTime), N'Buồn nôn', N'Cho uống oresol', NULL)
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (9, 9, 4, N'Sự kiện 9', CAST(N'2024-03-09T15:00:00.000' AS DateTime), N'Đau mắt', N'Nhỏ thuốc mắt', NULL)
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (10, 10, 5, N'Sự kiện 10', CAST(N'2024-03-10T09:10:00.000' AS DateTime), N'Cảm cúm', N'Cho nghỉ ngơi, uống thuốc', N'Liên hệ phụ huynh đón về')
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (11, 11, 1, N'Sự kiện 11', CAST(N'2024-03-11T10:20:00.000' AS DateTime), N'Sốt cao', N'Hạ sốt, chuyển bệnh viện', N'Tình trạng nặng')
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (12, 12, 2, N'Sự kiện 12', CAST(N'2024-03-12T11:30:00.000' AS DateTime), N'Đau răng', N'Cho thuốc giảm đau', N'Hẹn đi nha sĩ')
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (13, 13, 3, N'Sự kiện 13', CAST(N'2024-03-13T14:15:00.000' AS DateTime), N'Chảy máu cam', N'Sơ cứu', NULL)
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (14, 14, 4, N'Sự kiện 14', CAST(N'2024-03-14T09:00:00.000' AS DateTime), N'Phát ban', N'Theo dõi', N'Có thể do thức ăn')
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (15, 15, 5, N'Sự kiện 15', CAST(N'2024-03-15T10:40:00.000' AS DateTime), N'Đau tai', N'Kiểm tra, cho thuốc nhỏ tai', NULL)
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (16, 16, 1, N'Sự kiện 16', CAST(N'2024-03-16T11:00:00.000' AS DateTime), N'Ho kéo dài', N'Tư vấn phụ huynh', N'Cần đi khám chuyên khoa')
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (17, 17, 2, N'Sự kiện 17', CAST(N'2024-03-17T13:30:00.000' AS DateTime), N'Khó thở nhẹ', N'Cho hít khí dung', N'Tiền sử hen suyễn')
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (18, 18, 3, N'Sự kiện 18', CAST(N'2024-03-18T14:45:00.000' AS DateTime), N'Đau khớp', N'Chườm ấm', N'Do vận động mạnh')
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (19, 19, 4, N'Sự kiện 19', CAST(N'2024-03-19T09:20:00.000' AS DateTime), N'Mệt mỏi', N'Cho nghỉ ngơi', NULL)
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (20, 20, 5, N'Sự kiện 20', CAST(N'2024-03-20T10:00:00.000' AS DateTime), N'Đau đầu', N'Cho thuốc giảm đau', NULL)
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (21, 21, 1, N'Sự kiện 21', CAST(N'2024-03-21T09:30:00.000' AS DateTime), N'Sốt, ho', N'Cho uống hạ sốt, theo dõi', N'Liên hệ phụ huynh')
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (22, 22, 2, N'Sự kiện 22', CAST(N'2024-03-22T10:00:00.000' AS DateTime), N'Đau bụng', N'Nghỉ ngơi tại phòng y tế', N'Ăn uống không hợp vệ sinh')
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (23, 23, 3, N'Sự kiện 23', CAST(N'2024-03-23T11:15:00.000' AS DateTime), N'Chóng mặt', N'Cho uống nước đường', NULL)
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (24, 24, 4, N'Sự kiện 24', CAST(N'2024-03-24T14:00:00.000' AS DateTime), N'Ngã trầy xước', N'Sát trùng, băng bó', N'Ngã khi chơi đùa')
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (25, 25, 5, N'Sự kiện 25', CAST(N'2024-03-25T08:45:00.000' AS DateTime), N'Đau họng', N'Cho uống thuốc ho', N'Hẹn tái khám')
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (26, 26, 1, N'Sự kiện 26', CAST(N'2024-03-26T09:00:00.000' AS DateTime), N'Sổ mũi', N'Cho uống thuốc cảm', NULL)
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (27, 27, 2, N'Sự kiện 27', CAST(N'2024-03-27T10:30:00.000' AS DateTime), N'Nổi mẩn đỏ', N'Theo dõi, nghi dị ứng', N'Yêu cầu phụ huynh đưa đi khám')
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (28, 28, 3, N'Sự kiện 28', CAST(N'2024-03-28T13:00:00.000' AS DateTime), N'Buồn nôn', N'Cho uống oresol', NULL)
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (29, 29, 4, N'Sự kiện 29', CAST(N'2024-03-29T15:00:00.000' AS DateTime), N'Đau mắt', N'Nhỏ thuốc mắt', NULL)
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (30, 30, 5, N'Sự kiện 30', CAST(N'2024-03-30T09:10:00.000' AS DateTime), N'Cảm cúm', N'Cho nghỉ ngơi, uống thuốc', N'Liên hệ phụ huynh đón về')
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (31, 31, 1, N'Sự kiện 31', CAST(N'2024-04-01T10:20:00.000' AS DateTime), N'Sốt cao', N'Hạ sốt, chuyển bệnh viện', N'Tình trạng nặng')
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (32, 32, 2, N'Sự kiện 32', CAST(N'2024-04-02T11:30:00.000' AS DateTime), N'Đau răng', N'Cho thuốc giảm đau', N'Hẹn đi nha sĩ')
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (33, 33, 3, N'Sự kiện 33', CAST(N'2024-04-03T14:15:00.000' AS DateTime), N'Chảy máu cam', N'Sơ cứu', NULL)
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (34, 34, 4, N'Sự kiện 34', CAST(N'2024-04-04T09:00:00.000' AS DateTime), N'Phát ban', N'Theo dõi', N'Có thể do thức ăn')
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (35, 35, 5, N'Sự kiện 35', CAST(N'2024-04-05T10:40:00.000' AS DateTime), N'Đau tai', N'Kiểm tra, cho thuốc nhỏ tai', NULL)
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (36, 36, 1, N'Sự kiện 36', CAST(N'2024-04-06T11:00:00.000' AS DateTime), N'Ho kéo dài', N'Tư vấn phụ huynh', N'Cần đi khám chuyên khoa')
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (37, 37, 2, N'Sự kiện 37', CAST(N'2024-04-07T13:30:00.000' AS DateTime), N'Khó thở nhẹ', N'Cho hít khí dung', N'Tiền sử hen suyễn')
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (38, 38, 3, N'Sự kiện 38', CAST(N'2024-04-08T14:45:00.000' AS DateTime), N'Đau khớp', N'Chườm ấm', N'Do vận động mạnh')
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (39, 39, 4, N'Sự kiện 39', CAST(N'2024-04-09T09:20:00.000' AS DateTime), N'Mệt mỏi', N'Cho nghỉ ngơi', NULL)
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (40, 40, 5, N'Sự kiện 40', CAST(N'2024-04-10T10:00:00.000' AS DateTime), N'Đau đầu', N'Cho thuốc giảm đau', NULL)
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (41, 41, 1, N'Sự kiện 41', CAST(N'2024-04-11T09:30:00.000' AS DateTime), N'Sốt, ho', N'Cho uống hạ sốt, theo dõi', N'Liên hệ phụ huynh')
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (42, 42, 2, N'Sự kiện 42', CAST(N'2024-04-12T10:00:00.000' AS DateTime), N'Đau bụng', N'Nghỉ ngơi tại phòng y tế', N'Ăn uống không hợp vệ sinh')
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (43, 43, 3, N'Sự kiện 43', CAST(N'2024-04-13T11:15:00.000' AS DateTime), N'Chóng mặt', N'Cho uống nước đường', NULL)
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (44, 44, 4, N'Sự kiện 44', CAST(N'2024-04-14T14:00:00.000' AS DateTime), N'Ngã trầy xước', N'Sát trùng, băng bó', N'Ngã khi chơi đùa')
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (45, 45, 5, N'Sự kiện 45', CAST(N'2024-04-15T08:45:00.000' AS DateTime), N'Đau họng', N'Cho uống thuốc ho', N'Hẹn tái khám')
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (46, 46, 1, N'Sự kiện 46', CAST(N'2024-04-16T09:00:00.000' AS DateTime), N'Sổ mũi', N'Cho uống thuốc cảm', NULL)
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (47, 4, 2, N'Sự kiện 47', CAST(N'2024-04-17T10:30:00.000' AS DateTime), N'Nổi mẩn đỏ', N'Theo dõi, nghi dị ứng', N'Yêu cầu phụ huynh đưa đi khám')
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (48, 3, 3, N'Sự kiện 48', CAST(N'2024-04-18T13:00:00.000' AS DateTime), N'Buồn nôn', N'Cho uống oresol', NULL)
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (49, 2, 4, N'Sự kiện 49', CAST(N'2024-04-19T15:00:00.000' AS DateTime), N'Đau mắt', N'Nhỏ thuốc mắt', NULL)
INSERT [dbo].[MedicalEvent] ([EventId], [StudentId], [NurseId], [EventName], [EventDate], [Symptoms], [ActionTaken], [Note]) VALUES (50, 1, 5, N'Sự kiện 50', CAST(N'2024-04-20T09:10:00.000' AS DateTime), N'Cảm cúm', N'Cho nghỉ ngơi, uống thuốc', N'Liên hệ phụ huynh đón về')
SET IDENTITY_INSERT [dbo].[MedicalEvent] OFF
GO
SET IDENTITY_INSERT [dbo].[MedicalInventory] ON 

INSERT [dbo].[MedicalInventory] ([MedicalInventoryId], [ManagerId], [Quantity], [MedicalName], [Unit], [ExpiryDate], [DateAdded]) VALUES (1, 1, 100, N'Bông gòn', N'Gói', CAST(N'2025-12-31' AS Date), CAST(N'2024-01-01' AS Date))
INSERT [dbo].[MedicalInventory] ([MedicalInventoryId], [ManagerId], [Quantity], [MedicalName], [Unit], [ExpiryDate], [DateAdded]) VALUES (2, 1, 50, N'Cồn y tế', N'Chai', CAST(N'2026-06-30' AS Date), CAST(N'2024-01-01' AS Date))
INSERT [dbo].[MedicalInventory] ([MedicalInventoryId], [ManagerId], [Quantity], [MedicalName], [Unit], [ExpiryDate], [DateAdded]) VALUES (3, 1, 20, N'Băng gạc', N'Hộp', CAST(N'2025-10-31' AS Date), CAST(N'2024-01-05' AS Date))
INSERT [dbo].[MedicalInventory] ([MedicalInventoryId], [ManagerId], [Quantity], [MedicalName], [Unit], [ExpiryDate], [DateAdded]) VALUES (4, 1, 30, N'Thuốc hạ sốt', N'Vỉ', CAST(N'2025-08-31' AS Date), CAST(N'2024-01-05' AS Date))
INSERT [dbo].[MedicalInventory] ([MedicalInventoryId], [ManagerId], [Quantity], [MedicalName], [Unit], [ExpiryDate], [DateAdded]) VALUES (5, 1, 10, N'Oresol', N'Gói', CAST(N'2026-03-31' AS Date), CAST(N'2024-01-10' AS Date))
INSERT [dbo].[MedicalInventory] ([MedicalInventoryId], [ManagerId], [Quantity], [MedicalName], [Unit], [ExpiryDate], [DateAdded]) VALUES (6, 1, 5, N'Kẹp y tế', N'Cái', CAST(N'2026-03-31' AS Date), CAST(N'2024-01-10' AS Date))
INSERT [dbo].[MedicalInventory] ([MedicalInventoryId], [ManagerId], [Quantity], [MedicalName], [Unit], [ExpiryDate], [DateAdded]) VALUES (7, 1, 15, N'Nước muối sinh lý', N'Chai', CAST(N'2025-09-30' AS Date), CAST(N'2024-01-15' AS Date))
INSERT [dbo].[MedicalInventory] ([MedicalInventoryId], [ManagerId], [Quantity], [MedicalName], [Unit], [ExpiryDate], [DateAdded]) VALUES (8, 1, 25, N'Khẩu trang y tế', N'Hộp', CAST(N'2026-01-31' AS Date), CAST(N'2024-01-15' AS Date))
INSERT [dbo].[MedicalInventory] ([MedicalInventoryId], [ManagerId], [Quantity], [MedicalName], [Unit], [ExpiryDate], [DateAdded]) VALUES (9, 1, 10, N'Găng tay y tế', N'Hộp', CAST(N'2025-11-30' AS Date), CAST(N'2024-01-20' AS Date))
INSERT [dbo].[MedicalInventory] ([MedicalInventoryId], [ManagerId], [Quantity], [MedicalName], [Unit], [ExpiryDate], [DateAdded]) VALUES (10, 1, 5, N'Nhiệt kế', N'Cái', CAST(N'2026-03-31' AS Date), CAST(N'2024-01-20' AS Date))
INSERT [dbo].[MedicalInventory] ([MedicalInventoryId], [ManagerId], [Quantity], [MedicalName], [Unit], [ExpiryDate], [DateAdded]) VALUES (11, 1, 80, N'Bông gòn', N'Gói', CAST(N'2025-12-31' AS Date), CAST(N'2024-03-01' AS Date))
INSERT [dbo].[MedicalInventory] ([MedicalInventoryId], [ManagerId], [Quantity], [MedicalName], [Unit], [ExpiryDate], [DateAdded]) VALUES (12, 1, 40, N'Cồn y tế', N'Chai', CAST(N'2026-06-30' AS Date), CAST(N'2024-03-01' AS Date))
INSERT [dbo].[MedicalInventory] ([MedicalInventoryId], [ManagerId], [Quantity], [MedicalName], [Unit], [ExpiryDate], [DateAdded]) VALUES (13, 1, 15, N'Băng gạc', N'Hộp', CAST(N'2025-10-31' AS Date), CAST(N'2024-03-05' AS Date))
INSERT [dbo].[MedicalInventory] ([MedicalInventoryId], [ManagerId], [Quantity], [MedicalName], [Unit], [ExpiryDate], [DateAdded]) VALUES (14, 1, 25, N'Thuốc hạ sốt', N'Vỉ', CAST(N'2025-08-31' AS Date), CAST(N'2024-03-05' AS Date))
INSERT [dbo].[MedicalInventory] ([MedicalInventoryId], [ManagerId], [Quantity], [MedicalName], [Unit], [ExpiryDate], [DateAdded]) VALUES (15, 1, 8, N'Oresol', N'Gói', CAST(N'2026-03-31' AS Date), CAST(N'2024-03-10' AS Date))
INSERT [dbo].[MedicalInventory] ([MedicalInventoryId], [ManagerId], [Quantity], [MedicalName], [Unit], [ExpiryDate], [DateAdded]) VALUES (16, 1, 3, N'Kẹp y tế', N'Cái', CAST(N'2026-03-31' AS Date), CAST(N'2024-03-10' AS Date))
INSERT [dbo].[MedicalInventory] ([MedicalInventoryId], [ManagerId], [Quantity], [MedicalName], [Unit], [ExpiryDate], [DateAdded]) VALUES (17, 1, 12, N'Nước muối sinh lý', N'Chai', CAST(N'2025-09-30' AS Date), CAST(N'2024-03-15' AS Date))
INSERT [dbo].[MedicalInventory] ([MedicalInventoryId], [ManagerId], [Quantity], [MedicalName], [Unit], [ExpiryDate], [DateAdded]) VALUES (18, 1, 20, N'Khẩu trang y tế', N'Hộp', CAST(N'2026-01-31' AS Date), CAST(N'2024-03-15' AS Date))
INSERT [dbo].[MedicalInventory] ([MedicalInventoryId], [ManagerId], [Quantity], [MedicalName], [Unit], [ExpiryDate], [DateAdded]) VALUES (19, 1, 8, N'Găng tay y tế', N'Hộp', CAST(N'2025-11-30' AS Date), CAST(N'2024-03-20' AS Date))
INSERT [dbo].[MedicalInventory] ([MedicalInventoryId], [ManagerId], [Quantity], [MedicalName], [Unit], [ExpiryDate], [DateAdded]) VALUES (20, 1, 4, N'Nhiệt kế', N'Cái', CAST(N'2026-03-31' AS Date), CAST(N'2024-03-20' AS Date))
INSERT [dbo].[MedicalInventory] ([MedicalInventoryId], [ManagerId], [Quantity], [MedicalName], [Unit], [ExpiryDate], [DateAdded]) VALUES (21, 1, 100, N'Bông gòn', N'Hộp', CAST(N'2025-06-18' AS Date), CAST(N'2029-06-18' AS Date))
SET IDENTITY_INSERT [dbo].[MedicalInventory] OFF
GO
SET IDENTITY_INSERT [dbo].[Medications] ON 

INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (1, 1, N'Paracetamol', 1, N'500mg', 10, 10)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (2, 1, N'Ibuprofen', 1, N'200mg', 6, 6)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (3, 1, N'Nước muối sinh lý', 1, N'R?a mui', 1, 1)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (4, 1, N'Vitamin C', 1, N'100mg', 5, 5)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (5, 1, N'Siro ho', 1, N'10ml', 3, 3)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (6, 1, N'Thuốc hạ sốt', 1, N'1 gói', 4, 4)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (7, 2, N'Amoxicillin', 2, N'250mg', 10, 10)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (8, 2, N'Siro ho', 2, N'5ml', 5, 5)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (9, 2, N'Nước muối', 2, N'R?a h?ng', 1, 1)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (10, 2, N'Vitamin D', 2, N'400IU', 7, 7)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (11, 2, N'Histamine', 2, N'10mg', 5, 5)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (12, 2, N'Thuốc bổ', 2, N'1 viên', 3, 3)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (13, 3, N'Cetirizine', 3, N'5mg', 7, 7)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (14, 3, N'Nước muối', 3, N'R?a mui', 1, 1)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (15, 3, N'Thuốc nhỏ mắt', 3, N'2 gi?t', 1, 1)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (16, 3, N'Vitamin C', 3, N'100mg', 10, 10)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (17, 3, N'Thuốc bôi dị ứng', 3, N'Thoa', 1, 1)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (18, 3, N'Siro dị ứng', 3, N'5ml', 3, 3)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (19, 4, N'Enterogermina', 4, N'1 ?ng', 5, 5)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (20, 4, N'Oresol', 4, N'1 gói', 3, 3)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (21, 4, N'Thuốc tiêu chảy', 4, N'1 viên', 4, 4)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (22, 4, N'Vitamin B', 4, N'1 viên', 5, 5)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (23, 4, N'Men tiêu hóa', 4, N'1 gói', 6, 6)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (24, 4, N'Nước điện giải', 4, N'100ml', 2, 2)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (25, 5, N'Vitamin B1', 5, N'1 viên', 15, 15)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (26, 5, N'Vitamin C', 5, N'1 viên', 10, 10)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (27, 5, N'Vitamin D3', 5, N'1 gi?t', 30, 30)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (28, 5, N'Men tiêu hóa', 5, N'1 gói', 10, 10)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (29, 5, N'Siro ăn ngon', 5, N'10ml', 5, 5)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (30, 5, N'Thuốc bổ tổng hợp', 5, N'1 viên', 7, 7)
INSERT [dbo].[Medications] ([MedicationId], [StudentId], [MedicationName], [PrescriptionId], [Dosage], [Quantity], [RemainingQuantity]) VALUES (31, NULL, N'Petrol', 6, N'2', 1, NULL)
SET IDENTITY_INSERT [dbo].[Medications] OFF
GO
SET IDENTITY_INSERT [dbo].[Nurse] ON 

INSERT [dbo].[Nurse] ([NurseId], [FullName], [Username], [Email], [PasswordHash]) VALUES (1, N'Nguyễn Thị Y tá 1', N'yta1', N'yta1@gmail.com', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Nurse] ([NurseId], [FullName], [Username], [Email], [PasswordHash]) VALUES (2, N'Trần Văn Y tá 2', N'yta2', N'yta2@gmail.com', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Nurse] ([NurseId], [FullName], [Username], [Email], [PasswordHash]) VALUES (3, N'Lê Thị Y tá 3', N'yta3', N'yta3@gmail.com', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Nurse] ([NurseId], [FullName], [Username], [Email], [PasswordHash]) VALUES (4, N'Phạm Văn Y tá 4', N'yta4', N'yta4@gmail.com', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Nurse] ([NurseId], [FullName], [Username], [Email], [PasswordHash]) VALUES (5, N'Hoàng Thị Y tá 5', N'yta5', N'yta5@gmail.com', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Nurse] ([NurseId], [FullName], [Username], [Email], [PasswordHash]) VALUES (6, N'Nguyen Thi Y Ta 6', N'yta6', N'yta6@gmail.com', N'e10adc3949ba59abbe56e057f20f883e')
SET IDENTITY_INSERT [dbo].[Nurse] OFF
GO
SET IDENTITY_INSERT [dbo].[Parent] ON 

INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (1, N'Nguyễn Thị Lan', N'0911112233', N'lan.nguyen@gmail.com', N'123 Đường ABC, Quận 1, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (2, N'Trần Văn Minh', N'0912223344', N'minh.tran@gmail.com', N'456 Phố XYZ, Quận 2, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (3, N'Lê Thị Hoa', N'0913334455', N'hoa.le@gmail.com', N'789 Ngõ DEF, Quận 3, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (4, N'Phạm Văn Hùng', N'0914445566', N'hung.pham@gmail.com', N'101 Đường GHI, Quận 4, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (5, N'Hoàng Thị Mai', N'0915556677', N'mai.hoang@gmail.com', N'202 Phố JKL, Quận 5, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (6, N'Đỗ Văn Quân', N'0916667788', N'quan.do@gmail.com', N'303 Ngõ MNO, Quận 6, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (7, N'Bùi Thị Thảo', N'0917778899', N'thao.bui@gmail.com', N'404 Đường PQR, Quận 7, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (8, N'Vũ Văn Long', N'0918889900', N'long.vu@gmail.com', N'505 Phố STU, Quận 8, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (9, N'Đặng Thị Yến', N'0919990011', N'yen.dang@gmail.com', N'606 Ngõ VWX, Quận 9, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (10, N'Châu Văn Đức', N'0920001122', N'duc.chau@gmail.com', N'707 Đường YZA, Quận 10, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (11, N'Nguyễn Văn Thắng', N'0921112233', N'thang.nguyen@gmail.com', N'808 Phố BCD, Quận 11, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (12, N'Trần Thị Lệ', N'0922223344', N'le.tran@gmail.com', N'909 Ngõ EFG, Quận 12, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (13, N'Lê Văn Khoa', N'0923334455', N'khoa.le@gmail.com', N'111 Đường HIJ, Quận Bình Thạnh, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (14, N'Phạm Thị Ngân', N'0924445566', N'ngan.pham@gmail.com', N'222 Phố KLM, Quận Gò Vấp, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (15, N'Hoàng Văn Nam', N'0925556677', N'nam.hoang@gmail.com', N'333 Ngõ NOP, Quận Phú Nhuận, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (16, N'Đỗ Thị Hương', N'0926667788', N'huong.do@gmail.com', N'444 Đường QRS, Quận Tân Bình, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (17, N'Bùi Văn Tùng', N'0927778899', N'tung.bui@gmail.com', N'555 Phố TUV, Quận Tân Phú, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (18, N'Vũ Thị Kim', N'0928889900', N'kim.vu@gmail.com', N'666 Ngõ WXY, Quận Bình Tân, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (19, N'Đặng Văn Sơn', N'0929990011', N'son.dang@gmail.com', N'777 Đường ZAB, Quận Thủ Đức, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (20, N'Châu Thị Trinh', N'0930001122', N'trinh.chau@gmail.com', N'888 Phố CDE, Quận 1, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (21, N'Nguyễn Văn An', N'0931112233', N'an.nguyen@gmail.com', N'101 Đường FGH, Quận 2, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (22, N'Trần Thị Bình', N'0932223344', N'binh.tran@gmail.com', N'202 Phố IJK, Quận 3, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (23, N'Lê Văn Cường', N'0933334455', N'cuong.le@gmail.com', N'303 Ngõ LMN, Quận 4, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (24, N'Phạm Thị Diệu', N'0934445566', N'dieu.pham@gmail.com', N'404 Đường OPQ, Quận 5, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (25, N'Hoàng Văn Hùng', N'0935556677', N'hung.hoang@gmail.com', N'505 Phố RST, Quận 6, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (26, N'Đỗ Thị Lan', N'0936667788', N'lan.do@gmail.com', N'606 Ngõ UVW, Quận 7, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (27, N'Bùi Văn Phát', N'0937778899', N'phat.bui@gmail.com', N'707 Đường XYZ, Quận 8, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (28, N'Vũ Thị Quyên', N'0938889900', N'quyen.vu@gmail.com', N'808 Phố ABC, Quận 9, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (29, N'Đặng Văn Sáng', N'0939990011', N'sang.dang@gmail.com', N'909 Ngõ DEF, Quận 10, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (30, N'Châu Thị Thanh', N'0940001122', N'thanh.chau@gmail.com', N'111 Đường GHI, Quận 11, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (31, N'Nguyễn Văn Việt', N'0941112233', N'viet.nguyen@gmail.com', N'222 Phố JKL, Quận 12, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (32, N'Trần Thị Xuân', N'0942223344', N'xuan.tran@gmail.com', N'333 Ngõ MNO, Quận Bình Thạnh, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (33, N'Lê Văn Yến', N'0943334455', N'yen.le@gmail.com', N'444 Đường PQR, Quận Gò Vấp, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (34, N'Phạm Thị Ánh', N'0944445566', N'anh.pham@gmail.com', N'555 Phố STU, Quận Phú Nhuận, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (35, N'Hoàng Văn Bảo', N'0945556677', N'bao.hoang@gmail.com', N'666 Ngõ VWX, Quận Tân Bình, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (36, N'Đỗ Thị Cẩm', N'0946667788', N'cam.do@gmail.com', N'777 Đường YZA, Quận Tân Phú, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (37, N'Bùi Văn Dũng', N'0947778899', N'dung.bui@gmail.com', N'888 Phố BCD, Quận Bình Tân, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (38, N'Vũ Thị Giang', N'0948889900', N'giang.vu@gmail.com', N'999 Ngõ EFG, Quận Thủ Đức, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (39, N'Đặng Văn Hải', N'0949990011', N'hai.dang@gmail.com', N'123 Đường HIJ, Quận 1, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (40, N'Châu Thị Kim', N'0950001122', N'kim.chau@gmail.com', N'456 Phố KLM, Quận 2, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (41, N'Nguyễn Văn Lợi', N'0951112233', N'loi.nguyen@gmail.com', N'789 Ngõ NOP, Quận 3, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (42, N'Trần Thị Mỹ', N'0952223344', N'my.tran@gmail.com', N'101 Đường QRS, Quận 4, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (43, N'Lê Văn Nghĩa', N'0953334455', N'nghia.le@gmail.com', N'202 Phố TUV, Quận 5, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (44, N'Phạm Thị Oanh', N'0954445566', N'oanh.pham@gmail.com', N'303 Ngõ WXY, Quận 6, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (45, N'Hoàng Văn Phúc', N'0955556677', N'phuc.hoang@gmail.com', N'404 Đường ZAB, Quận 7, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (46, N'Đỗ Thị Quỳnh', N'0956667788', N'quynh.do@gmail.com', N'505 Phố CDE, Quận 8, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (47, N'Bùi Văn Trung', N'0957778899', N'trung.bui@gmail.com', N'606 Ngõ FGH, Quận 9, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (48, N'Vũ Thị Thúy', N'0958889900', N'thuy.vu@gmail.com', N'707 Đường IJK, Quận 10, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (49, N'Đặng Văn Cường', N'0959990011', N'cuong.dang@gmail.com', N'808 Phố LMN, Quận 11, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Parent] ([ParentId], [FullName], [PhoneNumber], [Email], [Address], [PasswordHash]) VALUES (50, N'Châu Thị Diễm', N'0960001122', N'diem.chau@gmail.com', N'909 Ngõ OPQ, Quận 12, TP.HCM', N'e10adc3949ba59abbe56e057f20f883e')
SET IDENTITY_INSERT [dbo].[Parent] OFF
GO
SET IDENTITY_INSERT [dbo].[ParentPrescription] ON 

INSERT [dbo].[ParentPrescription] ([PrescriptionId], [NurseId], [SubmittedDate], [Schedule], [ParentNote], [ParentId], [PrescriptionFile]) VALUES (1, 1, CAST(N'2025-06-09' AS Date), N'Sáng, Tối', N'Bé bị sốt cao', 1, N'https://localhost:7024/files/blogs//8ef98348-e223-47de-8bb1-164654e85904.jpg')
INSERT [dbo].[ParentPrescription] ([PrescriptionId], [NurseId], [SubmittedDate], [Schedule], [ParentNote], [ParentId], [PrescriptionFile]) VALUES (2, 2, CAST(N'2025-06-09' AS Date), N'3 lần/ngày', N'Bé viêm họng', 2, N'presc_2.pdf')
INSERT [dbo].[ParentPrescription] ([PrescriptionId], [NurseId], [SubmittedDate], [Schedule], [ParentNote], [ParentId], [PrescriptionFile]) VALUES (3, 3, CAST(N'2025-06-09' AS Date), N'Tối', N'Bé bị dị ứng', 3, N'presc_3.pdf')
INSERT [dbo].[ParentPrescription] ([PrescriptionId], [NurseId], [SubmittedDate], [Schedule], [ParentNote], [ParentId], [PrescriptionFile]) VALUES (4, 4, CAST(N'2025-06-09' AS Date), N'Ngày 2 lần', N'Bé tiêu chảy', 4, N'presc_4.pdf')
INSERT [dbo].[ParentPrescription] ([PrescriptionId], [NurseId], [SubmittedDate], [Schedule], [ParentNote], [ParentId], [PrescriptionFile]) VALUES (5, 5, CAST(N'2025-06-09' AS Date), N'Sáng, Trưa, Tối', N'Bé lười ăn, thiếu vitamin', 5, N'presc_5.pdf')
INSERT [dbo].[ParentPrescription] ([PrescriptionId], [NurseId], [SubmittedDate], [Schedule], [ParentNote], [ParentId], [PrescriptionFile]) VALUES (6, NULL, CAST(N'2025-06-23' AS Date), N'Sáng 2 viên, chiều 2 viên', N'Nhớ cho con uống nhé y tá', 1, N'https://localhost:7024/files/blogs//e2ba4a87-bb34-4864-ab4f-7e93dea1e8a9.jpg')
SET IDENTITY_INSERT [dbo].[ParentPrescription] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (1, 1, N'Nguyễn An Bình', N'binhan1', N'1A', CAST(N'2015-09-01' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (2, 1, N'Nguyễn Cẩm Tú', N'tucn1', N'3B', CAST(N'2013-03-15' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (3, 2, N'Trần Gia Bảo', N'baogt1', N'2C', CAST(N'2014-07-20' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (4, 2, N'Trần Minh Anh', NULL, N'5A', CAST(N'2011-11-10' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (5, 3, N'Lê Thanh Tùng', NULL, N'1A', CAST(N'2015-10-25' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (6, 3, N'Lê Thị Ngọc', NULL, N'4D', CAST(N'2012-05-05' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (7, 4, N'Phạm Quang Minh', NULL, N'2C', CAST(N'2014-02-28' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (8, 4, N'Phạm Thùy Linh', NULL, N'6B', CAST(N'2010-09-09' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (9, 5, N'Hoàng Văn Đạt', NULL, N'3B', CAST(N'2013-01-01' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (10, 5, N'Hoàng Thị Trúc', NULL, N'5A', CAST(N'2011-04-20' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (11, 6, N'Đỗ Minh Quân', NULL, N'1A', CAST(N'2015-07-07' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (12, 6, N'Đỗ Thảo Vy', NULL, N'4D', CAST(N'2012-12-12' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (13, 7, N'Bùi Thanh Bình', NULL, N'2C', CAST(N'2014-08-18' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (14, 7, N'Bùi Ánh Dương', NULL, N'6B', CAST(N'2010-02-22' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (15, 8, N'Vũ Hải Đăng', NULL, N'3B', CAST(N'2013-06-06' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (16, 8, N'Vũ Quỳnh Chi', NULL, N'5A', CAST(N'2011-08-08' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (17, 9, N'Đặng Văn Khoa', NULL, N'1A', CAST(N'2015-03-03' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (18, 9, N'Đặng Thị Mai', NULL, N'4D', CAST(N'2012-10-10' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (19, 10, N'Châu Gia Huy', NULL, N'2C', CAST(N'2014-01-01' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (20, 10, N'Châu Bảo Ngọc', NULL, N'6B', CAST(N'2010-07-07' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (21, 11, N'Nguyễn Đức Anh', NULL, N'3B', CAST(N'2013-09-09' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (22, 11, N'Nguyễn Thu Thủy', NULL, N'5A', CAST(N'2011-01-01' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (23, 12, N'Trần Văn Long', NULL, N'1A', CAST(N'2015-04-04' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (24, 12, N'Trần Diệu Linh', NULL, N'4D', CAST(N'2012-06-06' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (25, 13, N'Lê Hoàng Phúc', NULL, N'2C', CAST(N'2014-11-11' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (26, 13, N'Lê Thanh Nga', NULL, N'6B', CAST(N'2010-04-04' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (27, 14, N'Phạm Chí Công', NULL, N'3B', CAST(N'2013-02-02' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (28, 14, N'Phạm Thúy An', NULL, N'5A', CAST(N'2011-07-07' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (29, 15, N'Hoàng Văn Cường', NULL, N'1A', CAST(N'2015-08-08' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (30, 15, N'Hoàng Thị Hà', NULL, N'4D', CAST(N'2012-01-01' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (31, 16, N'Đỗ Minh Hiếu', NULL, N'2C', CAST(N'2014-05-05' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (32, 16, N'Đỗ Phương Anh', NULL, N'6B', CAST(N'2010-11-11' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (33, 17, N'Bùi Anh Tuấn', NULL, N'3B', CAST(N'2013-10-10' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (34, 17, N'Bùi Thị Thoa', NULL, N'5A', CAST(N'2011-03-03' AS Date), N'N?', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (35, 18, N'Vũ Duy Khánh', NULL, N'1A', CAST(N'2015-06-06' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (36, 18, N'Vũ Hải Yến', NULL, N'4D', CAST(N'2012-09-09' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (37, 19, N'Đặng Minh Khang', NULL, N'2C', CAST(N'2014-03-03' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (38, 19, N'Đặng Thị Kim', NULL, N'6B', CAST(N'2010-08-08' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (39, 20, N'Châu Hoàng Long', NULL, N'3B', CAST(N'2013-05-05' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (40, 20, N'Châu Thị Lan', NULL, N'5A', CAST(N'2011-10-10' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (41, 21, N'Nguyễn Hữu Nghĩa', NULL, N'1A', CAST(N'2015-02-02' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (42, 21, N'Nguyễn Thị Phương', NULL, N'4D', CAST(N'2012-04-04' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (43, 22, N'Trần Bá Đạt', NULL, N'2C', CAST(N'2014-09-09' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (44, 22, N'Trần Ngọc Mai', NULL, N'6B', CAST(N'2010-01-01' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (45, 23, N'Lê Quang Huy', NULL, N'3B', CAST(N'2013-07-07' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (46, 23, N'Lê Thị Thảo', NULL, N'5A', CAST(N'2011-12-12' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (47, 24, N'Phạm Văn Quyết', NULL, N'1A', CAST(N'2015-05-05' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (48, 24, N'Phạm Thị Thanh', NULL, N'4D', CAST(N'2012-03-03' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (49, 25, N'Hoàng Minh Đức', NULL, N'2C', CAST(N'2014-10-10' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (50, 25, N'Hoàng Thị Tuyết', NULL, N'6B', CAST(N'2010-06-06' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (51, 26, N'Đỗ Văn Kiên', NULL, N'3B', CAST(N'2013-04-04' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (52, 26, N'Đỗ Thị Thoa', NULL, N'5A', CAST(N'2011-09-09' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (53, 27, N'Bùi Văn Hậu', NULL, N'1A', CAST(N'2015-01-01' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (54, 27, N'Bùi Thị Trinh', NULL, N'4D', CAST(N'2012-07-07' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (55, 28, N'Vũ Thành Nam', NULL, N'2C', CAST(N'2014-06-06' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (56, 28, N'Vũ Thị Hương', NULL, N'6B', CAST(N'2010-12-12' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (57, 29, N'Đặng Văn Tùng', NULL, N'3B', CAST(N'2013-08-08' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (58, 29, N'Đặng Thị Ngọc', NULL, N'5A', CAST(N'2011-02-02' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (59, 30, N'Châu Văn Đạt', NULL, N'1A', CAST(N'2015-11-11' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (60, 30, N'Châu Thị Anh', NULL, N'4D', CAST(N'2012-05-05' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (61, 31, N'Nguyễn Minh Khôi', NULL, N'2C', CAST(N'2014-04-04' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (62, 31, N'Nguyễn Thị Thúy', NULL, N'6B', CAST(N'2010-10-10' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (63, 32, N'Trần Văn Thắng', NULL, N'3B', CAST(N'2013-01-01' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (64, 32, N'Trần Thị Linh', NULL, N'5A', CAST(N'2011-04-04' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (65, 33, N'Lê Anh Khoa', NULL, N'1A', CAST(N'2015-07-07' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (66, 33, N'Lê Thị Mai', NULL, N'4D', CAST(N'2012-09-09' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (67, 34, N'Phạm Duy Anh', NULL, N'2C', CAST(N'2014-08-08' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (68, 34, N'Phạm Thị Trang', NULL, N'6B', CAST(N'2010-03-03' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (69, 35, N'Hoàng Văn Toàn', NULL, N'3B', CAST(N'2013-06-06' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (70, 35, N'Hoàng Thị Loan', NULL, N'5A', CAST(N'2011-08-08' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (71, 36, N'Đỗ Minh Quân', NULL, N'1A', CAST(N'2015-03-03' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (72, 36, N'Đỗ Thảo Vy', NULL, N'4D', CAST(N'2012-10-10' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (73, 37, N'Bùi Thanh Bình', NULL, N'2C', CAST(N'2014-01-01' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (74, 37, N'Bùi Ánh Dương', NULL, N'6B', CAST(N'2010-07-07' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (75, 38, N'Vũ Hải Đăng', NULL, N'3B', CAST(N'2013-09-09' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (76, 38, N'Vũ Quỳnh Chi', NULL, N'5A', CAST(N'2011-01-01' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (77, 39, N'Đặng Văn Khoa', NULL, N'1A', CAST(N'2015-04-04' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (78, 39, N'Đặng Thị Mai', NULL, N'4D', CAST(N'2012-06-06' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (79, 40, N'Châu Gia Huy', NULL, N'2C', CAST(N'2014-11-11' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (80, 40, N'Châu Bảo Ngọc', NULL, N'6B', CAST(N'2010-04-04' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (81, 41, N'Nguyễn Đức Anh', NULL, N'3B', CAST(N'2013-02-02' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (82, 41, N'Nguyễn Thu Thủy', NULL, N'5A', CAST(N'2011-07-07' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (83, 42, N'Trần Văn Long', NULL, N'1A', CAST(N'2015-08-08' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (84, 42, N'Trần Diệu Linh', NULL, N'4D', CAST(N'2012-01-01' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (85, 43, N'Lê Hoàng Phúc', NULL, N'2C', CAST(N'2014-05-05' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (86, 43, N'Lê Thanh Nga', NULL, N'6B', CAST(N'2010-11-11' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (87, 44, N'Phạm Chí Công', NULL, N'3B', CAST(N'2013-10-10' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (88, 44, N'Phạm Thúy An', NULL, N'5A', CAST(N'2011-03-03' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (89, 45, N'Hoàng Văn Cường', NULL, N'1A', CAST(N'2015-06-06' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (90, 45, N'Hoàng Thị Hà', NULL, N'4D', CAST(N'2012-09-09' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (91, 46, N'Đỗ Minh Hiếu', NULL, N'2C', CAST(N'2014-03-03' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (92, 46, N'Đỗ Phương Anh', NULL, N'6B', CAST(N'2010-08-08' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (93, 47, N'Bùi Anh Tuấn', NULL, N'3B', CAST(N'2013-05-05' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (94, 47, N'Bùi Thị Thoa', NULL, N'5A', CAST(N'2011-10-10' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (95, 48, N'Vũ Duy Khánh', NULL, N'1A', CAST(N'2015-02-02' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (96, 48, N'Vũ Hải Yến', NULL, N'4D', CAST(N'2012-04-04' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (97, 49, N'Đặng Minh Khang', NULL, N'2C', CAST(N'2014-09-09' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (98, 49, N'Đặng Thị Kim', NULL, N'6B', CAST(N'2010-01-01' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (99, 50, N'Châu Hoàng Long', NULL, N'3B', CAST(N'2013-07-07' AS Date), N'Nam', N'e10adc3949ba59abbe56e057f20f883e')
GO
INSERT [dbo].[Student] ([StudentId], [ParentId], [FullName], [StudentNumber], [ClassName], [DateOfBirth], [Gender], [PasswordHash]) VALUES (100, 50, N'Châu Thị Lan', NULL, N'5A', CAST(N'2011-12-12' AS Date), N'Nữ', N'e10adc3949ba59abbe56e057f20f883e')
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[VaccinationResult] ON 

INSERT [dbo].[VaccinationResult] ([VaccinationResultId], [VaccinationScheduleId], [HealthProfileId], [NurseId], [Status], [DoseNumber], [Note]) VALUES (1, 1, 1, 1, 1, 1, N'Hoàn thành mũi 1')
INSERT [dbo].[VaccinationResult] ([VaccinationResultId], [VaccinationScheduleId], [HealthProfileId], [NurseId], [Status], [DoseNumber], [Note]) VALUES (2, 1, 2, 2, 1, 1, N'Hoàn thành mũi 1')
INSERT [dbo].[VaccinationResult] ([VaccinationResultId], [VaccinationScheduleId], [HealthProfileId], [NurseId], [Status], [DoseNumber], [Note]) VALUES (3, 1, 3, 3, 1, 1, N'Hoàn thành mũi 1')
INSERT [dbo].[VaccinationResult] ([VaccinationResultId], [VaccinationScheduleId], [HealthProfileId], [NurseId], [Status], [DoseNumber], [Note]) VALUES (4, 2, 4, 4, 1, 2, N'Hoàn thành mũi 2')
INSERT [dbo].[VaccinationResult] ([VaccinationResultId], [VaccinationScheduleId], [HealthProfileId], [NurseId], [Status], [DoseNumber], [Note]) VALUES (5, 2, 5, 5, 0, 2, N'Hoãn tiêm do sốt nhẹ')
INSERT [dbo].[VaccinationResult] ([VaccinationResultId], [VaccinationScheduleId], [HealthProfileId], [NurseId], [Status], [DoseNumber], [Note]) VALUES (6, 3, 6, 1, 1, 1, N'Hoàn thành mũi 1')
INSERT [dbo].[VaccinationResult] ([VaccinationResultId], [VaccinationScheduleId], [HealthProfileId], [NurseId], [Status], [DoseNumber], [Note]) VALUES (7, 3, 7, 2, 1, 1, N'Hoàn thành mũi 1')
INSERT [dbo].[VaccinationResult] ([VaccinationResultId], [VaccinationScheduleId], [HealthProfileId], [NurseId], [Status], [DoseNumber], [Note]) VALUES (8, 1, 8, 3, 1, 1, N'Hoàn thành mũi 1')
INSERT [dbo].[VaccinationResult] ([VaccinationResultId], [VaccinationScheduleId], [HealthProfileId], [NurseId], [Status], [DoseNumber], [Note]) VALUES (9, 2, 9, 4, 1, 2, N'Hoàn thành mũi 2')
INSERT [dbo].[VaccinationResult] ([VaccinationResultId], [VaccinationScheduleId], [HealthProfileId], [NurseId], [Status], [DoseNumber], [Note]) VALUES (10, 3, 10, 5, 0, 1, N'Hoãn tiêm do dị ứng nhẹ')
INSERT [dbo].[VaccinationResult] ([VaccinationResultId], [VaccinationScheduleId], [HealthProfileId], [NurseId], [Status], [DoseNumber], [Note]) VALUES (21, 3, 4, 4, 1, 1, N'Sức khỏe của bé đã ổn.')
INSERT [dbo].[VaccinationResult] ([VaccinationResultId], [VaccinationScheduleId], [HealthProfileId], [NurseId], [Status], [DoseNumber], [Note]) VALUES (22, 3, 96, 4, 1, 1, N'Sức khỏe đã ổn định, hẹn lần sau tái khám.')
SET IDENTITY_INSERT [dbo].[VaccinationResult] OFF
GO
SET IDENTITY_INSERT [dbo].[VaccinationSchedule] ON 

INSERT [dbo].[VaccinationSchedule] ([VaccinationScheduleId], [FormId], [ManagerId], [Name], [ScheduleDate], [Location], [Note]) VALUES (1, 1, 1, N'Tiêm chủng vaccine cúm', CAST(N'2024-03-01T09:00:00.000' AS DateTime), N'Phòng y tế trường', N'Yêu cầu tiêm chủng đầy đủ')
INSERT [dbo].[VaccinationSchedule] ([VaccinationScheduleId], [FormId], [ManagerId], [Name], [ScheduleDate], [Location], [Note]) VALUES (2, 4, 1, N'Tiêm vaccine sởi', CAST(N'2024-03-05T10:00:00.000' AS DateTime), N'Phòng y tế trường', N'Dành cho học sinh chưa tiêm hoặc thiếu mũi')
INSERT [dbo].[VaccinationSchedule] ([VaccinationScheduleId], [FormId], [ManagerId], [Name], [ScheduleDate], [Location], [Note]) VALUES (3, 7, 1, N'Tiêm vaccine bạch hầu', CAST(N'2024-03-10T11:00:00.000' AS DateTime), N'Phòng y tế trường', N'Kiểm tra sổ tiêm chủng trước khi tiêm')
SET IDENTITY_INSERT [dbo].[VaccinationSchedule] OFF
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK__Blog__ManagerId__6C190EBB] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Manager] ([ManagerId])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK__Blog__ManagerId__6C190EBB]
GO
ALTER TABLE [dbo].[ConsentForm]  WITH CHECK ADD  CONSTRAINT [FK__ConsentFo__Paren__6D0D32F4] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Parent] ([ParentId])
GO
ALTER TABLE [dbo].[ConsentForm] CHECK CONSTRAINT [FK__ConsentFo__Paren__6D0D32F4]
GO
ALTER TABLE [dbo].[ConsentForm]  WITH CHECK ADD  CONSTRAINT [FK_ConsentForm_Form] FOREIGN KEY([FormId])
REFERENCES [dbo].[Form] ([FormId])
GO
ALTER TABLE [dbo].[ConsentForm] CHECK CONSTRAINT [FK_ConsentForm_Form]
GO
ALTER TABLE [dbo].[ConsultationForm]  WITH CHECK ADD  CONSTRAINT [FK__Consultat__Paren__6EF57B66] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Parent] ([ParentId])
GO
ALTER TABLE [dbo].[ConsultationForm] CHECK CONSTRAINT [FK__Consultat__Paren__6EF57B66]
GO
ALTER TABLE [dbo].[ConsultationForm]  WITH CHECK ADD  CONSTRAINT [FK_ConsultationForm_ConsultationSchedule] FOREIGN KEY([ConsultationScheduleId])
REFERENCES [dbo].[ConsultationSchedule] ([ConsultationScheduleId])
GO
ALTER TABLE [dbo].[ConsultationForm] CHECK CONSTRAINT [FK_ConsultationForm_ConsultationSchedule]
GO
ALTER TABLE [dbo].[ConsultationSchedule]  WITH CHECK ADD  CONSTRAINT [FK__Consultat__Nurse__70DDC3D8] FOREIGN KEY([NurseId])
REFERENCES [dbo].[Nurse] ([NurseId])
GO
ALTER TABLE [dbo].[ConsultationSchedule] CHECK CONSTRAINT [FK__Consultat__Nurse__70DDC3D8]
GO
ALTER TABLE [dbo].[ConsultationSchedule]  WITH CHECK ADD  CONSTRAINT [FK_ConsultationSchedule_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[ConsultationSchedule] CHECK CONSTRAINT [FK_ConsultationSchedule_Student]
GO
ALTER TABLE [dbo].[Form]  WITH CHECK ADD  CONSTRAINT [FK__Form__ManagerId__66603565] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Manager] ([ManagerId])
GO
ALTER TABLE [dbo].[Form] CHECK CONSTRAINT [FK__Form__ManagerId__66603565]
GO
ALTER TABLE [dbo].[HealthCheckResult]  WITH CHECK ADD  CONSTRAINT [FK__HealthChe__Healt__72C60C4A] FOREIGN KEY([HealthCheckScheduleId])
REFERENCES [dbo].[HealthCheckSchedule] ([HealthCheckScheduleId])
GO
ALTER TABLE [dbo].[HealthCheckResult] CHECK CONSTRAINT [FK__HealthChe__Healt__72C60C4A]
GO
ALTER TABLE [dbo].[HealthCheckResult]  WITH CHECK ADD  CONSTRAINT [FK__HealthChe__Healt__73BA3083] FOREIGN KEY([HealthProfileId])
REFERENCES [dbo].[HealthProfile] ([HealthProfileId])
GO
ALTER TABLE [dbo].[HealthCheckResult] CHECK CONSTRAINT [FK__HealthChe__Healt__73BA3083]
GO
ALTER TABLE [dbo].[HealthCheckResult]  WITH CHECK ADD  CONSTRAINT [FK__HealthChe__Nurse__74AE54BC] FOREIGN KEY([NurseId])
REFERENCES [dbo].[Nurse] ([NurseId])
GO
ALTER TABLE [dbo].[HealthCheckResult] CHECK CONSTRAINT [FK__HealthChe__Nurse__74AE54BC]
GO
ALTER TABLE [dbo].[HealthCheckSchedule]  WITH CHECK ADD  CONSTRAINT [FK__HealthChe__FormI__74AE54BC] FOREIGN KEY([FormId])
REFERENCES [dbo].[Form] ([FormId])
GO
ALTER TABLE [dbo].[HealthCheckSchedule] CHECK CONSTRAINT [FK__HealthChe__FormI__74AE54BC]
GO
ALTER TABLE [dbo].[HealthCheckSchedule]  WITH CHECK ADD FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Manager] ([ManagerId])
GO
ALTER TABLE [dbo].[HealthProfile]  WITH CHECK ADD  CONSTRAINT [FK__HealthPro__Stude__6383C8BA] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[HealthProfile] CHECK CONSTRAINT [FK__HealthPro__Stude__6383C8BA]
GO
ALTER TABLE [dbo].[MedicalEvent]  WITH CHECK ADD  CONSTRAINT [FK__MedicalEv__Nurse__787EE5A0] FOREIGN KEY([NurseId])
REFERENCES [dbo].[Nurse] ([NurseId])
GO
ALTER TABLE [dbo].[MedicalEvent] CHECK CONSTRAINT [FK__MedicalEv__Nurse__787EE5A0]
GO
ALTER TABLE [dbo].[MedicalEvent]  WITH CHECK ADD  CONSTRAINT [FK__MedicalEv__Stude__59FA5E80] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[MedicalEvent] CHECK CONSTRAINT [FK__MedicalEv__Stude__59FA5E80]
GO
ALTER TABLE [dbo].[MedicalInventory]  WITH CHECK ADD FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Manager] ([ManagerId])
GO
ALTER TABLE [dbo].[Medications]  WITH CHECK ADD  CONSTRAINT [FK__Medicatio__Stude__52593CB8] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[Medications] CHECK CONSTRAINT [FK__Medicatio__Stude__52593CB8]
GO
ALTER TABLE [dbo].[Medications]  WITH CHECK ADD  CONSTRAINT [FK_Medications_Prescription] FOREIGN KEY([PrescriptionId])
REFERENCES [dbo].[ParentPrescription] ([PrescriptionId])
GO
ALTER TABLE [dbo].[Medications] CHECK CONSTRAINT [FK_Medications_Prescription]
GO
ALTER TABLE [dbo].[ParentPrescription]  WITH CHECK ADD FOREIGN KEY([NurseId])
REFERENCES [dbo].[Nurse] ([NurseId])
GO
ALTER TABLE [dbo].[ParentPrescription]  WITH CHECK ADD FOREIGN KEY([ParentId])
REFERENCES [dbo].[Parent] ([ParentId])
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK__Student__ParentI__4D94879B] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Parent] ([ParentId])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK__Student__ParentI__4D94879B]
GO
ALTER TABLE [dbo].[VaccinationResult]  WITH CHECK ADD  CONSTRAINT [FK__Vaccinati__Healt__7F2BE32F] FOREIGN KEY([HealthProfileId])
REFERENCES [dbo].[HealthProfile] ([HealthProfileId])
GO
ALTER TABLE [dbo].[VaccinationResult] CHECK CONSTRAINT [FK__Vaccinati__Healt__7F2BE32F]
GO
ALTER TABLE [dbo].[VaccinationResult]  WITH CHECK ADD  CONSTRAINT [FK__Vaccinati__Nurse__00200768] FOREIGN KEY([NurseId])
REFERENCES [dbo].[Nurse] ([NurseId])
GO
ALTER TABLE [dbo].[VaccinationResult] CHECK CONSTRAINT [FK__Vaccinati__Nurse__00200768]
GO
ALTER TABLE [dbo].[VaccinationResult]  WITH CHECK ADD  CONSTRAINT [FK__Vaccinati__Vacci__01142BA1] FOREIGN KEY([VaccinationScheduleId])
REFERENCES [dbo].[VaccinationSchedule] ([VaccinationScheduleId])
GO
ALTER TABLE [dbo].[VaccinationResult] CHECK CONSTRAINT [FK__Vaccinati__Vacci__01142BA1]
GO
ALTER TABLE [dbo].[VaccinationSchedule]  WITH CHECK ADD  CONSTRAINT [FK__Vaccinati__FormI__7D439ABD] FOREIGN KEY([FormId])
REFERENCES [dbo].[Form] ([FormId])
GO
ALTER TABLE [dbo].[VaccinationSchedule] CHECK CONSTRAINT [FK__Vaccinati__FormI__7D439ABD]
GO
ALTER TABLE [dbo].[VaccinationSchedule]  WITH CHECK ADD FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Manager] ([ManagerId])
GO
