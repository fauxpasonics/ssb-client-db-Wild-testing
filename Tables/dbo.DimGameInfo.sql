CREATE TABLE [dbo].[DimGameInfo]
(
[DimGameInfoId] [int] NOT NULL IDENTITY(1, 1),
[Outcome] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PistonsScore] [int] NULL,
[OpponentScore] [int] NULL,
[RecordToDateWin] [int] NULL,
[RecordToDateLoss] [int] NULL,
[OpponentRecordToDateWin] [int] NULL,
[OpponentRecordToDateLoss] [int] NULL,
[Qtr1StartTime] [datetime] NULL,
[Qtr1EndTime] [datetime] NULL,
[Qtr2StartTime] [datetime] NULL,
[Qtr2EndTime] [datetime] NULL,
[Qtr3StartTime] [datetime] NULL,
[Qtr3EndTime] [datetime] NULL,
[Qtr4StartTime] [datetime] NULL,
[Qtr4EndTime] [datetime] NULL,
[OvertimePeriods] [int] NULL CONSTRAINT [DF__DimGameIn__Overt__4E1E9780] DEFAULT ((0)),
[CreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UpdatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__DimGameIn__Creat__4F12BBB9] DEFAULT (getdate()),
[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF__DimGameIn__Updat__5006DFF2] DEFAULT (getdate()),
[IsDeleted] [bit] NOT NULL CONSTRAINT [DF__DimGameIn__IsDel__50FB042B] DEFAULT ((0)),
[DeleteDate] [datetime] NULL,
[SSID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SourceSystem] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [dbo].[DimGameInfo] ADD CONSTRAINT [PK_DimGameInfo] PRIMARY KEY CLUSTERED  ([DimGameInfoId])
GO
