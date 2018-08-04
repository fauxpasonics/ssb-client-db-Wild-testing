CREATE TABLE [apietl].[FanMaker_UserHistory]
(
[ETL__session_id] [uniqueidentifier] NOT NULL,
[ETL__insert_datetime] [datetime] NOT NULL CONSTRAINT [DF__FanMaker___ETL____51AB6A59] DEFAULT (getutcdate()),
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[json_payload] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsLoaded] [bit] NOT NULL CONSTRAINT [DF__FanMaker___IsLoa__529F8E92] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1)
)
GO
