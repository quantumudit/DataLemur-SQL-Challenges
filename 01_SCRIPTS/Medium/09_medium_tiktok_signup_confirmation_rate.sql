-- signup confirmation rate --

WITH signup_info AS
(
    SELECT
        e.email_id,
        e.user_id,
        t.signup_action
    FROM
        emails AS e
        LEFT JOIN texts AS t
        ON e.email_id = t.email_id
)

SELECT
    ROUND(
        (SELECT COUNT(DISTINCT email_id) FROM signup_info WHERE signup_action = 'Confirmed')::NUMERIC/
        COUNT(DISTINCT email_id)::NUMERIC, 2
    ) AS confirm_rate
FROM
    signup_info;
