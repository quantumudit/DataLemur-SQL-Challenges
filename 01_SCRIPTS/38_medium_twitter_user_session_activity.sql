-- user session activity --

WITH tweeter_sessions AS
(
    SELECT
        user_id,
        session_type,
        SUM(duration) AS total_duration
    FROM 
        sessions
    WHERE
        start_date BETWEEN '2022-01-01' AND '2022-02-01'
    GROUP BY
        user_id,
        session_type
)

SELECT
    user_id,
    session_type,
    DENSE_RANK() OVER(PARTITION BY session_type ORDER BY total_duration DESC) AS ranking
FROM
    tweeter_sessions;
