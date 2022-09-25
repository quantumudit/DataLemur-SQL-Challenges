-- linkedin power creators --

WITH power_creators AS
(
    SELECT
        pp.profile_id,
        pp.name AS person_name,
        pp.followers AS person_followers,
        cp.name AS company_name,
        cp.followers AS company_followers,
        (CASE WHEN pp.followers > cp.followers THEN 1 ELSE 0 END) AS power_creator_flag
    FROM
        employee_company AS ec
        INNER JOIN personal_profiles AS pp
        ON ec.personal_profile_id = pp.profile_id
        INNER JOIN company_pages AS cp
        ON ec.company_id = cp.company_id
)

SELECT
    profile_id
FROM
    power_creators
GROUP BY
    profile_id
HAVING
    MIN(power_creator_flag) = 1
ORDER BY
    profile_id;
