-- employee 테이블 전체 내용 조회
SELECT
    *
FROM
    tab;

-- employees 테이블의 first_name, last_name, job_id만 조회
SELECT
    first_name,
    last_name,
    job_id
FROM
    employees;

-- employee_id가 176인 사람의 LAST_NAME과 DEPARTMENT_ID 조회
SELECT
    last_name,
    department_id
FROM
    employees
WHERE
    employee_id = 176;

-- salary가 12000이상 되는 직원들의 last_name, salary 조회
SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary >= 12000;

-- salary가 5000~12000의 범위 이외인 사원들의 last_name, salary 조회
SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary > 12000
    OR salary < 5000;


-- 9/16 
-- 20번 및 50번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 DEPARTMENT_ID를 오름차순 조회
SELECT
    last_name,
    department_id
FROM
    employees
WHERE
    department_id = 20
    OR department_id = 50;

-- COMMISSION_PCT를 받는 모든 사원들의 LAST_NAME, SALARY, COMMISION_PCT 조회
-- 단, SALARY 내림차순, COMMISSION_PCT 내림차순
SELECT
    last_name,
    salary,
    commission_pct
FROM
    employees
WHERE
    commission_pct > 0
ORDER BY
    salary DESC,
    commission_pct DESC;

-- SALARY가 2500, 3500, 7000이 아니며 JOB_ID가 SA_REP, ST_CLERK인 사원 조회
SELECT
    *
FROM
    employees
WHERE
    NOT salary IN ( 2500, 3500, 7000 )
        AND job_id IN ( 'SA_REP', 'ST_CLERK' );

-- 2008/02/20 ~ 2008/05/01 사이에 고용된 사원들의 LAST_NAME, EMPLOYEE_ID, HIRE_DATE조회
-- HIRE_DATE내림차순으로 조회
SELECT
    last_name,
    employee_id,
    hire_date
FROM
    employees
WHERE
        hire_date >= '2008-02-20'
    AND hire_date <= '2008-05-01'
ORDER BY
    hire_date DESC;

-- 2004년도에 고용된 모든 사람들의 LAST_NAME, HIRE_DATE 조회 
-- HIRE_DATE 오름차순 정렬
SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
        hire_date >= '2004-01-01'
    AND hire_date <= '2004-12-31'
ORDER BY
    hire_date ASC;
    
    
    -- salary가 5000~12000의 범위 이외인 사원들의 last_name, salary 조회
SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary NOT BETWEEN 5000 AND 12000;
    
    
-- 20번 및 50번 부서에서 근무하며, SALARY가 5000~12000사이인 사원들의 LAST_NAME및 DEPARTMENT_ID 조회
SELECT
    last_name,
    department_id
FROM
    employees
WHERE
    department_id IN ( 20, 50 )
    AND salary BETWEEN 5000 AND 12000;
    
-- 2008/02/20 ~ 2008/05/01 사이에 고용된 사원들의 LAST_NAME, EMPLOYEE_ID, HIRE_DATE조회
-- HIRE_DATE내림차순으로 조회
SELECT
    last_name,
    employee_id,
    hire_date
FROM
    employees
WHERE
    hire_date BETWEEN '2008-02-20' AND '2008-05-01'
ORDER BY
    hire_date DESC;

-- 2004년도에 고용된 모든 사람들의 LAST_NAME, HIRE_DATE 조회 
-- HIRE_DATE 오름차순 정렬
SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date BETWEEN '2004-01-01' AND '2004-12-31'
ORDER BY
    hire_date ASC;
    
-- LIKE    
-- 2004년도에 고용된 모든 사람들의 LAST_NAME, HIRE_DATE 조회 
-- HIRE_DATE 오름차순 정렬

SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date LIKE '04%'
ORDER BY
    hire_date;

-- LAST_NAME에 u 가 포함되는 사원들의 사번 및 LAST_NAME 조회
SELECT
    employee_id,
    last_name
FROM
    employees
WHERE
    last_name LIKE '%u%';

-- LAST_NAME의 4번째 글자가 a인 사원들의 LAST_NAME 조회
SELECT
    last_name
FROM
    emplyees
WHERE
    last_name LIKE '___a%';

-- LAST_NAME에 글자가 a 혹은 e글자가 들어있는 사원들의 LAST_NAME을 조회한 후 LAST_NAME 오름차순 조회
SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%a%'
    OR last_name LIKE '%e%'
ORDER BY
    last_name;

SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%a%e%'
    OR last_name LIKE '%e%a%'
ORDER BY
    last_name;
    
    
    
    
