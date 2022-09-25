-- top rated businesses --

SELECT
    SUM(CASE WHEN review_stars IN (4, 5) THEN 1 ELSE 0 END) AS business_num,
    ROUND(
        100 * 
        (SUM
            (CASE WHEN review_stars IN (4, 5) THEN 1 ELSE 0 END)::NUMERIC / 
            COUNT(business_id)
        ), 
    2) AS top_business_pct
FROM
    reviews;
