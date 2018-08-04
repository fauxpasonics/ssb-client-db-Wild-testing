CREATE TABLE [segmentation].[SegmentationFlatData8463e53b-94ca-4859-a03c-6de74ef68477]
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
ALTER TABLE [segmentation].[SegmentationFlatData8463e53b-94ca-4859-a03c-6de74ef68477] ADD CONSTRAINT [pk_SegmentationFlatData8463e53b-94ca-4859-a03c-6de74ef68477] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatData8463e53b-94ca-4859-a03c-6de74ef68477] ON [segmentation].[SegmentationFlatData8463e53b-94ca-4859-a03c-6de74ef68477] ([_rn])
GO
