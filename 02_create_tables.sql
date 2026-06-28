-- Raw table
CREATE TABLE raw_employees (
    employee_id    VARCHAR(10),
    full_name      VARCHAR(100),
    department     VARCHAR(50),
    job_title      VARCHAR(50),
    date_hired     VARCHAR(20),
    status         VARCHAR(20),
    annual_salary  VARCHAR(20)
);

-- Staging table
CREATE TABLE staging_employees (
    employee_id    VARCHAR(10)    NOT NULL,
    full_name      VARCHAR(100)   NOT NULL,
    department     VARCHAR(50)    NOT NULL,
    job_title      VARCHAR(50)    NOT NULL,
    date_hired     VARCHAR(20)    NOT NULL,
    status         VARCHAR(20)    NOT NULL,
    annual_salary  DECIMAL(15,2)  NOT NULL,
    loaded_at      TIMESTAMP      DEFAULT CURRENT_TIMESTAMP
);

-- Warehouse table
CREATE TABLE warehouse_employees (
    employee_id       VARCHAR(10)    NOT NULL,
    full_name         VARCHAR(100)   NOT NULL,
    department        VARCHAR(50)    NOT NULL,
    job_title         VARCHAR(50)    NOT NULL,
    date_hired        DATE           NOT NULL,
    status            VARCHAR(20)    NOT NULL,
    annual_salary     DECIMAL(15,2)  NOT NULL,
    monthly_salary    DECIMAL(15,2)  NOT NULL,
    monthly_tax       DECIMAL(15,2)  NOT NULL,
    pension           DECIMAL(15,2)  NOT NULL,
    nhf               DECIMAL(15,2)  NOT NULL,
    net_monthly_pay   DECIMAL(15,2)  NOT NULL,
    years_of_service  INT            NOT NULL,
    salary_band       VARCHAR(20)    NOT NULL,
    loaded_at         TIMESTAMP      DEFAULT CURRENT_TIMESTAMP
);

-- Clean employees table
CREATE TABLE employees (
    employee_id     VARCHAR(10)    NOT NULL,
    full_name       VARCHAR(100)   NOT NULL,
    department      VARCHAR(50)    NOT NULL,
    job_title       VARCHAR(50)    NOT NULL,
    date_hired      DATE           NOT NULL,
    status          VARCHAR(20)    DEFAULT 'Active',
    annual_salary   DECIMAL(15,2)  NOT NULL,
    PRIMARY KEY (employee_id)
);
