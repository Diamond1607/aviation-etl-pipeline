-- Payroll summary view
CREATE OR REPLACE VIEW vw_payroll_summary AS
SELECT
    department,
    COUNT(*)                         AS headcount,
    SUM(annual_salary)               AS total_annual_cost,
    SUM(monthly_salary)              AS total_monthly_gross,
    SUM(monthly_tax)                 AS total_paye,
    SUM(pension)                     AS total_pension,
    SUM(nhf)                         AS total_nhf,
    SUM(net_monthly_pay)             AS total_net_payroll,
    ROUND(AVG(net_monthly_pay), 2)   AS avg_net_pay,
    ROUND(AVG(years_of_service), 1)  AS avg_years_of_service
FROM warehouse_employees
WHERE status = 'Active'
GROUP BY department
ORDER BY total_net_payroll DESC;

-- Staff profiles view
CREATE OR REPLACE VIEW vw_staff_profiles AS
SELECT
    employee_id,
    full_name,
    department,
    job_title,
    salary_band,
    years_of_service,
    CONCAT('₦', FORMAT(monthly_salary,  2))  AS gross_monthly,
    CONCAT('₦', FORMAT(monthly_tax,     2))  AS paye_tax,
    CONCAT('₦', FORMAT(pension,         2))  AS pension,
    CONCAT('₦', FORMAT(nhf,             2))  AS nhf,
    CONCAT('₦', FORMAT(net_monthly_pay, 2))  AS take_home_pay,
    status
FROM warehouse_employees
ORDER BY department, annual_salary DESC;
