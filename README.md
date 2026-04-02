# 💳 Fintech Payment Transaction Analysis (SQL EDA)

## 📌 Project Overview
This project performs a comprehensive **Exploratory Data Analysis (EDA)** on a fintech dataset consisting of 200+ payment transactions. Using advanced SQL techniques, I transformed raw transaction logs into actionable business insights, focusing on system reliability, revenue leakage, and user behavior.

## ❓ Problem Statement
In the digital payments industry, transaction failures represent a double loss: **immediate revenue** and **customer trust**. The objective of this project was to diagnose why transactions fail and identify which segments (payment methods, time slots, or transaction sizes) are the most vulnerable.

## 🚀 Technical Stack & Optimization
* **Database:** MySQL
* **Data Ingestion:** Optimized for performance by using the **MySQL Command Line Interface (CLI)** for bulk loading, ensuring faster processing compared to standard GUI import wizards.
* **SQL Features Used:** * **Window Functions:** For calculating Running Totals and Cumulative Growth.
    * **Conditional Aggregations (CASE):** For bucketing transaction amounts and calculating Success/Failure ratios.
    * **Date/Time Functions:** For temporal pattern analysis.

---

## 📊 Key Analytical Queries & Insights

### 1. Overall System Health
* **Goal:** Establish a baseline for success vs. failure.
* **Insight:** The system maintains an **81% success rate**. This serves as the benchmark for evaluating individual payment methods.

### 2. Payment Method Efficiency (KPI)
* **Goal:** Calculate `Success %` and `Failure Rate %` per payment mode.
* **Insight:** **NetBanking** is a major bottleneck with a **26.4% failure rate**, while **Cards** are the most reliable at **11.3%**.

### 3. Revenue Trajectory (Running Total)
* **Goal:** Use `SUM(amount) OVER (ORDER BY timestamp)` to track cumulative successful revenue.
* **Insight:** Visualizes daily liquidity and helps identify which specific days contributed to the largest growth spikes.

### 4. High-Value Transaction Risk
* **Goal:** Categorize transactions into Low, Medium, and High tiers.
* **Insight:** High-value transactions (>3000) fail **10% more often** than low-value ones, indicating potential strictness in fraud filters or bank-side limits.

### 5. Temporal Failure Patterns
* **Goal:** Aggregate failures by the `HOUR` of the day.
* **Insight:** Significant failure spikes occurred between **3 AM and 5 AM**, likely coinciding with automated bank maintenance or batch processing windows.

---

## 💡 Why I Did This
**I built this project to demonstrate the transition from data support to Data Analytics. By applying business logic (KPIs like Success %) to raw logs, I've shown how SQL can be used to drive technical and financial decision-making in a fintech environment.
