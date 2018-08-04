CREATE TABLE [apietl].[o_fulfillment_groups_section_2]
(
[o_fulfillment_groups_section_id] [uniqueidentifier] NOT NULL,
[o_fulfillment_groups_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[o_fulfillment_groups_section_2] ADD CONSTRAINT [PK__o_fulfil__EABD358FCC927CD1] PRIMARY KEY CLUSTERED  ([o_fulfillment_groups_section_id])
GO
