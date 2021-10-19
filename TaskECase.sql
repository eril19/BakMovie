--Evelin (2301866643)
--Faldian Pratama Wijaya (2301891746)
--Kautsar Ryandika Wibowo (2301878233)
--Muhammad Eril Fario (2301896904)

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