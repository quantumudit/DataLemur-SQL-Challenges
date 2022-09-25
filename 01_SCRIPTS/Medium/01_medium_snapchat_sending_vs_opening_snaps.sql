-- sending vs. operning snaps --

WITH age_group_activities AS
(
    SELECT
        a.activity_type,
        a.time_spent,
        ab.age_bucket
    FROM
        activities AS a
        INNER JOIN age_breakdown AS ab
        ON a.user_id = ab.user_id
    WHERE
        a.activity_type IN ('send', 'open')
),

open_send_sums AS
(
    SELECT
        age_bucket,
        SUM(CASE WHEN activity_type = 'open' THEN time_spent ELSE 0 END) AS open_sum,
        SUM(CASE WHEN activity_type = 'send' THEN time_spent ELSE 0 END) AS send_sum,
        SUM(time_spent) AS total_sum
    FROM
        age_group_activities
    GROUP BY
        age_bucket
)

SELECT
    age_bucket,
    ROUND((send_sum / total_sum) * 100, 2) AS send_perc,
    ROUND((open_sum / total_sum) * 100, 2) AS open_perc
FROM
    open_send_sums;
