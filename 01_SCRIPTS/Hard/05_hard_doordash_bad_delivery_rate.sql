-- bad delivery rate --

WITH order_details AS
(
    SELECT
        o.order_id,
        o.status,
        o.order_timestamp,
        c.signup_timestamp
    FROM
        orders AS o
        INNER JOIN customers AS c
        ON o.customer_id = c.customer_id
    WHERE
        DATE_PART('year', signup_timestamp) = 2022 AND
        DATE_PART('month', signup_timestamp) = 6
)

SELECT
    ROUND(
        100 *
        SUM(CASE WHEN status = 'completed successfully' THEN 0 ELSE 1 END)::NUMERIC /
        COUNT(DISTINCT order_id),
        2
    ) AS bad_experience_pct
FROM
    order_details
WHERE
    DATE(order_timestamp) <= DATE(signup_timestamp) + '14 days'::INTERVAL;
