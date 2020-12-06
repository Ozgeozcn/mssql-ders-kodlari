declare @kKod int
declare @vergi nvarchar(15)
declare @sDurum int
declare @sTarih datetime
declare @bDate datetime = '2001-01-01'
declare @i int = 20

while @i > 0
begin

select top 1 @kKod = kullaniciKod, @vergi = vergiNo from tblKullanici order by NEWID()
select @sDurum = siparisDurumKod from tblSiparisDurum order by NEWID()
select @sTarih = DATEADD(second, rand() * 10000000, @bDate)


INSERT INTO [dbo].[tblSiparis]
           ([kullaniciKod]
           ,[faturaAdresi]
           ,[vergiDairesi]
           ,[vergiNo]
           ,[siparisDurumKod]
           ,[siparisTarih])
     VALUES
           (@kKod
           ,null
           ,null
           ,@vergi
           ,@sDurum
           ,@sTarih)

set @i = @i - 1
end
