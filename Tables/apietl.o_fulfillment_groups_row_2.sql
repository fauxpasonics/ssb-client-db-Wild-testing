CREATE TABLE [apietl].[o_fulfillment_groups_row_2]
(
[o_fulfillment_groups_row_id] [uniqueidentifier] NOT NULL,
[o_fulfillment_groups_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seats_array] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[o_fulfillment_groups_row_2] ADD CONSTRAINT [PK__o_fulfil__19B0322B92A3C1B7] PRIMARY KEY CLUSTERED  ([o_fulfillment_groups_row_id])
GO
