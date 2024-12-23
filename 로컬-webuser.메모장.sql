CREATE SEQUENCE visit_seq  -- 시퀀스이름
   START WITH 1             -- 시작을 1로 설정
   INCREMENT BY 1          -- 증가 값을 1씩 증가
   NOMAXVALUE             -- 최대 값이 무한대
   NOCACHE
   NOCYCLE;

CREATE table "VISIT" (
    NO       NUMBER(5,0) NOT NULL,
    WRITER   VARCHAR2(20) NOT NULL,
    MEMO     VARCHAR2(4000) NOT NULL,
    REGDATE  DATE NOT NULL
   
);
ALTER TABLE VISIT ADD CONSTRAINT VISIT_NO_PK PRIMARY KEY(NO);
INSERT INTO VISIT VALUES(VISIT_seq.NEXTVAL, 'KYA', '처음', SYSDATE);
select * from visit order by no desc;

--********************************************************************
CREATE table LOGIN (
    ID      VARCHAR2(12) NOT NULL,
    PASS    VARCHAR2(12) NOT NULL
);
ALTER TABLE LOGIN ADD CONSTRAINT VISIT_ID_PK PRIMARY KEY(ID);
  
--********************************************************************

create table ACCOUNT(
    NO         NUMBER(5,0) NOT NULL,
    NAME     VARCHAR2(20) NOT NULL,
    ID     VARCHAR2(4000) NOT NULL,
    PWD     VARCHAR2(4000) NOT NULL,
    REGDATE   DATE NOT NULL
);
alter table ACCOUNT add constraint ACCOUNT_NO_PK primary key (NO);
alter table ACCOUNT add constraint ACCOUNT_ID_UQ UNIQUE(ID);

INSERT INTO ACCOUNT VALUES((select NVL(max(no),0)+1 from account),'AAA','AAA','AAA',SYSDATE);
select * from account;

SELECT PWD, NAME FROM ACCOUNT WHERE ID = '85yuna';

commit;
--===========================
-- jsp 회원가입 테이블
CREATE TABLE SIGNUP (
    ID VARCHAR2(12) ,                         -- 아이디 (4~12자의 영문 대소문자와 숫자)
    PWD VARCHAR2(12) NOT NULL,                -- 비밀번호 (4~12자의 영문 대소문자와 숫자)
    EMAIL VARCHAR2(100) NOT NULL,             -- 이메일 주소
    NAME VARCHAR2(50) NOT NULL,               -- 이름
    BIRTH NUMBER(10)                          -- 생년월일 (20001010)
);

ALTER TABLE SIGNUP ADD CONSTRAINT SIGNUP_ID_PK PRIMARY KEY(ID);
select * from signup;

-- jsp로그인테이블
CREATE TABLE LOGIN2(
    ID VARCHAR2(12),
    PWD VARCHAR2(12) NOT NULL
);
ALTER TABLE LOGIN2 ADD CONSTRAINT LOGIN2_ID_PK PRIMARY KEY(ID);

--========
drop table LOGIN;
CREATE table LOGIN (
    ID   VARCHAR2(30) not null,
    PASS VARCHAR2(30) NOT NULL,
    name varchar2(30) not null
);
alter table login add constraint login_id_pk primary key(id);
select * from login;
--TEMP MEMBER
drop table TEMPMEMBER;
CREATE TABLE TEMPMEMBER (
ID VARCHAR2(20), 
PASSWD VARCHAR2(20), 
NAME VARCHAR2(20), 
MEM_NUM1 VARCHAR2(6), 
MEM_NUM2 VARCHAR2(7), 
E_MAIL VARCHAR2(30), 
PHONE VARCHAR2(30), 
ZIPCODE VARCHAR2(7), 
ADDRESS VARCHAR2(60), 
JOB VARCHAR2(30) 
 );

alter table tempmember add constraint tempmember_id_pk primary key(id);

 insert into tempMember values('aaaa', '1111', '홍길동', '123456', '7654321', 
'hong@hanmail.net', '02-1234', '100-100', '서울', '프로그래머');
 insert into tempMember values('bbbb', '1111', '홍길동', '123456', '7654321', 
'hong@hanmail.net', '02-1234', '100-100', '서울', '프로그래머');
 insert into tempMember values('cccc', '1111', '홍길동', '123456', '7654321', 
'hong@hanmail.net', '02-1234', '100-100', '서울', '프로그래머');

COMMIT;
SELECT * FROM TEMPMEMBER;

--=============================
-- 답변형 게시판
 CREATE TABLE BOARD(
    NUM         NUMBER(7,0) NOT NULL, 
    WRITER      VARCHAR2(12) NOT NULL, 
    EMAIL       VARCHAR2(30) NOT NULL, 
    SUBJECT     VARCHAR2(50) NOT NULL, 
    PASS        VARCHAR2(10) NOT NULL, 
    READCOUNT   NUMBER(5,0) DEFAULT 0, 
    "REF"       NUMBER(5,0) DEFAULT 0, 
    STEP        NUMBER(3,0) DEFAULT 0, 
    "DEPTH"     NUMBER(3,0) DEFAULT 0, 
    REGDATE     TIMESTAMP (6) DEFAULT SYSDATE, 
    "CONTENT"   VARCHAR2(4000) NOT NULL, 
    IP          VARCHAR2(20) NOT NULL
);
ALTER TABLE BOARD ADD CONSTRAINT BOARD_NUM_PK PRIMARY KEY (NUM);

CREATE SEQUENCE BOARD_SEQ   -- 시퀀스이름
   START        WITH 1      -- 시작을 1로 설정
   INCREMENT    BY 1        -- 증가값을 1씩 증가
   NOMAXVALUE               -- 최대값이 무한대..
   NOCACHE
   NOCYCLE;

 select * from board;
 SELECT COUNT(*) AS COUNT FROM BOARD;

 select * from board where num = 1;
 update board set readcount=readcount+1 where num = 1;
 select count(*) count from board where num =1 and pass = '12345';
commit;
--========================================================
-- 회원테이블 
drop table member;
 CREATE TABLE MEMBER (
    ID          VARCHAR2(12)  NOT NULL,
    PW          VARCHAR2(12)  NOT NULL,
    NAME        VARCHAR2(10)  NOT NULL,
    PHONE1      VARCHAR2(3)   NOT NULL,
    PHONE2      VARCHAR2(4)   NOT NULL,
    PHONE3      VARCHAR2(4)   NOT NULL,
    EMAIL       VARCHAR2(30)  NOT NULL,
    BIRTH       VARCHAR2(20)  NOT NULL,
    ZIPCODE     VARCHAR2(7)   NOT NULL,
    ADDRESS1    VARCHAR2(120) NOT NULL,
    ADDRESS2    VARCHAR2(50)  NOT NULL
 );
 ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_ID_PK PRIMARY KEY(ID);

