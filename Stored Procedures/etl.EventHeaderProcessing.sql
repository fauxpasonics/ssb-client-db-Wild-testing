SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Ish Fuseini
-- Create date: 5/4/2016
-- =============================================
CREATE PROCEDURE [etl].[EventHeaderProcessing]
    (
      @BatchId INT = 0
    , @LoadDate DATETIME = NULL
    , @Options NVARCHAR(MAX) = NULL
    )
AS
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON;

	/*
	
	2015-16
	
	*/

        DECLARE @MaxRecords INT;
        SELECT  @MaxRecords = COUNT(1)
        FROM    dbo.DimEvent;

-- Suites
        DECLARE @EventHeaderStartSuite INT;
        SET @EventHeaderStartSuite = 0;
        WITH    suites_sorted
                  AS (
                       SELECT TOP ( @MaxRecords )
                                *
                       FROM     dbo.DimEvent
                       WHERE    DimSeasonId = 44
                       ORDER BY EventDate ASC
                     )
            UPDATE  suites_sorted
            SET     @EventHeaderStartSuite = suites_sorted.DimEventHeaderId = @EventHeaderStartSuite
                    + 1
            WHERE   suites_sorted.MinorCategoryTM = 'Hockey'
                    AND suites_sorted.DimSeasonId = 44
                    AND suites_sorted.EventDesc NOT IN ( 'Suite Beverage',
                                                         'Suite Rental',
                                                         '15-16 Wild Suite Resale' );

-- Suite Rental
        DECLARE @EventHeaderStartSuiteR INT;
        SET @EventHeaderStartSuiteR = 0;
        WITH    suitesrent_sorted
                  AS (
                       SELECT TOP ( @MaxRecords )
                                *
                       FROM     dbo.DimEvent
                       WHERE    DimSeasonId = 44
                       ORDER BY EventDate ASC
                     )
            UPDATE  suitesrent_sorted
            SET     @EventHeaderStartSuiteR = suitesrent_sorted.DimEventHeaderId = @EventHeaderStartSuiteR
                    + 1
            WHERE   suitesrent_sorted.MinorCategoryTM = 'Hockey'
                    AND suitesrent_sorted.DimSeasonId = 44
                    AND suitesrent_sorted.EventDesc = ( 'Suite Rental' )
                    AND suitesrent_sorted.DimEventHeaderId < 0;

-- Suite Beverage
        DECLARE @EventHeaderStart INT;
        SET @EventHeaderStart = 0;
        WITH    suitesbev_sorted
                  AS (
                       SELECT TOP ( @MaxRecords )
                                *
                       FROM     dbo.DimEvent
                       WHERE    DimSeasonId = 44
                       ORDER BY EventDate ASC
                     )
            UPDATE  suitesbev_sorted
            SET     @EventHeaderStart = suitesbev_sorted.DimEventHeaderId = @EventHeaderStart
                    + 1
            WHERE   suitesbev_sorted.MinorCategoryTM = 'Hockey'
                    AND suitesbev_sorted.DimSeasonId = 44
                    AND suitesbev_sorted.EventDesc = ( 'Suite Beverage' )
                    AND suitesbev_sorted.DimEventHeaderId < 0;

-- Parking
        DECLARE @EventHeaderStartPark INT;
        SET @EventHeaderStartPark = 0;
        WITH    parking_sorted
                  AS (
                       SELECT TOP ( @MaxRecords )
                                *
                       FROM     dbo.DimEvent
                       WHERE    DimSeasonId = 35
                       ORDER BY EventDate ASC
                     )
            UPDATE  parking_sorted
            SET     @EventHeaderStartPark = parking_sorted.DimEventHeaderId = @EventHeaderStartPark
                    + 1
            WHERE   parking_sorted.DimSeasonID = 35;

