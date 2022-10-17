-- apple pay volume --

SELECT
    merchant_id,
    SUM(
        CASE
        WHEN LOWER(payment_method) = 'apple pay' THEN transaction_amount
        ELSE 0
        END
    ) AS volume
FROM
    transactions
GROUP BY
    merchant_id
ORDER BY
    volume DESC;
