--Total Transaction Value

SELECT ROUND(SUM(amount),2) AS total_value
FROM transactions;

--Average Transaction Amount

SELECT AVG(amount) AS avg_transaction_amount
FROM transactions;

--Fraud Count

SELECT CASE WHEN isFraud = 0 THEN 'Not Fraud' 
			WHEN isFraud = 1 THEN 'Fraud' END AS fraud_transactions,
       COUNT(*) AS Count     
FROM transactions
GROUP BY 1;

--Overall Fraud Rate

SELECT ROUND(SUM(isFraud)*100/COUNT(*),4) AS fraud_rate
FROM transactions;
