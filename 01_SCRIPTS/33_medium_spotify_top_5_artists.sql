-- top 5 artists --

WITH artist_top10_appearance AS
(
    SELECT
        a.artist_name,
        COUNT(a.artist_name) AS appearance
    FROM
        global_song_rank AS gsr
        INNER JOIN songs AS s
        ON gsr.song_id = s.song_id
        INNER JOIN artists AS a
        ON s.artist_id = a.artist_id
    WHERE
        gsr.rank <= 10
    GROUP BY
        a.artist_name
),

artist_ranking AS
(
    SELECT
        artist_name,
        appearance,
        DENSE_RANK() OVER(ORDER BY appearance DESC) AS artist_rank
    FROM
        artist_top10_appearance
)

SELECT
    artist_name,
    artist_rank
FROM
    artist_ranking
WHERE
    artist_rank <= 5;
