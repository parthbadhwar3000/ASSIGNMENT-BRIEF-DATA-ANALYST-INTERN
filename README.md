# ASSIGNMENT-BRIEF-DATA-ANALYST-INTERN

# 📊 Data Analyst Assignment – Alt Mobility

## 👋 About the Project
This project is part of a Data Analyst Internship assignment for **Alt Mobility**, an electric vehicle (EV) leasing and asset management company. The goal is to analyze order, customer, and payment data using SQL and visualize customer retention to derive business insights.

---

## 📁 Datasets Used
- `customer_orders_cleaned.csv`: Cleaned version of customer orders.
- `payments_cleaned.csv`: Cleaned version of payment data.
- Original CSVs were cleaned using Python (see notebook below).

---

## 🧹 Data Cleaning (Python)
Raw data was cleaned and prepared using Python.  
**Cleaning steps included:**
- Removing nulls and duplicates
- Standardizing `order_status` and `payment_status`
- Converting date columns to datetime format
- Exporting cleaned CSVs for SQL analysis

📓 Notebook: `datacleaning.ipynb`

---

## ✅ Tasks Covered

### 1. Order and Sales Analysis
- Order status breakdown (completed, pending, cancelled)
- Yearly and monthly revenue trends
- Sales behavior within month (start/mid/end)
- Seasonal/festival sales patterns
- Average order value and revenue by order status

### 2. Customer Analysis
- Unique customers, repeat vs one-time buyers
- Customer segmentation (low/medium/high spenders)
- Top/least spenders and orderers
- Customer spending trends over months/years

### 3. Payment Status Analysis
- Success, pending, and failure rates
- Trends across months and years
- Payment amount by status
- Customers with repeated payment failures

### 4. Order Details Report
- Combined order & payment data
- Included key columns: order ID, customer ID, dates, status, amounts
- Key metrics: total orders, successful payments, revenue, avg order value

### 5. Customer Retention Analysis (Visualization)
- Focused on January 2024 customers
- Tracked repeat orders in each following month
- Visualized drop-off in Tableau

📷 Chart included: `visualization.pdf`

---

## 📂 Folder Structure
```
/data-analyst-alt-mobility/
├── data/
│   └── customer_orders_cleaned.csv
│   └── payments_cleaned.csv
│
├── notebooks/
│   └── datacleaning.ipynb
│
├── sql_queries/
│   └── order_sales_analysis.sql
│   └── customer_analysis.sql
│   └── payment_status_analysis.sql
│   └── order_details_report.sql
│
├── visualizations/
│
│   └── visualization.pdf
│
├── README.md
└── summary_of_findings.pdf
```

---

## 🧠 Key Insights

### 📌 Order & Sales
- High revenue during festive seasons
- Order volumes spike mid-month
- Steady sales growth from 2020 to 2025

### 📌 Customers
- ~60–70% repeat customers
- High-value customers drive majority revenue
- One-time customers dominate volume but not value

### 📌 Payments
- Generally high success rate
- Noticeable spike in failures during March 2023
- Few customers have multiple failures — may need attention

### 📌 Retention
- Drop from February to December for January 2024 cohort
- Suggests engagement drop-off after first purchase

---

## 💡 Recommendations for Alt Mobility
- Improve post-purchase engagement for new customers
- Offer loyalty rewards during low-retention periods
- Address recurring payment issues for certain users
- Target high-spending customers with VIP benefits

---

## 📎 Submission Contents
- ✅ SQL Queries (`/sql_queries`)
- ✅ Python Notebook for data cleaning (`/notebooks`)
- ✅ Cleaned Datasets (`/data`)
- ✅ Customer Retention Chart (`/visualizations`)
- ✅ Final Summary Report (`summary_of_findings.pdf`)
- ✅ This README (`README.md`)
