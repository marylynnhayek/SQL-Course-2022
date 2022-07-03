create table Customer(
    Customer_ID int not null,
    Customer_Name varchar(25),
    Customer_Adress varchar(30),
    Customer_City varchar(20),
    Customer_State varchar(2),
    Postal_Code varchar(10),
    primary key(Customer_ID)
  );
  
insert into Customer values(1,'Contemporary Casuals','1355 S Hines Blvd','Gainesville','FL','32601-2871');
insert into Customer values(2,'Value Furniture','15145 S.W. 17th St.','Plano','TX','75094-7743');
insert into Customer values(3,'Home Furnishings','1900 Allard Ave.','Albany','NY','12209-1125');
insert into Customer values(4,'Eastern Furniture','1925 Beltline Rd.','Carteret','NJ','07008-3188');
insert into Customer values(5,'Impressions','5585 Westcott Ct.','Sacramento','CA','94206-4056');
insert into Customer values(6,'Furniture Gallery','325 Flatiron Dr.','Boulder','CO','80514-4432');
insert into Customer values(7,'Period Furniture','394 Rainbow Dr.','Seattle','WA','97954-5589');
insert into Customer values(8,'Calfornia Classics','816 Peach Rd.','Santa Clara','CA','96915-7754');
insert into Customer values(9,'M and H Casual Furniture','3709 First Street','Clearwater','FL','34620-2314');
insert into Customer values(10,'Seminole Interiors','2400 Rocky Point Dr.','Seminole','FL','34646-4423');
insert into Customer values(11,'American Euro Lifestyles','2424 Missouri Ave N.','Prospect Park','NJ','07508-5621');
insert into Customer values(12,'Battle Creek Furniture','345 Capitol Ave. SW','Battle Creek','MI','49015-3401');
insert into Customer values(13,'Heritage Furnishings','66789 College Ave.','Carlisle','PA','17013-8834');
insert into Customer values(14,'Kaneohe Homes','112 Kiowai St.','Kaneohe','HI','96744-2537');
insert into Customer values(15,'Mountain Scenes','4132 Main Street','Ogden','UT','84403-4432');

create table Does_Business_In(
  Customer_ID int Not Null,
  Territory_ID int Not Null,
  PRIMARY KEY(Customer_ID,Territory_ID),
  foreign key (Customer_ID) references Customer(Customer_ID),
  foreign key (Territory_ID) references Territory(Territory_ID)
);

insert into Does_Business_In values(1,1);
insert into Does_Business_In values(1,2);
insert into Does_Business_In values(2,2);
insert into Does_Business_In values(3,3);
insert into Does_Business_In values(4,3);
insert into Does_Business_In values(5,2);
insert into Does_Business_In values(6,5);

create table Employee(
  Employee_id varchar(10) NOT NULL,
  Employee_name varchar(25),
  Employee_adress varchar(30),
  Employee_birthdate DATE,
  Employee_city varchar(20),
  Employee_date_hired DATE,
  Employee_state varchar(2),
  Employee_supervisor varchar(10),
  Employee_zip varchar(10),
  Sup_id varchar(10),
  foreign key (Sup_id) REFERENCES Employee(Employee_supervisor),
  primary key (Employee_id)
);

insert into Customer values('123-44-345','Jim Jason','2134 Hilltop Rd','1900-01-01',NULL,'1999-12-06','TN','454-56-768',NULL);
insert into Customer values('454-56-768','Robert Lewis','17834 Deerfield Ln','1900-01-01','Nashville','1999-01-01','TN',NULL,NULL);

create table Skill(
  skill_id VARCHAR(12) NOT NULL,
  skill_description VARCHAR(30),
  PRIMARY KEY(skill_id)
);

insert into Skill values('BS12','12in Band Saw');
insert into Skill values('QC1','Quality Control');
insert into Skill values('RT1','Router');
insert into Skill values('S)1','Sander-Orbital');
insert into Skill values('SB1','Sander-Belt');
insert into Skill values('TS10','10in Table Saw');
insert into Skill values('TS12','12in Table Saw');
insert into Skill values('UC1','Upholstery Cutter');
insert into Skill values('US1','Upholstery Sewer');
insert into Skill values('UT1','Upholstery Tacker');

CREATE TABLE Employee_Skills(
  Employee_id varchar(10) NOT NULL,
  skill_id VARCHAR(12) NOT NULL,
  PRIMARY KEY(Employee_id, skill_id),
  foreign key (Employee_id) REFERENCES Employee(Employee_id),
  foreign key (skill_id) REFERENCES Skill(skill_id)
);

insert into Employee_Skills values('123-44-345','BS12');
insert into Employee_Skills values('123-44-345','RT1');
insert into Employee_Skills values('454-56-768','BS12');

CREATE TABLE order(
  order_id int NOT NULL,
  Customer_ID int,
  order_date DATE,
  foreign key(Customer_ID) references Customer (Customer_ID)
);

insert into order values(1001,1,'2008-10-21');
insert into order values(1002,8,'2008-10-21');
insert into order values(1003,15,'2008-10-22');
insert into order values(1004,5,'2008-10-22');
insert into order values(1005,3,'2008-10-24');
insert into order values(1006,2,'2008-10-24');
insert into order values(1007,11,'2008-10-27');
insert into order values(1008,12,'2008-10-30');
insert into order values(1009,4,'2008-5-11');
insert into order values(1010,1,'2008-5-11');