-- manager_id가 없는 사원들의 last_name, job_id 조회
SELECT
    last_name,
    job_id
FROM
    employees
WHERE
    manager_id IS NULL;

-- JOB_ID가 ST_CLERK인 사원들의 DEPARTMENT_ID를 조회(단, 부서 번호가 null인 것을 제외)
SELECT DISTINCT
    department_id
FROM
    employees
WHERE
        job_id = 'ST_CLERK'
    AND department_id IS NOT NULL;

-- COMMISSION_PCT가 null이 아닌 사원들 중에서 COMMISSION = SALARY * COMMISSION_PCT를 구한 후
-- employee_ID, FIRST_NAME, JOB_ID, COMMISSION 조회
SELECT
    employee_id,
    first_name,
    job_id,
    commission_pct * salary AS commission
FROM
    employees
WHERE
    commission_pct IS NOT NULL;


-- 9월 23일 (목)
-- first_name이 Curtis인 사람의 first_name, last_name, emil, phone_number, job_id 조회
-- 단, job_id 결과는 소문자로 출력한다. 
SELECT
    first_name,last_name,emil,phone_number, lower(job_id)
FROM
    employees
WHERE
    first_name = 'Curtis';

-- job_id가 AD_PRESS, PU_CUERK인 사원들의 EMPLOYEE_ID, FIRST_NAME, LAST_NAME, 
-- DEPARTMENT_ID, JOB_ID 조회, 단, 사원명은 FIRST_NAME과 LAST_NAME을 연결하여 출력
SELECT
    employee_id,
    concat(first_name,last_name),
    department_id,
    job_id
FROM
    employees
WHERE
    job_id IN('AD_PRESS','PU_CUERK');
    
    
-- 9월 27일
-- 사원들의 최대 급여와 최소 급여의 차이를 조회
SELECT MAX(salary)-MIN(salary) AS GAP FROM employees;

-- 매니저로 근무하는 사원들의 총 수 조회 (단, MANAGER_ID 중복 제거)
SELECT COUNT(DISTINCT MANAGER_ID) FROM employees;

SELECT DEPTNO, TRUNC(AVG(SAL),0) AS AVG_SAL, 
MAX(SAL) AS MAX_SAL, 
MIN(SAL) AS MIN_SAL, COUNT(*) FROM EMP GROUP BY DEPTNO;



-- 9월 29일

-- 문제1 자신의 담당 매니져의 고용일보다 빠른 입사자 찾기
--select e1.EMPLOYEE_ID
--from EMPLOYEES e1, EMPLOYEES e2
--where e1.hire_date > e2.hire_date;
-- where에서 and로 연결하여 조건을 2개 줘야한다. 
-- 우선 =을 사용하여 조인부터 해줘야 하는 것

select * from
employees e1, employees e2
where e1.manager_id = e2.employee_id and e1.hiredate < e2.hiredate;

select * from
employees e1 join employees e2 on e1.manager_id = e2.employee_id and e1.hire_date < e2.hire_date;

-- 문제2 도시 이름이 t로 시작하는 지역에 사는 사원들의 사번, last_name, 부서번호 조회
--SELECT
--    EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID
--FROM
----    EMPLOYEES E
--    JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
--    JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
-- WHERE L.LOCATION_ID LIKE('t%');
 
 select employee_id, last_name, e.department_id
 from employees e, departments d, locations l
 where e.department_id = d.department_id and d.location_id = l.loction_id and city like 'T%';

-- 문제3 위치 id가 1700인 사원들의 last_name, 부서번호, 연봉 조회
select employee_id, last_name, e.department_id
from employees e, department d
where e.department_id = d.department_id and location_id = 1700;

-- 문제4 Executive 부서에 근무하는 모든 사원들의 부서번호, last_name, job_id 조회

select last_name, e.department_id, e.job_id
from employees e, department d
where e.department_id = d.department_id and e.department_id = 'Executive';

-- lAST_NAME 에 U가 포함되는 사원들과 동일 부서에 근무하는 사원들의 사번 및 LAST_NAME 조회
SELECT employee_id, last_name FROM employees WHERE department_id 
in(select distinct department_id from employees where last_name like '%u%');

--
create table indexTBL as select DISTINCT first_name, last_name, hire_date from employees;

select * from indexTBL;

-- 인덱스 생성 전 검색 방식 : Full
select * from indexTBL where first_name='Jack';

-- 인덱스 생성
create index idx_indexTBL_firstname on indexTBL(first_name);
-- 인덱스 생성 후 검색 방식 : index 검색 (Range Scan)
select * from indexTBL where first_name='Jack';

 

    
    