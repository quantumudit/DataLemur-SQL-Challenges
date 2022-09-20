-- second day confirmation --

SELECT DISTINCT
    e.user_id
FROM
    emails AS e
    INNER JOIN texts AS t
    ON e.email_id = t.email_id
WHERE
    t.signup_action = 'Confirmed' AND
    DATE_PART('day', t.action_date - e.signup_date) = 1;
