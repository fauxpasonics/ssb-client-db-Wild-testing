CREATE TABLE [segmentation].[SegmentationFlatData70aa95ca-1627-40a6-b89b-8487453fe8a0]
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
ALTER TABLE [segmentation].[SegmentationFlatData70aa95ca-1627-40a6-b89b-8487453fe8a0] ADD CONSTRAINT [pk_SegmentationFlatData70aa95ca-1627-40a6-b89b-8487453fe8a0] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatData70aa95ca-1627-40a6-b89b-8487453fe8a0] ON [segmentation].[SegmentationFlatData70aa95ca-1627-40a6-b89b-8487453fe8a0] ([_rn])
GO
