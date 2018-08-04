CREATE TABLE [segmentation].[SegmentationFlatDatad10435f0-ba7f-4e3d-bee2-c0e2bc039685]
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
ALTER TABLE [segmentation].[SegmentationFlatDatad10435f0-ba7f-4e3d-bee2-c0e2bc039685] ADD CONSTRAINT [pk_SegmentationFlatDatad10435f0-ba7f-4e3d-bee2-c0e2bc039685] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatDatad10435f0-ba7f-4e3d-bee2-c0e2bc039685] ON [segmentation].[SegmentationFlatDatad10435f0-ba7f-4e3d-bee2-c0e2bc039685] ([_rn])
GO
