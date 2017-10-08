USE [flight_tracking];
PRINT GETDATE();

DECLARE @startingdate		datetime = GETDATE()-1;
SET @startingdate	= GETDATE()-2;

DECLARE @startdate			VARCHAR(10) = FORMAT(@startingdate, 'yyyy-MM-dd');
DECLARE @starttime			datetime = @startdate+' 00:00:00';
DECLARE @currenttime		datetime = @starttime;
DECLARE @endtime			datetime = @startdate+' 23:59:00';
DECLARE @currentMonth		VARCHAR(2) =  FORMAT(@startingdate, 'MM');
DECLARE @currentYYYY_MM		VARCHAR(10) = FORMAT(@startingdate, 'yyyy_MM');
DECLARE @currentdir			VARCHAR(40) = 'E:\downloads\adsb_exchange\json\'+@currentYYYY_MM;
DECLARE @currentfile		VARCHAR(80);
DECLARE @t					VARCHAR(MAX);
PRINT @startdate;

WHILE @currenttime <= @endtime
 BEGIN
	SET @currentfile = @currentdir+'\'+@startdate+'-'+REPLACE(CONVERT(varchar(5), @currenttime, 108), ':', '')+'Z.json';
	PRINT @currentfile;

	EXEC spx_json_read @currentfile, @t output;

	BEGIN TRY

	INSERT INTO dbo.tracking_2017_10
	SELECT *, (@startdate+'-'+REPLACE(CONVERT(varchar(5), @currenttime, 108), ':', '')+'Z') AS [_FileDateTime]
	FROM OPENJSON(@t,'$.acList')
	WITH (
			Alt			int				'$.Alt',
			AltT		int				'$.AltT',
			Bad			varchar(10)		'$.Bad',
			Brng		int				'$.Brng',
			[Call]		nvarchar(max)	'$.Call',
			CallSus		varchar(10)		'$.CallSus',
			CMsgs		int				'$.CMsgs',
			CNum		nvarchar(max)	'$.CNum',
			[Cos]		nvarchar(max)	'$.Cos',
			[Cot]		nvarchar(max)	'$.Cot',
			Cou			nvarchar(max)	'$.Cou',
			Dst			int				'$.Dst',
			Engines		nvarchar(max)	'$.Engines',
			EngMount	varchar(10)		'$.EngMount',
			EngType		varchar(10)		'$.EngType',
			FlightsCount	int			'$.FlightsCount',
			[From]		nvarchar(max)	'$.From',
			GAlt		int				'$.GAlt',
			Gnd			varchar(10)		'$.Gnd',
			HasPic		varchar(10)		'$.HasPic',
			HasSig		varchar(10)		'$.HasSig',
			Help		varchar(10)		'$.Help',
			Icao		nvarchar(max)	'$.Icao',
			Id			int				'$.Id',
			InHg		float			'$.InHg',
			Interested	varchar(10)		'$.Interested',
			IsTisb		varchar(10)		'$.IsTisb',
			Lat			float			'$.Lat',
			Long		float			'$.Long',
			Man			nvarchar(max)	'$.Man',
			Mdl			nvarchar(max)	'$.Mdl',
			Mil			varchar(10)		'$.Mil',
			Mlat		varchar(10)		'$.Mlat',
			Op			nvarchar(max)	'$.Op',
			OpCode		nvarchar(max)	'$.OpCode',
			PicX		int				'$.PicX',
			PicY		int				'$.PicY',
			PosStale	varchar(10)		'$.PosStale',
			PosTime		float			'$.PosTime',
			Rcvr		float			'$.Rcvr',
			Reg			nvarchar(max)	'$.Reg',
			ResetTrail	varchar(10)		'$.ResetTrail',
			Sat			varchar(10)		'$.Sat',
			Sig			float			'$.Sig',
			Spd			float			'$.Spd',
			SpdTyp		float			'$.SpdTyp',
			Species		varchar(10)		'$.Species',
			Sqk			float			'$.Sqk',
			Stops		nvarchar(max)	'$.Stops',
			Tag			nvarchar(max)	'$.Tag',
			TAlt		float			'$.TAlt',
			[To]		nvarchar(max)	'$.To',
			Trak		float			'$.Trak',
			TrkH		varchar(10)		'$.TrkH',
			Trt			float			'$.Trt',
			TSecs		float			'$.TSecs',
			TT			nvarchar(max)	'$.TT',
			TTrk		float			'$.TTrk',
			Type		nvarchar(max)	'$.Type',
			Vsi			float			'$.Vsi',
			VsiT		float			'$.VsiT',
			WTC			varchar(10)		'$.WTC',
			[Year]		nvarchar(10)	'$.Year'
	);
	END TRY
	BEGIN CATCH

	INSERT INTO [dbo].[tracking_errors]
           ([error_time],[error_file],[error_number],[error_message])
    VALUES (@currenttime, @currentfile, ERROR_NUMBER(), ERROR_MESSAGE() )  

	SELECT @currenttime AS C_time, @currentfile AS C_file, ERROR_NUMBER(), ERROR_MESSAGE()
         
	END CATCH
    SET @currenttime = DATEADD(MINUTE, 1, @currenttime);
 END;

 INSERT INTO [dbo].[file] ([date]) VALUES (@startdate);
 PRINT GETDATE();
 GO
