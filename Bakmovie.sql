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


--DML INSERT
--Genre
insert into Genre values('GEN001','Horror')
insert into Genre values('GEN002','Comedy')
insert into Genre values('GEN003','Slice of Life')
insert into Genre values('GEN004','Action')
insert into Genre values('GEN005','Adventure')
insert into Genre values('GEN006','Thriller')
insert into Genre values('GEN007','Romance')
insert into Genre values('GEN008','Drama')
insert into Genre values('GEN009','Sci fi')
insert into Genre values('GEN010','Mystery')

--Director
insert into Director values('DIR001','Steven Spielberg','Sspielberg@gmail.com','California','Dream street','087655428976')
insert into Director values('DIR002','Christoper Nolan','Cnolan@yahoo.com','Los Angeles','Prosperity street','081234567890')
insert into Director values('DIR003','Quentin Tarantino','Qtarantino@hotmail.com','West Virginia','Country road street','085711347856')
insert into Director values('DIR004','Tim Burton','Tburton@yahoo.com','Alabama','Sweet home street','089877615432')
insert into Director values('DIR005','Guillermo del Toro','GdToro@gmail.com','Las Vegas','Casino royale street','085271315689')
insert into Director values('DIR006','Gary Kurtz','Garykurtz@gmail.com','London','James street','082366743628')
insert into Director values('DIR007','Raam Punjabi','Raampunjabi@gmail.com','Surabaya','Jalan pahlawan','083477657878')
insert into Director values('DIR008','Joko Anwar','jokoanw@gmail.com','Medan','Jalan Mawar','081328587868')
insert into Director values('DIR009','Slamet Rahardjo','Slametrhjo@gmail.com','Serang','Jalan Merak','085365754535')
insert into Director values('DIR010','Tom Hanks','Tomhanks@gmail.com','Concord','Rolling street','081277778888')

--Publisher
insert into Publisher values('PUB001','Dalt Wisney Studios','Wisney@gmail.com','California',' 500 South Buena Vista Street','089877668945')
insert into Publisher values('PUB002','Unilever Studios','UniStud@yahoo.com','California','North Buena Vista Street','081277657654')
insert into Publisher values('PUB003','22nd Century Fox','FOX@hotmail.com','Los Angeles','10201 W. Pico Blvd','085767114589')
insert into Publisher values('PUB004','Paramount Pictures','Parpic@yahoo.com','Las Vegas','5515 Melrose Ave','085222468021')
insert into Publisher values('PUB005','Dreamworks Pictures','Dream@gmail.com','California','1000 Flower Street','085766458932')
insert into Publisher values('PUB006','Multivision Plus','Mtiviplus@gmail.com','Surabaya','Jalan Paduka No. 12','085674748484')
insert into Publisher values('PUB007','Columbia Pictures','Columbiap@gmail.com','Los Angeles','1231 Gower Street','087698987575')
insert into Publisher values('PUB008','Fox Studios','Foxstd@gmail.com','Melbourne','121 Streeton Street','085675756432')
insert into Publisher values('PUB009','Sony Pictures','Sonypic@gmail.com','California','10202 West Washington','081288889898')
insert into Publisher values('PUB010','Wild Bunch','Wildbunch@gmail.com','Jakarta','Kenton Country number 12','081245456789')

--Movie
insert into Movie values('MOV001','Dunia Terbalik','DIR001','PUB002','A Funny dan Enjoyable Film','2012-12-12',200000)
insert into Movie values('MOV002','Tukang Ojek Pengkolan','DIR001','PUB004','A Wholesome and very enjoyable Film','2009-12-09',150000)
insert into Movie values('MOV003','The Joncuring','DIR004','PUB005','A frightening  and scary film','2011-09-07',45000)
insert into Movie values('MOV004','Peapdool','DIR002','PUB003','An Awesome adventure film','2003-03-02',345000)
insert into Movie values('MOV005','Wohn Jick 2','DIR003','PUB001','Best action film of all time','2015-11-05',250000)
insert into Movie values('MOV006','Im Pan','DIR003','PUB001','Legend of action film','2001-01-01',225000)
insert into Movie values('MOV007','Whatever Works','DIR001','PUB010','Family friendly and enjoyable film','2013-07-03',150000)
insert into Movie values('MOV008','The Artist','DIR006','PUB009','This film is based on true story','2006-11-12',75000)
insert into Movie values('MOV009','Away Spirited','DIR010','PUB001','Best Animation In 2016','2006-11-11',500000)
insert into Movie values('MOV010','My Neighbor Totoro','DIR010','PUB001','Life Changing film in 2008','2008-12-11',80000)

