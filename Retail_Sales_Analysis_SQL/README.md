# 📊 End-to-End Retail Sales & Profitability Analysis (SQL & Power BI)

![Database](https://img.shields.io/badge/Database-MySQL%2FPostgreSQL-blue)
![Language](https://img.shields.io/badge/Language-SQL-orange)
![Tool](https://img.shields.io/badge/Visualization-Power_BI-yellow)
![Status](https://img.shields.io/badge/Status-Completed-success)

An end-to-end exploratory data analysis and business performance audit of the North American Superstore dataset using **SQL** and **Power BI**. This project evaluates key business metrics—revenue generation, profit margins, discounting impact, logistics behavior, and category performance—to identify actionable strategies for margin optimization.

---

## 📁 Repository Structure

```text
retail_sales/
├── 📄 README.md                        # Project documentation & repository guide
├── 📄 business_insights.md             # Executive summary & strategic recommendations
├── 📁 dataset/
│   └── 📄 SampleSuperstore_Cleaned.csv # Cleaned dataset (9,977 unique records)
├── 📁 sql_queries/
│   ├── 📄 01_data_cleaning.sql        # Schema adjustments, NULL audits & deduplication
│   ├── 📄 02_sales_analysis.sql       # Total revenue trends & regional performance
│   ├── 📄 03_profit_analysis.sql      # Profit margins & loss-making analysis
│   ├── 📄 04_product_analysis.sql     # Sub-category volume & margin degradation
│   ├── 📄 05_discount_analysis.sql    # Discount tier impact & margin thresholds
│   ├── 📄 06_shipping_analysis.sql    # Ship mode volume & order counts
│   └── 📄 07_advanced_sql.sql        # CTEs, Window Functions (RANK, DENSE_RANK, SUM OVER)
└── 📁 power_bi/
    └── 📄 superstore_dashboard.pbix   # Interactive Power BI dashboard report
🗄️ Dataset Overview & Schema
Located in dataset/SampleSuperstore_Cleaned.csv, the dataset contains retail transaction records covering orders across North America with 13 key attributes:

Categorical / Geographic: Ship Mode, Segment, Country, City, State, Postal Code, Region, Category, Sub-Category

Numerical Metrics: Sales, Quantity, Discount, Profit

🧼 Data Cleaning & Preprocessing Highlights
Executed in sql_queries/01_data_cleaning.sql:

Schema Correction: Converted Postal Code from Integer to VARCHAR(10) text format to prevent numeric misclassification of geographic attributes.

Deduplication Audit: Identified and removed 17 exact duplicate records from the raw dataset, bringing the total record count from 9,994 to 9,977 clean rows.

Data Integrity Checks: Verified 0 missing/NULL values across all 13 columns and confirmed no negative values in Sales or Quantity.

💡 Key Business Insights Summary
(For the complete breakdown, see business_insights.md)

1. The "Discount Trap" (Margin Degradation)
High Discounts Destroy Margins: Discounts exceeding 20% consistently force transactions into negative profitability across almost all product sub-categories.

0% Discount Superiority: Transactions with 0% discount generate the highest overall profit margin (~30%+), whereas transaction tiers with >50% discount incur steep losses.

Aggressive Discounting Sub-Categories: Tables, Bookcases, and Supplies receive some of the highest average discounts, directly causing them to operate at an overall net deficit.

2. Product Line Performance Matrix
Top Profit Drivers: Copiers, Phones, and Accessories yield the highest net profit margins and maintain consistent demand across all regions.

Primary Loss Leader: Tables is the worst-performing sub-category, incurring an overall net loss exceeding -$17,000, followed by Bookcases and Supplies.

High Revenue, Low Margin Anomaly: Chairs and Storage generate massive sales volume but yield disproportionately low net profits due to heavy shipping and discount overhead.

3. Geographic Performance
Top Revenue Markets: The West ($725K+) and East ($678K+) regions lead in revenue, contributing over 60% of total enterprise sales.

Regional Margin Disparities: The Central region exhibits lower net profit margins despite healthy transaction volume, primarily driven by higher average discount rates in key states (e.g., Texas, Illinois).

4. Shipping & Logistics Behavior
Standard Class Dominance: Over 60% of order volume utilizes Standard Class shipping, representing the primary driver of logistics costs.

Same Day Premium: While Same Day shipping accounts for the lowest volume, it maintains strong profit margins, indicating solid consumer adoption for premium delivery options.

🎯 Strategic Recommendations
Implement Discount Caps: Enforce a hard cap of 20% maximum discount for non-clearance inventory, requiring managerial sign-off for higher tiers.

Restructure Loss-Making Lines: Re-negotiate supplier costs or adjust pricing structures for Tables and Bookcases to eliminate net operational deficits.

Regional Promotional Audit: Re-evaluate promotional strategy in high-loss states (e.g., Texas, Illinois), shifting from flat discounts to bundled value offers.

Promote High-Margin SKUs: Reallocate marketing budget and catalog feature spots toward top margin contributors (Copiers, Phones, Accessories).

🛠️ How to Run the Project
SQL Scripts:

Import dataset/SampleSuperstore_Cleaned.csv into your database engine (MySQL, PostgreSQL, etc.) as a table named data.

Execute scripts sequentially from sql_queries/01_data_cleaning.sql through sql_queries/07_advanced_sql.sql.

Power BI Dashboard:

Open power_bi/superstore_dashboard.pbix in Power BI Desktop to explore the interactive visual analytics.
