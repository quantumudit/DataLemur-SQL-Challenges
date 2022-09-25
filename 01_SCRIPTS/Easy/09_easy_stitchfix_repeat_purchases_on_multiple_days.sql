-- repeat purchases on multiple days --

WITH purchases_by_users AS
(
    SELECT
        user_id,
        product_id, DATE(purchase_date),
        DENSE_RANK() OVER(PARTITION BY user_id, product_id ORDER BY DATE(purchase_date) ASC) AS purchase_num
    FROM
        purchases
)

SELECT
    COUNT(DISTINCT user_id) AS users_num
FROM
    purchases_by_users
WHERE
    purchase_num > 1;