-- Premium Passes
        DECLARE @EventHeaderStartPrem INT;
        SET @EventHeaderStartPrem = 0;
        WITH    premium_pass_sorted
                  AS (
                       SELECT TOP ( @MaxRecords )
                                *
                       FROM     dbo.DimEvent
                       WHERE    DimSeasonId = 46
                       ORDER BY EventDate ASC
                     )
            UPDATE  premium_pass_sorted
            SET     @EventHeaderStartPrem = premium_pass_sorted.DimEventHeaderId = @EventHeaderStartPrem
                    + 1
            WHERE   premium_pass_sorted.DimSeasonId = 46;

-- Loge

        DECLARE @EventHeaderStartLoge INT;
        SET @EventHeaderStartLoge = 0;
        WITH    loge_sorted
                  AS (
                       SELECT TOP ( @MaxRecords )
                                *
                       FROM     dbo.DimEvent
                       WHERE    DimSeasonId = 23
                       ORDER BY EventDate ASC
                     )
            UPDATE  loge_sorted
            SET     @EventHeaderStartLoge = loge_sorted.DimEventHeaderId = @EventHeaderStartLoge
                    + 1
            WHERE   loge_sorted.DimSeasonId = 23;

-- Season

        DECLARE @EventHeaderStartSeason INT;
        SET @EventHeaderStartSeason = 0;
        WITH    season_sorted
                  AS (
                       SELECT TOP ( @MaxRecords )
                                *
                       FROM     dbo.DimEvent
                       WHERE    DimSeasonId = 19
                       ORDER BY EventDate ASC
                     )
            UPDATE  season_sorted
            SET     @EventHeaderStartSeason = season_sorted.DimEventHeaderId = @EventHeaderStartSeason
                    + 1
            WHERE   season_sorted.DimSeasonId = 19
                    AND season_sorted.EventDesc <> 'Scan Test event';

-- ExperienceApp

        DECLARE @EventHeaderStartExp INT;
        SET @EventHeaderStartExp = 0;
        WITH    exp_sorted
                  AS (
                       SELECT TOP ( @MaxRecords )
                                *
                       FROM     dbo.DimEvent
                       WHERE    DimSeasonId = 59
                       ORDER BY EventDate ASC
                     )
            UPDATE  exp_sorted
            SET     @EventHeaderStartExp = exp_sorted.DimEventHeaderId = @EventHeaderStartExp
                    + 1
            WHERE   exp_sorted.DimSeasonId = 59
                    AND exp_sorted.EventDesc NOT LIKE '%Home Game%';

-- Food Vouchers

        DECLARE @EventHeaderStartFood INT;
        SET @EventHeaderStartFood = 0;
        WITH    food_sorted
                  AS (
                       SELECT TOP ( @MaxRecords )
                                *
                       FROM     dbo.DimEvent
                       WHERE    DimSeasonId = 77
                       ORDER BY EventDate ASC
                     )
            UPDATE  food_sorted
            SET     @EventHeaderStartFood = food_sorted.DimEventHeaderId = @EventHeaderStartFood
                    + 1
            WHERE   food_sorted.DimSeasonId = 77
                    AND food_sorted.EventDesc LIKE '%Loaded tickets%';
					

/*

Playoffs

91 - Playoff Game
95 - Budlight Lounge
96 - Suite Rental // Beverage Upgrade
100 - Parking
105 - Passes


*/

-- Playoff Games
        DECLARE @EventHeaderPlayoff INT;
        SET @EventHeaderPlayoff = 0;
        WITH    ply_sorted
                  AS (
                       SELECT TOP ( @MaxRecords )
                                *
                       FROM     dbo.DimEvent
                       WHERE    DimSeasonId = 91
                       ORDER BY EventDate ASC
                     )
            UPDATE  ply_sorted
            SET     @EventHeaderPlayoff = ply_sorted.DimEventHeaderId = @EventHeaderPlayoff
                    + 1
            WHERE   ply_sorted.DimSeasonId = 91;

