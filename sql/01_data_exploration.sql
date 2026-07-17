
--Total Transactions

SELECT COUNT(*) AS total_transactions 
FROM transactions;

--Highest Transaction Amount

SELECT MAX(amount) AS highest_transaction_amount
FROM transactions;

--Average Customer Balance 

SELECT AVG(oldbalanceOrg) AS avg_customer_balance
FROM transactions;

--Top 10 Highest Transactions

SELECT *
FROM transactions
ORDER BY amount DESC
LIMIT 10;
