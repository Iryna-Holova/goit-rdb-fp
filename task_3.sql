SELECT
    entity.name AS Entity,
    entity.code AS Code,
    AVG(Number_rabies) AS avg_rabies,
    MIN(Number_rabies) AS min_rabies,
    MAX(Number_rabies) AS max_rabies,
    SUM(Number_rabies) AS sum_rabies
FROM cases
INNER JOIN entity ON cases.entity_id = entity.id
WHERE NOT Number_rabies = ''
GROUP BY entity_id
ORDER BY avg_rabies DESC
LIMIT 10;