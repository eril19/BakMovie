--Evelin (2301866643)
--Faldian Pratama Wijaya (2301891746)
--Kautsar Ryandika Wibowo (2301878233)
--Muhammad Eril Fario (2301896904)

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


