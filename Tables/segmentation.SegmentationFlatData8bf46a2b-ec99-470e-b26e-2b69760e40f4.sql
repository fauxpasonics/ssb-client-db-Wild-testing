CREATE TABLE [segmentation].[SegmentationFlatData8bf46a2b-ec99-470e-b26e-2b69760e40f4]
(
[id] [uniqueidentifier] NOT NULL,
[DocumentType] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SessionId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Environment] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TenantId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[_rn] [bigint] NULL,
[SSB_CRMSYSTEM_CONTACT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerSourceSystem] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
ALTER TABLE [segmentation].[SegmentationFlatData8bf46a2b-ec99-470e-b26e-2b69760e40f4] ADD CONSTRAINT [pk_SegmentationFlatData8bf46a2b-ec99-470e-b26e-2b69760e40f4] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatData8bf46a2b-ec99-470e-b26e-2b69760e40f4] ON [segmentation].[SegmentationFlatData8bf46a2b-ec99-470e-b26e-2b69760e40f4] ([_rn])
GO
