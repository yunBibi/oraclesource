-- SQL은 대소문자 구별 하지 않음
-- 대소문자 구별은 비밀번호만 한다.

-- scott 계정에 존재하는 모든 테이블 조회
SELECT
    *
FROM
    tab;

-- 조회(Select) : 행 단위로 조회, 열 단위로 조회
-- emp 테이블의 내용을 전체 조회
SELECT
    *
FROM
    emp;

-- emp테이블의 empno, ename, job만 조회
SELECT
    empno,
    ename,
    job
FROM
    emp;

-- 중복 제거 후 조회 : distinct
SELECT DISTINCT
    deptno
FROM
    emp;

-- 별칭을 붙여서 조회 : AS(alais) : 보여줄 때에만 이름을 바꿔서 보여주는 것
SELECT
    empno AS 사원번호
FROM
    emp;

-- 연봉 구하기 (월급*12 + 커미션)
SELECT
    ename           AS 사원명,
    job             AS "직 책",
    sal             AS 급여,
    comm            AS 추가수당,
    sal * 12 + comm AS 연봉
FROM
    emp;

-- 별명을 붙일 때 공백이 생긴다면 제대로 출력되지 않는다. 그래서 ""로 묶어준다.

-- 정렬 : ORDER BY 컬럼명 기준(오름차순(ASC), 내림차순(DSC)) 
-- ename, sal 조회할 때 sal 내림차순으로 정렬

-- 오름차순(생략가능 - 기본값)
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal ASC;

SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal;

-- EMP 테이블의 전체 내용을 조회하고, 단 사원번호 내림차순 정렬
SELECT
    *
FROM
    emp
ORDER BY
    empno DESC;

-- 전체 내용 조회(부서번호 오름차순, 그 안에서 급여 내림차순) 
SELECT
    *
FROM
    emp
ORDER BY
    deptno ASC,
    sal DESC;

-- 실습
SELECT
    empno  AS employee_no,
    ename  AS employee_name,
    mgr    AS manager,
    sal    AS salary,
    comm   AS commission,
    deptno AS department_no,
    job,
    hiredate
FROM
    emp
ORDER BY
    deptno DESC,
    ename ASC;
    
-- 특정 조건을 기준으로 원하는 데이터를 조회 : WHERE

-- 전체 데이터 조회, 단, 부서번호가 30번인 데이터만 조회
SELECT
    *
FROM
    emp
WHERE
    deptno = 30;

-- 사원번호가 7782번 조회
SELECT
    *
FROM
    emp
WHERE
    empno = 7782;

-- 부서번호가 30번이고, 사원직책이 SALESMAN인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN';
-- 오라클은 홑따옴표로 문자 데이터를 표현한다.

-- 부서번호가 30이거나 사원 직책이 CLERK 조회
SELECT
    *
FROM
    emp
WHERE
    deptno = 30
    OR job = 'CLEDRK';
    


-- 9/16목 산술연산자를 사용한 WHERE절   

-- 연봉이 36000인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal * 12 = 36000;
-- 월급이 3000 보다 큰 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal > 3000;

-- 월급이 3000 이상인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal >= 3000;

-- 이름의 첫 글자가 F 이후인 사원 조회
-- 문자에도 크다 작다 적용 가능하다
SELECT
    *
FROM
    emp
WHERE
    ename >= 'F';  

-- 급여가 2500이상이고, 직업이 ANALYST인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        sal >= 2500
    AND job = 'ANALYST';

-- 직무가 SALESMAN이거나, CLERK이거나, MANAGER인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    job = 'SALESMAN'
    OR job = 'CLERK'
    OR job = 'MANAGER';

-- 등가비교연산자 =, //   !=, <>, ^=(같지 않다)
SELECT
    *
FROM
    emp
WHERE
    sal != 3000;

SELECT
    *
FROM
    emp
WHERE
    sal <> 3000;

SELECT
    *
FROM
    emp
WHERE
    sal^= 3000;

SELECT
    *
FROM
    emp
WHERE
    NOT sal = 3000;

-- IN : 포함한다
-- 직무가 SALESMAN이거나, CLERK이거나, MANAGER인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    job IN ( 'ANALYST', 'CLERCK', 'MANAGER' );

-- 부서번호가 10,20번 사원 조회
SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 10, 20 );

-- BETWEEN A AND B
-- 급여가 2000에서 3000 사이인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;
-- 급여가 2000에서 3000 사이인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal NOT BETWEEN 2000 AND 3000;


-- LIKE 연산자와 와일드 카드
-- 일부 문자열이 포함된 데이터 조회할 때 사용

-- 와일드 카드 
-- %(길이와 상관 없이 모든 문자 데이터를 의미)
-- _(어떤 값이든 상관없이 한 개의 문자 데이터를 의미)

-- 사원명이 S로 시작하는 사원들 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'S%';

-- 사원명의 두 번째 글자가 L인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_L%';

-- 사원명에 AM 문자가 포함되어 있는 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%AM%';

-- 사원명에 AM문자가 포함되어 있지 않은 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '%AM%';


-- IS NULL 
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL;

-- MGR이 NULL인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    mgr IS NULL;

-- MGR이 NULL이 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    mgr IS NOT NULL; 

-- < 집합 연산자 >
-- 합집합 : UNION(중복값을 제거), UNION ALL(중복값을 제거하지 않음)
-- 교집합 : INTERSECT
-- 차집합 : MINUS

-- EMPNO, ENAME, SAL, DEPRNO 조회(부서번호가 10번이거나 20번인 사원)
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 20;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION ALL
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    sal,
    job,
    deptno,
    sal
FROM
    emp
WHERE
    deptno = 20;
    

-- MINUS
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
MINUS
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
INTERSECT
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;






-- 9/17 금요일
-- 오라클 함수 / 내장함수
-- 1) 문자함수
-- 대소문자 변경 : UPPER(문자열) LOWER(문자열) INITCAP(문자열)
SELECT
    ename,
    upper(ENAME)
    lowerLOWERenameENAME)
    initcapINITCAPenameENAME
)
    empEMP

;

-- ENAME이 SCOTT인 사람 찾기
    SELECT
*
    emp
EMP
    lowerLOWERenameENAME ) ='scott'

;
    SELECT
*
    emp
EMP
    lowerLOWERenameENAME ) lowerLOWER('%scott%')

;

-- 문자 길이 구하기
-- LENGTH(문자열) : 해당 문자열의 길이 돌려줌
-- LENGTHB(문자열) : 해당 문자열의 바이트 수 돌려줌
    enameENAME
    lengthLENGTHenameENAME
)
    empEMP

;

-- 한글 한 자 당 3byte 사용
-- DUAL : 데이터베이스 관리자가 소유한 테이블 / 임시로 연산을 하거나 함수의 결과 값을 확인하는 용도
    lengthLENGTH('한글')
    lengthbLENGTHB('한글'
)
    dualDUAL

;

-- JOB이 6글자 이상인 사원들 조회
    SELECT
*
    emp
EMP
    legthLEGTHjobJOB )> =6

;

-- 문자열 일부를 추출하기
-- SUBSTR(문자열데이터, 시작위치, 추출길이)
-- SUBSTR(문자열데이터, 시작위치)
    jobJOB
    substrSUBSTRjobJOB ,0
)
    empEMP

;
    jobJOB
    substrSUBSTRjobJOB ,1 ,2)
    substrSUBSTRjobJOB ,3 ,2)
    substrSUBSTRjobJOB ,5
)
    empEMP

;

-- EMP 테이블의 모든 사원 이름을 세 번째 글자부터 끝까지 출력하기
    enameENAME
    substrSUBSTRenameENAME ,3
)
    empEMP

