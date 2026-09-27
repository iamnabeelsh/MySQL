-- chapter 5 
-- conversion function

-- there are two types implicit & explicit
-- implicit - oracle/sql converts it
-- explicit - we tell oracle/sql to convert it


-- to char function
select first_name || ' ' || last_name as "Full Name", to_char(hire_date,' DD "of" MON "in" YYYY ') as "Hire Date" from EMPLOYEES; -- here tochar converts date into desired format synatx SELECT TO_CHAR(DATE,'FORMAT') FROM TABLE_NAME
-- fm = Fill Mode call removes 0 and unwanted padding

select to_char(salary,'99,999.00L') as Salary from EMPLOYEES;                         -- gives salary in desired format (rem 9 for number L for local currency $ for dollar and 0 to display 0)



-- to number any string with number can be converted into numbers by TO_NUMBER
SELECT TO_NUMBER('2345') as Converted FROM DUAL;                            -- this converts string numbers into real numbers

-- TO_CHAR = to text || TO_NUMBER = to number

-- TO DATE 
SELECT TO_DATE('17-04-95','DD-MM-YYYY') FROM DUAL;              -- FETCHES DATE


-- general functions

--nvl

select NVL(COMMISSION_PCT,10) FROM EMPLOYEES;                        -- HERE NVL REPLACES THE VALUE WE GIVE NVL FUNCTION IS USED TO REPLACE NULL VALUES WITH THE GIVEN VALUE
SELECT LAST_NAME, SALARY + (NVL(COMMISSION_PCT,0.25))AS TOTALSALARY FROM EMPLOYEES ;      --HERE NVL ADDS COMMISSION AS .25 FOR NULL VALUES

--NVL2
SELECT LAST_NAME, SALARY + (NVL2(COMMISSION_PCT,0.25,3))AS TOTALSALARY FROM EMPLOYEES ;      --HERE NVL2 MAKES NULL VALUES THIRD OPTION TO ADD AND NOT NULL VALUES 2ND VALUES TO ADD
--EASY SAID NVL2 REPLACES BOTH NULL AND NOT NULL VALUES BY FOLLOWING WAY ---- NVL2(YOUR_TABLE,NOTNULL_REPLACEMENT,NULL_REPLACEMENT); I.E THEY CHANGE ENTIRE VALUES


--NULLIF
SELECT LAST_NAME, SALARY + (NULLIF(10,10))AS TOTALSALARY FROM EMPLOYEES ;             -- THIS ONE COMPARES IF EQUAL RETURNS NULL IF NOT RETURNS THE FIRST VALUE IN BRACKET



--COALESCE 
SELECT LAST_NAME, SALARY + (COALESCE(NULL,255,563))AS TOTALSALARY FROM EMPLOYEES ;   -- 


-- CASE/END --IF ELSE OF SQL
SELECT LAST_NAME,SALARY, CASE WHEN SALARY > 10000 THEN 'HIGH' WHEN SALARY<10000 THEN 'MED' ELSE 'LOW' END AS SALARY_STATS FROM EMPLOYEES;       -- THIS IS IF ELSE CASE 
-- PRACTICE THROUGHLY THE SYNTAX FOR CASE

SELECT FIRST_NAME || ' ' || LAST_NAME AS FULLNAME,
        SALARY,
        CASE
        WHEN SALARY > 15000 THEN 'NICE'
        WHEN SALARY > 5000 THEN 'NOT NICE'
        ELSE 'IMMPRACTICAL'
        END AS SALARYSTATS
        FROM EMPLOYEES;                         -- GO WITH SYNTAX THROUGHLY




SELECT FIRST_NAME || ' ' || LAST_NAME AS FULLNAME,
        SALARY, JOB_ID,
        CASE JOB_ID
        WHEN 'IT_PROG' THEN 8000+SALARY
        WHEN 'ST_CLERK' THEN 5000+SALARY
        ELSE SALARY 
        END AS TOTAL 
        FROM EMPLOYEES;
        
        
-- DECODE           -- ALTERNATE FOR CASE WORKS SAME LIKE IF ELSE
SELECT SALARY, DECODE(
    job_id,
    'IT_PROG', 1.10 * salary,
    'ST_CLERK', 1.15 * salary,
    'SA_REP', 1.20 * salary,
    salary 
)  AS SALA FROM EMPLOYEES;




