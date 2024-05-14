DROP FUNCTION IF EXISTS year_diff;

DELIMITER // 
CREATE FUNCTION year_diff(year INT)
RETURNS INT
DETERMINISTIC
NO SQL
BEGIN
    RETURN TIMESTAMPDIFF(YEAR, MAKEDATE(year, 1), CURRENT_DATE());
END //
DELIMITER ;

SELECT
entity.name AS Entity, entity.code AS Code, cases.Year, year_diff(Year) AS year_diff
FROM cases
INNER JOIN entity ON cases.entity_id = entity.id