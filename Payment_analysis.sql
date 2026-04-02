use payment_analysis;
-- 1.Overall Transaction Health
SELECT 
    COUNT(*) AS total_txns,
    SUM(CASE WHEN status='SUCCESS' THEN 1 ELSE 0 END) AS success_count,
    SUM(CASE WHEN status='FAILED' THEN 1 ELSE 0 END) AS failure_count
FROM transactions;

-- 2.Failure Rate %

SELECT 
    ROUND(
        SUM(CASE WHEN status='FAILED' THEN 1 ELSE 0 END)*100.0 / COUNT(*), 
        2
    ) AS failure_rate
FROM transactions;

-- 3.Payment Method Performance

SELECT 
    payment_method,
    COUNT(*) AS total_txns,
    SUM(CASE WHEN status='FAILED' THEN 1 ELSE 0 END) AS failed_txns,
    ROUND(
        SUM(CASE WHEN status='FAILED' THEN 1 ELSE 0 END)*100.0 / COUNT(*), 
        2
    ) AS failure_rate
FROM transactions
GROUP BY payment_method
ORDER BY failure_rate DESC;

-- 4.Transaction Amount vs Failure 
SELECT 
    CASE 
        WHEN amount < 1000 THEN 'Low'
        WHEN amount BETWEEN 1000 AND 3000 THEN 'Medium'
        ELSE 'High'
    END AS amount_category,
    COUNT(*) AS total_txns,
    SUM(CASE WHEN status='FAILED' THEN 1 ELSE 0 END) AS failed_txns
FROM transactions
GROUP BY amount_category;

-- 5.Time-Based Failure Pattern

SELECT 
    HOUR(timestamp) AS hour_of_day,
    COUNT(*) AS total_txns,
    SUM(CASE WHEN status='FAILED' THEN 1 ELSE 0 END) AS failed_txns
FROM transactions
GROUP BY hour_of_day
ORDER BY failed_txns DESC;

-- 6.User-Level Failure Behavior 

SELECT 
    user_id,
    COUNT(*) AS total_txns,
    SUM(CASE WHEN status='FAILED' THEN 1 ELSE 0 END) AS failed_txns
FROM transactions
GROUP BY user_id
HAVING failed_txns > 0
ORDER BY failed_txns DESC
LIMIT 5;

-- 7.High-Value Failed Transactions

SELECT *
FROM transactions
WHERE status='FAILED'
ORDER BY amount DESC
limit 10;



-- 8.Payment Method Share

SELECT 
    payment_method,
    COUNT(*) AS total_txns,
    ROUND(COUNT(*)*100.0 / (SELECT COUNT(*) FROM transactions), 2) AS percentage_share
FROM transactions
GROUP BY payment_method;

-- 9.Trend Analysis

SELECT timestamp, amount, 
SUM(amount) OVER (ORDER BY timestamp) as running_total
FROM transactions 
WHERE status = 'SUCCESS'
limit 15;

-- 10.Payment Success Rate % 

SELECT payment_method, 
       ROUND(100.0 * SUM(CASE WHEN status = 'SUCCESS' THEN 1 ELSE 0 END) / COUNT(*), 2) AS success_rate_pct
FROM transactions
GROUP BY 1;