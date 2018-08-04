CREATE TABLE [apietl].[FanMaker_UserHistory_SessionID_Lkp]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[ETL__session_id] [uniqueidentifier] NOT NULL,
[ETL__insert_datetime] [datetime] NOT NULL,
[NewSessionID] [uniqueidentifier] NULL,
[IsLoadedManuallyFlipped] [int] NOT NULL,
[IsLoaded_Actual] [int] NOT NULL
)
GO
