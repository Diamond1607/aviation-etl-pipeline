-- Fix date formats
SET SQL_SAFE_UPDATES = 0;

UPDATE staging_employees
SET date_hired = CONCAT(
    SUBSTRING(date_hired, 7, 4), '-',
    SUBSTRING(date_hired, 4, 2), '-',
    SUBSTRING(date_hired, 1, 2)
)
WHERE employee_id = 'AV016';

UPDATE staging_employees
SET date_hired = REPLACE(date_hired, '/', '-')
WHERE employee_id = 'AV017';

SET SQL_SAFE_UPDATES = 1;

-- Load clean data into staging
INSERT INTO staging_employees (
    employee_id, full_name, department,
    job_title, date_hired, status, annual_salary
)
SELECT DISTINCT
    employee_id,
    CASE
        WHEN TRIM(full_name) = '' THEN 'Unknown'
        ELSE TRIM(full_name)
    END                                              AS full_name,
    CONCAT(
        UPPER(LEFT(LOWER(department), 1)),
        LOWER(SUBSTRING(department, 2))
    )                                                AS department,
    job_title,
    date_hired,
    CONCAT(
        UPPER(LEFT(LOWER(status), 1)),
        LOWER(SUBSTRING(status, 2))
    )                                                AS status,
    CAST(annual_salary AS DECIMAL(15,2))             AS annual_salary
FROM raw_employees;