;
-- EMP 테이블의 모든 사원 이름을 세 번째 글자부터 끝까지 출력하기
    enameENAME
    substrSUBSTRenameENAME ,3
)
    empEMP

;

--               문자열 데이터 안에서 특정 문자를 찾기
--               INSTR(문자열,찾을 문자열,시작위치(옵션), 몇번째에 있는걸 찾을 것인지(옵션)) 

    instrINSTR('HELLO, ORACLE!' ,'L')
    instrINSTR('HELLO, ORACLE!' ,'L' ,5)
    instrINSTR('HELLO, ORACLE!' ,'L' ,2 ,2
)
    dualDUAL

;

-- 원본 문자열 : 이것이 Oracle이다. 이것도 오라클이다.
-- 찾을 문자열 : 이것

-- 제일 처음에 나오는 이것의 위치를 찾기
    instrINSTR('이것이 Oracle이다. 이것도 오라클이다.' ,'이것'
)
    dualDUAL

;

-- 시작 위치를 3으로 지정한 후 나오는 이것의 위치
    instrINSTR('이것이 Oracle이다. 이것도 오라클이다.' ,'이것' ,3
)
    dualDUAL

;

-- 이것이 두 번째로 나오는 위치 찾기
    instrINSTR('이것이 Oracle이다. 이것도 오라클이다.' ,'이것' ,1 ,2
)
    dualDUAL

;


-- 사원 이름에 문자 S가 있는 사원 구하기
    SELECT
*
    emp
EMP
    instrINSTRenameENAME ,'S' ) >0

;

-- 특정 문자를 다른 문자로 바꾸는 함수
-- REPLACE(문자열 데이터 또는 열 이름, 찾는 문자, 바꿀 문자)

-- 010-1234-5678 => 010 1234 5678, 010123345678
    SELECT                    '010-1234-5678' 원본원본
    replaceREPLACE('010-1234-5678' ,'-' ,' ' ) replace1REPLACE1
    replaceREPLACE('010-1234-5678' ,'-'      ) replace2
REPLACE2
    dualDUAL

;
    
-- 두 문자열 데이터를 합치는 함수
-- CONCAT(문자열1, 문자열2)

-- EMPNO, ENAME 합쳐서 출력
    empnoEMPNO
    enameENAME
    concatCONCATempnoEMPNO enameENAME
)
    emp
EMP
    ename ENAME ='SCOTT'

;

-- 7788:SCOTT
-- SELECT EMPNO, ENAME, CONCAT(EMPNO, ':', ENAME)
-- FROM EMP WHERE ENAME = 'SCOTT';
-- CONCAT은 문자열 2개만 받을 수 있기 때문에 에러가 난다. (인수의 개수가 3개이기 때문에)

    empnoEMPNO
    enameENAME
    concatCONCATempnoEMPNO concatCONCAT(':' enameENAME)
)
    emp
EMP
    ename ENAME ='SCOTT'

;


-- || : 문자열 데이터 연결 연산자 (CONCAT 대신 사용)
    empno EMPNO| enameENAME
    empno
    EMPNO| |
    ':'| ename
ENAME
    emp
EMP
    ename ENAME ='SCOTT'

;



-- 9월 23일(목) 
-- 문자열 함수 : 공백 제거(기본)
-- TRIM : 양쪽 공백 제거
-- LTRIM : 왼쪽 공백 제거
-- RTRIM : 오른쪽 공백 제거

    SELECT     '    이것이     ' 공백공백
    ,TRIM('   이것이    ' ) 공백제거
공백제거
    dualDUAL

;

-- TRIM(삭제 옵션(선택), 삭제할 문자(선택), FROM 원본문자열) 
    SELECT
    '['| |TRIM( '_' FROM'__Oracle__'
    )| | ']' trimTRIM
    ,
    '['| |TRIM( LEADING '_' FROM'__Oracle__'
    )| | ']' trim_leadingTRIM_LEADING
    ,
    '['| |TRIM( TRAILING '_' FROM'__Oracle__'
    )| | ']' trim_trailingTRIM_TRAILING
    ,
    '['| |TRIM( BOTH '_' FROM'__Oracle__'
    )| | ']' trim_both
TRIM_BOTH
    dualDUAL

;

-- 숫자함수 : ROUND(숫자, 반올림 위치(선택))
--          TRUNC(숫자, 버림 위치(선택))
--          CEIL(숫자) : 입력된 숫자와 가장 가까운 큰 정수
--          FLOOR(숫자) : 입력된 숫자와 가장 가까운 작은 정수
--          MOD(숫자, 나눌 숫자) : 나머지 값

    roundROUND(1234.5678      ) roundROUND
    roundROUND(1234.5678 ,0   ) round0ROUND0
    roundROUND(1234.5678 ,1   ) round1ROUND1
    roundROUND(1234.5678 ,2   ) round2ROUND2
    roundROUND(1234.5678 , -1 ) round_minus1ROUND_MINUS1
    roundROUND(1234.5678 , -2 ) round_minus2
ROUND_MINUS2
    dualDUAL

;
    truncTRUNC(1234.5678      ) truncTRUNC
    truncTRUNC(1234.5678 ,0   ) trunc0TRUNC0
    truncTRUNC(1234.5678 ,1   ) trunc1TRUNC1
    truncTRUNC(1234.5678 ,2   ) trunc2TRUNC2
    truncTRUNC(1234.5678 , -1 ) trunc_minus1TRUNC_MINUS1
    truncTRUNC(1234.5678 , -2 ) trunc_minus2
TRUNC_MINUS2
    dualDUAL

;
    ceilCEIL(3.14)
    floorFLOOR(3.14)
    ceilCEIL( - 3.14)
    floorFLOOR( - 3.14
)
    dualDUAL

;
    modMOD(15 ,6)
    modMOD(10 ,2)
    modMOD(11 ,2
)
    dualDUAL

;

-- 날짜함수
-- SYSDATE : 오라클 데이터베이스 서버가 설치된 os의 현재 날짜와 시간
-- ADD_MONTH : 몇 개월 이후 날짜를 구하는 함수
    sysdate     SYSDATE nowNOW
    sysdate SYSDATE - 1 yesterdayYESTERDAY
    sysdate SYSDATE + 1 tomorrow
TOMORROW
    dualDUAL

;
    sysdateSYSDATE
    add_monthsADD_MONTHSsysdateSYSDATE ,3
)
    dualDUAL

;

-- 입사 20주년이 되는 날짜 조회
    enameENAME
    hiredateHIREDATE
    add_monthsADD_MONTHShiredateHIREDATE ,240
)
    empEMP

;

-- 현재 날짜를 기준으로 입사 38년 미만인 사원 조회
    enameENAME
    hiredate
HIREDATE
    emp
EMP
    add_monthsADD_MONTHShiredateHIREDATE ,480 ) sysdateSYSDATE

;

-- MONTHS_BETWEEN : 두 날짜 간의 개월 수 차이 구하기
    empnoEMPNO
    enameENAME
    hiredateHIREDATE
    sysdateSYSDATE
    months_betweenMONTHS_BETWEENhiredateHIREDATE sysdateSYSDATE        ) month1MONTH1
    months_betweenMONTHS_BETWEENsysdateSYSDATE hiredateHIREDATE        ) month2MONTH2
    truncTRUNCmonths_betweenMONTHS_BETWEENhiredateHIREDATE sysdateSYSDATE) ) month3
MONTH3
    empEMP

;
    
-- next_day(날짜, 요일문자)   
-- last_day(날짜)
    sysdateSYSDATE
    next_dayNEXT_DAYsysdateSYSDATE ,'월요일')
    last_dayLAST_DAYsysdateSYSDATE
)
    dualDUAL

