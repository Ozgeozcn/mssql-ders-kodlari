declare @fKod int
declare @toplam float

declare cls cursor for select top 20 faturaKod from tblSiparis order by faturaKod desc
open cls
fetch next from cls into @fKod

while @@FETCH_STATUS = 0
begin

select @toplam = SUM(toplam) from tblSiparisDetay where faturaKod = @fKod
update tblSiparis set toplam = @toplam where faturaKod = @fKod
fetch next from cls into @fKod
end

close cls
deallocate cls
