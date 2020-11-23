Use Market
go


create table Kategoriler
(
Id int primary key identity,
Ad nvarchar(200) not null,
ParentId int null,

constraint fk_kategori_kategori foreign key(ParentId) references Kategoriler(Id),
constraint uq_kategori_ad unique (Ad)
)