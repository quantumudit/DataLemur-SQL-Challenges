-- first transactions --

WITH transaction_ranking AS
(
    SELECT
        user_id,
        spend,
        transaction_date,
        DENSE_RANK() OVER(PARTITION BY user_id ORDER BY transaction_date ASC) AS transaction_num
    FROM
        user_transactions
)

SELECT
    COUNT(DISTINCT user_id) AS users
FROM
    transaction_ranking
WHERE
    transaction_num = 1 AND spend >= 50;
