-- Running Total of Fraud Amount

SELECT
type,
step,
total_amount,
SUM(total_amount)
OVER(PARTITION BY type ORDER BY step) running_total
FROM
(
SELECT
type,
step,
SUM(amount) total_amount
FROM transactions
WHERE isFraud=1
GROUP BY type,step
)t;



-- Top Customers

WITH customer_summary AS
(
SELECT
nameOrig,
SUM(amount) total_amount
FROM transactions
GROUP BY nameOrig
),

ranked_customers AS
(
SELECT *,
DENSE_RANK() OVER(ORDER BY total_amount DESC) customer_rank
FROM customer_summary
)

SELECT *
FROM ranked_customers
WHERE customer_rank<=5;

