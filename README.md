# 🛍️ Retail Orders Data Analysis  

## 📌 Project Overview  
This project focuses on analyzing **retail orders data** to extract meaningful business insights such as:  
- Top-performing products and regions  
- Month-over-month sales growth  
- Category-wise peak sales months  
- Sub-category profitability trends  

The workflow includes **data cleaning & preprocessing using Python**, followed by **SQL-based analysis** to generate insights.  

---

## ✅ Project Workflow  

1. **Data Cleaning & Preprocessing (Python)**  
   - Removed missing & duplicate records  
   - Standardized date formats & categorical values  
   - Ensured correct data types for SQL ingestion  
   - Exported cleaned dataset for further SQL analysis

2. Database & Table Creation (SQL)

   - Created df_orders table with appropriate data types (INT, VARCHAR, DATE, DECIMAL)

   - Loaded cleaned data into the SQL database

3. Business Analysis with SQL Queries

   - Identified Top 10 highest revenue-generating products

   - Found Top 5 highest-selling products per region using CTE + window functions

   - Performed month-over-month sales growth comparison for 2022 vs 2023

   - Determined which month had the highest sales for each category

   - Calculated highest sub-category profit growth in 2023 vs 2022
  


## Result

Highlighted the top-performing products and regions, enabling targeted marketing strategies

Revealed seasonal sales patterns, showing which months drive maximum revenue

Identified fast-growing sub-categories, guiding product portfolio decisions

Delivered a set of reusable SQL scripts for ongoing business performance tracking

