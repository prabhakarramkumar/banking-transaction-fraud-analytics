-- Fraud by Transaction Type

SELECT
type,
COUNT(*) AS fraud_count
FROM transactions
WHERE isFraud=1
GROUP BY type;

-- Average Fraud Amount

SELECT ROUND(AVG(amount),2)
FROM transactions
WHERE isFraud=1;

-- Fraud Rate by Transaction Type

SELECT
type,
COUNT(*) AS total_transactions,
SUM(isFraud) AS fraud_transactions,
ROUND(SUM(isFraud)*100/COUNT(*),3) AS fraud_rate
FROM transactions
GROUP BY type
ORDER BY fraud_rate DESC;

-- Top Fraud Transactions

WITH ranked_transactions AS
(
SELECT *,
DENSE_RANK() OVER(ORDER BY amount DESC) amount_rank
FROM transactions
)

SELECT *
FROM ranked_transactions
WHERE amount_rank<=10;