create table OrderLine(
  order_id int NOT NULL,
  product_id int NOT NULL,
  ordered_Quantity int,
  primary key(order_id,product_id),
  FOREIGN key (product_id) REFERENCES product(product_id),
  foreign key (order_id) references order(order_id)
);

insert into OrderLine values(1001,1,2);
insert into OrderLine values(1001,2,2);
insert into OrderLine values(1001,4,1);
insert into OrderLine values(1002,3,5);
insert into OrderLine values(1003,3,3);
insert into OrderLine values(1004,6,2);
insert into OrderLine values(1004,8,2);
insert into OrderLine values(1005,4,3);
insert into OrderLine values(1006,4,1);
insert into OrderLine values(1006,5,2);
insert into OrderLine values(1006,7,2);
insert into OrderLine values(1007,1,3);
insert into OrderLine values(1007,2,2);
insert into OrderLine values(1008,3,3);
insert into OrderLine values(1008,8,3);
insert into OrderLine values(1009,4,2);
insert into OrderLine values(1009,7,3);
insert into OrderLine values(1010,8,10);

create table product_In(
  product_id int NOT NULL,
  work_Center_id varchar(12) NOT NULL,
  primary key (product_id,work_Center),
  foreign key(product_id) REFERENCES product(profuct_id),
  foreign key(work_Center) REFERENCES work_center(work_Center_id)
);

create table product_line(
  product_line_id int NOT NULL,
  product_line_name varchar(50),
  PRIMARY KEY(product_line_id)
);

insert into product_line values(1,'Cherry Tree');
insert into product_line values(2,'Scandinavia');
insert into product_line values(3,'Country Look');

create table product(
  product_id int NOT NULL,
  product_line_id int,
  product_description varchar(50),
  product_finish varchar(20),
  standard_price decimal(6,2),
  PRIMARY KEY(product_id),
  FOREIGN KEY (product_line_id) REFERENCES product_line(product_line_id)
);

insert into product values(1,1,'End Table','Cherry',175);
insert into product values(2,2,'Coffee Table','Natural Ash',200);
insert into product values(3,2,'Computer Desk','Natural Ash',375);
insert into product values(4,3,'Entertainment Center','Natural Maple',650);
insert into product values(5,1,'Writers Desk','Cherry',325);
insert into product values(6,2,'8-Drawer Desk','White Ash',750);
insert into product values(7,2,'Dining Table','Natural Ash',800);

create table Raw_Materials(
  Material_Id varchar(12) NOT NULL,
  Material_name varchar(30),
  Standard_cost decimal(6,2),
  Unit_Of_Measure varchar(10),
  PRIMARY KEY(Material_Id)
);

create table SalesPerson(
  SalesPerson_Id int NOT NULL,
  SalesPerson_Name varchar(25),
  SalesPerson_Phone varchar(50),
  SalesPerson_Fax varchar(50),
  Territory_ID int,
  foreign key(Territory_ID) REFERENCES territory(Territory_ID),
  PRIMARY KEY(SalesPerson_Id)
);

insert into SalesPerson values(1,'Doug Henny','8134445555',NULL,1);
insert into SalesPerson values(2,'Robert Lewis','8139264006',NULL,2);
insert into SalesPerson values(3,'William Strong','5053821212',NULL,3);
insert into SalesPerson values(4,'Julie Dawson','4355346677',NULL,4);
insert into SalesPerson values(5,'Jacob Winslow','2238973498',NULL,5);

create table Supplies(
  vendor_id int NOT NULL,
  Material_Id VARCHAR(12) NOT NULL,
  Supply_Unit_Price DECIMAL(6,2),
  primary key (vendor_id,Material_Id),
  foreign key(vendor_id) REFERENCES vendor(vendor_id),
  foreign key(Material_Id) REFERENCES Raw_Materials(Material_Id)
);

create table territory(
  Territory_ID int NOT NULL,
  Territory_name varchar(50),
  PRIMARY KEY(Territory_ID)
);

insert into territory values(1,'SouthEast');
insert into territory values(2,'SouthWest');
insert into territory values(3,'NorthEast');
insert into territory values(4,'NorthWest');
insert into territory values(5,'Central');

create table uses(
  Material_Id varchar(12) NOT NULL,
  Product_Id int NOT NULL,
  Goes_into_Quantity int,
  foreign key(Material_Id) references Raw_Materials(Material_Id),
  foreign key(product_id) references product(product_id),
  PRIMARY KEY(Material_Id,product_id)
);

create table vendor(
  vendor_id int NOT NULL,
  vendor_name VARCHAR(25),
  vendor_Address VARCHAR(30),
  vendor_City VARCHAR(20),
  vendor_Contact VARCHAR(50),
  vendor_Fax VARCHAR(10),
  vendor_Phone VARCHAR(10),
  vendor_State VARCHAR(2),
  vendor_Tax_Id VARCHAR(50),
  vendor_ZipCode VARCHAR(50),
  primary key(vendor_id)
);

create table Work_Center(
  Work_Center_Id VARCHAR(12) NOT NULL,
  Work_Center_Location VARCHAR(30),
  primary key(Work_Center_Id)
);

insert into Work_Center values('SM1','Main Saw Mill');
insert into Work_Center values('WR1','Warehouse and Receiving');

create table Works_IN(
  Employee_Id varchar(10) NOT NULL,
  Work_Center_Id varchar(12) NOT NULL,
  primary key(Employee_Id,Work_Center_Id),
  foreign key(Employee_Id) REFERENCES Employee(Employee_id),
  foreign key(Work_Center_Id) REFERENCES Work_Center(Work_Center_Id)
);

insert into Works_IN values('123-44-345','SM1');
