-- Department payroll summary
SELECT * FROM vw_payroll_summary;

-- Full staff profiles
SELECT * FROM vw_staff_profiles;

-- Top 3 highest paid departments
SELECT
    department,
    avg_net_pay,
    avg_years_of_service
FROM vw_payroll_summary
ORDER BY avg_net_pay DESC
LIMIT 3;

-- Most experienced staff
SELECT
    full_name,
    department,
    years_of_service,
    salary_band
FROM warehouse_employees
ORDER BY years_of_service DESC
LIMIT 5;

-- Monthly payroll cost breakdown
SELECT
    department,
    headcount,
    total_monthly_gross,
    total_paye,
    total_pension,
    total_net_payroll
FROM vw_payroll_summary;
