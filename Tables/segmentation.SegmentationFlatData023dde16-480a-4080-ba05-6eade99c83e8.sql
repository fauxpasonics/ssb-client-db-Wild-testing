CREATE TABLE [segmentation].[SegmentationFlatData023dde16-480a-4080-ba05-6eade99c83e8]
(
[id] [uniqueidentifier] NOT NULL,
[DocumentType] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SessionId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Environment] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TenantId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[_rn] [bigint] NULL,
[SSB_CRMSYSTEM_CONTACT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[activityid] [uniqueidentifier] NOT NULL,
[activitytypecode] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[activitytypecodename] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[actualdurationminutes] [int] NULL,
[actualend] [datetime] NULL,
[actualstart] [datetime] NULL,
[category] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[client_touchpointcampaign] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[createdbyname] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[createdon] [datetime] NULL,
[createdonbehalfbyname] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[directioncode] [bit] NULL,
[directioncodename] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[importsequencenumber] [int] NULL,
[isbilled] [bit] NULL,
[isbilledname] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[isregularactivity] [bit] NULL,
[isregularactivityname] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[isworkflowcreated] [bit] NULL,
[isworkflowcreatedname] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[kore_activitycategoryid] [uniqueidentifier] NULL,
[kore_activitycategoryidname] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[kore_activitysubcategoryid] [uniqueidentifier] NULL,
[kore_activitysubcategoryidname] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[kore_additionalparameters] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[kore_campaignprospectid] [uniqueidentifier] NULL,
[kore_campaignprospectidname] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[kore_category] [int] NULL,
[kore_categoryname] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[kore_colorcode] [int] NULL,
[kore_colorcodename] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[kore_importid] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[kore_priorconversations] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[kore_quickcampaignid] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[kore_secondarynameid] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[kore_subcategory] [int] NULL,
[kore_subcategoryname] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[kore_touchpoint] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[kore_touchpointcomments] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[kore_touchpointid] [uniqueidentifier] NULL,
[kore_touchpointidname] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps_campaignid] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps_colorcode] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps_dealsheetid] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps_donotstream] [bit] NULL,
[koreps_donotstreamname] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps_premiumdealid] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps_savescreeninitiated] [bit] NULL,
[koreps_savescreeninitiatedname] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps_syncpriority] [int] NULL,
[koreps_touchpointid] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[leftvoicemail] [bit] NULL,
[leftvoicemailname] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[modifiedby] [uniqueidentifier] NULL,
[modifiedbyname] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[modifiedbyyominame] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[modifiedon] [datetime] NULL,
[modifiedonbehalfby] [uniqueidentifier] NULL,
[modifiedonbehalfbyname] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[modifiedonbehalfbyyominame] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[new_cdr_id] [int] NULL,
[overriddencreatedon] [datetime] NULL,
[ownerid] [uniqueidentifier] NULL,
[owneridname] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[owneridtype] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[owneridyominame] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[owningbusinessunit] [uniqueidentifier] NULL,
[owningteam] [uniqueidentifier] NULL,
[owninguser] [uniqueidentifier] NULL,
[phonenumber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[prioritycode] [int] NULL,
[prioritycodename] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[scheduleddurationminutes] [int] NULL,
[scheduledend] [datetime] NULL,
[scheduledstart] [datetime] NULL,
[serviceid] [uniqueidentifier] NULL,
[stageid] [uniqueidentifier] NULL,
[statecode] [int] NULL,
[statecodename] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[statuscode] [int] NULL,
[statuscodename] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[str_marketingphonecallsalestypeid] [uniqueidentifier] NULL,
[str_marketingphonecallsalestypeidname] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[str_marketingphonecallservicetypeid] [uniqueidentifier] NULL,
[str_marketingphonecallservicetypeidname] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[str_temp] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[str_touchpoint] [bit] NULL,
[str_touchpointname] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[subcategory] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [segmentation].[SegmentationFlatData023dde16-480a-4080-ba05-6eade99c83e8] ADD CONSTRAINT [pk_SegmentationFlatData023dde16-480a-4080-ba05-6eade99c83e8] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatData023dde16-480a-4080-ba05-6eade99c83e8] ON [segmentation].[SegmentationFlatData023dde16-480a-4080-ba05-6eade99c83e8] ([_rn])
GO