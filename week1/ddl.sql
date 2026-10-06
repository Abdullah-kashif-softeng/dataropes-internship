-- DDL: create tables

CREATE TABLE customers (
    customer_id  INT PRIMARY KEY,
    first_name   VARCHAR(50)  NOT NULL,
    last_name    VARCHAR(50)  NOT NULL,
    email        VARCHAR(100) NOT NULL,
    phone        VARCHAR(20),
    address      VARCHAR(150),
    city         VARCHAR(50),
    country      VARCHAR(50),
    created_at   DATE NOT NULL
);

CREATE TABLE orders (
    order_id         INT PRIMARY KEY,
    customer_id      INT NOT NULL,
    order_date       DATE NOT NULL,
    ship_date        DATE,
    product_name     VARCHAR(100) NOT NULL,
    quantity         INT NOT NULL,
    unit_price       DECIMAL(10, 2) NOT NULL,
    total_amount     DECIMAL(10, 2) NOT NULL,
    payment_method   VARCHAR(30),
    status           VARCHAR(20) NOT NULL,
    shipping_address VARCHAR(150),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

ALTER TABLE orders ADD COLUMN category VARCHAR(50);

UPDATE orders SET category = CASE
    WHEN product_name IN ('Wireless Mouse', 'USB Keyboard', 'Laptop Stand', 'Webcam', 'Mouse Pad') THEN 'Computer Accessories'
    WHEN product_name IN ('Phone Case', 'Power Bank') THEN 'Mobile Accessories'
    WHEN product_name IN ('Bluetooth Speaker', 'Headphones') THEN 'Audio'
    WHEN product_name IN ('HDMI Cable', 'USB Hub') THEN 'Cables & Hubs'
    WHEN product_name = 'Monitor' THEN 'Displays'
END;