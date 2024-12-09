CREATE DATABASE demo_database;  -- Thêm dấu chấm phẩy ở đây

CREATE DATABASE IF NOT EXISTS demo_database;

USE demo_database;

CREATE TABLE IF NOT EXISTS users (	
	users_id INT, 
	full_name VARCHAR(255), 
	email VARCHAR(255), 
	age INT, 
	birth_day DATE,
	money DOUBLE, 
	is_active BOOLEAN
);

-- Đổi tên table
RENAME TABLE users TO users_rename;

-- Xoá Table
DROP TABLE users_rename;
DROP TABLE IF EXISTS users_rename;


-- Not null
CREATE TABLE not_null (
	id INT NOT NULL,
	age INT
);

-- Unique
CREATE TABLE `unique` (
	id INT UNIQUE
);

-- Default
CREATE TABLE `default` (
	id INT NOT NULL UNIQUE,
	role VARCHAR(255) DEFAULT 'ROLE_USER',
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);              

-- khoá chính: PRIMARY KEY
CREATE TABLE primary_key (
	id BIGINT PRIMARY KEY AUTO_INCREMENT
);

-- khoá phụ: FOREIGN KEY
CREATE TABLE foreign_key (
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	foreign_key BIGINT,
	FOREIGN KEY (foreign_key) REFERENCES primary_key(id)
);

-- THÊM DỮ LIỆU VÀO TABLE
INSERT INTO users (users_id, full_name, email, age, birth_day, money, is_active) 
VALUES
(1, 'long 1', 'long@gmail.com', 18, '1999-01-01', 1500000, TRUE),
(2, 'long 2', 'long2@gmail.com', 19, '1999-01-02', 1600000, FALSE),
(3, 'long 4', 'long4@gmail.com', 20, '1999-01-03', 1700000, TRUE);

-- UPDATE DỮ LIỆU
UPDATE users 
SET money = 99999999
WHERE users.users_id = 1


-- XOÁ DỮ LIỆU 
DELETE FROM users
WHERE users_id = 2

-- TRUY VẤN
SELECT * FROM users

CREATE DATABASE db_app_food

CREATE TABLE users(
	users_id INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(255),
	email VARCHAR(255),
	pass_word VARCHAR(255)
)

INSERT INTO users(full_name, email, pass_word) VALUES 
('Nguyen Thi Lan', 'nguyenthlan@example.com', '123456'),
('Tran Van Binh', 'tranvanbinh@example.com', 'password1'),
('Le Thi Hoa', 'lethihoa@example.com', 'securepwd'),
('Pham Quoc Huy', 'phamquochuy@example.com', 'qwerty123'),
('Do Minh Chau', 'dominchau@example.com', 'letmein'),
('Vu Ngoc Phuc', 'vungocphuc@example.com', 'abc123'),
('Nguyen Van Hoang', 'nguyenvanhoang@example.com', 'mypassword'),
('Tran Thi Mai', 'tranthimai@example.com', 'pass123'),
('Le Van Hai', 'levanhai@example.com', 'welcome1'),
('Nguyen Hoai Nam', 'nguyenhoainam@example.com', 'secure123');

SELECT * FROM users

SELECT full_name AS 'Họ và tên', email FROM users

SELECT * FROM users
LIMIT 2 OFFSET 1

CREATE TABLE foods (
	food_id INT PRIMARY KEY AUTO_INCREMENT,
	food_name VARCHAR(255),
	description VARCHAR(255)
)

INSERT INTO foods (food_name, description) VALUES
('Gỏi Sài Gòn', 'goi_saigon.jpg', 'Gỏi đặc sản miền Nam'),
('Gỏi Quê Tôi', 'goi_quetoi.jpg', 'Hương vị gỏi truyền thống Việt Nam'),
('Gỏi Biển Xanh', 'goi_bienxanh.jpg', 'Tươi ngon từ biển cả'),
('Gỏi Đất Quảng', 'goi_datquang.jpg', 'Hương vị Quảng Nam độc đáo'),
('Gỏi Tre Việt', 'goi_treviet.jpg', 'Gỏi Việt đậm đà hương vị');

CREATE TABLE orders (
    orders_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    food_id INT,
    FOREIGN KEY (user_id) REFERENCES users(users_id),
    FOREIGN KEY (food_id) REFERENCES foods(food_id)
);

INSERT INTO orders (user_id, food_id) VALUES
(1,2),
(3,1),
(2,5),
(1,3),
(3,1)

SELECT * FROM orders


SELECT orders.orders_id, users.full_name
FROM orders
INNER JOIN users ON orders.user_id = users.users_id;


SELECT * 
FROM users
LEFT JOIN orders ON orders.user_id = users.users_id

SELECT * 
FROM users
RIGHT JOIN orders ON orders.user_id = users.users_id

SELECT * 
FROM orders
CROSS JOIN users 


SELECT 
    users.users_id,
    users.email,
    users.full_name, 
    COUNT(users.users_id) AS order_count
FROM orders
INNER JOIN users ON orders.user_id = users.users_id
GROUP BY users.users_id

SELECT 
    users.users_id,
    users.email,
    users.full_name, 
    COUNT(users.users_id) AS order_count
FROM orders
INNER JOIN users ON orders.user_id = users.users_id
GROUP BY users.users_id
ORDER BY order_count asc



SELECT 
    COUNT(orders.user_id) AS 'Like',  -- Đếm số lượng đơn hàng (like)
    orders.user_id, -- ID người dùng từ bảng đơn hàng
    users.users_id, 
    users.full_name, 
    users.email,
    users.pass_word
FROM orders
INNER JOIN users ON orders.user_id = users.users_id
GROUP BY orders.user_id
ORDER BY `Like` DESC
LIMIT 5;


SELECT 
    COUNT(orders.food_id) AS 'Like',  -- Đếm số lượng đơn hàng (like)
    orders.food_id, -- ID người dùng từ bảng đơn hàng
    foods.food_id, 
    foods.food_name
FROM orders
INNER JOIN foods ON orders.food_id = foods.food_id
GROUP BY orders.food_id
ORDER BY `Like` DESC -- Sắp xếp theo số lượng 'Thích' theo thứ tự giảm dần
LIMIT 2; 


SELECT *
FROM users
LEFT JOIN orders ON users.users_id = orders.user_id
WHERE orders.user_id IS NULL