--Movie Detail
insert into MovieDetail values ('MOV001','GEN002')
insert into MovieDetail values ('MOV002','GEN002')
insert into MovieDetail values ('MOV003','GEN001')
insert into MovieDetail values ('MOV003','GEN006')
insert into MovieDetail values ('MOV004','GEN004')
insert into MovieDetail values ('MOV004','GEN002')
insert into MovieDetail values ('MOV005','GEN004')
insert into MovieDetail values ('MOV006','GEN002')
insert into MovieDetail values ('MOV006','GEN004')
insert into MovieDetail values ('MOV007','GEN003')
insert into MovieDetail values ('MOV007','GEN008')
insert into MovieDetail values ('MOV008','GEN003')
insert into MovieDetail values ('MOV009','GEN005')
insert into MovieDetail values ('MOV010','GEN005')
insert into MovieDetail values ('MOV010','GEN010')

--User
--User
insert into [User] values('USR001','mamatus','Rahmat Zaenudin','Jakarta','RZ123@gmail.com','A guy who loves to watch film')
insert into [User] values('USR002','denpatah','Raden Fatah','Surabaya','obeah@gmail.com','An Artist')
insert into [User] values('USR003','babeeh','Odin Syamsudin','Lamongan','Syamsul0129@gmail.com','A Producer of Small movie')
insert into [User] values('USR004','jokojo','Joko Sujoko','Medan','Jokowawan@gmail.com','A dreamer to be Movie Character')
insert into [User] values('USR005','inemloveijah','Sarinem Lofijah','Malang','Inemanakjalanan@gmail.com','A Wise women who love movie')
insert into [User] values('USR006','sartong','Pala Rudisarto','Yogyakarta','Pedagangikan@gmail.com','A fish seller with dvd player on his house')
insert into [User] values('USR007','Doras','Dora Simorangkir','Batam','Theexplorer@gmail.com','An explorer of the wild')
insert into [User] values('USR008','Jumame','Rey Jumame','Jayapura','Pace123456@gmail.com','Still stream movies even always buffering')
insert into [User] values('USR009','Devibal','Devi Balsar','Bekasi','Pinayayaya@gmail.com','A girl from another planet likes earth film')
insert into [User] values('USR010','nopang','Naufal Pratama','Bandung','weebnolife@gmail.com','A man with passion to be an actor')

--Review
insert into review values('USR001', 'MOV001', 'Recommended', 'Very good movie, I like it', '2020-06-22')
insert into review values('USR001', 'MOV002', 'Recommended', 'Nice movie, I love it', '2020-06-22')
insert into review values('USR002', 'MOV001', 'Not Recommended', 'Not a good movie, kinda boring', '2020-06-12')
insert into review values('USR002', 'MOV003', 'Recommended', 'An amazing movie with a professional actors', '2020-06-12')
insert into review values('USR003', 'MOV009', 'Recommended', 'Enjoyable movie, has a good animation', '2020-11-22')
insert into review values('USR004', 'MOV009', 'Recommended', 'Fantastic movie, has a good animation and a good storyline', '2010-06-24')
insert into review values('USR005', 'MOV010', 'Not Recommended', 'Not a good movie, kinda boring and the animation is very bad', '2020-06-23')
insert into review values('USR005', 'MOV009', 'Not Recommended', 'The animation is very basic and the storyline is very common', '2020-06-12')
insert into review values('USR008', 'MOV006', 'Recommended', 'The action is on point, and the storyline is just my style', '2001-01-03')
insert into review values('USR010', 'MOV008', 'Recommended', 'This movie is very good because it highlights the character development', '2020-06-23')

--Sales Transaction
insert into SalesTransaction values ('SAL001', 'USR001', '2020-06-22')
insert into SalesTransaction values ('SAL002', 'USR002', '2020-06-13')
insert into SalesTransaction values ('SAL003', 'USR003', '2006-11-11')
insert into SalesTransaction values ('SAL004', 'USR004', '2010-06-22')
insert into SalesTransaction values ('SAL005', 'USR005', '2008-12-19')
insert into SalesTransaction values ('SAL006', 'USR005', '2020-06-22')
insert into SalesTransaction values ('SAL007', 'USR008', '2001-01-02')
insert into SalesTransaction values ('SAL008', 'USR010', '2006-12-05')
insert into SalesTransaction values ('SAL009', 'USR007', '2020-12-01')
insert into SalesTransaction values ('SAL010', 'USR010', '2020-06-22')
insert into SalesTransaction values ('SAL011', 'USR001', '2020-11-11')
insert into SalesTransaction values ('SAL012', 'USR009', '2005-05-05')
insert into SalesTransaction values ('SAL013', 'USR003', '2020-11-22')
insert into SalesTransaction values ('SAL014', 'USR010', '2018-03-01')
insert into SalesTransaction values ('SAL015', 'USR003', '2019-10-05')

