alter session set "_ORACLE_SCRIPT" = true;

-- 새로운 사용자 생성
create user c##scott IDENTIFIED BY tiger
default tablespace users
TEMPORARY TABLESPACE temp;

-- 새로운 사용자에게 권한 부여
grant connect, RESOURCE to c##scott;

grant connect, RESOURCE, dba to c##scott;




-- 10월 5일

-- 사용자 관리
-- scott, hr... 오라클 데이터베이스가 기본 계정으로 제공하는 사용자들

-- 오라클 데이터베이스의 특징
-- 테이블, 인덱스, 뷰... 여러가지 객체가 사용자별로 생성되고 관리

-- 데이터베이스 스키마
-- 데이터 간 관계, 데이터 구조, 제약 조건 등 데이터를 저장 및 관리하기 위해 정의한 
-- 데이터베이스 구조의 범위
-- 사용자 == 스키마

-- 사용자 생성
create user c##test IDENTIFIED BY 12345;
-- 사용자 비밀번호 변경
ALTER USER c##test IDENTIFIED BY 54321;
-- 사용자 삭제
DROP USER c##test cascade;

-- 상태: 실패 -테스트 실패: ORA-01045: 사용자 C##TEST는 CREATE SESSION 권한을 가지고있지 않음; 로그온이 거절되었습니다
-- 사용자를 생성했다고 해서 모든 권한이 부여되는 것은 아니다. 

-- 권한 관리
-- 시스템 권한 : 사용자 생성, 정보 수정, 삭제, 데이터베이스 접근, 객체 생성... 

-- 권한 부여 : grant
-- 데이터베이스 접속 권한 부여
grant create session to c##test;
grant create table to c##test;

-- 일일히 권한을 부여하기 어려워서 '롤관리'를 통해서 한다. 
-- RESOURCE 롤 : 생성 권한들이 모여있는 롤
-- CREATE TRIGGER, CREATE SEQUENCE, CREATE TYPE, 
-- CREATE PROCEDURE, CREATE CLUSTER, CREATE OPERATOR, CREATE INDEXTYPE, CREATE TABLE

DROP user c##test2 CASCADE;

CREATE USER c##test2 IDENTIFIED BY 12345
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE temp;

GRANT RESOURCE, CREATE SESSION, CREATE TABLE TO c##test2;

-- c##test에게 users 테이블 공간 2M 할당
ALTER USER c##test2 QUOTA 2M ON USERS;














