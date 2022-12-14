--create database GamingSharing1;
--use GamingSharing1;
create table Account (
	id int not null identity(1,1) primary key,
	username varchar(150) not null,
	[password] varchar(150) not null,
	email varchar(255) not null,
	role_id int not null,
	active bit not null default 1,
);
create table [User] (
	id int not null identity(1,1) primary key,
	account_id int not null,
	last_name nvarchar(150) not null,
	middle_name nvarchar(150),
	first_name nvarchar(255) not null,
	gender bit not null,
	phone varchar(150) not null,
	CONSTRAINT FK_User_Account FOREIGN KEY (account_id)
        REFERENCES Account (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

create table Role (
	id int not null identity(1,1) primary key,
	[name] nvarchar(150) not null unique,
);

ALTER TABLE Account
ADD CONSTRAINT FK_Account_Role FOREIGN KEY (rollid)
REFERENCES Role (id)
ON DELETE CASCADE
ON UPDATE CASCADE;

create table Category (
	id int not null identity(1,1) primary key,
	[name] nvarchar(150) not null,
);

create table Product (
	id int not null identity(1,1) primary key,
	category_id int not null,
	[name] nvarchar(150) not null,
	price int not null default 0,
	quantity int not null default 0,
	viewed int not null default 0, 
	description nvarchar(MAX),
	image varchar(150),
	CONSTRAINT FK_Product_Category FOREIGN KEY (category_id)
        REFERENCES Category (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

create table Cart (
	id int not null identity(1,1) primary key,
	[user_id] int not null,
	CONSTRAINT FK_Cart_User FOREIGN KEY (user_id)
        REFERENCES [User] (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

create table CartDetail (
	id int not null identity(1,1) primary key,
	cart_id int not null,
	product_id int not null,
	quantity int not null,
	CONSTRAINT FK_CartDetail_Product FOREIGN KEY (product_id)
        REFERENCES Product (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	CONSTRAINT FK_CartDetail_Cart FOREIGN KEY (cart_id)
        REFERENCES Cart (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
);

create table Cancel (
	id int not null identity(1,1) primary key,
	name nvarchar(150) not null unique,
);

create table [Order] (
	id int not null identity(1,1) primary key,
	[user_id] int not null,
	create_time date not null,
	status_id int not null,
	cancel_id int,
	CONSTRAINT FK_Order_User FOREIGN KEY (user_id)
        REFERENCES [User] (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	CONSTRAINT FK_Order_Cancel FOREIGN KEY (cancel_id)
        REFERENCES Cancel (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

create table OrderDetail (
	id int not null identity(1,1) primary key,
	order_id int not null,
	product_id int not null,
	quantity int not null,
	CONSTRAINT FK_OrderDetail_Product FOREIGN KEY (product_id)
        REFERENCES Product (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	CONSTRAINT FK_OrderDetail_Order FOREIGN KEY (order_id)
        REFERENCES [Order] (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
);

create table StatusOrder (
	id int not null identity(1,1) primary key,
	[name] nvarchar(150) not null unique,
);

ALTER TABLE [Order]
ADD CONSTRAINT FK_Order_StatusOrder FOREIGN KEY (status_id)
REFERENCES StatusOrder (id)
ON DELETE CASCADE
ON UPDATE CASCADE;

create table Blog (
	id int not null identity(1,1) primary key,
	tittle nvarchar(150) not null unique,
	[body] nvarchar(Max) not null,
	create_time date not null,
	viewed int not null,
	category_id int not null,
	browser int not null,
	[priority] int not null,
	[image] nvarchar(50) not null,
	[source] nvarchar(50) not null,
);

create table BlogCategory (
	id int not null identity(1,1) primary key,
	[name] nvarchar(50) not null,
	description nvarchar(50) not null,
	viewed int default 0 not null,
);

create table Address (
	id int not null identity(1,1) primary key,
	user_id int not null,
	ward_code nvarchar(20),
	address_detail nvarchar(150),
	CONSTRAINT FK_Address_User FOREIGN KEY (user_id)
        REFERENCES [User] (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE administrative_regions (
	id integer NOT NULL,
	name nvarchar(255) NOT NULL,
	name_en nvarchar(255) NOT NULL,
	code_name nvarchar(255) NULL,
	code_name_en nvarchar(255) NULL,
	CONSTRAINT administrative_regions_pkey PRIMARY KEY (id)
);

CREATE TABLE administrative_units (
	id integer NOT NULL,
	full_name nvarchar(255) NULL,
	full_name_en nvarchar(255) NULL,
	short_name nvarchar(255) NULL,
	short_name_en nvarchar(255) NULL,
	code_name nvarchar(255) NULL,
	code_name_en nvarchar(255) NULL,
	CONSTRAINT administrative_units_pkey PRIMARY KEY (id)
);


CREATE TABLE provinces (
	code nvarchar(20) NOT NULL,
	name nvarchar(255) NOT NULL,
	name_en nvarchar(255) NULL,
	full_name nvarchar(255) NOT NULL,
	full_name_en nvarchar(255) NULL,
	code_name nvarchar(255) NULL,
	administrative_unit_id integer NULL,
	administrative_region_id integer NULL,
	CONSTRAINT provinces_pkey PRIMARY KEY (code)
);

ALTER TABLE provinces ADD CONSTRAINT provinces_administrative_region_id_fkey FOREIGN KEY (administrative_region_id) REFERENCES administrative_regions(id);
ALTER TABLE provinces ADD CONSTRAINT provinces_administrative_unit_id_fkey FOREIGN KEY (administrative_unit_id) REFERENCES administrative_units(id);

CREATE TABLE districts (
	code nvarchar(20) NOT NULL,
	name nvarchar(255) NOT NULL,
	name_en nvarchar(255) NULL,
	full_name nvarchar(255) NULL,
	full_name_en nvarchar(255) NULL,
	code_name nvarchar(255) NULL,
	province_code nvarchar(20) NULL,
	administrative_unit_id integer NULL,
	CONSTRAINT districts_pkey PRIMARY KEY (code)
);


ALTER TABLE districts ADD CONSTRAINT districts_administrative_unit_id_fkey FOREIGN KEY (administrative_unit_id) REFERENCES administrative_units(id);
ALTER TABLE districts ADD CONSTRAINT districts_province_code_fkey FOREIGN KEY (province_code) REFERENCES provinces(code);


CREATE TABLE wards (
	code nvarchar(20) NOT NULL,
	name nvarchar(255) NOT NULL,
	name_en nvarchar(255) NULL,
	full_name nvarchar(255) NULL,
	full_name_en nvarchar(255) NULL,
	code_name nvarchar(255) NULL,
	district_code nvarchar(20) NULL,
	administrative_unit_id integer NULL,
	CONSTRAINT wards_pkey PRIMARY KEY (code)
);


ALTER TABLE wards ADD CONSTRAINT wards_administrative_unit_id_fkey FOREIGN KEY (administrative_unit_id) REFERENCES administrative_units(id);
ALTER TABLE wards ADD CONSTRAINT wards_district_code_fkey FOREIGN KEY (district_code) REFERENCES districts(code);

ALTER TABLE Address
ADD CONSTRAINT FK_Address_Wards FOREIGN KEY (ward_code)
REFERENCES wards (code)
ON DELETE CASCADE
ON UPDATE CASCADE;
