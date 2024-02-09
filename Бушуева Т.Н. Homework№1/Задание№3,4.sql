create table customer (
    customer_id int4 primary key not null 
    ,first_name text not null 
    ,last_name text
    ,gender varchar(10)
    ,DOB varchar(10)
    ,job_title text
    ,job_industry_category text not null
    ,wealth_segment text not null 
    ,deceased_indicator varchar(10) not null
    ,owns_car varchar(10) not null 
    ,property_valuation int4 not null 
    ,address text not null
    ,postcode int4 not null
    ,state text not null
    ,country text not null
 )
 create table transaction (
     transaction_id int4 not null primary key
     ,customer_id int8 not null 
     ,new_product_id varchar(10) not null 
     ,transaction_date varchar(10) not null 
     ,online_order text
     ,order_status text
     ,list_price float4 not null 
     )


create table product (
    new_product_id varchar(10) not null primary key
    ,product_id int4 not null
    ,brand text	not null
    ,product_line text
    ,product_class text	
    ,product_size text
    ,standard_cost float4 
    )


insert into customer values
(2950,'Kristos','Anthony','Male','1955-01-11','Software Engineer I','Financial Services','Mass Customer','N','Yes',8,'3 New Castle Terrace',3032,'VIC','Australia'),
(3120,'Lauree','O Donnell','Female','1979-02-04','Clinical Specialist','Health','Mass Customer','N','Yes',6,'32 Elmside Point',2560,'NSW','Australia'),
(402,'Berne','Donegan','Male','1977-06-03','Desktop Support Technician','Retail','Affluent Customer','N','No',1,'07 New Castle Circle',2646,'NSW','Australia'),
(3135,'Titus','Worsall','Male','1962-01-14','Staff Scientist','Financial Services','Mass Customer','N','No',7,'24712 Hazelcrest Lane',3024,'VIC','Australia'),
(787,'Norma','Batrim','Female','1996-12-15','','Retail','Affluent Customer','N','Yes',10,'79 Arkansas Drive',3008,'VIC','Australia'),
(2339,'Damien','Haddeston','Male','1958-12-28','Web Designer II','Property','Affluent Customer','N','Yes',5,'533 Ramsey Center',4507,'QLD','Australia'),
(1542,'Sanders','Fernyhough','Male','1978-07-27','Food Chemist','Health','Mass Customer','N','Yes',10,'22 Hayes Center',3156,'VIC','Australia'),
(2459,'Jeanna','Naulls','Female','1986-01-10','Quality Engineer','Manufacturing','High Net Worth','N','No',10,'22 Hayes Center',3156,'VIC','Australia'),
(1305,'Averil','Gentiry','Male','1970-03-01','Executive Secretary','Financial Services','High Net Worth','N','Yes',8,'515 Bunting Point',4115,'QLD','Australia'),
(3262,'Maynord','L Episcopi','Male','1959-10-14','Product Engineer','Entertainment','Mass Customer','N','No',12,'3 Myrtle Pass',2095,'NSW','Australia')




insert into transaction values
(1,2950,'P-1','2/25/2017','False','Approved',71.49),
(2,3120,'P-2','5/21/2017','True','Approved',2091.47),
(3,402,'P-3','10/16/2017','False','Approved',1793.43),
(4,3135,'P-4','8/31/2017','False','Approved',1198.46),
(5,787,'P-5','10/1/2017','True','Approved',1765.3),
(6,2339,'P-6','3/8/2017','True','Approved',1538.99),
(7,1542,'P-7','4/21/2017','True','Approved',60.34),
(8,2459,'P-8','7/15/2017','False','Approved',1292.84),
(9,1305,'P-9','8/10/2017','False','Approved',1071.23),
(10,3262,'P-10','8/30/2017','True','Approved',1231.15)

insert into product values
('P-1',2,'Solex','Standard','medium','medium',53.62),
('P-2',3,'Trek Bicycles','Standard','medium','large',388.92),
('P-3',37,'OHM Cycles','Standard','low','medium',248.82),
('P-4',88,'Norco Bicycles','Standard','medium','medium',381.10),
('P-5',78,'Giant Bicycles','Standard','medium','large',709.48),
('P-6',25,'Giant Bicycles','Road','medium','medium',829.65),
('P-7',22,'WeareA2B','Standard','medium','medium',45.26),
('P-8',15,'WeareA2B','Standard','medium','medium',13.44),
('P-9',67,'Solex','Standard','medium','large',380.74),
('P-10',12,'WeareA2B','Standard','medium','medium',161.60)
