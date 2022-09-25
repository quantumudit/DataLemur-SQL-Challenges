-- histogram of users and purchases --

WITH latest_transactions AS
(
    SELECT
        transaction_date,
        user_id,
        product_id,
        DENSE_RANK() OVER (PARTITION BY user_id ORDER BY transaction_date DESC) AS latest_purchase
    FROM 
        user_transactions
)

SELECT
    transaction_date,
    COUNT(DISTINCT user_id) AS number_of_users,
    SUM(latest_purchase) AS number_of_products
FROM
    latest_transactions
WHERE
    latest_purchase = 1
GROUP BY
    transaction_date
ORDER BY
    transaction_date;
