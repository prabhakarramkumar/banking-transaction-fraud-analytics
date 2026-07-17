-- Transaction Distribution

SELECT
type,
COUNT(*) AS transaction_count,
SUM(amount) AS total_amount
FROM transactions
GROUP BY type
ORDER BY total_amount DESC;

-- Average Amount by Transaction Type

SELECT
type,
AVG(amount) AS avg_amount
FROM transactions
GROUP BY type;

-- Transaction Share

SELECT
type,
COUNT(*)/(SELECT COUNT(*) FROM transactions)*100 AS transaction_share
FROM transactions
GROUP BY type;

-- High Value Transactions

SELECT *
FROM transactions
WHERE amount > 1615979.47;