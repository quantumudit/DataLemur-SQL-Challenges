-- average deal size --

SELECT
    ROUND(AVG(yearly_seat_cost * num_seats), 2) AS average_deal_size
FROM
    contracts;