;

-- 형변환 함수
-- TO_CHAR() : 숫자 또는 날짜 데이터를 문자 데이터로 변환
-- TO_NUMBER() : 문자 데이터를 숫자 데이터로 변환
-- TO_DATE() : 문자 데이터를 날짜 데이터로 변환

    sysdateSYSDATE
    to_charTO_CHARsysdateSYSDATE ,'YYYY/MM/DD' ) 현재날짜
현재날짜
    dualDUAL

;
    sysdateSYSDATE
    to_charTO_CHARsysdateSYSDATE ,'MM' ) 현재월
현재월
    dualDUAL

;
    sysdateSYSDATE
    to_charTO_CHARsysdateSYSDATE ,'MON' ) 현재월
현재월
    dualDUAL

;
    sysdateSYSDATE
    to_charTO_CHARsysdateSYSDATE ,'HH:MI:SS' ) 현재시간
현재시간
    dualDUAL

;
    sysdateSYSDATE
    to_charTO_CHARsysdateSYSDATE ,'HH12:MI:SS' ) 현재시간
현재시간
    dualDUAL

;
    sysdateSYSDATE
    to_charTO_CHARsysdateSYSDATE ,'HH24:MI:SS' ) 현재시간
현재시간
    dualDUAL

;

-- L(Locale) : 지역화폐 단위를 붙여서 출력
-- 9, 0 : 숫자의 한 자리를 의미함(9는 빈자리를 채우지 않고, 0은 빈자리를 채움)
    salSAL
    to_charTO_CHARsalSAL ,'$999,999' ) sal_$SAL_$
    to_charTO_CHARsalSAL ,'$000,000' ) sal_$2SAL_$2
    to_charTO_CHARsalSAL ,'L999,999' ) sal_l
SAL_L
    empEMP

;
    to_numberTO_NUMBER('1,300' ,'999,999'
)
    dualDUAL

;
    SELECTTO_DATE('2021-09-12' ,'YYYY-MM-DD' ) todate1TODATE1
    ,TO_DATE('20210912' ,'YYYY-MM-DD'   ) todate2
TODATE2
    dualDUAL

;


-- 날짜 데이터는 연산이 가능함
-- 1981-06-01 이후 입사자 조회 
    SELECT
*
    emp
EMP
    hiredate HIREDATE >TO_DATE('19810601' ,'YYYY-MM-DD')

;


-- null 처리 함수
-- NVL(데이터, 널이면 반환할 값)
    empnoEMPNO
    enameENAME
    salSAL
    commCOMM
    sal SAL comm
COMM
    empEMP

;
    empnoEMPNO
    enameENAME
    salSAL
    commCOMM
    sal SAL commCOMM
    nvlNVLcommCOMM ,0)
    sal SAL nvlNVLcommCOMM ,0
)
    empEMP

;

-- NVL2(데이터, 널이 아닐 경우 반환할 값, 널이면 반환할 값)
    empnoEMPNO
    enameENAME
    salSAL
    commCOMM
    nvl2NVL2commCOMM ,'O' ,'X')
    nvl2NVL2commCOMM sal SAL * 12 commCOMM sal SAL *12
)
    empEMP

;
    SELECT
*
    emp
EMP
    empno EMPNO =7369;

-- 9월 27일 (월)
-- DECODE 함수
-- DECODE([검사 대상이 될 열 또는 데이터], [조건1],[데이터가 조건1과 일치할 때 반환할 결과], 
--                                    [조건2],[데이터가 조건2과 일치할 때 반환할 결과],
--                                    .....
--                                   [위 조건들 중에서 일치한 경우가 없을 때 반환할 결과])

-- job에 따라 급여의 비율 설정
- job에 따라 급여의 비율 설정
select empno, ename, job, sal, decode(
    job,
    'MANAGER',
    sal * 1.1,
    'SALESMAN',
    sal * 1.05,
    'ALALYST',
    sal,
    sal * 1.03
) AS upsal
from emp;


-- CASE : DEOCODE 문으로 작성할 수 있는 것들은 모두 변환 가능
--        =의 의미로도 사용되지만 다른 조건도 가능하다
select empno, ename, job, sal, CASE
    job
   WHEN 'MANAGER' THEN sal * 1.1
   WHEN 'SALESMAN' THEN sal * 1.05 WHEN 'ALALYST' then sal else sal * 1.03 END AS upsal
from emp;

-- COMMISSION이 NULL이면 '해당사항 없음', '0'이면 '수당없음', '0보다 크면 '수당: 2500' 출력
SELECT EMPNO, ENAME, COMM 
    CASE 
    WHEN COMM IS NULL THEN '해당없음'
    WHEN comm = 0 THEN '수당없음'
    WHEN comm > 0 THEN '수당 : ' || COMM
END AS COMM_TEXT FROM EMP;

-- [ 실습 ] PPT 참조
SELECT EMPNO, ENAME, SAL, TRUNC(SAL/21.5, 2) AS day_pay,
ROUND(sal / 21.5 / 8, 1)AS TIME_PAY FROM EMP;

SELECT EMPNO, ENAME, HIREDATE, next_day(add_months(hiredate, 3), '월요일') AS r_job,
nvl(TO_CHAR(comm), 'N/A') AS comm FROM emp;

SELECT EMPNO, ENAME, MGR, 
decode(SUBSTR(TO_CHAR(MGR)1,2), 
NULL, '0000', 
 '75', '5555', 
 '76', '6666',
 '78', '7777', 
 '78' , '8888', 
SUBSTR(TO_CHAR(MGR),1))
as CHG_MGR 
FROM emp;

