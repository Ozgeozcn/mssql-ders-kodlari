use Market
go

create table Urunler(
Id int primary key identity,
MarkaId int not null,
Ad nvarchar(300) not null,

constraint fk_urun_marka foreign key (MarkaId) references Markalar(Id),
constraint un_urun_ad unique(MarkaId, Ad)
)