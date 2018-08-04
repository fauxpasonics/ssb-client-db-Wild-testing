CREATE TABLE [segmentation].[SegmentationFlatData040a4215-ea68-4c7e-bf2d-98ce5b88699d]
(
[id] [uniqueidentifier] NOT NULL,
[DocumentType] [varchar] (17) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SessionId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Environment] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TenantId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[_rn] [bigint] NULL,
[SSB_CRMSYSTEM_CONTACT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OrderDate] [date] NULL,
[ProductCategory] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProductSubCategory] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProductID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProductName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QuantitySold] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UnitPrice] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OrderTotal] [numeric] (37, 0) NULL
)
GO
ALTER TABLE [segmentation].[SegmentationFlatData040a4215-ea68-4c7e-bf2d-98ce5b88699d] ADD CONSTRAINT [pk_SegmentationFlatData040a4215-ea68-4c7e-bf2d-98ce5b88699d] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatData040a4215-ea68-4c7e-bf2d-98ce5b88699d] ON [segmentation].[SegmentationFlatData040a4215-ea68-4c7e-bf2d-98ce5b88699d] ([_rn])
GO
