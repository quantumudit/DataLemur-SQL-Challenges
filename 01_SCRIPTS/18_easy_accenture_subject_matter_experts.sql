-- subject matter experts --

SELECT 
    employee_id
FROM 
    employee_expertise
GROUP BY
    employee_id
HAVING
    (COUNT(DISTINCT domain) = 2 AND SUM(years_of_experience) >= 12) OR
    (COUNT(DISTINCT domain) = 1 AND SUM(years_of_experience) >= 8);
