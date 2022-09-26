-- monthly merchant balance --

WITH signed_transactions AS
(
    SELECT
        DATE(transaction_date) AS transaction_date,
        CASE
        WHEN type = 'deposit' THEN amount
        ELSE -amount
        END AS amount
    FROM
        transactions
),

daily_balance_details AS
(
    SELECT
        transaction_date AS transaction_day,
        DATE_PART('month', transaction_date) AS month,
        SUM(amount) AS daily_balance
    FROM
        signed_transactions
    GROUP BY
        transaction_date,
        DATE_PART('month', transaction_date)
)

SELECT
    transaction_day,
    SUM(daily_balance) OVER (PARTITION BY month ORDER BY transaction_day ASC) AS balance
FROM 
    daily_balance_details
ORDER BY
    transaction_day ASC;
