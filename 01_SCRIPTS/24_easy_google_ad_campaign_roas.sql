-- ad campaign roas --

SELECT
    advertiser_id,
    ROUND(SUM(revenue::NUMERIC) / SUM(spend::NUMERIC), 2) AS ROAS
FROM
    ad_campaigns
GROUP BY
    advertiser_id
ORDER BY
    advertiser_id;
