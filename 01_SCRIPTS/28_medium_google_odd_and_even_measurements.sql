-- odd and even measurements --

WITH odd_even_measurements AS
(
    SELECT
        measurement_id,
        measurement_value,
        measurement_time,
        DATE(measurement_time) AS measurement_day,
        DENSE_RANK() OVER(PARTITION BY DATE(measurement_time) ORDER BY measurement_time ASC) AS measurment_number
    FROM
        measurements
)

SELECT
    measurement_day,
    SUM(CASE WHEN measurment_number IN (1, 3, 5) THEN measurement_value ELSE 0 END) AS odd_sum,
    SUM(CASE WHEN measurment_number IN (2, 4, 6) THEN measurement_value ELSE 0 END) AS even_sum
FROM
    odd_even_measurements
GROUP BY
    measurement_day;
