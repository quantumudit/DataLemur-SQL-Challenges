-- fill missing product --

WITH grouped_products AS
(
    SELECT
        product_id,
        category,
        name,
        COUNT(category) OVER (ORDER BY product_id) AS category_group
    FROM products
)

SELECT
    product_id,
    CASE
        WHEN category IS NULL THEN FIRST_VALUE(category) OVER (PARTITION BY category_group)
        ELSE category
    END AS category,
    name
FROM
    grouped_products
