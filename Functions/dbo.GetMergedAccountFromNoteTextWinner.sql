SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[GetMergedAccountFromNoteTextWinner]
(
	@Input AS nvarchar(max)
) 
RETURNS TABLE
AS	
	RETURN SELECT TRY_PARSE(REVERSE(LEFT(REVERSE(@Input), CHARINDEX(' ', REVERSE(@Input)) - 1)) AS int) MergedAccountWinner


GO
