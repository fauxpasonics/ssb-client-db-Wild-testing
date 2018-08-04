CREATE TABLE [segmentation].[SegmentationFlatData54f6e795-6ab5-4a8e-9567-4d72bb4d1c9b]
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
ALTER TABLE [segmentation].[SegmentationFlatData54f6e795-6ab5-4a8e-9567-4d72bb4d1c9b] ADD CONSTRAINT [pk_SegmentationFlatData54f6e795-6ab5-4a8e-9567-4d72bb4d1c9b] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatData54f6e795-6ab5-4a8e-9567-4d72bb4d1c9b] ON [segmentation].[SegmentationFlatData54f6e795-6ab5-4a8e-9567-4d72bb4d1c9b] ([_rn])
GO
