DROP FUNCTION IF EXISTS cases_per_period;

DELIMITER //
CREATE FUNCTION cases_per_period(cases TEXT, period INT)
RETURNS FLOAT
DETERMINISTIC
NO SQL
BEGIN
	RETURN cases / period;
END //
DELIMITER ;

SELECT
	Number_malaria AS per_year,
	cases_per_period(Number_malaria, 4) AS per_decade,
	cases_per_period(Number_malaria, 12) AS per_month
FROM cases
WHERE NOT Number_malaria = "";