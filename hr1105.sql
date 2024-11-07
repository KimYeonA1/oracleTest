--테이블 설계하기(사원번호, 사원명, 급여):DDL
--  class EMP01{
--    public int no;
--    public String name;
--    public double salary;
--  }
create table EMP01(
    no NUMBER(4),
    name VARCHAR2(20)not null,
    salary NUMBER(10, 2) default 1000.0,
    CONSTRAINT EMP01_no_PK primary key(no),
    CONSTRAINT emp01_name_uk UNIQUE(name)
);

--테이블 정보 구하기
select * from tab;
--테이블 삭제하기 DDL
drop table emp01;
--휴지통 보기
select * from recyclebin;
--휴지통 복원
flashback table emp01 to before drop;
--테이블 복사(제약조건은 복사가 안 됨)
desc emplyees;
select count(*) from employees;
create table emple02 as select * from employees;
desc emple02;
select count(*) from emple02;
--제약조건 걸기 primary key, unique
alter table emple02 add constraint emple02_id_pk primary key(employee_id);
alter table emple02 add constraint emple02_email_uk UNIQUE(email);
--제약조건 삭제하기 unique
alter table emple02 drop CONSTRAINT emple02_email_uk;
--제약조건 정보 검색
select * from user_constraints;
select table_name, constraint_name, constraint_type from user_constraints where table_name = upper('emple02');
--컬럼 추가 emp01
alter table emp01 add job varchar2(10) not null;
desc emp01;
--컬럼 제거 emp01
alter table emp01 drop column job;
--컬럼 변경(주의: 기존값이 존재할 때 생각을 할 것 -> 타입변경불가, 사이즈 큰것으로 변경가능
alter table emp01 modify job number(10) default 0;
--컬럼 이름 변경
alter table emp01 rename column job to job2;
alter table emp01 rename column job2 to job;

--테이블명을 변경 emp01 -> emp02 ddl(create, alter, drop, rename, trunscate)
rename emp01 to emp02;
select * from tab;
---------------------------------------------

create table EMP03(
    customer_id char(7) not null,
    customer_name VarCHAR2(10)not null,
    gender char(1) not null,
    birthday char(8) not null,
    phone_number varchar(16),
    email varchar(30),
    point number(10) default 0
);

alter table emp03 add constraint emp03_id_pk primary key(customer_id);
alter table emp03 add constraint emp03_gender_ck check(gender in('M','W'));
alter table emp03 add constraint emp03_email_uk unique(email);

select * from user_constraints where table_name = 'emp03';

--제약조건 검색
select * from user_constraints where table_name = 'emp03';

DESC EMP01;
--제약조건 NOT NULL
ALTER TABLE EMP01 MODIFY SALARY NUMBER(10,2) NOT NULL;

--INSERT INTO 테이블명(컬럼명,,) VALUES (컬럼값, ,,)
CREATE TABLE INSERT_TEST(
 NO1 NUMBER,
 NO2 NUMBER,
 NO3 NUMBER
 );
 DESC IT;
 INSERT INTO IT VALUES(1,2,3); --값 추가
 INSERT INTO IT VALUES(1,2, NULL);
 INSERT INTO IT(NO1, NO2) VALUES(11,22);
 INSERT INTO IT(NO1, NO2) VALUES(11,'문자');
 INSERT INTO IT(NO1, NO2) VALUES(111);
 INSERT INTO IT(NO1, NO2) VALUES(111, 222, 333);
 INSERT INTO IT(NO1, NO2) VALUES(1111, NULL, 3333); --명시적/다르게 넣었다면 암시적'

 SELECT * FROM IT; --들어갔는지 확인하기
 
 --NO3 NOT NULL 제약조건 걸기
 ALTER TABLE IT MODIFY NO3 NUMBER NOT NULL;
 DELETE FROM IT WHERE NO3 IS NULL;
 
 --DEPT 테이블생성
 CREATE TABLE DEPT
 AS 
 SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID FROM DEPARTMENTS;
 
 SELECT * FROM DEPT;
 DELETE FROM DEPT;
 TRUNCATE TABLE DEPT;
 ROLLBACK;
 
 -------------------------------------------------------------------과제
 CREATE TABLE GRADE (
    GRADE_NO NUMBER(10) NOT NULL,               
    STU_NAME VARCHAR2(50) NOT NULL,             
    KOR NUMBER(10) DEFAULT 0 NOT NULL,          
    ENG NUMBER(10) DEFAULT 0 NOT NULL,         
    MATH NUMBER(10) DEFAULT 0 NOT NULL,         
    TOTAL NUMBER(10) DEFAULT 0,                
    AVR NUMBER(5, 2) DEFAULT 0,                
    DEPT_CODE NUMBER(10)                        
);

alter table GRADE add constraint GRADE_GRADE_NO_pk primary key(GRADE_NO);
alter table GRADE add constraint GRADE_STU_NAME_ck check(STU_NAME);
alter table GRADE add constraint GRADE_KOR_ck check(KOR);
alter table GRADE add constraint GRADE_ENG_ck check(ENG);
alter table GRADE add constraint GRADE_MATH_ck check(MATH);
alter table GRADE add constraint GRADE_TOTAL_ck check(TOTAL);
alter table GRADE add constraint GRADE_DEPT_CODE_pk primary key(DEPT_CODE);

CREATE TABLE DEPARTMENT(  
    DEPT_CODE NUMBER(10) NOT NULL,
    DEPT_NAME VARCHAR2(10) NOT NULL);
    
alter table DEPARTMENT add constraint DEPARTMENT_DEPT_CODE_pk primary key(DEPT_CODE);


select * from user_constraints where table_name = 'GRADE';
---------------------------------------------------------------------










