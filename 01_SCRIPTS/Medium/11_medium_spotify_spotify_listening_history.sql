-- spotify listening history --

WITH total_plays AS
(
    SELECT
        user_id,
        song_id,
        song_plays
    FROM
        songs_history
    
    UNION ALL
        
    SELECT
        user_id,
        song_id,
        COUNT(song_id)
    FROM
        songs_weekly
    WHERE
        DATE(listen_time) <= '2022-08-04'
    GROUP BY
        user_id,
        song_id
)

SELECT 
    user_id,
    song_id,
    SUM(song_plays) AS song_plays
FROM 
    total_plays
GROUP BY
    user_id,
    song_id
ORDER BY
    song_plays DESC;