SELECT EMPNO, ENAME, MGR, 
CASE
WHEN MGR IS NULL THEN '0000'
WHEN (SUBSTR(TO_CHAR(MGR)1,2)= '75'THEN '5555' 
WHEN (SUBSTR(TO_CHAR(MGR)1,2)='76' THEN '6666'
WHEN (SUBSTR(TO_CHAR(MGR)1,2)= '78'THEN '7777'
WHEN (SUBSTR(TO_CHAR(MGR)1,2)= '78' THEN '8888'
ELSE TO_CHAR(MGR) END
as CHG_MGR 
FROM
emp;

-- 다중행 함수 : SUM(), COUNT(), AVG(), MAX(), MIN()
SELECT
    SUM(sal)
FROM
    emp;

-- EMP테이블의 데이터 개수 조회
SELECT
    COUNT(*)
FROM
    emp;

SELECT
    COUNT(sal)
FROM
    emp;

SELECT
    COUNT(DISTINCT sal)
FROM
    emp;

-- 부서번호가 10번인 사원의 최대 급여
SELECT
    MAX(sal)
FROM
    emp
WHERE
    deptno = 10;
-- 부서번호가 10번인 사원의 최대 급여
SELECT
    MIN(sal)
FROM
    emp
WHERE
    deptno = 10;

-- 부서번호가 20번인 사원 중에서 제일 오래된 입사일 조회
SELECT
    MIN(hiredate)
FROM
    emp
WHERE
    deptno = 20;

-- 부서번호가 30번인 사원들의 평균 급여 조회
SELECT
    AVG(sal)
FROM
    emp
WHERE
    deptno = 30;

SELECT
    avg(DISTINCT sal)
FROM
    emp
WHERE
    deptno = 30;

-- GROUP BY 그룹화할 열 지정(여러개 지정 가능)
-- 부서별 급여의 합 조회
SELECT
    SUM(sal),
    deptno
FROM
    emp
GROUP BY
    deptno
ORDER BY
    deptno;

-- 부서별 급여 평균 조회
SELECT
    AVG(sal),
    deptno
FROM
    emp
GROUP BY
    deptno
ORDER BY
    deptno;

-- 부서별, 직무별 급여 평균 조회
SELECT
    AVG(sal),
    deptno,
    job
FROM
    emp
GROUP BY
    deptno,
    job
ORDER BY
    deptno,
    job;

-- GROUP BY - HAVING 조건식
-- WHERE절에는 그룹함수를 사용할 수 없기 때문

-- 부서별, 직무별 급여 평균 조회(단, 급여의 평균이 2000이상)
SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno,
    job
HAVING
    AVG(sal) >= 2000
ORDER BY
    deptno,
    job;

SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
WHERE
    sal <= 3000
GROUP BY
    deptno,
    job
HAVING
    AVG(sal) >= 2000
ORDER BY
    deptno,
    job;

SELECT
    job,
    COUNT(*)
FROM
    emp
GROUP BY
    job
HAVING
    COUNT(job) >= 3;

SELECT
    to_char(hiredate, 'YYYY') AS hire_year,
    deptno,
    COUNT(*)                  AS cnt
FROM
    emp
GROUP BY
    to_char(hiredate, 'YYYY'),
    deptno;

-- 데이터 삽입, 삭제, 수정 : 결과는 실행된 행의 개수로 넘어온다.

-- 실습용 테이블 생성
CREATE TABLE dept_temp AS SELECT * FROM dept;

SELECT * FROM dept_temp;

-- INSERT : 데이터 삽입
-- INSERT INTO 테이블명(필드명 ....) VALUES(값1, 값2...)
-- insert into 테이블명 values(값1, 값2...) <- 필드명 생략 가능
-- insert를 하고 나면 commit 을 해야 한다.

INSERT INTO dept_temp(
    deptno,
    dname,
    loc
) VALUES (
    50,
    'DATABASE',
    'SEOUL'
);

insert into dept_temp values(60, 'NETWORK', 'BUSAN');

-- null을 삽입하는 방법
insert into dept_temp(deptno, dname) values(90, 'DATABASE');

insert into dept_temp(deptno, dname, LOC) values(91,'WEB',NULL);
insert into dept_temp(deptno, dname, LOC) values(92, 'MOBILE', '');

commit;

-- 9월 28일 오전

-- 실습용 테이블 생성
-- 테이블 구조는 복사하되, 데이터는 복사하고 싶지 않을 때
CREATE TABLE emp_temp AS SELECT * FROM emp where 1<>1;

select * from emp_temp;

-- description 
desc emp_temp;

insert into emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values(1111, '홍길동', 'manager', null, '2021-09-27', 4000, null, 10);

insert into emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values(2222, '성춘향', 'analyst', null, '2021-09-27', 5000, null, 10);

insert into emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values(3333, '박보검', 'analyst', null, sysdate, 5000, null, 10);

select * from emp_temp;

commit;

-- UPDATE : 수정
-- UPDATE 테이블명 SET 변경할 열 = 변경할 값, 변경할 열 = 변경할 값...
-- UPDATE 테이블명 SET 변경할 열 = 변경할 값, 변경할 열 = 변경할 값... WHERE 수정할 조건

SELECT * FROM dept_temp;

UPDATE dept_temp 
SET LOC = 'SEOUL' WHERE deptno = 90;

UPDATE dept_temp
SET LOC = 'BUSAN' WHERE deptno = 91;

COMMIT;

SELECT * FROM emp_temp;

-- SAL이 4000이하인 사원만 추가 수당을 50으로 변경
UPDATE emp_temp
SET COMM = 50 
WHERE SAL <= 4000;

COMMIT;

UPDATE emp_temp
SET sal = 1500
WHERE empno = 7369;


-- DELETE : 삭제
-- DELETE 테이블 이름 WHERE 삭제할 데이터 조건
-- DELETE FROM 테이블 이름 WHERE 삭제할 데이터 조건

CREATE TABLE emp_temp2 AS SELECT * FROM emp;
SELECT * FROM emp_temp2;

-- JOB이 MANAGER인 사원 삭제
DELETE emp_temp2
WHERE JOB ='MANAGER';

-- 전체 사원 삭제
DELETE EMP_TEMP2;    -- 내용 없이 구조만 남아있게 된다.

ROLLBACK;

-- 조인JOIN : 두 개 이상의 테이블을 연결하여 하나의 테이블처럼 출력할 때 사용하는 방식
-- 내부조인(INNER JOIN) : 등가 조인, 단순 조인으로 부르기도 함 (교집합 영역만 뽑아냄)
-- 외부조인(OUTER JOIN)

SELECT COUNT(*) FROM emp;
SELECT COUNT(*) FROM dept;

-- 카테시안 조인 : 나올 수 있는 모든 조합
SELECT *
FROM emp, dept;

-- 내부조인(INNER조인)
-- 등가조인 : 일치하는 데이터 추출
-- 비등가조인 : 특정 범위에 있는 데이터 추출

SELECT *
FROM emp, dept
WHERE emp.deptno = dept.deptno;

SELECT empno, ename, emp.deptno, dname
FROM emp, dept
WHERE emp.deptno = dept.deptno;

SELECT empno, ename, emp.deptno, dname
FROM emp, dept
WHERE emp.deptno = dept.deptno
ORDER BY dname;

-- 테이블 별칭 설정
SELECT empno, ename, e.deptno, dname
FROM emp e, dept d
WHERE e.deptno = d.deptno
ORDER BY dname;

-- SAL 3000 이상인 사원들의 사번, 이름, 부서번호, 부서명, 급여
SELECT empno, ename, d.deptno, dname, sal
FROM emp e, dept d
WHERE e.deptno = d.deptno AND sal >=3000;

-- 급여가 2500 이하이고, 사원번호가 9999 이하인 사원의 사번, 이름, 급여, 부서명, 부서 위치
SELECT empno, ename, sal, dname, loc
FROM emp e, dept d
WHERE e.deptno = d.deptno AND sal <=2500 AND empno <=9999;

-- 28일 오전 끝









-- 9월 28일 오후

-- 비등가 조인
-- 공통된 칼럼이 없는 경우 

-- emp테이블의 급여가 salgrade 특정 범위에 속하면 grade값 조회
select * from salgrade;
select * from emp;

select *
from emp e, salgrade s
where e.sal between s.losal and s.hisal;

-- 자체 조인(셀프 조인) : 본인 자신의 테이블과 다시 한 번 조인
select * from emp;
select e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno;

-- 외부조인(outer join)
-- 왼쪽 외부 조인(left outer join) : 일치하지 않는 것이 있어도 기준은 왼쪽 테이블이 기준이 된다.
select e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno(+);

-- 오른쪽 외부 조인(right outer join)
select e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
from emp e1, emp e2
where e1.mgr(+) = e2.empno;

-- 양쪽 외부 조인(+ 기호는 제공 안 함)

-- 모든 데이터 베이스에서 사용 가능한 표준 조인 구문

-- JOIN~ON
SELECT empno, ename, emp.deptno, dname
FROM emp JOIN dept ON emp.deptno = dept.deptno
ORDER BY dname;

select empno, ename, d.deptno, dname, sal
from emp e join dept d on e.deptno = d.deptno
where sal >= 3000;

select *
from emp e join salgrade s
on e.sal between s.losal and s.hisal;

-- outer 표준 구문
select e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
from emp e1 left outer join emp e2 on e1.mgr = e2.empno;

select e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
from emp e1 right outer join emp e2 on e1.mgr = e2.empno;

select e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
from emp e1 full outer join emp e2 on e1.mgr = e2.empno;







-- 실습1
select emp.deptno, dname, empno, ename, sal from emp 
join dept on emp.deptno = dept.deptno where sal>2000 order by deptno;

select deptno, dname, empno, ename, sal
from dept d, emp e 
where d.deptno = e.deptno and sal > 2000;

-- 실습 2
select emp.deptno, dname, avg(sal)as avg_sal, max(sal)as max_sal, count(*) as cnt from emp join dept 
on emp.deptno = dept.deptno;

select d.deptno, dname, floor(avg(sal)) as avg_sal, max(sal)as max_sal, min(sal)as min_sal, count(*) as cnt
from emp e, dept d
where e.deptno = d.deptno
group by d.deptno, dname;

select d.deptno, dname, floor(avg(sal)) as avg_sal, max(sal)as max_sal, min(sal)as min_sal, count(*) as cnt
from emp e join dept d
on e.deptno = d.deptno
group by d.deptno, dname;


select d.deptno, dname, empno, ename, job, sal from emp e, dept d
where d.deptno = e.deptno order by deptno;

select d.deptno, dname, empno, ename, job, sal
from dept d left outer join emp e on d.deptno = e.deptno
order by d.deptno,
e.empno;

-- 세 개의 테이블 연결하기(조인하기)  
SELECT
    *
FROM
    emp e1,
    emp e2,
    emp e3
WHERE
        e1.empno = e2.empno
    AND e1.empno = e3.empno;

SELECT
    *
FROM
         emp e1
    JOIN emp e2 ON e1.empno = e2.empno
    JOIN emp e3 ON e2.empno = e3.empno;
-- e1, e2, e3 다 emp인데 왜 dept랑 salgrade 테이블이 오는지 모르겠다..


SELECT
    d.deptno,
    dname,
    e1.empno,
    e1.ename,
    e1.mgr,
    e1.sal,
    losal,
    hisal,
    grade,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp      e1,
    dept     d,
    salgrade s,
    emp      e2
WHERE
        e1.deptno (+) = d.deptno
    AND e1.sal BETWEEN s.losal (+) AND s.hisal (+)
        AND e1.mgr = e2.empno (+)
ORDER BY
    d.deptno,
    e.ename;



SELECT
    d.deptno,
    dname,
    e1.empno,
    e1.ename,
    e1.mgr,
    e1.sal,
    losal,
    hisal,
    grade,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
         emp e1
    right outer JOIN dept d ON e1.deptno = d.deptno
    right outer JOIN salgrade ON e1.sal BETWEEN s.losal  AND s.hisal
    left outer JOIN emp ON e1.mgr = e2.empno
ORDER BY
    d.deptno,
    e.ename;

-- 9월29일(수)
-- 서브쿼리 : sql문을 실행하는데 필요한 데이터를 추가로 조회하기 위해 sql문
--          내부에서 사용하는 select문을 말함
--          연산자와 같은 비교 또는 조회 대상의 오른쪽에 놓여서 괄호로 묶어서 사용
--          서브쿼리의 SELECT 절에 명시한 열은 메인쿼리의 비교 대상고 같은 자료형과 같은 개수로 지정

-- JONES 사원의 급여보다 높은 급여를 받는 사원 조회
-- 1. JONES 사원의 급여 조회
SELECT SAL FROM EMP WHERE ENAME = 'JONES';  -- 2975
-- 2975보다 큰 사원 조회
SELECT * FROM EMP WHERE SAL > 2975;

-- 단일행 서브쿼리
-- 서브쿼리의 결과가 단 하나의 행으로 나오는 경우
-- >, >=, = <=, <>, ^=, != 
SELECT * FROM EMP WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'JONES');

-- ALLEN 사원의 추가 수당보다 많은 추가 수다을 받는 사원 조회
SELECT * FROM EMP WHERE COMM > (SELECT COMM FROM EMP WHERE ENAME = 'ALLEN');

-- WARD사원의 입사일보다 빨리 입사한 사원 목록 조회
SELECT * FROM EMP WHERE HIREDATE < (SELECT HIREDATE WHERE ENAME = 'WARD');

-- 20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는 사원 정보(사원번호, 사원명, 
-- 직업, 금여)와 소속부서정보(부서정보, 부서명 부서위치)를 조회
-- JOIN과 서브쿼리를 동시에 사용
SELECT EMPNO, ENAME, JOB, SAL JOIN, D.DEPTNO, DNAME, LOC FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND D.DEPTNO = 20 AND E.SAL > (SELECT AVG(SAL) FROM EMP);


-- 다중행 서브쿼리
-- 서브쿼리 실행 결과가 여러개로 나오는 경우
-- IN : 메인쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치하면 true
-- ANY(SOME): 메인 쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 true
-- ALL : 메인쿼리의 조건식을 서브쿼리의 결과 모두 만족하면 true
-- EXISTS : 서브쿼리의 결과가 존재하면(행 1개 이상 존재) true

-- 부서별 최고 급여보다 큰 사원 조회
-- SELECT * FROM EMP WHERE SAL > (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);
-- 단일 행 하위 질의에 2개 이상의 행이 리턴되었습니다.

-- 부서별 최고 급여와 같은 사원 조회
SELECT * FROM EMP WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

-- ANY(SOME)
SELECT * FROM EMP WHERE SAL = ANY (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

-- 30번 부서 사원들의 최고급여보다 적은 사원 조회
SELECT * FROM EMP WHERE SAL  < ANY (SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 30);

SELECT * FROM EMP WHERE SAL  < ANY (SELECT SAL FROM EMP WHERE DEPTNO = 30);

-- ALL
-- 30번ㅜ부서 사원들의 최고급여보다 적은 사원 
SELECT * FROM EMP WHERE SAL  < ALL (SELECT SAL FROM EMP WHERE DEPTNO = 30);

SELECT * FROM EMP WHERE SAL  > ALL (SELECT SAL FROM EMP WHERE DEPTNO = 30);

-- EXISTS
SELECT * FROM EMP WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO = 10);

-- 전체 사원 중 ALLEN과 같은 직책인 사원들의 사원정보, 부서정보 출력하기
-- ENAME, EMPNO, JOB, SAL, DEPTNO, DNAME 출력
SELECT ENAME, EMPNO, JOB, SAL, D.DEPTNO, D.DNAME FROM EMP E, DEPT D 
WHERE E.DEPTNO = D.DEPTNO AND E.JOB = (SELECT JOB FROM EMP WHERE ENAME = 'ALLEN');

-- 전체 사원의 평균 급여보다 높은 급여를 받는 사원들의 사원정보, 부서정보, 급여등급 출력하기
-- 급여가 많은 순으로 정렬하되 급여가 같은 경우에는 사원번호를 오름차순으로 정렬)
SELECT ENAME, EMPNO, JOB, SAL, D.DEPTNO, D.DNAME, S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO = D.DEPTNO AND E.SAL 
BETWEEN S.LOSAL AND S.HISAL AND E.SAL > (SELECT AVG(SAL) FROM EMP)
ORDER BY E.SAL DESC, E.EMPNO ASC;

-- 비교할 열이 여러 개인 다중열 서브쿼리
SELECT * FROM EMP WHERE (DEPTNO,SAL) IN (SELECT DEPTNO, MAX(SAL) FROM EMP GROUPBY DEPTNO);

-- FROM 서브쿼리(인라인 뷰)
SELECT EMPNO, ENAME, D.DEPTNO, DANME, LOC
FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10, (SELECT * FROM DEPT) D 
WHERE E10.DEPTNO = D.DEPTNO;

-- INSERT 사용하는 서브쿼리 
-- VALUES 절은 사용하지 않음
-- 데이터가 추가되는 테이블의 열 개수와 서브쿼리의 열 개수가 일치해야 한다.

-- EMP 테이블에서 SALGRADE 테이블을 참조하여 급여 등급이 1인 사원만을 EMP_TEMP
-- 에 추가하기
SELECT * 
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE = 1;


-- 트랜잭션
-- 하나의 단위로 데이터를 처리

CREATE TABLE DEPT_TCL AS SELECT *FROM DEPT;

SELECT * FROM DEPT_TCL;

-- 트랜잭션과 관련있는 명령어 실행
INSERT INTO DEPT_TCL VALUES(50,'DATABASE','SEOUL');

UPDATE DEPT_TCL SET LOC = 'BUSAN' WHERE DEPTNO = 40;
 
DELETE FROM DEPT_TCL WHERE DNAME = 'RESEARCH';
 
----------------

-- 수행된 명령 취소
ROLLBACK;

-- 수행된 명령 최종 반영
COMMIT;

SELECT * FROM DEPT_TCL;

-- 세션 : 어떤 활동을 위한 시간이나 기간
--       데이터베이스 접속을 시작으로 여러 데이터베이스에서 관련 작업을 수행한 수 
--       접속을 종료하기까지 전체 기간

DELETE FROM DEPT_TCL WHERE DEPTNO = 30;
SELECT * FROM DEPT_TCL;

COMMIT;

UPDATE DEPT_TCL
SET LOC = 'SEOUL'
WHERE DEPTNO = 10;























INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO 
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE = 1;

-- UPDATE 서브쿼리
SELECT * FROM dept_temp;

-- 40번 부서의 부서 이름과 지역 수정(dept 테이블의 deptno = 30인 지역명, 부서명 추출)

select dname, loc
from dept
where deptno = 30;

update dept_temp
set (dname, loc) = (select dname, loc from dept where deptno = 30) where deptno = 40;

update dept_temp
set loc = 'SEOUL'
where deptno = (select deptno from dept_temp where dname = 'ACCOUNTING');

-- DELETE 서브쿼리
SELECT * FROM EMP_TEMP;

-- 급여 등급이 3등급이고 30번 부서인 사원들만 삭제
DELETE EMP_TEMP 
WHERE EMPNO IN (SELECT EMPNO 
                FROM EMP_TEMP E, SALGRADE S
                WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE = 3 AND DEPTNO = 30);

-- 
CREATE TABLE exam_emp as select *from emp;

-- dept 테이블의 내용을 이용하여 exam_dept 생성
create table exam_dept as select *from dept;

create table exam_salgrede as select *from salgreade;

insert into exam_emp values(7201, 'test-user1', 'manager', 7788, '2016-01-02',4500,null,50);
insert into exam_emp values(7202, 'test-user2', 'clerk', 7201, '2016-02-21',1800,null,50);
insert into exam_emp values(7203, 'test-user3', 'analyst', 7201, '2016-04-11',3400,null,60);
insert into exam_emp values(7204, 'test-user4', 'saleman', 7201, '2016-05-31',2700,300,60);
insert into exam_emp values(7205, 'test-user5', 'clerk', 7201, '2016-07-20',2600,null,70);
insert into exam_emp values(7206, 'test-user6', 'clerk', 7201, '2016-09-08',2600,null,70);
insert into exam_emp values(7207, 'test-user7', 'lecturer', 7201, '2016-10-28',2300,null,80);
insert into exam_emp values(7208, 'test-user8', 'student', 7201, '2016-03-09',1200,null,80);

-- EXAM_EMP에 속한 사원 중 50번 부서에서 근무하는 사원들의 평균 급여보다 많은 급여를 받고 있는 사원들을
-- 70번 부서로 옮기는 SQL 문 작성하기
update exam_emp
set deptno = 70
where sal > (select avg(sal) from exam_emp where deptno = 50);

-- EXAM_EMP에 속한 사원 중 
-- 60번 부서의 사원 중에서 입사일이 가장 빠른 사원보다 늦게 입사한 사원의 급여를 10% 인상하고 
-- 80번 부서로 옮기는 SQL 문 작성하기

update exam_emp
set sal = sal *1.1, deptno = 80
where HIREDATE > (select min(HIREDATE) from exam_emp where deptno=60);

-- EXAM_EMP에 속한 사원 중, 급여 등급이 5인 사원을 삭제하는 SQL문을 작성하기
DELETE FROM exam_emp
where empno in 
(select empno from exam_emp, salgrade 
where sal between losal and hisal and grade = 5);

select * from dept_temp;

-- 10월 1일 오후
-- DDL(데이터 정의어)
-- 객체를 생성, 변경, 삭제
-- 실행하면 반영됨

-- CREATE(생성) ALTER(변경), DROP(삭제)
-- CREATE TABLE 테이블이름(
--        필드명1 자료형,
--        필드명2 자료형, 
-- )

-- 테이블 이름 규칙
-- 문자로 시작(영어 권장)
-- 같은 사용자 안에서 동일한 테이블 명 사용 불가
-- SQL 키워드는 테이블 이름으로 사용할 수 없음

-- 필드명 생성 규칙
-- 문자로 시작
-- 열 이름은 중복되면 안 됨
-- SQL키워드 사용 불가

-- 자료형 : 숫자 NUMBER, 가변문자 VARCHR2, 날짜 DATE...

CREATE TABLE EMP_DDL(
    EMPNO NUMBER(4),   -- 숫자로 4자리 허용
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),  -- 숫자로 7자리, 소수점 2자리 허용
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2)
);

