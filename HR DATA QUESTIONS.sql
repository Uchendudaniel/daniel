
select * from hr;
describe hr;
select birthdate from hr;
SET SQL_SAFE_UPDATES=0;
update  hr
set birthdate=CASE 
WHEN BIRTHDATE LIKE '%/%'THEN DATE_FORMAT(STR_TO_DATE(BIRTHDATE, '%m/%d/%Y'), '%Y-%M-%D')
WHEN BIRTHDATE LIKE '%-%'THEN DATE_FORMAT(STR_TO_DATE(BIRTHDATE, '%m-%d-%Y'), '%Y-%M-%D')
when birthdate like '%-%' then date_format('%m-%d-%Y','%Y-%m-%d')
ELSE null
END;
ALTER table HR
MODIFY COLUMN  BIRTHDATE DATE;
SELECT BIRTHDATE FROM HR;
update hr
set hire_date= CASE
WHEN hire_date LIKE '%/%'THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m/%d/%Y'), '%Y-%M-%D')
WHEN hire_date LIKE '%-%'THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m-%d-%Y'), '%Y-%M-%D')
ELSE nulL
END;
select hire_date from hr;
ALTER table HR
MODIFY COLUMN  hire_date DATE;
describe hr;
UPDATE hr
SET termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate != ' ' AND termdate != '';
   ALTER TABLE HR 
MODIFY COLUMN TERMDATE DATE;
-- QUESTIONS
-- 1. What is the gender breakdown of employees in the company?
SELECT GENDER , COUNT(*) AS COUNT
FROM HR
WHERE  TERMDATE='0000-00-00'
GROUP BY GENDER;
-- 2.What is the race/ethnicity breakdown of employees in the company?
SELECT RACE , COUNT(*) AS COUNT
FROM HR
WHERE TERMDATE='0000-00-00'
GROUP BY RACE
ORDER BY COUNT(*) DESC;
-- 3.How many employees work at headquarters versus remote locations?
SELECT LOCATION, COUNT(*)  AS COUNT 
FROM HR
WHERE TERMDATE='000-00-00'
GROUP BY LOCATION;

-- 4.How does the gender distribution vary across departments and job titles?
select department, gender, count(*) as count
from hr
where termdate='0000-00-00'
group by department, gender
order by department; 
-- 5.What is the distribution of job titles across the company?
select jobtitle, count(*) as count
from hr
where termdate='000-00-00'
group by jobtitle
order by jobtitle desc;
-- 6.Which department has the highest turnover rate?
select department, total_count, terminated_count,
terminated_count/total_count as termination_rate
from(
select department , count(*) as total_count,
sum(case when termdate<>'000-00-00' and termdate<=curdate() then 1 else 0 end) as terminated_count
from hr group by department
) as subquery
order by termination_rate desc;
-- 7.What is the distribution of employees across locations by state?
SELECT LOCATION_STATE, COUNT(*) AS COUNT
FROM HR
WHERE TERMDATE='0000-00-00'
GROUP BY LOCATION_STATE
ORDER BY COUNT ASC;


 