-- Tạo cơ sở dữ liệu
CREATE DATABASE FoodApp;

USE FoodApp;

-- Bước 2: Tạo bảng
CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255)
);

CREATE TABLE restaurant (
    res_id INT AUTO_INCREMENT PRIMARY KEY,
    res_name VARCHAR(255),
    image VARCHAR(255),
    description VARCHAR(255)
);

CREATE TABLE food_type (
    type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(255)
);

CREATE TABLE food (
    food_id INT AUTO_INCREMENT PRIMARY KEY,
    food_name VARCHAR(255),
    image VARCHAR(255),
    price FLOAT,
    description VARCHAR(255),
    type_id INT,
    FOREIGN KEY (type_id) REFERENCES food_type(type_id)
);

CREATE TABLE sub_food (
    sub_id INT AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(255),
    sub_price FLOAT,
    food_id INT,
    FOREIGN KEY (food_id) REFERENCES food(food_id)
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    food_id INT,
    amount INT,
    code VARCHAR(255),
    arr_sub_id VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (food_id) REFERENCES food(food_id)
);

CREATE TABLE rate_res (
    rate_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    res_id INT,
    amount INT,
    date_rate DATETIME,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);

CREATE TABLE like_res (
    like_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    res_id INT,
    date_like DATETIME,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);

-- Bước 3: Chèn dữ liệu mẫu (tùy chọn)

-- Chèn dữ liệu vào bảng user
INSERT INTO user (full_name, email, password)
VALUES 
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

-- Chèn dữ liệu vào bảng restaurant
INSERT INTO restaurant (res_name, image, description)
VALUES 
('Gỏi Sài Gòn', 'goi_saigon.jpg', 'Gỏi đặc sản miền Nam'),
('Gỏi Quê Tôi', 'goi_quetoi.jpg', 'Hương vị gỏi truyền thống Việt Nam'),
('Gỏi Biển Xanh', 'goi_bienxanh.jpg', 'Tươi ngon từ biển cả'),
('Gỏi Đất Quảng', 'goi_datquang.jpg', 'Hương vị Quảng Nam độc đáo'),
('Gỏi Tre Việt', 'goi_treviet.jpg', 'Gỏi Việt đậm đà hương vị');

-- Chèn dữ liệu vào bảng food_type
INSERT INTO food_type (type_name)
VALUES 
('Gỏi Thịt'),
('Gỏi Cá'),
('Gỏi Tôm'),
('Gỏi Mực'),
('Gỏi Gà');

-- Chèn dữ liệu vào bảng food
INSERT INTO food (food_name, image, price, description, type_id)
VALUES 
('Gỏi Gà Xé Phay', 'goi_ga_xe.jpg', 7.99, 'Thịt gà xé phay trộn với rau răm và hành tây', 5),
('Gỏi Cá Trích', 'goi_ca_trich.jpg', 9.99, 'Cá trích tươi sống cuốn bánh tráng', 2),
('Gỏi Tôm Thịt', 'goi_tom_thit.jpg', 5.49, 'Kết hợp giữa tôm luộc và thịt ba chỉ', 3),
('Gỏi Mực Thái', 'goi_muc_thai.jpg', 6.99, 'Mực thái giòn, cay nồng kiểu Thái', 4),
('Gỏi Thịt Bò', 'goi_thit_bo.jpg', 8.49, 'Thịt bò tái trộn cùng xoài xanh và rau thơm', 1);

-- Chèn dữ liệu vào bảng sub_food
INSERT INTO sub_food (sub_name, sub_price, food_id)
VALUES 
('Thêm Đậu Phộng', 0.50, 1),
('Thêm Hành Phi', 0.50, 2),
('Thêm Rau Răm', 0.30, 3),
('Thêm Nước Mắm Chua Ngọt', 0.50, 4),
('Thêm Ớt Tươi', 0.20, 5);

-- Chèn dữ liệu vào bảng like_res
INSERT INTO like_res (user_id, res_id, date_like) 
VALUES 
(1, 1, '2024-12-01 10:30:00'),
(2, 2, '2024-12-02 14:00:00'),
(3, 3, '2024-12-02 16:00:00'),
(4, 4, '2024-12-03 09:00:00'),
(5, 5, '2024-12-03 13:00:00');

-- Chèn dữ liệu vào bảng orders
INSERT INTO orders (user_id, food_id, amount, code, arr_sub_id)
VALUES
(1, 1, 2, 'ORD001', 'S001'),
(2, 2, 1, 'ORD002', 'S002'),
(3, 3, 3, 'ORD003', 'S003'),
(4, 4, 1, 'ORD004', 'S004'),
(5, 5, 4, 'ORD005', 'S005');

-- Câu truy vấn:

-- 1. Tìm 5 người dùng đã like nhiều nhà hàng nhất:
SELECT user_id, COUNT(res_id) AS like_count
FROM like_res
GROUP BY user_id
ORDER BY like_count DESC
LIMIT 5;

-- 2. Tìm 2 nhà hàng có lượt like nhiều nhất:
SELECT res_id, COUNT(user_id) AS like_count
FROM like_res
GROUP BY res_id
ORDER BY like_count DESC
LIMIT 2;

-- 3. Tìm người đã đặt hàng nhiều nhất:
SELECT user_id, COUNT(*) AS order_count
FROM orders
GROUP BY user_id
ORDER BY order_count DESC
LIMIT 1;

-- 4. Tìm người dùng không hoạt động trong hệ thống:
SELECT user_id
FROM user
WHERE user_id NOT IN (
    SELECT DISTINCT user_id FROM like_res
)
AND user_id NOT IN (
    SELECT DISTINCT user_id FROM orders
);