DESC EMP_DDL;

DROP TABLE emp_ddl;

CREATE TABLE dept_ddl AS SELECT *FROM dept;
 
-- 구조 + 데이터 이용하여 생성
CREATE TABLE dept_ddl_30 AS SELECT *FROM dept WHERE deptno =30;

-- 다른 테이블의 구조만 복사하여 새 테이블 생성
CREATE TABLE dept_ddl2 AS SELECT *FROM dept WHERE 1<>1;
SELECT * FROM dept_ddl2;

-- ALTER : 이미 생성된 객체를 변경
CREATE TABLE EMP_ALTER AS SELECT * FROM EMP;

-- 새로운 칼럼(열) 추가 : ADD
DESC EMP_ALTER;

ALTER TABLE EMP_ALTER ADD HP VARCHAR2(20);

SELECT * FROM EMP_ALTER;

-- RENAME : 열 이름을 변경
ALTER TABLE EMP_ALTER RENAME COLUMN HP TO TEL;
DESC EMP_ALTER;

-- MODIFY : 열의 자료형을 변경
ALTER TABLE EMP_ALTER MODIFY EMPNO NUMBER(5);

-- DROP : 열 삭제
ALTER TABLE EMP_ALTER DROP COLUMN TEL;

-- 테이블 이름 변경
RENAME EMP_ALTER TO EMP_RENAME;

