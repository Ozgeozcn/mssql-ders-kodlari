declare @i tinyint = 1
declare @isim nvarchar(50)
declare @cisim nvarchar(50)
declare @kimlik char(11)
declare @soyisim nvarchar(50)
declare @csoyisim nvarchar(50)
declare @adress nvarchar(500)
declare @caddeSokak nvarchar(100)

while @i > 0
begin

select top 1 @isim = Isim from Names order by NEWID()
select top 1 @soyisim = Soyisim from Surnames order by NEWID()
select @kimlik = dbo.IdentificationNumber()

if RAND() < 0.5
begin
set @caddeSokak = convert(nvarchar, convert(int, RAND() * 3000 + 50)) + '. Sokak '
end
else 
begin
select top 1 @cisim = Isim from Names order by NEWID()
select top 1 @csoyisim = Soyisim from Surnames order by NEWID()
set @caddeSokak = CONCAT_WS(' ', @cisim, @csoyisim, 'Caddesi')

end

select @adress =  concat_ws(' ', trim(Mahalle), @caddeSokak,trim(semt_bucak_belde),CHAR(13),
trim(Town),'/',trim(City)) from AdressTemp order by NEWID()
print @adress

INSERT INTO [dbo].[Kullanicilar]
           ([Ad]
           ,[Soyad]
           ,[KimlikNo]
           ,[Adress])
     VALUES
           (@isim
           ,@soyisim
           ,@kimlik
           ,@adress)

set @i = @i -  1
end