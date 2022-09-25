-- linkedin power creators --

SELECT
    p.profile_id
FROM
    personal_profiles AS p
    INNER JOIN company_pages AS c
    ON p.employer_id = c.company_id
WHERE
    p.followers > c.followers
ORDER BY
    p.profile_id ASC;
