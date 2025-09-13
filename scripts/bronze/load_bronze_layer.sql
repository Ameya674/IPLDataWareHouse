-- ===============================================================
-- THE FOLLWLING CODE LOADS DATA INTO THE TABLES IN BRONZE SCHEMA
-- ===============================================================

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;

	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT '======================================';
		PRINT 'Loading Bronze Layer';
		PRINT '======================================';


		TRUNCATE TABLE bronze.ball_by_ball;
		BULK INSERT bronze.ball_by_ball
		FROM 'C:\ipl_datawarehouse\Ball_By_Ball.csv'
		WITH 
		(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		)

		TRUNCATE TABLE bronze.match;
		BULK INSERT bronze.match
		FROM 'C:\ipl_datawarehouse\Match.csv'
		WITH 
		(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);

		TRUNCATE TABLE bronze.player;
		BULK INSERT bronze.player
		FROM 'C:\ipl_datawarehouse\Player.csv'
		WITH 
		(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);

		TRUNCATE TABLE bronze.team;
		BULK INSERT bronze.team 
		FROM 'C:\ipl_datawarehouse\Team.csv'
		WITH 
		(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);

		TRUNCATE TABLE bronze.player_match;
		BULK INSERT bronze.player_match
		FROM 'C:\ipl_datawarehouse\Player_match.csv'
		WITH 
		(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);

	END TRY

	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message: ' + ERROR_MESSAGE();
		PRINT 'Error Message: ' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message: ' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH

END
