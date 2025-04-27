CREATE OR REPLACE VIEW sales_summary AS
SELECT
    o.order_id,
    o.customer_id,
    o.order_status,
    DATE_TRUNC('DAY', o.order_purchase_timestamp) AS order_purchase_date,
    p.payment_type,
    p.payment_value,
    i.price,
    i.freight_value,
    i.product_id,
    i.seller_id,
    r.review_score
FROM
    cleaned_olist_orders o
LEFT JOIN cleaned_olist_order_items i
    ON o.order_id = i.order_id
LEFT JOIN cleaned_olist_payments p
    ON o.order_id = p.order_id
LEFT JOIN cleaned_olist_reviews r
    ON o.order_id = r.order_id;