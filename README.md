# ElevateLabsTask--6--Sales-Trend-Analysis-Using-Aggregations
Analyze monthly revenue and order volume.

# Sales Trend Analysis Using Aggregations

## Objective
- Analyze monthly revenue and order volume using SQL queries
- Identify time-based trends, product performance, and category contributions

## Dataset Description
**Dataset:** `sales_data` table

**Key Columns:**
- `Date` - Transaction date
- `Total_Revenue` - Revenue generated
- `Transaction_ID` - Unique order identifier  
- `Product_Name` - Product sold
- `Product_Category` - Product category

## Tools Used
- **DBMS:** PostgreSQL/MySQL/SQLite
- **Language:** SQL

## Methodology

### Key Queries
1. Monthly revenue/order volume by month/year
2. Top 3 months by sales revenue  
3. Revenue/orders by product category
4. January 2024 performance analysis
5. Product ranking by revenue/volume
6. Product revenue trends over time
7. Top products by category

### Aggregation Techniques
| Function | Purpose |
|----------|---------|
| `SUM()` | Total revenue |
| `COUNT(DISTINCT)` | Unique transactions |
| `EXTRACT()` | Time period extraction |
| `GROUP BY` | Data aggregation |
| `ORDER BY` | Results sorting |

## Insights

### Key Findings
▶ **Seasonal Patterns:** Peak sales during holiday months  
▶ **Category Trends:** Electronics dominate revenue  
▶ **Product Performance:** Premium products drive revenue, mid-tier drive volume  
▶ **Time Trends:** Clear seasonal spikes aligned with events  

### Recommendations
✅ Focus marketing on peak months  
✅ Expand top-performing categories  
✅ Optimize promotions using seasonal data  

## Execution Guide
1. Open SQL environment
2. Import `sales_data` table
3. Run provided SQL script (7 queries)
4. Analyze results
