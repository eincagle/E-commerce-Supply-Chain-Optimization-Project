# E-commerce Sales Analytics Dashboard

This project is an end-to-end business intelligence solution analyzing Brazilian e-commerce sales using Snowflake, Python (Pandas), SQL, and Power BI.

## Tools Used

- **Python & Pandas**: Data cleaning, inspection, and transformation
- **Snowflake**: Cloud data warehousing & SQL querying
- **Power BI**: Interactive dashboard design
- **SQL**: Used for joins, summarization, and view creation

## Dashboard Features

- Total revenue, orders, customers, and review score KPIs
- Monthly and yearly sales trends
- Payment method breakdown
- Customer feedback distribution (review scores)

![Dashboard Preview](images/dashboard_preview.jpg)

## Project Structure

| Folder              | Description                                          |
| ------------------- | ---------------------------------------------------- |
| `Original Data/`    | Original datasets (CSV format)                       |
| `Cleaned Data/`     | Cleaned datasets (CSV format)                        |
| `SQL Queries/`      | All SQL scripts for Snowflake (view creation, joins) |
| `Jupyter Notebook/` | Jupyter Notebook for preprocessing with Python       |
| `Power BI/`         | `.pbix` file with final Power BI dashboard           |
| `Images/`           | Screenshots and visuals                              |

## How to Use

1. Clone the repo
2. Load cleaned CSVs into Snowflake or your SQL tool of choice
3. Run queries in `/sql` folder
4. Open Power BI and load the `.pbix` file

## Sample SQL Queries

See `sample_queries.sql` for insights like:

- Revenue by product
- Orders by review score
- Revenue by year/month

---

## Key Data Insights

- **Customer Satisfaction Drives Revenue**  
  Orders with review scores of 4 or 5 stars account for **74.73%** of total revenue.  
  _This highlights a strong correlation between customer satisfaction and spending behavior._

- **Credit Card is the Preferred Payment Method**  
  **73.67%** of all transactions were made using credit cards.  
  _Suggests that credit card payment reliability is critical to customer conversion._

- **Seasonal Sales Spike in Q4**  
  **18.01%** of annual revenue occurs during October–December (Q4).  
  _Reflects a year-end seasonal boost, likely due to holidays and promotions._

- **Top 5 Product Categories Generate Nearly 40% of Revenue**  
  The top 5 product categories contribute **38.98%** of total revenue.  
  _Emphasizes the importance of inventory and promotional focus on a few core categories._

- **Freight Costs Represent a Significant Portion of Order Value**  
  Freight charges make up **14.24%** of the total order value.  
  _Monitoring logistics costs is essential for maintaining profitability._

## Author

Created by Ein Cagle — Data Analyst & BI Developer  
Visit: [Portfolio](https://www.datascienceportfol.io/eincagle)
