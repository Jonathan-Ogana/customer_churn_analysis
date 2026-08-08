# Customer Churn Analysis

## Project Overview

This project analyses customer churn using SQL Server and Microsoft Power BI to understand customer attrition and identify patterns associated with customers leaving a telecommunications company.

The analysis focuses on answering a key business question:

> **Why are customers leaving?**

The project follows a practical data analytics workflow, covering data exploration, data analysis, KPI development, visualisation, and business insight generation.

---

## Business Problem

Customer churn can have a significant impact on business revenue and long-term growth.

The objective of this analysis is to:

- Measure the overall customer churn rate.
- Identify characteristics associated with customer churn.
- Compare churned and retained customers.
- Analyse churn across different customer and service segments.
- Identify areas where customer retention efforts could be prioritised.
- Present findings through an interactive Power BI dashboard.

---

## Dataset

The dataset contains **7,043 customer records** and includes information relating to:

- Customer demographics
- Tenure
- Contract type
- Internet service
- Technical support
- Monthly charges
- Total charges
- Customer churn status

The target variable is **Churn**, which indicates whether a customer has left the company.

---

## Key Metrics

| Metric | Result |
|---|---:|
| Total Customers | 7,043 |
| Churned Customers | 1,869 |
| Overall Churn Rate | 26.5% |

---

## Analytical Questions

The analysis investigates questions such as:

1. What proportion of customers have churned?
2. How does churn vary by customer tenure?
3. Does contract type have a relationship with churn?
4. How does internet service relate to customer churn?
5. Are customers with technical support less likely to churn?
6. How do monthly charges differ between churned and retained customers?
7. How do total charges differ between churned and retained customers?
8. Which customer segments show higher levels of churn?
9. What patterns can be identified that may support customer retention strategies?

---

## Data Analysis Process

### 1. Data Exploration

The dataset was initially explored to understand:

- Dataset structure
- Data types
- Customer characteristics
- Churn distribution
- Potential data-quality issues

### 2. Data Quality Checks

SQL Server was used to examine the dataset for potential issues and validate the data before analysis.

### 3. Exploratory and Diagnostic Analysis

SQL queries were developed to compare churned and retained customers across important customer and service characteristics.

The analysis included:

- Filtering
- Aggregation
- Grouping
- Conditional analysis using `CASE`
- Comparative analysis
- Customer segmentation

### 4. KPI Development

Key metrics were developed to communicate customer churn performance, including:

- Total Customers
- Churned Customers
- Churn Rate

### 5. Data Visualisation

Microsoft Power BI was used to create visualisations that communicate:

- Customer churn
- Churn rate
- Churn by customer characteristics
- Churn by service characteristics
- Customer charge patterns

### 6. Business Reporting

The findings were consolidated into a structured analytical report highlighting the major patterns identified in the data and their potential business implications.

---

## Key Findings

The analysis identified **1,869 churned customers out of 7,043**, resulting in an overall churn rate of approximately **26.5%**.

Churn was further investigated across:

- Tenure
- Contract type
- Internet service
- Technical support
- Monthly charges
- Total charges

One important analytical lesson from the project was the need to distinguish between **association and causation**.

For example, differences in total charges between churned and retained customers were observed. However, this difference alone does not establish that total charges caused customers to churn. Further investigation is required to understand the underlying relationships.

---

## Tools & Technologies

- **Microsoft SQL Server** — Data exploration, querying and analysis
- **SQL** — Data aggregation, segmentation and comparative analysis
- **Microsoft Power BI** — KPI development, visualisation and dashboard creation
- **Git & GitHub** — Version control and project documentation

---

## Skills Demonstrated

- Data Analysis
- SQL Querying
- Customer Churn Analysis
- Data Exploration
- Data Validation
- KPI Development
- Data Visualisation
- Dashboard Development
- Business Intelligence
- Diagnostic Analysis
- Analytical Reporting
- Insight Generation
- Data-Driven Decision Making

---
