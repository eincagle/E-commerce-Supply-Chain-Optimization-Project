-- preview sales_summary view
SELECT *
FROM sales_summary
LIMIT 10;

-- total revenue (sales + freight)
SELECT 
    SUM(price + freight_value) AS total_revenue
FROM sales_summary;

-- average review ccore by payment type
SELECT 
    payment_type,
    ROUND(AVG(review_score), 2) AS avg_review_score
FROM sales_summary
GROUP BY payment_type
ORDER BY avg_review_score DESC;

-- total orders by order status
SELECT 
    order_status,
    COUNT(DISTINCT order_id) AS total_orders
FROM sales_summary
GROUP BY order_status
ORDER BY total_orders DESC;

-- total freight value by seller
SELECT 
    seller_id,
    SUM(freight_value) AS total_freight_collected
FROM sales_summary
GROUP BY seller_id
ORDER BY total_freight_collected DESC
LIMIT 10;

-- revenue per product ID
SELECT 
    product_id,
    SUM(price) AS product_revenue
FROM sales_summary
GROUP BY product_id
ORDER BY product_revenue DESC
LIMIT 10;

-- monthly sales trend (based on purchase date)
SELECT 
    DATE_TRUNC('MONTH', order_purchase_date) AS month,
    SUM(price + freight_value) AS monthly_revenue
FROM sales_summary
GROUP BY month
ORDER BY month ASC;