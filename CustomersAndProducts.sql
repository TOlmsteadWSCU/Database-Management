/* customersAndProducts - Create Tables - Solution */
drop database if exists customersAndProducts;   # perhaps left over from previous
create database customersAndProducts;   -- note the blank after --
use customersAndProducts;   # switch to the customerAndProducts database

#----------------------------------------------------------------------------
create table customerContacts
(
                customerContactId int primary key,
                customerId varchar(12),
                fname varchar(10), 
                lname varchar(15),
                email varchar(40)
);

insert into customerContacts 
values (1, 'MXLDR',  'Abraham',  'Lincoln',  'lincoln@MXLDR.com');
insert into customerContacts 
values (2, 'MXLDR',  'Richard', 'Nixon',  'nixon@MXLDR.com');
insert into customerContacts 
values (3, 'MXLDR',  'Franklin',  'Roosevelt',  'fdr@MXLDR.com');
insert into customerContacts 
values (4, 'MXLDR',  'Theodore',  'Roosevelt',  'roosevelt@MXLDR.com');
insert into customerContacts
values (5, 'SCI2000',  'Albert',  'Einstein',  'einstein@SCI2000.com');
insert into customerContacts 
values (6, 'SCI2000',  'Charles',  'Darwin',  'darwin@SCI2000.com');
insert into customerContacts
values (7, 'SCI2000',  'Marie',  'Curie',  'curie@SCI2000.com');
insert into customerContacts
values (8, 'SCI2000',  'Benjamin',  'Franklin',  'franklin@SCI2000.com');
insert into customerContacts
values (9, 'MSCRUS',  'George',  'Gershwin',  'gershwin@MSCRUS.com');
insert into customerContacts
values (10, 'MSCRUS',  'Benjamin',  'Britten',  'britten@MSCRUS.com');
insert into customerContacts
values (11, 'MSCRUS',  'John',  'Lennon',  'lennon@MSCRUS.com');

#----------------------------------------------------------------------------
create table customers (
                customerId varchar(10) primary key,
                customerName varchar(20)
                );

insert into customers values('MXLDR', 'Maximum Leadership');
insert into customers values('SCI2000', 'Science 2000');
insert into customers values('MSCRUS', 'Music R Us');

#----------------------------------------------------------------------------
create table orders (
                orderId int primary key,
                customerId varchar(10),
                orderDate date
                );

insert into orders values(1, 'MXLDR', '2006-01-23');
insert into orders values(2, 'SCI2000', '2006-01-23');
insert into orders values(3, 'SCI2000', '2006-02-02');
insert into orders values(4, 'SCI2000', '2006-02-05');
insert into orders values(5, 'MSCRUS', '2006-02-01');
insert into orders values(6, 'MSCRUS', '2006-02-02');
insert into orders values(7, 'MXLDR', '2006-01-26');

#----------------------------------------------------------------------------
create table orderLines(
                lineId int, 
                orderId int,
                productId varchar(10),
                quantity int,
                primary key(lineId, orderId)
                );

insert into orderLines values(1, 1, 'MINI', 4);
insert into orderLines values(2, 1, 'MAXI', 2);
insert into orderLines values(3, 2, 'MAXI', 12);
insert into orderLines values(4, 3, 'MINI', 16);
insert into orderLines values(5, 4, 'MINI', 16);
insert into orderLines values(6, 4, 'MAXI', 10);
insert into orderLines values(7, 5, 'MIDI', 10);
insert into orderLines values(8, 5, 'MAXI', 10);
insert into orderLines values(9, 6, 'MAXI', 6);
insert into orderLines values(10, 7, 'MAXI', 8);

#----------------------------------------------------------------------------
create table products(
                productId varchar(10),
                productName varchar(20),
                weight double,
                price double
);

insert into products values('MINI', 'Small product', 1.5, 5.99);
insert into products values('MIDI', 'Medium product', 4.5, 9.99);
insert into products values('MAXI', 'Large product', 8, 15.99);

#select * from customerContacts;
#select * from customers;
#select * from orders;
#select * from orderLines;
#select * from products;
