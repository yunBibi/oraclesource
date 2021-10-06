
-- 10월 6일 오전

CREATE TABLE userTBL(
    no NUMBER(4) CONSTRAINT pk_userTBL PRIMARY KEY,
    username VARCHAR2(20) NOT NULL,
    birthYear NUMBER(4) NOT NULL,
    addr VARCHAR2(20) NOT NULL,
    mobile VARCHAR2(20)
);

-- no : 번호 (순차적인 번호 부여) => 시퀀스 객체
CREATE SEQUENCE user_seq;

--USER삽입
INSERT INTO userTBL 
VALUES(user_seq.nextval, '홍길동', 1985, '서울', '010-1234-5678');

INSERT INTO userTBL 
VALUES(user_seq.nextval, '김지우', 1986, '부산', '010-4578-9685');

INSERT INTO userTBL 
VALUES(user_seq.nextval, '신동완', 1990, '경기', '010-9877-2356');

COMMIT;

-- 전체 사용자 조회
SELECT * FROM userTBL;

-- 특정 사용자 정보 수정
UPDATE userTBL
SET addr='인천'
WHERE no=1;

-- 특정 사용자 삭제 
DELETE FROM usertbl WHERE no =4;
DELETE FROM usertbl WHERE no =5;
DELETE FROM usertbl WHERE no =6;

COMMIT; 

