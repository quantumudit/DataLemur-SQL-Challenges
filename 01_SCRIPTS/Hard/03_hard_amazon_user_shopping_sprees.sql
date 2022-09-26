-- user shopping sprees --

WITH shopping_spree_transactions AS
(
    SELECT
        user_id,
        transaction_date,
        CASE
        WHEN
            LEAD(transaction_date, 1) OVER (PARTITION BY user_id ORDER BY transaction_date ASC) = (transaction_date +  INTERVAL '1 day')
            AND
            LEAD(transaction_date, 2) OVER (PARTITION BY user_id ORDER BY transaction_date ASC) = (transaction_date +  INTERVAL '2 days')
        THEN
            1
        ELSE 0
        END AS shopping_spree_flag
    FROM
        transactions
)

SELECT DISTINCT
    user_id
FROM
    shopping_spree_transactions
WHERE
    shopping_spree_flag = 1
ORDER BY
    user_id ASC;
