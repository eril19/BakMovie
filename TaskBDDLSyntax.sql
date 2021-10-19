--Evelin (2301866643)
--Faldian Pratama Wijaya (2301891746)
--Kautsar Ryandika Wibowo (2301878233)
--Muhammad Eril Fario (2301896904)

--DDL QUERY
create database Bakmovie
use Bakmovie

create table Director(
DirectorID char(6) primary key check(DirectorID like 'DIR[0-9][0-9][0-9]'),
DirectorName varchar(255) not null,
DirectorEmail varchar(255) not null check(DirectorEmail like '%@%'),
DirectorCity varchar(255) not null,
DirectorAddress varchar(255) not null,
DirectorPhone char(12) not null check( isnumeric(DirectorPhone) = 1),
)

select * from Director

create table Publisher(
PublisherID char(6) primary key check(PublisherID like 'PUB[0-9][0-9][0-9]')not null,
PublisherName varchar(255) not null,
PublisherEmail varchar(255) not null,
PublisherCity varchar(255) not null,
PublisherAddress varchar(255) not null check(len(PublisherAddress) > 15),
PublisherPhone char(12) not null check( isnumeric(PublisherPhone) = 1)
)

select * from Publisher

create table Movie(
MovieID char(6) primary key check(MovieID like 'MOV[0-9][0-9][0-9]') not null,
MovieTitle varchar(255) not null,
DirectorID char(6) foreign key references Director(DirectorID) not null,
PublisherID char(6) foreign key references Publisher(PublisherID) not null,
[MovieDescription] varchar(255) check(len([MovieDescription]) > 20),
MovieReleaseDate date check(year (MovieReleaseDate) between 2000 and 2016) not null,
MoviePrice int not null
)

select * from Movie

create table Genre(
GenreID char(6) primary key check(GenreID like 'GEN[0-9][0-9][0-9]') not null,
GenreName varchar(255) not null
)

select * from Genre

create table MovieDetail(
MovieID char(6) not null,
GenreID char(6) not null,
primary key (MovieID,GenreID),
foreign key (MovieID) references Movie(MovieID),
foreign key (GenreID) references Genre(GenreID)
)

select * from MovieDetail

create table [User](
UserID char(6) primary key check(UserID like 'USR[0-9][0-9][0-9]') not null,
UserNickname varchar(255) not null check(len(UserNickname) > 5),
UserFullname varchar(255) not null,
UserCity varchar(255) not null,
UserEmail varchar(255) not null check(UserEmail like '%@%'),
[UserDescription] varchar(255)
)

select * from [User]

create table Review(
UserID char(6) not null,
MovieID char(6) not null,
RecStat varchar(255) not null check(RecStat like 'Recommended' or RecStat like 'Not Recommended'),
ReviewContent varchar(255) not null check(len(ReviewContent) > 20),
ReviewDate date not null,
foreign key (MovieID) references Movie(MovieID),
foreign key (UserID) references [User](UserID),
primary key (MovieID, UserID)
)

DROP TABLE Review

select * from Review

create table SalesTransaction(
SalesID char(6) primary key check(SalesID like 'SAL[0-9][0-9][0-9]') not null,
UserID char(6) foreign key references [User](UserID) not null,
TransactionDate date not null,
)

select * from SalesTransaction

create table SalesTransactionDetails(
MovieID char(6) not null,
SalesID char(6) not null,
Quantity int not null
primary key (MovieID,SalesID),
foreign key (MovieID) references Movie(MovieID),
foreign key (SalesID) references SalesTransaction(SalesID)
)

select * from SalesTransactionDetails

drop table publisher
drop table Director
drop table [User]
drop table movie
drop table genre
drop table MovieDetail
drop table SalesTransactionDetails
drop table SalesTransaction
drop table review
