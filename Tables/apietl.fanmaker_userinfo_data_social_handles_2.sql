CREATE TABLE [apietl].[fanmaker_userinfo_data_social_handles_2]
(
[ETL__fanmaker_userinfo_data_social_handles_id] [uniqueidentifier] NOT NULL,
[ETL__fanmaker_userinfo_data_id] [uniqueidentifier] NULL,
[twitter] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[foursquare] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[facebook] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[instagram] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tvtag] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[shopify] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pinterest] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tumblr] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[fanmaker_userinfo_data_social_handles_2] ADD CONSTRAINT [PK__fanmaker__05C2AD0A3F947831] PRIMARY KEY CLUSTERED  ([ETL__fanmaker_userinfo_data_social_handles_id])
GO
