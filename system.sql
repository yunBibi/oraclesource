alter session set "_ORACLE_SCRIPT" = true;

-- 새로운 사용자 생성
create user c##scott IDENTIFIED BY tiger
default tablespace users
TEMPORARY TABLESPACE temp;

-- 새로운 사용자에게 권한 부여
grant connect, RESOURCE to c##scott;

grant connect, RESOURCE, dba to c##scott;