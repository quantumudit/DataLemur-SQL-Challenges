-- active user retention --

SELECT
    DATE_PART('month', event_date) AS month,
    COUNT(DISTINCT user_id) AS monthly_active_users
FROM
    user_actions
WHERE
    user_id IN (SELECT DISTINCT user_id FROM user_actions WHERE DATE_PART('month', event_date) = 6) AND
    DATE_PART('month', event_date) = 7 AND
    event_type IN ('sign-in', 'like', 'comment')
GROUP BY
    DATE_PART('month', event_date);
