-- same week purchases --

WITH user_count_tbl AS
(
    SELECT
        COUNT(DISTINCT up.user_id) AS total_purchase_users,
        COUNT(DISTINCT s.user_id) AS total_signup_users
    FROM
        signups AS s
        LEFT OUTER JOIN user_purchases AS up
        ON s.user_id = up.user_id
    WHERE
        up.purchase_date IS NULL OR
        up.purchase_date BETWEEN s.signup_date AND (s.signup_date + '1 week'::INTERVAL)
)

SELECT
    ROUND(
        100 * 
        (total_purchase_users::NUMERIC / total_signup_users), 
        2
    ) AS single_purchase_pct
FROM
    user_count_tbl;
