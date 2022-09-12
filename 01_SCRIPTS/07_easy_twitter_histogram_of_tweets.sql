-- histogram of tweets --

WITH tweet_counts AS
(
    SELECT
        COUNT(tweet_id) AS tweet_count
    FROM
        tweets
    WHERE
        DATE_PART('year', tweet_date) = 2022
    GROUP BY
        user_id
)

SELECT
    COUNT(tweet_count) AS tweet_bucket,
    tweet_count AS user_num
FROM
    tweet_counts
GROUP BY
    tweet_count
ORDER BY
    tweet_bucket ASC;
