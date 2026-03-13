# 🍕 Pizza Sales Analysis (SQL + Power BI)

## 📊 Project Overview

This project analyzes pizza sales data using **SQL for data analysis** and **Power BI for data visualization**. The goal is to uncover key business insights such as sales trends, customer ordering patterns, and product performance.

The project demonstrates practical **data analytics skills including SQL querying, data modeling, and dashboard development**.

---

## 📈 Dashboard Preview

![Pizza Sales Dashboard](pizza_sales_dashboard.png)

---
## 🧠 SQL Analysis

SQL was used to perform exploratory data analysis and extract business insights from the pizza sales dataset.
The analysis was structured into **three levels: Basic, Intermediate, and Advanced analysis**, demonstrating the use of joins, aggregations, window functions, and common table expressions (CTEs).

---

### Basic Analysis

Initial queries focused on understanding the overall sales performance and identifying key metrics.

• Calculated the **total number of orders placed**
• Computed the **total revenue generated from pizza sales**
• Identified the **highest priced pizza** available on the menu
• Determined the **most frequently ordered pizza size**
• Retrieved the **top 5 most ordered pizza types based on quantity**

These queries primarily used **joins and aggregate functions such as `COUNT()`, `SUM()`, and `GROUP BY`**.

---

### Intermediate Analysis

The intermediate analysis explored customer ordering patterns and product distribution.

• Calculated the **total quantity of pizzas ordered by category**
• Analyzed the **distribution of orders across different hours of the day**
• Examined the **number of pizzas available within each category**
• Calculated the **average number of pizzas ordered per day**
• Identified the **top 3 pizzas generating the highest revenue**

This stage involved **multi-table joins, aggregations, and subqueries** to derive deeper insights.

---

### Advanced Analysis

Advanced SQL techniques were applied to perform deeper revenue analysis and ranking.

• Calculated the **percentage contribution of each pizza type to total revenue**
• Analyzed **cumulative revenue growth over time using window functions**
• Determined the **top 3 pizzas by revenue within each pizza category** using **CTE and ranking functions**

These queries demonstrate the use of advanced SQL concepts such as:

* `WINDOW FUNCTIONS`
* `OVER()` clause
* `RANK()`
* `COMMON TABLE EXPRESSIONS (CTE)`

---

### SQL File

All queries used in this analysis can be found in the following file:

```id="sqlfile01"
pizza_sales_analysis.sql
```






```

---

## 📊 Power BI Dashboard

The Power BI dashboard visualizes insights obtained from SQL analysis.

Dashboard includes:

* KPI cards for total sales and orders
* Monthly order trends
* Peak ordering hours
* Orders by day of week
* Top 5 best selling pizzas
* Revenue distribution by pizza category
* Orders by pizza size
* Interactive slicers for category and size

---

## 🔍 Key Insights

* Classic pizzas generate the **highest revenue**
* **Large size pizzas** are the most frequently ordered
* Peak orders occur between **12 PM – 6 PM**
* **Friday and Saturday** have the highest number of orders

---

## 🛠 Tools & Technologies

* **SQL Server** – Data analysis
* **Power BI** – Data visualization
* **DAX** – KPI calculations
* **Data Modeling** – Table relationships

---

## 📁 Repository Structure

```
pizza-sales-analysis-sql-powerbi
│
├── data
│   ├── orders.csv
│   ├── order_details.csv
│   ├── pizzas.csv
│   └── pizza_types.csv
│
├── pizza_sales_analysis.sql
├── pizza_sales_dashboard.pbix
├── pizza_sales_dashboard.png
└── README.md
```

---

## 👩‍💻 Author

**Sakshi Grover**

Aspiring Data Analyst skilled in **SQL, Power BI, and Data Visualization**.

