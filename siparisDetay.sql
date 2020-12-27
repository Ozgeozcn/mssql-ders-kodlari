
declare @siparisUrunAdet int

declare @urunAdet int
declare @urunliste float
declare @urunkdv float
declare @toplam float
declare @urunKod int
declare @faturaKod int

declare @fiyat float
declare @kdvfiyat float

declare cls cursor for select faturaKod from tblSiparis where toplam is null
open cls
fetch next from cls into @faturakod

while @@FETCH_STATUS = 0
begin
set @toplam = 0
set @siparisUrunAdet = convert(int, rand() * 10 +1)

while @siparisUrunAdet > 0
begin
set @urunAdet = convert(int, rand() * 10 +1)
select top 1 @urunKod = urunKod, @urunkdv = KDVoran, @urunliste = listeFiyat from tblUrun order by NEWID()

set @fiyat = @urunliste * @urunAdet
set @kdvfiyat = @fiyat * @urunkdv

INSERT INTO [dbo].[tblSiparisDetay]
           ([faturaKod]
           ,[urunKod]
           ,[fiyat]
           ,[KDV]
           ,[adet])
     VALUES
           (@faturaKod
           ,@urunKod
           ,@fiyat
           ,@kdvfiyat
           ,@urunAdet)

set @toplam = @toplam + @fiyat + @kdvfiyat


set @siparisUrunAdet = @siparisUrunAdet - 1
end

update tblSiparis set toplam = @toplam where faturaKod = @faturaKod

fetch next from cls into @faturakod
end

close cls
deallocate cls
