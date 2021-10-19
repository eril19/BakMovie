--Evelin (2301866643)
--Faldian Pratama Wijaya (2301891746)
--Kautsar Ryandika Wibowo (2301878233)
--Muhammad Eril Fario (2301896904)

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

