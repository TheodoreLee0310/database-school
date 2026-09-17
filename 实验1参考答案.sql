--任务一 创建YGGZ数据库及数据表
--创建数据库YGGZ
CREATE DATABASE YGGZ
GO
USE YGGZ
GO
--部门表
CREATE TABLE Department (
	DeptNo char(3) PRIMARY KEY,
	DeptName varchar(20) NOT NULL
)
GO
--员工表
CREATE TABLE Employee (
	EmpNo char(5) PRIMARY KEY,
	EmpName varchar(20) NOT NULL,
	Sex char(2),
	Birthday datetime,
	Post varchar(20),
	DeptNo char(3) not null REFERENCES Department(DeptNo)   /*列级定义外键*/
)
GO
--工资表
CREATE TABLE Salay (
	PayDate datetime NOT NULL,
	EmpNo char(5) NOT NULL,    
	Wages numeric(8,2),
	foreign key (EmpNo) REFERENCES Employee(EmpNo)     /*表级定义外键*/
)

--任务二 创建Sales数据库及数据表
--创建数据库Sales
CREATE DATABASE Sales
GO
USE Sales
GO
--创建销售员表Seller
create table Seller(
	SaleID char(3) primary key,
	Salename varchar(20) not null,
	Sex char(2),
	Birthday datetime,
	HireDate datetime,
	Address varchar(60),
	Telephone varchar(20)
)
go
--创建客户表Customer
create table Customer(
	CustomerID char(3) primary key,
	CompanyName varchar(30) not null,
	ConnectName varchar(20),
	Address varchar(60),
	ZipCode char(6),
	Telephone varchar(20)
)
go
--创建商品种类表Category
create table Category(
	CategoryID int primary key,
	CategoryName varchar(20) not null,
	Description varchar(80)
)
go
--创建商品表Product
create table Product(
	ProductID char(6) primary key,
	ProductName varchar(30) not null,
	CategoryID int not null REFERENCES Category(CategoryID),/*列级定义外键*/
	Price money,
	stocks smallint
)
go
--创建订单表Orders
create table Orders(
	OrderID int IDENTITY(10001,1) primary key,
	CustomerID char(3) not null REFERENCES Customer(CustomerID),
	SaleID char(3) not null REFERENCES Seller(SaleID),
	OrderDate datetime,
	Notes varchar(80)
)
go
--创建订单明细表OrderDetail
create table OrderDetail(
	OrderID int,
	ProductID char(6),
	Quantity int,
	Total money,
	PRIMARY KEY(OrderID,ProductID),  /*组合主键只能定义在表级*/
	foreign key (OrderID) REFERENCES Orders(OrderID),    /*表级定义外键*/
	foreign key (ProductID) REFERENCES Product(ProductID)
)
go

--任务三：使用SQL语句修改数据表
--1.在员工表Employee中增加联系方式字段Phone，长度为11的定长字符串类型（char）。
ALTER TABLE Employee ADD Phone char(11)

--2.修改Employee表中的Phone的字段类型改为可变长字符串类型，长度为15。
ALTER TABLE Employee ALTER COLUMN Phone varchar(15)

--3.删除Employee表中的Phone字段。
ALTER TABLE Employee DROP COLUMN Phone
