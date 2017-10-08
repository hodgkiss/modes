USE [flight_tracking]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tracking_2018_01](
	[Flight_Id] [int] IDENTITY(1,1) NOT NULL,
	[Alt] [int] NULL,
	[AltT] [int] NULL,
	[Bad] [varchar](10) NULL,
	[Brng] [int] NULL,
	[Call] [nvarchar](max) NULL,
	[CallSus] [varchar](10) NULL,
	[CMsgs] [int] NULL,
	[CNum] [nvarchar](max) NULL,
	[Cos] [nvarchar](max) NULL,
	[Cot] [nvarchar](max) NULL,
	[Cou] [nvarchar](max) NULL,
	[Dst] [int] NULL,
	[Engines] [nvarchar](max) NULL,
	[EngMount] [varchar](10) NULL,
	[EngType] [varchar](10) NULL,
	[FlightsCount] [int] NULL,
	[From] [nvarchar](max) NULL,
	[GAlt] [int] NULL,
	[Gnd] [varchar](10) NULL,
	[HasPic] [varchar](10) NULL,
	[HasSig] [varchar](10) NULL,
	[Help] [varchar](10) NULL,
	[Icao] [nvarchar](max) NULL,
	[Id] [int] NULL,
	[InHg] [float] NULL,
	[Interested] [varchar](10) NULL,
	[IsTisb] [varchar](10) NULL,
	[Lat] [float] NULL,
	[Long] [float] NULL,
	[Man] [nvarchar](max) NULL,
	[Mdl] [nvarchar](max) NULL,
	[Mil] [varchar](10) NULL,
	[Mlat] [varchar](10) NULL,
	[Op] [nvarchar](max) NULL,
	[OpCode] [nvarchar](max) NULL,
	[PicX] [int] NULL,
	[PicY] [int] NULL,
	[PosStale] [varchar](10) NULL,
	[PosTime] [float] NULL,
	[Rcvr] [float] NULL,
	[Reg] [nvarchar](max) NULL,
	[ResetTrail] [varchar](10) NULL,
	[Sat] [varchar](10) NULL,
	[Sig] [float] NULL,
	[Spd] [float] NULL,
	[SpdTyp] [float] NULL,
	[Species] [varchar](10) NULL,
	[Sqk] [float] NULL,
	[Stops] [nvarchar](max) NULL,
	[Tag] [nvarchar](max) NULL,
	[TAlt] [float] NULL,
	[To] [nvarchar](max) NULL,
	[Trak] [float] NULL,
	[TrkH] [varchar](10) NULL,
	[Trt] [float] NULL,
	[TSecs] [float] NULL,
	[TT] [nvarchar](max) NULL,
	[TTrk] [float] NULL,
	[Type] [nvarchar](max) NULL,
	[Vsi] [float] NULL,
	[VsiT] [float] NULL,
	[WTC] [varchar](10) NULL,
	[Year] [nvarchar](max) NULL,
	[FileDateTime] [nchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Flight_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
