TRUNCATE TABLE warehouse_employees;

INSERT INTO warehouse_employees (
    employee_id, full_name, department, job_title,
    date_hired, status, annual_salary, monthly_salary,
    monthly_tax, pension, nhf, net_monthly_pay,
    years_of_service, salary_band
)

-- Original 15 employees
SELECT
    employee_id,
    full_name,
    department,
    job_title,
    date_hired,
    status,
    annual_salary,
    ROUND(annual_salary / 12, 2)                    AS monthly_salary,
    ROUND((annual_salary / 12) *
        CASE
            WHEN annual_salary <= 300000  THEN 0.07
            WHEN annual_salary <= 600000  THEN 0.11
            WHEN annual_salary <= 1100000 THEN 0.15
            WHEN annual_salary <= 1600000 THEN 0.19
            WHEN annual_salary <= 3200000 THEN 0.21
            ELSE 0.24
        END, 2)                                     AS monthly_tax,
    ROUND((annual_salary / 12) * 0.08,  2)          AS pension,
    ROUND((annual_salary / 12) * 0.025, 2)          AS nhf,
    ROUND(
        (annual_salary / 12) -
        (annual_salary / 12) *
            CASE
                WHEN annual_salary <= 300000  THEN 0.07
                WHEN annual_salary <= 600000  THEN 0.11
                WHEN annual_salary <= 1100000 THEN 0.15
                WHEN annual_salary <= 1600000 THEN 0.19
                WHEN annual_salary <= 3200000 THEN 0.21
                ELSE 0.24
            END -
        (annual_salary / 12) * 0.08 -
        (annual_salary / 12) * 0.025,
    2)                                              AS net_monthly_pay,
    TIMESTAMPDIFF(YEAR, date_hired, CURDATE())      AS years_of_service,
    CASE
        WHEN annual_salary <  5000000  THEN 'Junior'
        WHEN annual_salary < 10000000  THEN 'Mid-Level'
        WHEN annual_salary < 15000000  THEN 'Senior'
        ELSE 'Executive'
    END                                             AS salary_band
FROM employees

UNION ALL

-- New 5 employees from staging (dates already cleaned)
SELECT
    employee_id,
    full_name,
    department,
    job_title,
    STR_TO_DATE(date_hired, '%Y-%m-%d')             AS date_hired,
    status,
    annual_salary,
    ROUND(annual_salary / 12, 2)                    AS monthly_salary,
    ROUND((annual_salary / 12) *
        CASE
            WHEN annual_salary <= 300000  THEN 0.07
            WHEN annual_salary <= 600000  THEN 0.11
            WHEN annual_salary <= 1100000 THEN 0.15
            WHEN annual_salary <= 1600000 THEN 0.19
            WHEN annual_salary <= 3200000 THEN 0.21
            ELSE 0.24
        END, 2)                                     AS monthly_tax,
    ROUND((annual_salary / 12) * 0.08,  2)          AS pension,
    ROUND((annual_salary / 12) * 0.025, 2)          AS nhf,
    ROUND(
        (annual_salary / 12) -
        (annual_salary / 12) *
            CASE
                WHEN annual_salary <= 300000  THEN 0.07
                WHEN annual_salary <= 600000  THEN 0.11
                WHEN annual_salary <= 1100000 THEN 0.15
                WHEN annual_salary <= 1600000 THEN 0.19
                WHEN annual_salary <= 3200000 THEN 0.21
                ELSE 0.24
            END -
        (annual_salary / 12) * 0.08 -
        (annual_salary / 12) * 0.025,
    2)                                              AS net_monthly_pay,
    TIMESTAMPDIFF(YEAR, STR_TO_DATE(date_hired, '%Y-%m-%d'), CURDATE())
                                                    AS years_of_service,
    CASE
        WHEN annual_salary <  5000000  THEN 'Junior'
        WHEN annual_salary < 10000000  THEN 'Mid-Level'
        WHEN annual_salary < 15000000  THEN 'Senior'
        ELSE 'Executive'
    END                                             AS salary_band
FROM staging_employees;