--Sales Transaction Detail
insert into SalesTransactionDetails values ('MOV001', 'SAL001', '1')
insert into SalesTransactionDetails values ('MOV002', 'SAL001', '2')
insert into SalesTransactionDetails values ('MOV001', 'SAL002', '5')
insert into SalesTransactionDetails values ('MOV003', 'SAL002', '4')
insert into SalesTransactionDetails values ('MOV009', 'SAL003', '1')
insert into SalesTransactionDetails values ('MOV009', 'SAL004', '1')
insert into SalesTransactionDetails values ('MOV010', 'SAL005', '1')
insert into SalesTransactionDetails values ('MOV001', 'SAL005', '2')
insert into SalesTransactionDetails values ('MOV009', 'SAL006', '1')
insert into SalesTransactionDetails values ('MOV003', 'SAL006', '1')
insert into SalesTransactionDetails values ('MOV002', 'SAL006', '1')
insert into SalesTransactionDetails values ('MOV007', 'SAL006', '1')
insert into SalesTransactionDetails values ('MOV006', 'SAL007', '1')
insert into SalesTransactionDetails values ('MOV002', 'SAL007', '1')
insert into SalesTransactionDetails values ('MOV001', 'SAL007', '1')
insert into SalesTransactionDetails values ('MOV003', 'SAL007', '1')
insert into SalesTransactionDetails values ('MOV009', 'SAL007', '1')
insert into SalesTransactionDetails values ('MOV009', 'SAL008', '1')
insert into SalesTransactionDetails values ('MOV009', 'SAL009', '1')
insert into SalesTransactionDetails values ('MOV002', 'SAL010', '2')
insert into SalesTransactionDetails values ('MOV001', 'SAL011', '1')
insert into SalesTransactionDetails values ('MOV003', 'SAL012', '1')
insert into SalesTransactionDetails values ('MOV009', 'SAL013', '1')
insert into SalesTransactionDetails values ('MOV009', 'SAL014', '1')
insert into SalesTransactionDetails values ('MOV009', 'SAL015', '1')



--SIMULATION OF SALES AND REVIEW TRANSACTION

--Ada User bernama Joseph Tarjo, biasa dipanggil Jojo 
--ia merupakan seorang pria
--memiliki nomor hp 089716123478, dan memiliki ID USR123
--tinggal di kota Jakarta
--memiliki email HermitPlatinum@yahoo.co.id
--memiliki deskripsi tentang dirinya "Seorang pecinta film aksi yang tampan"

	insert into [User] values('USR123','Jojo','Joseph Tarjo','Jakarta','HermitPlatinum@yahoo.co.id','A handsome man who loves action film')

--lalu ia melakukan transaksi dengan membeli film sebanyak 2 buah di tanggal 25 maret 2020
--transaksi itu memiliki Id SAL020
--film yang dibeli adalah film yang berjudul "Peapdool" dengan Id MOV004

	insert into SalesTransaction values ('SAL020', 'USR123', '2020-03-25')
	insert into SalesTransactionDetails values ('MOV004', 'SAL020', '2')

---setelah membeli dan menonton film yang telah dibelinya, Jojo memberikan review terhadap film tersebut pada tanggal 30 maret 2020
--ia mengatakan bahwa film itu merupakan film yang luar biasa karena memiliki jalan cerita dan character developneby yang sangat baik
--ia merekomendasikan film ini bagi semua orang

insert into review values('USR123', 'MOV004', 'Recommended', 'Outstanding Movie, has a very good plot and character development', '2020-06-23')



--CASE
--1
select m.MovieID, MovieTitle as 'Title', MovieDescription as 'Description', 'Reviews Movie' = cast(count(r.RecStat) as varchar)+ ' review(s)' 
from Movie m join Review r on r.MovieID = m.MovieID
join [User] u on r.UserID = u.UserID
where UserCity = 'Bandung' or RecStat = 'Not Recommended'
group by m.MovieID,MovieTitle,MovieDescription

--2
select g.GenreID, GenreName as 'Genre Name', 'Total Movie' = Count(m.MovieID)  
from Genre g join MovieDetail md on md.GenreID = g.GenreID
join Movie m on m.MovieID=md.MovieID 
join Director d on d.DirectorID = m.DirectorID
where d.DirectorID between 'DIR004' and 'DIR008' and MONTH(MovieReleaseDate) = 02
group by g.GenreID, GenreName

--3
select d.DirectorID, DirectorName, replace(DirectorPhone,'0','+62') as 'Local Phone',
sum(Quantity) as 'Movie Sold'
from Director d join Movie m on m.DirectorID = d.DirectorID
join SalesTransactionDetails std on std.MovieID = m.MovieID
where d.DirectorID between 'DIR003' and 'DIR009' and Quantity > 20
group by d.DirectorID, DirectorName, DirectorPhone

