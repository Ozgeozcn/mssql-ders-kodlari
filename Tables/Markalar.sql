Use Market
go

create table Markalar(
Id int primary key identity,
Ad nvarchar(200) not null,
Web varchar(200) null,

constraint uq_marka_Ad unique (Ad)
)