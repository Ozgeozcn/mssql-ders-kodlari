declare @kullaniciKod int
declare @siparisDurum int
declare @tarih datetime

DECLARE @FromDate DATETIME2(0)
DECLARE @ToDate   DATETIME2(0)

SET @FromDate = '2000-01-01 08:22:13' 
SET @ToDate = '2020-11-05 17:56:31'

DECLARE @Seconds INT = DATEDIFF(SECOND, @FromDate, @ToDate)
DECLARE @Random INT

declare @i int 
set @i = 1000000

while @i >= 0
begin

select top 1 @kullaniciKod = kullaniciKod  from tblKullanici order by NEWID()
select top 1 @siparisDurum = siparisDurumKod  from tblSiparisDurum order by NEWID()

set @Random = ROUND(((@Seconds-1) * RAND()), 0)

SELECT @tarih = DATEADD(SECOND, @Random, @FromDate)

INSERT INTO [dbo].[tblSiparis]
           ([kullaniciKod]
           ,[faturaAdresi]
           ,[siparisDurumKod]
           ,[siparisTarih]
           ,[toplam])
     VALUES
           (@kullaniciKod
           ,null
           ,@siparisDurum
           ,@tarih
           ,null)


set @i = @i - 1

end