-- invalid search results --

WITH search_details AS
(
    SELECT
        country,
        SUM(num_search) AS total_search,
        SUM(num_search * (invalid_result_pct/100)) AS invalid_searches
    FROM
        search_category
    WHERE
        num_search IS NOT NULL AND invalid_result_pct IS NOT NULL
    GROUP BY
        country
)

SELECT 
    country, 
    total_search, 
    ROUND(invalid_searches/total_search * 100.0,2) invalid_result_pct
FROM 
    search_details;