--4
select u.UserNickname, upper(u.UserCity) as 'UserCity', sum(std.Quantity) as 'Total Movie Purchased',
count(m.MovieID) as 'Movie Owned'
from [User] u join Review r on u.UserID = r.UserID 
join Movie m on m.MovieID = r.MovieID
join SalesTransactionDetails std on std.MovieID = m.MovieID
where u.UserID in('USR002','USR003') and
month(m.MovieReleaseDate) % 2 != 0
group by u.UserNickname, u.UserCity

--5
select right(u.UserID,3) as 'Numeric User ID', upper(u.UserNickname) as 'Nickname', u.UserCity
from [User] u join SalesTransaction st on u.UserID = st.UserID
join SalesTransactionDetails std on st.SalesID = std.SalesID,
	(
		select 'Average' = AVG(st1.quantity)
		from SalesTransactionDetails st1
	) as AverageQty
where u.UserNickname like '%l%' and std.Quantity > AverageQty.Average

--6
select M.MovieID, M.MovieTitle, P.PublisherName, 'PublisherEmail' = SUBSTRING(P.PublisherEmail, 1, CHARINDEX('@', P.PublisherEmail) - 1)
from Movie M join SalesTransactionDetails std on M.MovieID = std.MovieID
join SalesTransaction st on st.SalesID = std.SalesID
join Publisher P on P.PublisherID = M.PublisherID,
	(
		select std1.MovieID, 'MaxQty' = Max(std1.Quantity)
		from SalesTransactionDetails std1 join SalesTransaction st1 on st1.SalesID = std1.SalesID
		where day(st1.transactiondate) = 22
		group by std1.MovieID
	)as Maxquantity
where day(st.transactiondate) = 22 and  std.quantity > Maxquantity.MaxQty 
group by m.MovieID, m.MovieTitle, p.PublisherName, p.PublisherEmail

--7
select d.DirectorID, d.DirectorName, 'Movie Title' = lower(m.MovieTitle),
'Total Genre' = cast(count(md.GenreID)as varchar) + ' genre(s)'
from Director d join Movie m on m.DirectorID = d.DirectorID
join MovieDetail md on m.MovieID = md.MovieID,
	(
		select 'ReleaseDate' = max(MovieReleaseDate)
		from Movie
		where month(MovieReleaseDate) = 9
	) as MaxReleaseDate
where day(m.MovieReleasedate) = day(MaxReleaseDate.ReleaseDate) - 1
and month(m.MovieReleasedate) = month(MaxReleaseDate.ReleaseDate)
and year(m.MovieReleasedate) = year(MaxReleaseDate.ReleaseDate)
group by D.DirectorID, d.DirectorName, m.MovieTitle


--8
select UserNickname, 'User First Name' = SUBSTRING(u.UserFullname, 1, CHARINDEX(' ', u.UserFullname) - 1),
'Total Quantity' = sum(std.Quantity)
from [User] u join  SalesTransaction st on u.UserID = st.UserID
join SalesTransactionDetails std on st.SalesID=std.SalesID,
	(
		select st1.UserID, 'MaxQty' = max(std1.Quantity), 'TotQty' = sum(std1.Quantity)
		from SalesTransactionDetails std1 join SalesTransaction st1 on std1.SalesID=st1.SalesID
		where day(St1.TransactionDate) = 20
		group by st1.UserID
	) as ManyQuantity
where day(st.TransactionDate) = 20 and ManyQuantity.TotQty >= ManyQuantity.MaxQty
group by u.UserNickname, u.UserFullname


--9
go
create view CustomUserViewer 
as
select u.UserID, u.UserNickname, 'Maximum Quantity' = max(std.Quantity), 'Minimum Quantity' = min(std.Quantity)
from [User] u join SalesTransaction st on u.UserID=st.UserID
join SalesTransactionDetails std on std.SalesID=st.SalesID
where day(st.TransactionDate) = 19 and u.UserNickname Like '%h%'
group by u.UserID, u.UserNickname
go 

select*from CustomUserViewer

--10
create view CustomPublisherViewer
as
select p.PublisherName, m.MovieTitle, 
(select format(m.MovieReleaseDate,'dd/MM/yyyy')) as 'Release Date', 'Total Purchase' = sum(std.Quantity), 'Minimal Purchase' = min(std.Quantity)
from Publisher p join Movie m on p.PublisherID=m.PublisherID
join SalesTransactionDetails std on std.MovieID=m.MovieID
where PublisherCity = 'Jakarta' and month(MovieReleaseDate) = 07
group by p.PublisherName, m.MovieTitle, m.MovieReleaseDate
go

select*from CustomPublisherViewer