CREATE TABLE [apietl].[fanmaker_getusers_data_identifiers_2]
(
[ETL__fanmaker_getusers_data_identifiers_id] [uniqueidentifier] NOT NULL,
[ETL__fanmaker_getusers_data_id] [uniqueidentifier] NULL,
[identifier] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[active] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[fanmaker_getusers_data_identifiers_2] ADD CONSTRAINT [PK__fanmaker__9327985CA8D16EE3] PRIMARY KEY CLUSTERED  ([ETL__fanmaker_getusers_data_identifiers_id])
GO
