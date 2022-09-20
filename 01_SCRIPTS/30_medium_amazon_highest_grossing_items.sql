-- highest grossing items --

WITH top_sales AS
(
    SELECT
        category,
        product,
        SUM(spend) AS total_spend
    FROM
        product_spend
    WHERE
        DATE_PART('year', transaction_date) = 2022
    GROUP BY
        category,
        product
),

top_sales_ranking AS
(
    SELECT
        category,
        product,
        total_spend,
        DENSE_RANK() OVER(PARTITION BY category ORDER BY total_spend DESC) AS product_rank
    FROM
        top_sales
)

SELECT
    category,
    product,
    total_spend
FROM
    top_sales_ranking
WHERE
    product_rank <= 2;
