# B2B Commercial Cards Sales & Pipeline Performance Analytics

## Project Overview
This project analyzes B2B commercial card sales data to evaluate overall sales performance, pipeline health, industry-wise conversion trends, and marketing ROI.  
The dashboard is designed for **executive leadership, sales managers, and strategy teams** to support data-driven decision-making across the full sales lifecycle.

The project combines **SQL-based data transformation and analysis** with an **interactive Power BI dashboard** to deliver clear, actionable business insights.

---

## Business Questions Answered
- How is overall B2B sales performance performing at an executive level?
- Where are deals currently concentrated within the sales pipeline?
- Which industries generate the highest revenue and which convert most efficiently?
- Which sales and marketing channels deliver the strongest ROI?
- Where should leadership focus to improve revenue predictability and efficiency?

---

## Dashboard Structure
The Power BI dashboard is structured into four purpose-driven pages:

### 1. Executive Overview
- High-level KPIs including total accounts, win rate, and account status distribution
- Snapshot of overall business health
- Designed for quick executive consumption

### 2. Sales Funnel & Pipeline Health
- Distribution of accounts across pipeline stages
- Expected revenue concentration by stage
- Insights into pipeline maturity and future revenue visibility

### 3. Industry & Sales Channel Performance
- Comparison of industries by total revenue
- Identification of high-conversion industries
- Revenue vs conversion efficiency trade-offs to support strategic prioritization

### 4. Marketing ROI & Channel Effectiveness
- Revenue efficiency by sales and marketing channels
- Comparison of revenue scale versus conversion quality
- Insights to support budget allocation and channel optimization

---

## Key Insights
- Overall sales performance is strong with a high win rate and most accounts successfully closed.
- Pipeline value is concentrated in late stages, improving short-term revenue predictability while highlighting the need to strengthen early-stage lead generation.
- High-revenue industries do not always show the highest conversion efficiency, indicating opportunities for focused optimization.
- Email and content marketing channels deliver the highest revenue efficiency per ₹ spent, while sales-led channels drive higher lead volume.

---

## Tools & Technologies Used
- **SQL (MySQL)** – Data cleaning, transformations, aggregations, and KPI calculations performed within a single structured SQL script  
- **Power BI** – Data modeling, DAX measures, and interactive dashboard development  
- **Excel** – Initial data inspection and preprocessing  

---

## Data Modeling & Analytical Approach
- Inspected and cleaned raw datasets using Excel and SQL
- Performed all data transformations, aggregations, and KPI calculations using a **single, well-structured SQL script**
- Created summary-level analytical tables to support efficient reporting
- Loaded transformed data into Power BI for modeling and visualization
- Ensured consistent KPI definitions across all dashboard pages
- Designed the dashboard using executive-level UI and storytelling principles

---

## Repository Structure
```text
├── data/
│   ├── raw_data.csv
│   └── b2b_accounts_pipeline.csv
│   └── b2b_accounts_pipeline.xlsx
├── sql/
│   └── b2b_commercial_cards_analysis.sql
├── powerbi/
│   └── B2B_sales_executive_dashboard.pbix
│   └── B2B_sales_executive_dashboard.pdf
└── README.md
