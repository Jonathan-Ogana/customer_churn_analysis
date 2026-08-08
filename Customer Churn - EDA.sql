-- Exploratory Data Analysis (EDA) for Customer Churn Dataset

-- Dataset overview

SELECT
    ORDINAL_POSITION,
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'WA_Fn-UseC_-Telco-Customer-Churn'
ORDER BY ORDINAL_POSITION;

-- Number of rows and columns

-- Number of rows

SELECT COUNT(*) AS Number_of_Rows
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn];

-- Number of columns

SELECT COUNT(*) AS Number_of_Columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'WA_Fn-UseC_-Telco-Customer-Churn';

-- Missing value assessment

SELECT
    COUNT(*) - COUNT(customerID) AS Missing_CustomerID,
    COUNT(*) - COUNT(gender) AS Missing_Gender,
    COUNT(*) - COUNT(SeniorCitizen) AS Missing_SeniorCitizen,
    COUNT(*) - COUNT(Partner) AS Missing_Partner,
    COUNT(*) - COUNT(Dependents) AS Missing_Dependents,
    COUNT(*) - COUNT(tenure) AS Missing_Tenure,
    COUNT(*) - COUNT(PhoneService) AS Missing_PhoneService,
    COUNT(*) - COUNT(MultipleLines) AS Missing_MultipleLines,
    COUNT(*) - COUNT(InternetService) AS Missing_InternetService,
    COUNT(*) - COUNT(OnlineSecurity) AS Missing_OnlineSecurity,
    COUNT(*) - COUNT(OnlineBackup) AS Missing_OnlineBackup,
    COUNT(*) - COUNT(DeviceProtection) AS Missing_DeviceProtection,
    COUNT(*) - COUNT(TechSupport) AS Missing_TechSupport,
    COUNT(*) - COUNT(StreamingTV) AS Missing_StreamingTV,
    COUNT(*) - COUNT(StreamingMovies) AS Missing_StreamingMovies,
    COUNT(*) - COUNT(Contract) AS Missing_Contract,
    COUNT(*) - COUNT(PaperlessBilling) AS Missing_PaperlessBilling,
    COUNT(*) - COUNT(PaymentMethod) AS Missing_PaymentMethod,
    COUNT(*) - COUNT(MonthlyCharges) AS Missing_MonthlyCharges,
    COUNT(*) - COUNT(TotalCharges) AS Missing_TotalCharges,
    COUNT(*) - COUNT(Churn) AS Missing_Churn
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn];

-- Summary Statistics

SELECT
    MIN(tenure) AS Min_Tenure,
    MAX(tenure) AS Max_Tenure,
    CAST(ROUND(AVG(tenure), 2) AS FLOAT) AS Avg_Tenure,
    CAST(ROUND(MIN(MonthlyCharges), 2) AS FLOAT) AS Min_Monthly_Charges,
    CAST(ROUND(MAX(MonthlyCharges), 2) AS FLOAT) AS Max_Monthly_Charges,
    CAST(ROUND(AVG(MonthlyCharges), 2) AS FLOAT) AS Avg_Monthly_Charges,
    CAST(ROUND(MIN(TotalCharges), 2) AS FLOAT) AS Min_Total_Charges,
    CAST(ROUND(MAX(TotalCharges), 2) AS FLOAT) AS Max_Total_Charges,
    CAST(ROUND(AVG(TotalCharges), 2) AS FLOAT) AS Avg_Total_Charges
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn];


-- Distribution of important variables

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

-- Identification of trends and patterns

SELECT
    CASE
        WHEN tenure <= 12 THEN '0-12 Months'
        WHEN tenure <= 24 THEN '13-24 Months'
        WHEN tenure <= 36 THEN '25-36 Months'
        WHEN tenure <= 48 THEN '37-48 Months'
        WHEN tenure <= 60 THEN '49-60 Months'
        ELSE '61+ Months'
    END AS Tenure_Group,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    CAST(ROUND(
            100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END)
            / COUNT(*), 2
        ) AS FLOAT
    ) AS Churn_Rate
FROM dbo.[WA_Fn-UseC_-Telco-Customer-Churn]
GROUP BY
    CASE
        WHEN tenure <= 12 THEN '0-12 Months'
        WHEN tenure <= 24 THEN '13-24 Months'
        WHEN tenure <= 36 THEN '25-36 Months'
        WHEN tenure <= 48 THEN '37-48 Months'
        WHEN tenure <= 60 THEN '49-60 Months'
        ELSE '61+ Months'
    END
ORDER BY
    MIN(tenure);