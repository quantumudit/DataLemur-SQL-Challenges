-- duplicate job listings --

WITH duplicated_listings AS
(
    SELECT
        company_id,
        title,
        description,
        COUNT(job_id) AS job_postings
    FROM
        job_listings
    GROUP BY
        company_id,
        title,
        description
    HAVING
        COUNT(job_id) > 1
)

SELECT
    COUNT(DISTINCT company_id) AS duplicate_companies
FROM
    duplicated_listings;
