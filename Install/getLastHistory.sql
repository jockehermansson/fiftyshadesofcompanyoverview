USE [appathon_cse]
GO
/****** Object:  StoredProcedure [dbo].[cfn_getLastHistory]    Script Date: 2015-02-13 19:08:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE PROCEDURE [dbo].[cfn_getLastHistory]
(
	-- Add the parameters for the function here
	@@idcompany		int,
	@@lang			nvarchar(5)
)

AS
BEGIN
	-- FLAG_EXTERNALACCESS --
	
	DECLARE @lang nvarchar(5)
	set @lang = @@lang
	--CORRECT LANGUAGE BUG
	IF @lang = N'en-us'
		SET @lang = N'en_us'

	-- Declare the return variable here
	DECLARE @call int
	DECLARE @visit int
	DECLARE @sentmail int

	-- SET @call = 168701 --
	-- SET @sentmail = 179001 --
	-- SET @visit = 168301 --

	-- Add the T-SQL statements to compute the return value here
	SELECT TOP 1 CONVERT(varchar(8),h.[date],4) as 'dato', h.[note] from history h where h.company = @@idcompany 
		AND h.[status] = 0 
		AND h.[type] = 168701 OR h.[type] = 179001 OR h.[type] = 168301
		ORDER BY h.[date] DESC FOR XML RAW, ELEMENTS, ROOT ('history');


END
