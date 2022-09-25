-- average review ratings --

SELECT
    DATE_PART('month', submit_date) AS mth,
    product_id AS product,
    ROUND(AVG(stars), 2) AS avg_stars
FROM
    reviews
GROUP BY
    DATE_PART('month', submit_date),
    product_id
ORDER BY
    mth ASC,
    product ASC;
