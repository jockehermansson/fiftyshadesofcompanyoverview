USE [appathon_cse]
GO
/****** Object:  StoredProcedure [dbo].[csp_getHelpdeskData]    Script Date: 2015-02-13 19:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<SSM
-- Create date: <2013-10-16>
-- Description:	<Used to return busniessvaluesw>
-- =============================================
CREATE PROCEDURE [dbo].[csp_getHelpdeskData]
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
	(select CAST(COUNT(idhelpdesk) as bigint) as 'Antall_aktive' from helpdesk 
	where enddate is not null and company = @@idcompany FOR XML RAW ('Value'), TYPE, root ('Aktive')
	),
	(	
	select CAST(COUNT(idhelpdesk) as bigint) as 'Totalt_helpdesk' from helpdesk
	where company = @@idcompany FOR XML RAW ('Value'), TYPE, root ('Totalt') 
	)
	FOR XML path(''), type, ROOT ('Helpdesk');

	
END
