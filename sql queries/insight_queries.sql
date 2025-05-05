
-- Insight 1: Revenue from high review scores (4 or 5)
SELECT 
  ROUND(SUM(price + freight_value) * 100.0 / 
        (SELECT SUM(price + freight_value) FROM sales_summary_extended), 2) AS high_score_revenue_pct
FROM sales_summary_extended
WHERE review_score >= 4;

-- Insight 2: Share of credit card payments
SELECT 
  payment_type,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS payment_pct
FROM sales_summary_extended
GROUP BY payment_type;

-- Insight 3: Q4 Revenue Share (Oct-Dec)
SELECT 
  ROUND(SUM(price + freight_value) * 100.0 / 
        (SELECT SUM(price + freight_value) FROM sales_summary_extended), 2) AS q4_revenue_pct
FROM sales_summary_extended
WHERE EXTRACT(MONTH FROM order_purchase_timestamp) IN (10, 11, 12);

-- Insight 4: Revenue Share of Top 5 Product Categories
WITH category_revenue AS (
  SELECT 
    product_category_name,
    SUM(price + freight_value) AS total
  FROM sales_summary_extended
  GROUP BY product_category_name
),
top5 AS (
  SELECT * FROM category_revenue ORDER BY total DESC LIMIT 5
)
SELECT 
  ROUND(SUM(total) * 100.0 / 
        (SELECT SUM(price + freight_value) FROM sales_summary_extended), 2) AS top5_revenue_pct
FROM top5;

-- Insight 5: Freight as % of Total Order Value
SELECT 
  ROUND(SUM(freight_value) * 100.0 / SUM(price + freight_value), 2) AS freight_pct
FROM sales_summary_extended;