DESC EMP_RENAME;

-- 테이블 데이터를 삭제 TRUNCATE
SELECT * FROM EMP_RENAME;
TRUNCATE TABLE EMP_RENAME;

-- 실습1 
CREATE TABLE member(
    id CHAR(8),
    name VARCHAR2(10),
    addr VARCHAR2(50),
    nation CHAR(4),
    email VARCHAR2(50),
    age NUMBER(7,2)
    );

DESC member;

ALTER TABLE member ADD BIGO VARCHAR2(20);

ALTER TABLE member MODIFY BIGO VARCHR2(30);

ALTER TABLE member RENAME COLUMN BIGO TO REMARK; 

-- 10월 5일 화요일
-- 뷰(VIEW) : 가상테이블
-- 목적 : 편리성(Select 문의 복잡도를 완화)
--       보안성(테이블의 특정 열을 노출하고 싶지 않을 경우)

-- CREATE [OR REPLACE] VIEW 뷰이름 (열이름1, 열이름2...)
-- AS (저장할 SELECT문)

-- 뷰 생성
CREATE VIEW vm_emp20 AS (SELECT empno, ename, job, deptno FROM emp WHERE deptno=20);

SELECT * FROM vm_emp20;

-- EMP  테이블의 전체 내용을 이용해 view  생성
create view vm_empall as select * from emp;

