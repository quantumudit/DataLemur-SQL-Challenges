-- data science skills --

SELECT
    candidate_id
FROM
    candidates
GROUP BY
    candidate_id
HAVING
    SUM(
        (CASE WHEN skill = 'Python' THEN 1 ELSE 0 END) +
        (CASE WHEN skill = 'Tableau' THEN 1 ELSE 0 END) +
        (CASE WHEN skill = 'PostgreSQL' THEN 1 ELSE 0 END)
    ) = 3
ORDER BY
    candidate_id ASC;
