-- highest number of products --

SELECT
    user_id,
    product_sum
FROM
(
    SELECT
        user_id,
        COUNT(product_id) AS product_sum,
        SUM(spend) AS total_spend
    FROM
        user_transactions
    GROUP BY
        user_id
) AS temp_tbl
WHERE
    total_spend >= 1000
ORDER BY
    product_sum DESC,
    total_spend DESC
LIMIT 3;
