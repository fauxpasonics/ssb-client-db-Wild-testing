CREATE TABLE [dbo].[DimArena]
(
[DimArenaId] [int] NOT NULL IDENTITY(1, 1),
[ArenaCode] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ArenaName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ArenaDesc] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ArenaClass] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Capacity] [int] NULL,
[IsOutdoor] [bit] NULL,
[StreetAddress] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[State] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ZipCode] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Latitude] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Longitude] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ArenaStartDate] [date] NULL,
[ArenaEndDate] [date] NULL,
[Active] [bit] NULL,
[SSCreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSUpdatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSCreatedDate] [datetime] NULL,
[SSUpdatedDate] [datetime] NULL,
[SSID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSID_arena_id] [int] NULL,
[SourceSystem] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DeltaHashKey] [binary] (32) NULL,
[CreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UpdatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__DimArena__Create__489AC854] DEFAULT (getdate()),
[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF__DimArena__Update__498EEC8D] DEFAULT (getdate()),
[IsDeleted] [bit] NOT NULL CONSTRAINT [DF__DimArena__IsDele__4A8310C6] DEFAULT ((0)),
[DeleteDate] [datetime] NULL
)
GO
ALTER TABLE [dbo].[DimArena] ADD CONSTRAINT [PK_DimArena] PRIMARY KEY CLUSTERED  ([DimArenaId])
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_LoadKey] ON [dbo].[DimArena] ([SourceSystem], [SSID_arena_id])
GO
