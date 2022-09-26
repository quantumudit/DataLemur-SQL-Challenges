-- year on year growth rate --

WITH user_spending AS
(
    SELECT
        DATE_PART('year', transaction_date) AS year,
        product_id,
        spend AS curr_year_spend,
        LAG(spend) OVER(PARTITION BY product_id ORDER BY transaction_date ASC) AS prev_year_spend
    FROM 
        user_transactions
)

SELECT
    year,
    product_id,
    curr_year_spend,
    prev_year_spend,
    CASE
        WHEN prev_year_spend IS NULL THEN NULL
        ELSE 
        ROUND(
            ((curr_year_spend / prev_year_spend)-1) * 100,
            2
        )
    END AS yoy_rate
FROM
    user_spending;
