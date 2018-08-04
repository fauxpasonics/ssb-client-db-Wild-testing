CREATE TABLE [etl].[TicketTaggingLogic]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[DimSeasonID] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TagType] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TagTypeTable] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TagTypeTableID] [int] NULL,
[Logic] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__CreatedDate] [datetime] NULL CONSTRAINT [DF__TicketTag__ETL____7954D6C0] DEFAULT (getdate()),
[ETL__UpdatedDate] [datetime] NULL CONSTRAINT [DF__TicketTag__ETL____7A48FAF9] DEFAULT (getdate()),
[Config_Location] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TagTypeRank] [int] NULL
)
GO
