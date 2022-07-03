--Code sports_queries: Mary-Lynn Hayek 3 Mai 2022: 

create table S_customer(
id varchar(3) Not Null,
name varchar(20) Not Null,
phone varchar(20) Not Null,
address varchar(20),
city varchar(20),
state varchar(15),
country varchar(20),
zip_code varchar(15),
credit_rating varchar(9) check(credit_rating 	IN('Excellent','Good','Poor')),
sales_rep_id varchar(3),
region_id varchar(3),
comments varchar(255),
);

create table S_region(
id varchar(3) Not Null,
name varchar(20) Not Null,
);

create table S_emp(
id varchar(3) not null,
last_name varchar(20) Not Null,
first_name varchar(20),
userid varchar(8) not null unique,
start_date date not null,
comments varchar(255),
manager_id varchar(3),
title varchar(25),
dept_id varchar(3),
salary decimal(11,2),
commission_pct decimal(4,2) check(commission_pct IN(10,12.5,15,17.5,20)),
s_lifetime int,
commission decimal(18,0),
);

create table S_inventory(
product_id varchar(7) not null,
warehouse_id varchar(7) not null,
amount_in_stock decimal(9,0),
reorder_point decimal(9,0),
max_in_stock decimal(9,0),
out_of_stock_explanation varchar(255),
restock_date date,
);

create table S_item(
ord_id varchar(3) not null,
item_id varchar(7) not null,
product_id varchar(7) not null,
price decimal(11,2),
quantity decimal(9,0),
quantity_shipped decimal(9,0),
);

create table S_ord(
id varchar(3) not null,
customer_id varchar(3) not null,
date_ordered date not null,
date_shipped date,
sales_rep_id varchar(3),
total decimal(11,2),
payment_type varchar(6) not null check(payment_type IN('Cash','Credit')),
order_filled varchar(1) check(order_filled IN('Y','N')),
);

create table S_product(
id varchar(7) not null,
name varchar(25) not null,
short_desc varchar(255),
suggested_whlsl_price decimal(11,2),
whlsl_units varchar(10),
);

create table S_title(
title varchar(25) not null,
);

create table S_warehouse(
id varchar(7) not null,
region_id varchar(3) not null,
address varchar(20),
city varchar(20),
state varchar(15),
country varchar(20),
zip_code varchar(15),
phone varchar(20),
manager_id varchar(3),
);

create table S_dept(
id varchar(3) not null,
name varchar(20) not null,
region_id varchar(3),
);