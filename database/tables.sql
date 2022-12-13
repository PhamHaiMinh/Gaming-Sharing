--create database GamingSharing1;
--use GamingSharing1;
create table Account1 (
	id int not null identity(1,1) primary key,
	username varchar(150) not null,
	[password] varchar(150) not null,
	email varchar(255) not null,
	rollid int not null,
	active bit not null default 1,
);
create table User1 (
	id int not null identity(1,1) primary key,
	account_id int not null,
	last_name varchar(150) not null,
	middle_name varchar(150),
	first_name varchar(255) not null,
	gender bit not null,
	phone varchar(150) not null,
	CONSTRAINT FK_User1_Account1 FOREIGN KEY (account_id)
        REFERENCES Account1 (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

create table Role1 (
	id int not null identity(1,1) primary key,
	name varchar(150) not null unique,
);

ALTER TABLE Account1
ADD CONSTRAINT FK_Account1_Role1 FOREIGN KEY (rollid)
REFERENCES Role1 (id)
ON DELETE CASCADE
ON UPDATE CASCADE;

create table Category1 (
	id int not null identity(1,1) primary key,
	name varchar(150) not null,
);

create table Product1 (
	id int not null identity(1,1) primary key,
	category_id int not null,
	name varchar(150) not null,
	price int not null default 0,
	quantity int not null default 0,
	viewed int not null default 0, 
	description nvarchar(MAX),
	image varchar(150),
	CONSTRAINT FK_Product1_Category1 FOREIGN KEY (category_id)
        REFERENCES Category1 (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

create table Cart1 (
	id int not null identity(1,1) primary key,
	user_id int not null,
	CONSTRAINT FK_Cart1_User1 FOREIGN KEY (user_id)
        REFERENCES User1 (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

create table Cart1Detail (
	id int not null identity(1,1) primary key,
	cart_id int not null,
	product_id int not null,
	quantity int not null,
	CONSTRAINT FK_Cart1Detail_Product1 FOREIGN KEY (product_id)
        REFERENCES Product1 (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	CONSTRAINT FK_Cart1Detail_Cart1 FOREIGN KEY (cart_id)
        REFERENCES Cart1 (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
);

create table Cancel1 (
	id int not null identity(1,1) primary key,
	name varchar(150) not null unique,
);

create table Order1 (
	id int not null identity(1,1) primary key,
	user_id int not null,
	create_time date not null,
	status_id int not null,
	cancel_id int,
	CONSTRAINT FK_Order1_User1 FOREIGN KEY (user_id)
        REFERENCES User1 (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	CONSTRAINT FK_Order1_Cancel1 FOREIGN KEY (cancel_id)
        REFERENCES Cancel1 (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

create table Order1Detail (
	id int not null identity(1,1) primary key,
	order_id int not null,
	product_id int not null,
	quantity int not null,
	CONSTRAINT FK_Order1Detail_Product1 FOREIGN KEY (product_id)
        REFERENCES Product1 (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	CONSTRAINT FK_Order1Detail_Order1 FOREIGN KEY (order_id)
        REFERENCES Order1 (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
);

create table StatusOrder1 (
	id int not null identity(1,1) primary key,
	name varchar(150) not null unique,
);

ALTER TABLE Order1
ADD CONSTRAINT FK_Order1_StatusOrder1 FOREIGN KEY (status_id)
REFERENCES StatusOrder1 (id)
ON DELETE CASCADE
ON UPDATE CASCADE;

create table Blog1 (
	id int not null identity(1,1) primary key,
	tittle varchar(150) not null unique,
	[content] varchar(Max) not null,
	create_time date not null,
);

create table Address1 (
	id int not null identity(1,1) primary key,
	user_id int not null,
	ward_code nvarchar(20),
	address_detail varchar(150),
	CONSTRAINT FK_Address1_User1 FOREIGN KEY (user_id)
        REFERENCES User1 (id)
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
