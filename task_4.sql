SELECT
    entity.name AS Entity,
    entity.code AS Code,
    cases.Year,
    MAKEDATE(cases.Year, 1) AS start_of_year,
    CURRENT_DATE() AS cur_date,
    TIMESTAMPDIFF(Year, MAKEDATE(YEAR, 1), CURRENT_DATE()) AS year_diff
FROM cases
INNER JOIN entity ON cases.entity_id = entity.id