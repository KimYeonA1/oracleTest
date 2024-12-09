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





 