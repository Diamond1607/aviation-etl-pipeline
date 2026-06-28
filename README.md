# ✈️ Aviation Payroll ETL Pipeline

## Project Overview
A complete SQL-based ETL pipeline built for an aviation company
payroll system. Raw employee data is extracted, cleaned,
transformed and loaded into a structured data warehouse
with live reporting views.

## Business Problem
Aviation payroll data arrives from multiple sources with
inconsistent formats, duplicates, and missing values.
This pipeline standardizes and enriches the data to
produce accurate monthly payroll reports.

## Pipeline Architecture
![ETL Pipeline](screenshots/pipeline_diagram.png)

RAW → STAGING → WAREHOUSE → VIEWS

## Tables
| Table | Description |
|---|---|
| raw_employees | Landing zone for unclean source data |
| staging_employees | Cleaned and deduplicated data |
| warehouse_employees | Enriched with salary calculations |

## Views
| View | Description |
|---|---|
| vw_payroll_summary | Monthly payroll by department |
| vw_staff_profiles | Full staff pay breakdown |

## Data Transformations Applied
- Removed duplicate records
- Standardized inconsistent casing (PILOTS → Pilots)
- Trimmed whitespace from names
- Handled missing values (empty names → 'Unknown')
- Fixed inconsistent date formats (DD-MM-YYYY, YYYY/MM/DD)
- Converted salary from text to DECIMAL
- Calculated PAYE tax using Nigerian tax brackets
- Calculated Pension (8%), NHF (2.5%), NSITF (1%)
- Derived years of service from hire date
- Assigned salary bands (Junior/Mid-Level/Senior/Executive)

## Tech Stack
- MySQL 8.0
- MySQL Workbench

## Key SQL Concepts Used
- DDL: CREATE TABLE, CREATE VIEW
- DML: INSERT, UPDATE, SELECT
- CASE WHEN for conditional logic
- UNION ALL to merge datasets
- Aggregate functions: SUM, AVG, COUNT
- Date functions: STR_TO_DATE, TIMESTAMPDIFF
- String functions: TRIM, CONCAT, SUBSTRING

## 📊 Results & Screenshots

### Warehouse Table (20 Employees)
![Warehouse Table](screenshots/01_warehouse_table.png)

### Department Payroll Summary
![Payroll Summary](screenshots/02_payroll_summary_view.png)

### Staff Profiles View
![Staff Profiles](screenshots/03_staff_profiles_view.png)

### Top 3 Highest Paid Departments
![Top Departments](screenshots/04_top_departments.png)

### Most Experienced Staff
![Experienced Staff](screenshots/05_experienced_staff.png)

## Author
Alabi Timilehin — Data Analyst
