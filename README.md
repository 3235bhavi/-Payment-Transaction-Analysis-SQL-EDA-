##💳 Fintech Payment Transaction Analysis (SQL EDA)

##📌 Project Overview

This project performs a deep-dive Exploratory Data Analysis (EDA) on a dataset of payment transactions. The goal was to identify system bottlenecks, analyze user spending behavior, and calculate key performance indicators (KPIs) to improve transaction success rates.

##❓ Problem Statement

In the fintech industry, transaction failures lead to direct revenue loss and customer churn. The business needed to answer:

-Which payment methods are underperforming?
-Are high-value transactions more prone to failure?
-How does our revenue grow cumulatively over time?
-Which users are experiencing a "broken" payment journey?

##🚀 Technical Highlights

-Tool: MySQL / MySQL Workbench.
-Data Loading: Optimized for speed using MySQL Command Line Interface (CLI) for efficient bulk data ingestion.
-SQL Concepts Used: * Window Functions: For calculating Running Totals and Cumulative Growth.
-CASE Statements: To categorize transaction amounts and calculate Success/Failure ratios.
-Aggregations: SUM, COUNT, ROUND, and GROUP BY for data summarization.

##🔍 Key Insights & Findings

-Reliability Gap: While Wallets have the highest transaction share (32%), NetBanking shows a critical failure rate of 26.4%, indicating a need for API optimization.
-High-Value Risk: Transactions labeled as "High" (>3000) have a 24.7% failure rate, which is nearly double that of low-value transactions.
-System Stress: Identified peak failure windows between 3 AM - 5 AM, suggesting potential conflicts with background batch processes or maintenance.
-Revenue Recovery: Calculated a cumulative running total of successful payments to visualize daily liquidity and growth trends.

##💡 Why I Did This

I built this project to demonstrate the transition from data support to Data Analytics. By applying business logic (KPIs like Success %) to raw logs, I've shown how SQL can be used to drive technical and financial decision-making in a fintech environment.
