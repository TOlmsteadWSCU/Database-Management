/*
195
authorsBooksAndPublishers
Travis Olmstead
*/
drop database if exists authorsBooksAndPublishers;  
create database authorsBooksAndPublishers; 
use authorsBooksAndPublishers;  

create table authors (
                authorId  smallint unsigned primary key auto_increment,
    authorName varchar(10)
);
insert into authors (authorName) values ('Dan'), ('Angie'), ('David'), ('Miller'), ('Beth'), ('Jill');
select * from authors;


create table authorsPrivateInfo (
                authorId smallint unsigned primary key,
    email varchar(30),
    phone varchar(12)
);
insert into authorsPrivateInfo values 
                (1, 'dan@hotmail.com', '641-1234'),         (2, 'angie@hotmail.com','641-1111'), 
    (3, 'david@hotmail.com', '209-1111'),                  (4, 'miller@hotmail.com', '209-6666'), 
    (5, 'beth@hotmail.com', '209-4444'),        (6, 'jill@hotmail.com', '357-3333');
select * from authorsPrivateInfo;


create table publishers (
                publisherId smallint unsigned primary key auto_increment,
    publisherName varchar(10)
);
insert into publishers (publisherName) values ('Ruper Inc.'), ('R & W'), ('Montberg'), ('SauerKraut');
select * from publishers;


create table books (
    bookId smallint unsigned primary key auto_increment,
    title varchar(50),
    numPages smallint unsigned
);
insert into books (title, numPages) values 
                ('Four Score and Seven', 342),    ('Automata & Languages', 550), 
    ('Willy Wonka', 280),             ('Compiler Design Made Easy', 20);
select * from books;


create table authorsXbooks (
    authorId smallint unsigned,
    bookId smallint unsigned,
    primary key(authorId, bookId)
);
insert into authorsXbooks (authorId, bookId) values 
                (1, 1), (1, 3), 
    (2, 1), (2, 4), (2, 3), 
    (3, 3), (3, 4),
    (4, 2),
    (5, 2);
select * from authorsXbooks;

    
create table booksXpublishers (                
    bookId smallint unsigned,
    publisherId smallint unsigned,
    primary key (bookId, publisherId)
);
insert into booksXpublishers (publisherId, bookId) values (1, 1), (1, 2), (2, 3), (3, 4), (4, 1);
select * from booksXpublishers;


create table signingDates (
                dateId smallint unsigned auto_increment,
    authorId smallint unsigned,
    signingDate date,
    location varchar(200),
    primary key(dateId, authorId)
);
insert into signingDates (authorId, signingDate, location) values
                (1, '2016-10-29', 'Walden Books, GJ Mall, Grand Junction, CO'),
    (2, '2016-10-30', 'Book Worm, Main Street, Gunnison, CO'),
    (1, '2016-11-01', 'Borders, W. 32nd Rd, Grand Junction, CO'),
    (3, '2016-11-10', 'Selma Treasure Books, 94 W. Oak, Montrose, CO'),
    (4, '2016-11-11', 'Antiques & Book, 404 H. 285, Conifer, CO'),
    (1, '2016-12-01', 'Munchkins & More, Pitkin Ave, Pitkind, CO');
select * from signingDates;
