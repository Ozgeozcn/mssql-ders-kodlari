declare @fKod int
declare @uKod int
declare @fiyat float
declare @kdv float
declare @adet int

declare @fUrunAdet int

declare cls cursor for select top 20 faturaKod from tblSiparis order by faturaKod desc
open cls
fetch next from cls into @fKod

while @@FETCH_STATUS = 0
begin
set @fUrunAdet = convert(int, RAND() * 16 + 1)
	
	while @fUrunAdet > 0
	begin
		select top 1 @fiyat = listeFiyat, @kdv = KDVoran, @uKod = urunKod  from tblUrun order by NEWID()
		set @adet = convert(int, RAND() * 10 + 1)

       INSERT INTO [dbo].[tblSiparisDetay]
                  ([faturaKod]
                  ,[urunKod]
                  ,[fiyat]
                  ,[KDV]
                  ,[adet])
            VALUES
                  (@fKod
                  ,@uKod
                  ,@fiyat
                  ,@kdv
                  ,@adet)
       
		set @fUrunAdet = @fUrunAdet - 1
	end


fetch next from cls into @fKod
end

close cls
deallocate cls
