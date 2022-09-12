-- spare server capacity --

WITH space_demand AS
(
    SELECT
        datacenter_id,
        SUM(monthly_demand) AS total_monthly_demand
    FROM
        forecasted_demand
    GROUP BY
        datacenter_id
)

SELECT
    dc.datacenter_id,
    (dc.monthly_capacity - sd.total_monthly_demand) AS spare_capacity
FROM
    datacenters AS dc
    INNER JOIN space_demand AS sd
    ON dc.datacenter_id = sd.datacenter_id
ORDER BY
    dc.datacenter_id ASC;
