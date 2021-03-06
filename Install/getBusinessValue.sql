USE [appathon_cse]
GO
/****** Object:  StoredProcedure [dbo].[csp_getBusinessValue]    Script Date: 2015-02-13 19:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<SSM
-- Create date: <2013-10-16>
-- Description:	<Used to return busniessvaluesw>
-- =============================================
CREATE PROCEDURE [dbo].[csp_getBusinessValue]
		@@lang nvarchar(5),
		@@idcompany INT
AS
BEGIN
	-- FLAG_EXTERNALACCESS --
	
	DECLARE @lang nvarchar(5)
	set @lang = @@lang
	--CORRECT LANGUAGE BUG
	IF @lang = N'en-us'
		SET @lang = N'en_us'
	select
	(select CAST(SUM(businessvalue) as bigint) as Total 
	from business 
	where businesstatus != 15101 and company = @@idcompany FOR XML RAW ('Value'), TYPE, root ('Total_mulighet')
	),
	(	
	select CAST(SUM(businessvalue) as bigint) as Total 
	from business 
	where businesstatus = 15101 and company = @@idcompany FOR XML RAW ('Value'), TYPE, root ('Total_vunnet') 
	)
	FOR XML path(''), type, ROOT ('Business');

	
END