-- vm_empall에 있는 특정 사원 정보를 수정
select * from vm_empall;

update vm_empall
set job = 'salesman'
where empno=7369;

insert into  vm_empall values(6666, 'KIM', 'MANAGER', NULL, '20/10/05', NULL,20);

-- 뷰 생성(수정 불가)
CREATE VIEW VM_EMP30READ AS SELECT EMPNO, ENMAE,JOB FROM EMP WHREE DEPTNO=30 WITH READ ONLY;

select * from emp;

-- 뷰 삭제
DROP VIEW vm_empall;

-- 시퀀스(수업에서 자주 사용)
-- 오라클 데이터베이스에서만 존재
-- 특정 규칙에 맞는 연속 숫자 생성
CREATE SEQUENCE SEQ_DEPT_SEQUENCE
INCREMENT BY 10  -- 옵션 (기본값은 1)
START WITH 10    -- 옵션 (기본값은 1)
MAXVALUE 90      -- 옵션 (기본값은 10의 27제곱)
MINVALUE 0       -- 옵션 (기본값은 1)
NOCYCLE CACHE 2; -- 옵션(CYCLE OR NOCYCLE, CACHE <- 미리 발급해 놓을 수)

-- DEPT 테이블에서 부서 번호를 10으로 시작해서 90까지 넣고 싶을 때
CREATE TABLE DEPT_SEQUENCE AS SELECT * FROM DEPT WHERE 1<>1;

INSERT INTO dept_sequence(DEPTNO, DNAME, LOC)
VALUES(SEQ_DEPT_SEQUENCE.nextval, 'DATABASE', 'SEOUL');

SELECT * FROM dept_sequence;

-- 시퀀스 수정
ALTER SEQUENCE SEQ_DEPT_SEQUENCE
INCREMENT BY 3
MAXVALUE 99
CYCLE;

-- 시퀀스 삭제 
DROP SEQUENCE SEQ_DEPT_SEQUENCE;

-- 인덱스 : 빠른 검색 가능
-- 데이터 검색 Table Full Scan, Index Scan

--  인덱스 생성
CREATE INDEX idx_emp_sal
ON emp(sal); -- SQL튜닝

-- 제약조건을 사용한 테이블 생성
CREATE TABLE userTBL(
userid char(8) not null primary key,
username varchar(10) not null);

-- 인덱스 삭제 
DROP INDEX idx_emp_sal;

-- 실습문제

-- 문1) 
CREATE TABLE EMPIDX AS SELECT * FROM EMP;
CREATE INDEX IDX_EMPIDX_EMPNO ON EMPIDX(EMPNO);

-- 문2)
CREATE VIEW EMPIDX_OVER15K AS (SELECT empno, ename, job, deptno, sal, comm from EMPIDX WHERE sal > 1500);
SELECT * FROM EMPIDX_OVER15K;

-- 문3)
CREATE TABLE DEPTSEQ AS SELECT * FROM DEPT;

CREATE SEQUENCE SEQ_DEPTSEQ_SEQUENCE
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 99
NOCYCLE NOCACHE;

INSERT INTO DEPTSEQ VALUES(SEQ_DEPTSEQ_SEQUENCE.NEXTVAL, 'database','seoul');
INSERT INTO DEPTSEQ VALUES(SEQ_DEPTSEQ_SEQUENCE.NEXTVAL, 'web', 'busan');
INSERT INTO DEPTSEQ VALUES(SEQ_DEPTSEQ_SEQUENCE.NEXTVAL, 'moblie', 'ilsan');

-- 제약조건
-- 데이터 무결성 유지를 위함

-- 1) NOT NULL : NULL의 저장을 허용하지 않음
CREATE TABLE TABLE_NOTNULL(
    LOGIN_ID VARCHAR2(20) NOT NULL,
    LOGIN_PwD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20));

-- INSERT INTO TABLE_NOTNULL VALUES('TEST_01', NULL, '010-1234-5678');

INSERT INTO TABLE_NOTNULL (LOGIN_ID, LOGIN_PwD) VALUES('TEST_01', 'TEST_01');
-- TEL은 NOT NULL이 아니기 때문에 값을 주지 않아도 생성이 가능하다.

UPDATE TABLE_NOTNULL
SET LOGIN_PwD = NULL
WHERE LOGIN_ID = 'TEST_01';

-- 제약조건 이름 지정
CREATE TABLE TABLE_NOTNULL2(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLNN2_LGNID_NN NOT NULL,
    LOGIN_PwD VARCHAR2(20) CONSTRAINT TBLNN2_LGNPwD_NN NOT NULL,
    TEL VARCHAR2(20));

-- 제약조건 확인
-- 현재 데이터베이스에 접속한 사용자가 소유한 객체 정보 : USER_로 시작
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='TABLE_NOTNULL2';

-- 이미 생성한 테이블에 제약 조건 지정
-- TABLE_NOTNULL에 TEL칼럼에 NOT NULL추가
-- 오류 보고 -
-- ORA-02296: (C##SCOTT.) 사용으로 설정 불가 - 널 값이 발견되었습니다.
SELECT * FROM TABLE_NOTNULL;
ALTER TABLE TABLE_NOTNULL MODIFY(TEL NOT NULL);

-- UPDATE를 통해 기존의 NULL 컬럼을 제거
UPDATE TABLE_NOTNULL
SET TEL='010-1234-5678'
WHERE LOGIN_ID = 'TEST_01';

SELECT * FROM TABLE_NOTNULL2;

ALTER TABLE TABLE_NOTNULL2 MODIFY(TEL CONSTRAINT TBLNN_TEL_NN NOT NULL);

-- 제약 조건 이름 변경
ALTER TABLE TABLE_NOTNULL2 RENAME CONSTRAINT TBLNN_TEL_NN TO TBLNN2_TEL_NN;

-- 제약 조건 삭제
ALTER TABLE TABLE_NOTNULL2 DROP CONSTRAINT TBLNN2_TEL_NN;

-- 2) UNIQUE : 중복되지 않는 값 / 중복을 허락하고 싶지 않다면 사용
CREATE TABLE TABLE_UNIQUE(
    LOGIN_ID VARCHAR2(20) UNIQUE,
    LOGIN_PwD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20));

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='TABLE_UNIQUE';

INSERT INTO TABLE_UNIQUE
VALUES('TEST_ID_01', 'PWD081', '010-1234-5678');

INSERT INTO TABLE_UNIQUE
VALUES('TEST_ID_01', 'PWD082', '010-1234-5679');
-- 오류 보고 -
-- ORA-00001: 무결성 제약 조건(C##SCOTT.SYS_C007784)에 위배됩니다

INSERT INTO TABLE_UNIQUE
VALUES(NULL, 'PWD082','010-1234-5679');
-- UNIQUE에는 NULL삽입이 가능

CREATE TABLE TABLE_UNIQUE2(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLUNQ2_LGID_UNQ UNIQUE,
    LOGIN_PwD VARCHAR2(20) CONSTRAINT TBLUNQ2_LGPwD_UNQ NOT NULL,
    TEL VARCHAR2(20));

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME LIKE 'TABLE_UNIQUE%';

ALTER TABLE TABLE_UNIQUE MODIFY(TEL UNIQUE);

-- 3) PRIMARY KEY : NOT NULL + UNIQUE
--                : 테이블 당 하나만 존재
--                : 인덱스 자동 생성
--                : 각 행을 식별하는 용도로 사용
CREATE TABLE TABLE_PK(
    LOGIN_ID VARCHAR2(20) PRIMARY KEY,
    LOGIN_PwD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20));

