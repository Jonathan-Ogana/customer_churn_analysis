-- Why are customers leaving the company?

-- Overall Churn Rate

SELECT 
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Total_Churned_Customers,
    CAST(ROUND(
        100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*), 2
    ) AS FLOAT) AS Overall_Churn_Rate
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn];

-- Hypothesis One: Charges and Customer Tenure

SELECT
    Churn,
    CAST(ROUND(AVG(MonthlyCharges), 2) AS FLOAT) AS Avg_Monthly_Charges,
    CAST(ROUND(AVG(tenure), 2) AS FLOAT) AS Avg_Tenure
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn]
GROUP BY Churn;

-- Hypothesis Two: Why are churned customers paying $74.44 while retained customers are paying $61.27?

-- Internet Service and Monthly Charges

SELECT
    Churn,
    InternetService,
    CAST(ROUND(AVG(MonthlyCharges), 2) AS FLOAT) AS Avg_Monthly_Charges,
    CAST(ROUND(AVG(tenure), 2) AS FLOAT) AS Avg_Tenure,
    COUNT(*) AS Customers
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn]
GROUP BY
    Churn,
    InternetService
ORDER BY
    Churn,
    Avg_Monthly_Charges DESC;

-- Hypothesis Three: Fiber Optic Customers

-- Churn Rate by Contract Type

SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    CAST(ROUND(
        100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS FLOAT) AS Churn_Rate
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn]
WHERE InternetService = 'Fiber optic'
GROUP BY Contract
ORDER BY Churn_Rate DESC;

-- Hypothesis Four: Is lack of support contributing to churn among high-risk customers?

SELECT
    TechSupport,
    OnlineSecurity,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    CAST(
        ROUND(
            100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END)
            / COUNT(*), 2
        ) AS FLOAT
    ) AS Churn_Rate
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn]
WHERE InternetService = 'Fiber optic'
  AND Contract = 'Month-to-month'
GROUP BY
    TechSupport,
    OnlineSecurity
ORDER BY Churn_Rate DESC;

-- Hypothesis Five: Payment Method Among the Highest-Risk Group

SELECT
    PaymentMethod,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    CAST(
        ROUND(
            100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END)
            / COUNT(*), 2
        ) AS FLOAT
    ) AS Churn_Rate
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn]
WHERE InternetService = 'Fiber optic'
  AND Contract = 'Month-to-month'
  AND TechSupport = 0
  AND OnlineSecurity = 0
GROUP BY PaymentMethod
ORDER BY Churn_Rate DESC;