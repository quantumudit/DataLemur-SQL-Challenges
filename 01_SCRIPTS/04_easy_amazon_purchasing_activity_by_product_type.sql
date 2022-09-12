-- purchasing activity by product type --

SELECT
    t1.order_date,
    t1.product_type,
    (
        SELECT
            SUM(quantity)
        FROM
            total_trans AS t2
        WHERE
            t2.order_date <= t1.order_date AND
            t2.product_type = t1.product_type
    ) AS cum_purchased
FROM
    total_trans AS t1;
