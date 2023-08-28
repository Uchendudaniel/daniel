
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



 