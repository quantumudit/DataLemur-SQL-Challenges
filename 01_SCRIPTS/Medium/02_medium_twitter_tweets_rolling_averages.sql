-- tweets rolling average --

WITH tweet_posts AS
(
    SELECT
        user_id,
        tweet_date,
        COUNT(tweet_id) AS tweet_count
    FROM
        tweets
    GROUP BY
        user_id,
        tweet_date
)

SELECT
    user_id,
    tweet_date,
    ROUND(
        AVG(tweet_count) OVER (PARTITION BY user_id ORDER BY tweet_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),
        2
    ) AS rolling_avg_3days
FROM
    tweet_posts;
