CREATE TABLE salary_data (
    job_title VARCHAR(100),
    experience_years INT,
    education_level VARCHAR(50),
    skills_count INT,
    industry VARCHAR(100),
    company_size VARCHAR(50),
    location VARCHAR(100),
    remote_work VARCHAR(20),
    certifications INT,
    salary FLOAT
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/job_salary_prediction_dataset.csv'
INTO TABLE salary_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; 

-- VERIFICANDO SE TODAS AS LINHAS FORAM IMPORTADAS
SELECT COUNT(*) FROM salary_data;

-- VISUALIZANDO PARTE DO DATASET
SELECT * 
FROM salary_data
LIMIT 10;

-- VERIFICANDO VALORES NULOS
SELECT 
    SUM(job_title IS NULL) as job_title_nulls,
    SUM(experience_years IS NULL) as exp_nulls,
    SUM(education_level IS NULL) as edu_nulls,
    SUM(salary IS NULL) as salary_nulls
FROM salary_data;


-- VERIFICANDO VALORES VAZIOS
SELECT *
FROM salary_data
WHERE job_title = '' OR education_level = '';

-- VERIFICANDO VALORES "ABSURDOS"
SELECT *
FROM salary_data
WHERE experience_years < 0 OR experience_years > 50 OR salary <= 0;

-- PRIMEIRA ANÁLISE DO DATASET
SELECT 
    MIN(salary),
    MAX(salary),
    AVG(salary)
FROM salary_data;

SELECT 
    experience_years,
    AVG(salary)
FROM salary_data
GROUP BY experience_years
ORDER BY experience_years;

SELECT 
    education_level,
    AVG(salary) as avg_salary
FROM salary_data
GROUP BY education_level
ORDER BY avg_salary DESC;

SELECT 
    remote_work,
    AVG(salary)
FROM salary_data
GROUP BY remote_work;