-- Budlight Lounge
        DECLARE @EventHeaderPlayoffSR INT;
        SET @EventHeaderPlayoffSR = 0;
        WITH    plysr_sorted
                  AS (
                       SELECT TOP ( @MaxRecords )
                                *
                       FROM     dbo.DimEvent
                       WHERE    DimSeasonId = 96
                       ORDER BY EventDate ASC
                     )
            UPDATE  plysr_sorted
            SET     @EventHeaderPlayoffSR = plysr_sorted.DimEventHeaderId = @EventHeaderPlayoffSR
                    + 1
            WHERE   plysr_sorted.DimSeasonId = 96
			AND plysr_sorted.EventDesc = '16CUP Suite Rental';
					
-- Beverage Upgrade
        DECLARE @EventHeaderPlayoffBv INT;
        SET @EventHeaderPlayoffBv = 0;
        WITH    plybev_sorted
                  AS (
                       SELECT TOP ( @MaxRecords )
                                *
                       FROM     dbo.DimEvent
                       WHERE    DimSeasonId = 96
                       ORDER BY EventDate ASC
                     )
            UPDATE  plybev_sorted
            SET     @EventHeaderPlayoffBv = plybev_sorted.DimEventHeaderId = @EventHeaderPlayoffBv
                    + 1
            WHERE   plybev_sorted.DimSeasonId = 96
			AND plybev_sorted.EventDesc = 'Beverage Upgrade';

-- Misc
        DECLARE @EventHeaderPlayoffMisc INT;
        SET @EventHeaderPlayoffMisc = 0;
        WITH    plym_sorted
                  AS (
                       SELECT TOP ( @MaxRecords )
                                *
                       FROM     dbo.DimEvent
                       WHERE    DimSeasonId = 96
                       ORDER BY EventDate ASC
                     )
            UPDATE  plym_sorted
            SET     @EventHeaderPlayoffMisc = plym_sorted.DimEventHeaderId = @EventHeaderPlayoffMisc
                    + 1
            WHERE   plym_sorted.DimSeasonId = 96
			AND plym_sorted.EventDesc LIKE '%2016 CUP%';


-- Parking
        DECLARE @EventHeaderPlayoffPrk INT;
        SET @EventHeaderPlayoffPrk = 0;
        WITH    plyprk_sorted
                  AS (
                       SELECT TOP ( @MaxRecords )
                                *
                       FROM     dbo.DimEvent
                       WHERE    DimSeasonId = 100
                       ORDER BY EventDate ASC
                     )
            UPDATE  plyprk_sorted
            SET     @EventHeaderPlayoffPrk = plyprk_sorted.DimEventHeaderId = @EventHeaderPlayoffPrk
                    + 1
            WHERE   plyprk_sorted.DimSeasonId = 100;

-- Passes
        DECLARE @EventHeaderPlayoffPass INT;
        SET @EventHeaderPlayoffPass = 0;
        WITH    plyp_sorted
                  AS (
                       SELECT TOP ( @MaxRecords )
                                *
                       FROM     dbo.DimEvent
                       WHERE    DimSeasonId = 105
                       ORDER BY EventDate ASC
                     )
            UPDATE  plyp_sorted
            SET     @EventHeaderPlayoffPass = plyp_sorted.DimEventHeaderId = @EventHeaderPlayoffPass
                    + 1
            WHERE   plyp_sorted.DimSeasonId = 105;

-- Experience
        DECLARE @EventHeaderPlayoffExp INT;
        SET @EventHeaderPlayoffExp = 0;
        WITH    plyexp_sorted
                  AS (
                       SELECT TOP ( @MaxRecords )
                                *
                       FROM     dbo.DimEvent
                       WHERE    DimSeasonId = 59
                       ORDER BY EventDate ASC
                     )
            UPDATE  plyexp_sorted
            SET     @EventHeaderPlayoffExp = plyexp_sorted.DimEventHeaderId = @EventHeaderPlayoffExp
                    + 1
            WHERE   plyexp_sorted.DimSeasonId = 59;

    END;
GO
