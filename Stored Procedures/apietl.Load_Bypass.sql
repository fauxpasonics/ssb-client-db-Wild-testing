SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Ismail Fuseini
-- Create date: 11/28/2016
-- Description:	
-- =============================================
CREATE PROCEDURE [apietl].[Load_Bypass] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	EXEC [apietl].[Load_Bypass_Orders]
	EXEC [apietl].[Load_Bypass_Items]
	
END
GO
