-- third transaction by users --

WITH transactions_rank AS
(
    SELECT
        user_id,
        spend,
        transaction_date,
        DENSE_RANK() OVER (PARTITION BY user_id ORDER BY transaction_date ASC) AS ranking
    FROM
        transactions
)

SELECT
    user_id,
    spend,
    transaction_date
FROM
    transactions_rank
WHERE
    ranking = 3;
