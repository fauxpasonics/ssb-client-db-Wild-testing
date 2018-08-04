CREATE TABLE [segmentation].[SegmentationFlatData562288b6-aa08-45c7-8ac0-ea848628c978]
(
[id] [uniqueidentifier] NOT NULL,
[DocumentType] [varchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SessionId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Environment] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TenantId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[_rn] [bigint] NULL,
[SSB_CRMSYSTEM_CONTACT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[activitytypecodename] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[actualend] [datetime] NULL,
[actualstart] [datetime] NULL,
[createdbyname] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[createdon] [datetime] NULL,
[createdonbehalfbyname] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[deliveryprioritycode] [int] NULL,
[deliveryprioritycodename] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[instancetypecode] [int] NULL,
[instancetypecodename] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[isbilled] [bit] NULL,
[isbilledname] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ismapiprivate] [bit] NULL,
[ismapiprivatename] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[isregularactivity] [bit] NULL,
[isregularactivityname] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[isworkflowcreated] [bit] NULL,
[isworkflowcreatedname] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[leftvoicemail] [bit] NULL,
[leftvoicemailname] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[modifiedbyname] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[modifiedon] [datetime] NULL,
[modifiedonbehalfbyname] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[owneridname] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[prioritycode] [int] NULL,
[prioritycodename] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[processid] [uniqueidentifier] NULL,
[statecode] [int] NULL,
[statecodename] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[statuscode] [int] NULL,
[statuscodename] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[subject] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [segmentation].[SegmentationFlatData562288b6-aa08-45c7-8ac0-ea848628c978] ADD CONSTRAINT [pk_SegmentationFlatData562288b6-aa08-45c7-8ac0-ea848628c978] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatData562288b6-aa08-45c7-8ac0-ea848628c978] ON [segmentation].[SegmentationFlatData562288b6-aa08-45c7-8ac0-ea848628c978] ([_rn])
GO