INSERT INTO TABLE_PK 
VALUES('TEST_01', 'PWD01','010-1234-7896');

INSERT INTO TABLE_PK 
VALUES('TEST_01', 'PWD02','010-1234-7896');
-- 무결성 제약 조건(C##SCOTT.SYS_C007789)에 위배됩니다.

CREATE TABLE TABLE_PK2(
    LOGIN_ID VARCHAR2(20) PRIMARY KEY,
    LOGIN_PwD VARCHAR2(20) PRIMARY KEY,
    TEL VARCHAR2(20));
-- 테이블에는 하나의 기본 키만 가질 수 있습니다.
-- PRIMARY KEY(기본 키)는 테이블 하나에 한 개씩 가능

CREATE TABLE TABLE_PK2(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLPK2_LGIN_PK PRIMARY KEY,
    LOGIN_PwD VARCHAR2(20) CONSTRAINT TBLPK2_LGPwD_NN NOT NULL,
    TEL VARCHAR2(20));

-- 제약조건을 지정하는 다른 방식
CREATE TABLE TABLE_CON(
    COL1 VARCHAR2(20),
    COL2 VARCHAR2(20),
    COL3 VARCHAR2(20),
    PRIMARY KEY(COL1),
    CONSTRAINT TBLCON_UNIQUE UNIQUE(COL2));
    
-- 4) FOREIGN KEY : 외래키
--                : 서로 다른 테이블 간 관계 정의
--                : 특정 테이블에서 PK제약 조건을 지정한 열을 다른 테이블 특정 열에서 참조
CREATE TABLE DEPT_FK(
    DEPTNO NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13));
    
CREATE TABLE EMP_FK(
    EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK(DEPTNO));

INSERT INTO EMP_FK 
VALUES(9999, 'TEST_NAME','TEST_JOB', NULL, '21-10-05', 3000, NULL, 10);
-- 무결성 제약조건(C##SCOTT.EMPFK_DEPTNO_FK)이 위배되었습니다- 부모 키가 없습니다

-- 외래 키 수행순서
-- 부모 테이블에 해당하는 데이터 삽입
-- 자식 테이블 데이터 삽입

INSERT INTO DEPT_FK VALUES(10, 'DATABASE', 'SEOUL');

DELETE FROM DEPT_FK WHERE DEPTNO = 10;
-- 무결성 제약조건(C##SCOTT.EMPFK_DEPTNO_FK)이 위배되었습니다- 자식 레코드가 발견되었습니다.

-- 외래 키 참조 행 데이터 삭제
-- 자식 테이블에 해당하는 데이터를 먼저 삭제
-- 부모 테이블에 해당하는 데이터 삭제

DELETE FROM EMP_FK WHERE DEPTNO = 10;
DELETE FROM DEPT_FK WHERE DEPTNO = 10;

-- 데이터 삭제 시 삭제할 데이터를 참조하는 처리를 어떻게 할 것인지 결정
-- ON DELETE CASCADE : 열 데이터 삭세 시 이 데이터를 참조하고 있는 데이터도 함께 삭제시킴

CREATE TABLE DEPT_FK2(
    DEPTNO NUMBER(2) CONSTRAINT DEPTFK2_DEPTNO_PK PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13));
    
CREATE TABLE EMP_FK2(
    EMPNO NUMBER(4) CONSTRAINT EMPFK2_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) CONSTRAINT EMPFK2_DEPTNO_FK REFERENCES DEPT_FK2(DEPTNO)
    ON DELETE CASCADE);

INSERT INTO DEPT_FK2 VALUES(10, 'DATABASE', 'SEOUL');

INSERT INTO EMP_FK2 
VALUES(9999, 'TEST_NAME','TEST_JOB', NULL, '21-10-05', 3000, NULL, 10);

DELETE FROM DEPT_FK2 WHERE DEPTNO = 10;
-- 부모키 먼저 삭제 가능해짐

SELECT * FROM DEPT_FK2;
SELECT * FROM EMP_FK2;

-- ON DELETE SET NULL : 열 데이터를 삭제할 때 이 데이터를 참조하는 데이터를 NULL로 수정해라
CREATE TABLE EMP_FK_3(
    EMPNO NUMBER(4) CONSTRAINT EMPFK_3_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) CONSTRAINT EMPFK_3_DEPTNO_FK REFERENCES DEPT_FK2(DEPTNO)
    ON DELETE SET NULL);

INSERT INTO DEPT_FK2 VALUES(10, 'DATABASE', 'SEOUL');

INSERT INTO EMP_FK_3
VALUES(9999, 'TEST_NAME','TEST_JOB', NULL, '21-10-05', 3000, NULL, 10);

SELECT * FROM DEPT_FK2;
SELECT * FROM EMP_FK_3;

DELETE FROM DEPT_FK2 WHERE DEPTNO = 10;

-- 5) CHECK : 열에 저장할 수 있는 값의 범위 또는 패턴 정의
--          : ex. 시간 0~23 
CREATE TABLE TABLE_CHECK(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLCK_LGIN_PK PRIMARY KEY,
    LOGIN_PwD VARCHAR2(20) CONSTRAINT TBLCK_LGPwD_NN CHECK (LENGTH(LOGIN_PwD) >3),
    TEL VARCHAR2(20));

INSERT INTO TABLE_CHECK VALUES('TEST_ID', '123', '010-1234-5678');

INSERT INTO TABLE_CHECK VALUES('TEST_ID', '1234', '010-1234-5678');

-- 기본값을 지정 DEFAULT
-- 특정 열에 저장할 값이 지정되지 않았을 경우에 입력되는 기본값
CREATE TABLE TABLE_DEFAULT(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLDF_LGIN_PK PRIMARY KEY,
    LOGIN_PwD VARCHAR2(20) DEFAULT '1234',
    TEL VARCHAR2(20));

INSERT INTO TABLE_DEFAULT(LOGIN_ID, LOGIN_PwD)
VALUES('TEST_ID', 'TEST_ID');

INSERT INTO TABLE_DEFAULT(LOGIN_ID, TEL)
VALUES('TEST_ID2', '010-5689-1234');

INSERT INTO TABLE_DEFAULT(LOGIN_ID, LOGIN_PwD, TEL)
VALUES('TEST_ID3', NULL, '010-1234-1234');

SELECT * FROM TABLE_DEFAULT;

-- 실습

-- DEPT_CONST테이블 생성
CREATE TABLE DEPT_CONST(
    DEPTNO NUMBER(2) CONSTRAINT DEPTCONST_DEPTNO_PK PRIMARY KEY,
    DNAME VARCHAR2(14) CONSTRAINT DEPTCONST_DNAME_UNQ UNIQUE,
    LOC VARCHAR2(13) CONSTRAINT DEPTCONST_LOC_NN NOT NULL);

-- EMP_CONST 테이블 생성
CREATE TABLE EMP_CONST(
    EMPNO NUMBER(2) CONSTRAINT EMPCONST_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10) CONSTRAINT EMPCONST_ENAME_NN NOT NULL,
    JOB VARCHAR2(9),
    TEL VARCHAR2(20) CONSTRAINT EMPCONST_TEL_UNQ UNIQUE,
    HIREDATE DATE,
    SAL NUMBER(7,2) CONSTRAINT EMPCONST_SAL_CHK CHECK(SAL BETWEEN 1000 AND 9999),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) CONSTRAINT EMPCONST_DEPTNO_FK REFERENCES DEPT_CONST(DEPTNO));







