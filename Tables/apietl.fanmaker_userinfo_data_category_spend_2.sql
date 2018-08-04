CREATE TABLE [apietl].[fanmaker_userinfo_data_category_spend_2]
(
[ETL__fanmaker_userinfo_data_category_spend_id] [uniqueidentifier] NOT NULL,
[ETL__fanmaker_userinfo_data_id] [uniqueidentifier] NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[spend] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[fanmaker_userinfo_data_category_spend_2] ADD CONSTRAINT [PK__fanmaker__0351F2BE3E5D4333] PRIMARY KEY CLUSTERED  ([ETL__fanmaker_userinfo_data_category_spend_id])
GO
