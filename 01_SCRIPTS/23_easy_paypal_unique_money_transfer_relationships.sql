-- unique money transfer relationship --

WITH two_way_rel AS
(
    SELECT
        payer_id AS payer,
        recipient_id AS recipient
    FROM
        payments
    
    INTERSECT
    
    SELECT
        recipient_id AS payer,
        payer_id AS recipient
    FROM
        payments
)

SELECT
    COUNT(payer)/2 AS unique_relationships
FROM
    two_way_rel;
