-- compensation outliers --

WITH employee_status AS
(
    SELECT 
        e1.employee_id,
        e1.salary,
        e1.title,
        CASE
            WHEN salary > 2 * (SELECT AVG(e2.salary) FROM employee_pay AS e2 WHERE e1.title = e2.title) THEN 'Overpaid'
            WHEN salary < 0.5 * (SELECT AVG(e2.salary) FROM employee_pay AS e2 WHERE e1.title = e2.title) THEN 'Underpaid'
            ELSE 'Near Average'
        END AS status
    FROM 
        employee_pay AS e1
)

SELECT
    employee_id,
    salary,
    status
FROM
    employee_status
WHERE
    status IN ('Underpaid', 'Overpaid');
