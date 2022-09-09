SELECT
    p.page_id
FROM
    pages as p
    LEFT JOIN page_likes AS pl
    ON p.page_id = pl.page_id
WHERE
    pl.page_id IS NULL;