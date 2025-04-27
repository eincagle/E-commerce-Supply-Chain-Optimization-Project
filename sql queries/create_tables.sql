CREATE TABLE cleaned_olist_orders (
  order_id STRING PRIMARY KEY,
  customer_id STRING,
  order_status STRING,
  order_purchase_timestamp TIMESTAMP,
  order_approved_at TIMESTAMP,
  order_delivered_carrier_date TIMESTAMP,
  order_delivered_customer_date TIMESTAMP,
  order_estimated_delivery_date TIMESTAMP
);

CREATE TABLE cleaned_olist_order_items (
  order_id STRING,
  order_item_id INTEGER,
  product_id STRING,
  seller_id STRING,
  shipping_limit_date TIMESTAMP,
  price FLOAT,
  freight_value FLOAT,
  PRIMARY KEY (order_id, order_item_id),
  FOREIGN KEY (order_id) REFERENCES cleaned_olist_orders(order_id),
  FOREIGN KEY (product_id) REFERENCES cleaned_olist_products(product_id),
  FOREIGN KEY (seller_id) REFERENCES cleaned_olist_sellers(seller_id)
);

CREATE TABLE cleaned_olist_products (
  product_id STRING PRIMARY KEY,
  product_category_name STRING,
  product_weight_g FLOAT,
  product_length_cm FLOAT,
  product_height_cm FLOAT,
  product_width_cm FLOAT
);

CREATE TABLE cleaned_olist_payments (
  order_id STRING,
  payment_sequential INTEGER,
  payment_type STRING,
  payment_installments INTEGER,
  payment_value FLOAT,
  PRIMARY KEY (order_id, payment_sequential),
  FOREIGN KEY (order_id) REFERENCES cleaned_olist_orders(order_id)
);

CREATE TABLE cleaned_olist_reviews (
  review_id STRING PRIMARY KEY,
  order_id STRING,
  review_score INTEGER,
  review_comment_title STRING,
  review_comment_message STRING,
  review_creation_date TIMESTAMP,
  review_answer_timestamp TIMESTAMP,
  FOREIGN KEY (order_id) REFERENCES cleaned_olist_orders(order_id)
);

CREATE TABLE cleaned_olist_customers (
  customer_id STRING PRIMARY KEY,
  customer_unique_id STRING,
  customer_zip_code_prefix STRING,
  customer_city STRING,
  customer_state STRING
);

CREATE TABLE cleaned_olist_sellers (
  seller_id STRING PRIMARY KEY,
  seller_zip_code_prefix STRING,
  seller_city STRING,
  seller_state STRING
);

CREATE TABLE cleaned_olist_geolocation (
  geolocation_zip_code_prefix STRING,
  geolocation_lat FLOAT,
  geolocation_lng FLOAT,
  geolocation_city STRING,
  geolocation_state STRING
);

-- link order items to orders
ALTER TABLE cleaned_olist_order_items
ADD CONSTRAINT fk_order_items_orders
FOREIGN KEY (order_id) REFERENCES cleaned_olist_orders(order_id);

-- link order items to products
ALTER TABLE cleaned_olist_order_items
ADD CONSTRAINT fk_order_items_products
FOREIGN KEY (product_id) REFERENCES cleaned_olist_products(product_id);

-- link order items to sellers
ALTER TABLE cleaned_olist_order_items
ADD CONSTRAINT fk_order_items_sellers
FOREIGN KEY (seller_id) REFERENCES cleaned_olist_sellers(seller_id);

-- link payments to orders
ALTER TABLE cleaned_olist_payments
ADD CONSTRAINT fk_payments_orders
FOREIGN KEY (order_id) REFERENCES cleaned_olist_orders(order_id);

-- link reviews to orders
ALTER TABLE cleaned_olist_reviews
ADD CONSTRAINT fk_reviews_orders
FOREIGN KEY (order_id) REFERENCES cleaned_olist_orders(order_id);

SHOW IMPORTED KEYS IN SCHEMA OLIST_PROJECT.PUBLIC;

