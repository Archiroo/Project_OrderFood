CREATE DATABASE db_OrderFood
Use db_OrderFood

--Bảng tài khoản
CREATE TABLE tb_User(
	u_id INT IDENTITY(1,1) PRIMARY KEY,
	u_fullName NVARCHAR(255) NOT NULL,
	u_phone CHAR(25) NOT NULL,
	u_password CHAR(25) NOT NULL)

--Bảng loại món ăn
CREATE TABLE tb_TypeFood(
	typeFood_id INT IDENTITY(1,1) PRIMARY KEY,
	typeFood_name NVARCHAR(255) NOT NULL)

--Bảng món ăn
CREATE TABLE tb_Food(
	food_id INT IDENTITY(1,1) PRIMARY KEY,
	typeFood_id INT,
	food_name NVARCHAR(255),
	food_price float,
	food_image nvarchar(255),
	food_description NVARCHAR(255),
	
	FOREIGN KEY(typeFood_id) REFERENCES tb_TypeFood(typeFood_id))

--Bảng khách hàng
CREATE TABLE tb_Customer(
	customer_id INT IDENTITY(1,1) PRIMARY KEY,
	u_id INT,
	customer_name NVARCHAR(255),
	customer_phone CHAR(25),
	customer_image NVARCHAR(255),
	FOREIGN KEY(u_id) REFERENCES tb_User(u_id))
	 
--Bảng đặt món
CREATE TABLE tb_Order(
	order_id INT IDENTITY(1,1) PRIMARY KEY,
	customer_id INT,
	order_date DATE,
	order_totalAmount INT,
	order_status INT DEFAULT 1,
	order_address NVARCHAR(255),
	
	FOREIGN KEY(customer_id) REFERENCES tb_Customer(customer_id))


--Bảng chi tiết order
CREATE TABLE tb_orderDetails(
	order_id INT,
	food_id INT,
	amount INT,
	
	FOREIGN KEY(order_id) REFERENCES tb_Order(order_id),
	FOREIGN KEY(food_id) REFERENCES tb_Food(food_id))

--Bảng đánh giá món ăn
CREATE TABLE tb_Assessment(
	customer_id INT,
	food_id INT,
	Ass_description NVARCHAR(255),

	FOREIGN KEY(customer_id) REFERENCES tb_Customer(customer_id),
	FOREIGN KEY(food_id) REFERENCES tb_Food(food_id))

