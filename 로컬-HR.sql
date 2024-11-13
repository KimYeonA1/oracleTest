-- hr resource 있는 테이블 정보(프로젝트 클래스 종류)
select * from tab;
-- employees 테이블 구조(클래스 구조)
desc employees;
-- emplyees 속에 들어있는 레코드(객체들)를 보여주세요.
select * from employees;
--departments 테이블 객체(레코드=인스턴스)를 확인
select * from departments;
-- departments 구조
desc departments;
-- department_id, department_name 보임
select department_id, department_name from departments;
-- 필드명에 별칭 사용하기
select department_id as "부서번호", department_name as "부서명" from departments;
select department_id as DEPT_NO, department_name as DEPT_NAME from departments;
select department_id as "DEPT NO", department_name as "DEPT NAME" from departments;
-- + ||

--desc dual;  --desc는 dual의 구조를 보는 것
--select * from dual;   --객체가 뭐가 들었는지 보는 것
--select '5' + 5 from employees;

select '5' + 5 from dual;
select '5' || 5 from dual;
-- 문자열 기능을 이용해서 필드명을 보여주기
select first_name, job_id from employees;
select first_name || '의 직급은' || job_id || '입니다' from employees;
select first_name || '의 직급은' || job_id || '입니다' as printData from employees;
--중복되지 않게 보여주기 distinct
select distinct job_id from employees;
--연봉을 3000이상 받는 사람 정보
select * from employees where salary >= 3000;
desc employees;
--2008년 이후에 입사한 직원조사 날짜비교
select * from employees where hire_date >= '2008/01/01';
select * from employees where TO_CHAR(hire_date,'YYYY/MM/DD') >= '2008/01/01';
select * from employees where hire_date >= TO_DATE('2008/01/01','YYYY/MM/DD HH24:MI:SS');
-- AND, BETWEEN a AND B
SELECT * FROM EMPLOYEES WHERE SALARY >= 2000 AND SALARY <= 3000;
SELECT * FROM EMPLOYEES WHERE SALARY BETWEEN 2000 AND 3000;
-- OR, IN( , )직원번호가 67이거나 101이거나 184인 사원
SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID = 67 OR EMPLOYEE_ID = 101 OR EMPLOYEE_ID = 184;
SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID IN(67, 101, 184);
--NULL 연산, 비교, 할당 안 된다.
SELECT 100 + NULL FROM DUAL;
desc emplooyees;
SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT IS NULL; 
SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL;
--ORDER BY ASC, DESC 사번을 기준으로 오름차순으로 정렬
SELECT EMPLOYEE_ID FROM EMPLOYEES ORDER BY EMPLOYEE_ID DESC;
--GROUB BY
SELECT DEPARTMENT_ID, SUM(SALARY) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID HAVING DEPARTMENT_ID = 30;

SELECT * FROM EMPLOYEES;
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID >= 70;
SELECT DEPARTMENT_ID, SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID >= 70;
SELECT DEPARTMENT_ID, SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID >= 70 GROUP BY DEPARTMENT_ID;--오류 MAX(SALARY)로 수정해야함
SELECT DEPARTMENT_ID, MAX(SALARY), MIN(SALARY),SUM(SALARY), ROUND(AVG(SALARY),1),
  COUNT(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID >= 70 GROUP BY DEPARTMENT_ID HAVING SUM(SALARY) >= 30000;
SELECT MAX(SALARY), ROUND(AVG(SALARY),1), SUM(SALARY) FROM EMPLOYEES;
--문자열 일부만 추출 SUBSTR(대상, 시작위치, 추출갯수)
SELECT SUBSTR('DATABASE',1,3) FROM DUAL;
--20번 부서에서 사원들의 입사년도 가져오기
SELECT EMPLOYEE_ID, FIRST_NAME, SUBSTR(HIRE_DATE, 1, 2)||'년도' AS "입사년도" FROM EMPLOYEES WHERE DEPARTMENT_ID = 20;
--TRIM
SELECT TRIM(LEADING FROM ' ABCD ') LT, LENGTH(TRIM(LEADING FROM ' ABCD ')) LT_LEN,
TRIM(TRAILING FROM ' ABCD ') RT, LENGTH(TRIM(TRAILING FROM ' ABCD ')) RT_LEN,
TRIM(BOTH FROM ' ABCD ') BOTH1, LENGTH(TRIM(BOTH FROM 'ABCD ')) BOTH1,
TRIM(' ABCD ') BOTHT2, LENGTH(TRIM(' ABCD ')) BOTHLEN2 FROM DUAL;
--부서 30번 소속된 직원들 근무달수를 구하기
SELECT FIRST_NAME, HIRE_DATE AS 입사일, SYSDATE AS 현재날짜,
ROUND (MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) AS "근무달수" FROM EMPLOYEES WHERE DEPARTMENT_ID = 30;
--NEXT DAY() 함수의 기능
SELECT SYSDATE,TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS'), NEXT_DAY(SYSDATE, '수요일') FROM DUAL;

--03년도에 입사한 사원 알아내기
SELECT 입사년도, 사원이름 FROM EMPLOYEES WHERE TO_CHAR(HIRE_DATE, 'YY') = '03';

select hire_date, TO_CHAR(hire_date, 'YY/MM/DD HH24:MI:SS'), TO_CHAR(hire_date,'MI') from employees;
select TO_DATE('20041214','YYYY/MM/DD')+1 from dual;

--이름이 k로 끝나는 직원을 검색
select first_name from employees where first_name like '%k';
select first_name from employees where upper(substr(first_name,LENGTH(first_name),1)) = UPPER ('k');

--현재 시간 표현
select sysdate from dual;
select to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS') from dual;
select sysdate - '2024/11/05' from dual;

select FLOOR(sysdate - TO_DATE('2024/11/05','YYYY/MM/DD')) from dual;
--숫자를 우리가 원하는 형식으로 출력하기 1234567.23 => $1,234,567.23
select trim (to_char(1234567.23, 'L999,999,999.99'))as money from dual;
select first_name, trim (to_char(salary, 'L999,999,999.99'))as salary from employees;

-- 문자 + 문자 = 숫자
select to_number ('10,000', '999,999') + to_number('20,000','999,999') from dual;
select to_number ('10,000', '999999') from dual;

--NVL
select first_name, salary , commission_pct, job_id from employees order by job_id;
--NVL commission_pct가 null이면 0으로 바꿔줌
select first_name, salary , nvl(commission_pct, 0) commission_pct, job_id from employees order by job_id;

--NVL2(대상, 널이 아닐 때 적용될 값, 널일 때 적용될 값)
select first_name , salary, commission_pct, salary+(salary * commission_pct) as total from employees;
select first_name , salary, commission_pct, salary+(salary * NVL(commission_pct, 0)) as total from employees;
select first_name , salary, commission_pct, salary+(salary * NVL2(commission_pct, commission_pct, 0)) as total from employees;

--부서별에 따라 급여를 인상하도록 하자.(조인: inner join, outer join, self join, cross join)
--(직원번호,직원명, 직급, 급여)부서명이 'Marketing'인 
--직원은 5% 'Purchasing'인 사원은 10%, ‘Human Resources'인 사원은 15%, 'IT'인 직원은 20% 인상한다.
select * from departments;
select employee_id, first_name,salary, department_id from employees;
select * from employees inner join departments on employees.department_id = departments.department_id;

select employee_id, first_name, job_id, salary, E.department_id, department_name, 
     case
     when upper (D.department_name) = upper('Marketing') then salary* 1.05
     when upper (D.department_name) = upper('Purchasing') then salary* 1.15
     when upper (D.department_name) = upper('Human Resources') then salary* 1.15
     when upper (D.department_name) = upper('IT') then salary* 1.20
     end NEWSALARY
from employees E inner join departments D on E.department_id = D.department_id
where upper(D.department_name) in (upper('Marketing'),upper('Purchasing'),upper('Human Resources'),upper('IT'));
order by NEWSALARY DESC;
    

                         
----employees 복사
create table emp003
as 
select * from employees;

--모든 사원의 부서번호를 30번으로 수정하자
select * from emp003;
update emp003 set department_id = 30;
rollback;
--모든 사원의 급여를 10% 인상한다
update emp003 set salary = salary * 1.1;
rollback;
--입사일을 오늘 날짜로 수정한다
update emp003 set hire_date = sysdate;
rollback;

--부서번호가 10번인 사원의 부서번호를 30번으로 수정
update emp003 set employee_id = 30 where employee_id = 10;

--급여가 3000 이상인 사원만 급여를 10 % 인상
update emp003 set salary = salary * 1.1 where salary >=3000;
rollback;

--2007년에 입사한 사원의 인사일이 오늘로 수정한다
update emp003 set hire_date = sysdate where substr(hire_date,1,2) = '07';
rollback;
--이름이 수산의 부서번호는 20 직급은
update emp003 set department_id = 20, job_id = 'FI_MGR'
select * from emp003 where first_name 'Susan';

--
UPDATE EMP003 SET SALARY = 17000, COMMISTION_PCT = 0.45
WHERE UPPER(LAST_NAME) = UPPER('RUSSELL');
ROLLBACK;

--30번 부서를 삭제
DELECT FROM EMP003 WHERE DEPARTMENT_ID = 30;
select * from emp003 where DEPARTMENT_ID = 30;
ROLLBACK;

--MY_CUSTOMER, MYCUSTOMER, MY_CUSTOMER_ 삭제 후 다시 테이블 생성하기
CREATE TABLE MYCUSTOMER(
    code VARCHAR2(7),
    name VARCHAR2(10) CONSTRAINT MYCUSTOMER_NAME_NN NOT NULL,
    gender CHAR(1) NOT NULL,
    birth VARCHAR2(8)NOT NULL,
    phone VARCHAR2(16),
);
ALTER TABLE MYCUSTOMER ADD CONSTRAINT MYCUSTOMER_code_PK PRIMARY KEY(code);
ALTER TABLE MYCUSTOMER ADD CONSTRAINT MYCUSTOMER_gender_CK CHECK(gender IN('M','W'));
ALTER TABLE MYCUSTOMER ADD CONSTRAINT MYCUSTOMER_PHONE_UK UNIQUE(PHONE);
DESC MYCUSTOMER;

INSERT INTO MYCUSTOMER VALUES ('2017108','박승대','M','19711430','010-2580-9919');
INSERT INTO MYCUSTOMER VALUES ('2019302','전미래','W','19740812','010-8864-0232');
SELECT * FROM MYCUSTOMER;
SELECT * FROM CUSTOMER;
DESC CUSTOMER;

-- 제약조건 검색기능(반드시 알아둘것)
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'CUSTOMER';
SELECT * FROM USER_TABLES;
SELECT * FROM user_cons_columns WHERE TABLE_NAME = 'CUSTOMER';
ALTER TABLE CUSTOMER DROP CONSTRAINT CUSTOMER_EMAIL_UK;
ALTER TABLE CUSTOMER DROP CONSTRAINT CUSTOMER_GENDER_CK;


-- MERGE  MYCUSTOMER - > CUSTOMER 병합을진행하는데 없으면 INSERT, 있으면 UPDATE
MERGE INTO CUSTOMER C
    USING MYCUSTOMER M
    ON (C.CODE = M.CODE)
    WHEN MATCHED THEN
        UPDATE SET C.NAME = M.NAME, C.GENDER = M.GENDER, C.BIRTH = M.BIRTH, C.PONE = M.PHONE 
    WHEN NOT MATCHED THEN
        INSERT (C.CODE,C.NAME,C.GENDER,C.BIRTH, C.PONE) values(M.CODE,M.NAME,M.GENDER,M.BIRTH, M.PHONE);

SELECT * FROM CUSTOMER;
SELECT * FROM MYCUSTOMER;
UPDATE MYCUSTOMER SET NAME = '박승우' WHERE CODE = '2017108';

-----------------------
CREATE TABLE DEPT01(
    NO VARCHAR2(8),
    NAME VARCHAR2(10) NOT NULL,
    REGION VARCHAR2(10)
);
ALTER TABLE DEPT01 ADD CONSTRAINT DEPT01_NO_PK PRIMARY KEY(NO);

CREATE TABLE MEMBER(
    NO NUMBER(8),
    NAME VARCHAR2(10) NOT NULL,
    JOB_ID VARCHAR2(10),
    DEPT_NO VARCHAR2(8)
    );
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_NO_PK PRIMARY KEY(NO);
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_DEPT_NO_FK FOREIGN KEY(DEPT_NO) REFERENCES DEPT01(NO);

------------------------------------------------------?
CREATE TABLE DEPT01(
    DEPT_NO NUMBER,
    DEPT_NAME VARCHAR2(10),
    LOCATION VARCHAR2(10)
);
CREATE TABLE MEMBER(
    MEMBER_NO NUMBER,
    MEMBER_NAME VARCHAR(10),
    JOB_ID VARCHAR(10),
    DEPT_NO NUMBER
);

ALTER TABLE DEPT01 ADD CONSTRAINT DEPT01_NO_PK PRIMARY KEY(DEPT_NO);

ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_NO_PK PRIMARY KEY(MEMBER_NO);
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_NO_FK FOREIGN KEY(DEPT_NO) REFERENCES DEPT01(DEPT_NO);
--입력
INSERT INTO DEPT01 VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT01 VALUES(20,'RESEARCH','DALLAS');
INSERT INTO DEPT01 VALUES(30,'SALES','CHICAGO');
INSERT INTO DEPT01 VALUES(40,'OPERATIONS','BOSTON');
SELECT * FROM DEPT01;

INSERT INTO MEMBER VALUES(7499,'ALLEN','SALESMAN',30);
INSERT INTO MEMBER VALUES(7566,'JONES','MANAGER',40);
SELECT * FROM MEMBER;

--행 삭제
DELETE FROM MEMBER WHERE DEPT_NO = 40;  
DELETE FROM DEPT01 WHERE NO = 40;

--한 번에 삭제하기
ALTER TABLE MEMBER DROP CONSTRAINT MEMBER_DEPT_NO_FK;
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_NO_FK FOREIGN KEY(DEPT_NO) REFERENCES DEPT01(NO)ON DELETE CASCADE;


--문제1
CREATE TABLE EMP01(
  EMPNO NUMBER(4),
  ENAME VARCHAR2(10) NOT NULL,
  JOB VARCHAR2(9),
  MGR NUMBER(4),
  HIREDATE DATE NOT NULL,
  SAL NUMBER(7,2) NOT NULL,
  COMM NUMBER(7,2)DEFAULT 0.0,
  DEPTNO NUMBER(2) NOT NULL
);
ALTER TABLE EMP01 ADD CONSTRAINT EMP01_EMPNO_PK PRIMARY KEY(EMPNO);
--문제2(데이트 수정)
INSERT INTO EMP01 VALUES(7369,'SMITH','CLEAK',7836, 80.12.17, 800,0.0,20);
INSERT INTO EMP01 VALUES(7499,'ALLEN','SALESMAN',7369,87/12/20, 1600,300,30);
INSERT INTO EMP01 VALUES(7839,'KING','PRESIDENT',NULL,81/02/08, 5000,NULL,10);

SELECT * FROM EMP01;
DROP TABLE EMP01;
--문제3
CREATE TABLE MEMBERS(
ID VARCHAR2(20) NOT NULL,
NAME VARCHAR2(20) NOT NULL,
REGNO VARCHAR2(13) NOT NULL,
HP VARCHAR2(13) NOT NULL,
ADDRESS VARCHAR2(100) NOT NULL,
);
ALTER TABLE MEMBERS ADD CONSTRAINT MEMBERS_ID_PK PRIMARY KEY(ID);
INSERT INTO MEMBERS VALUES('AAA','kai','1234','010-1234-5678','SEOUL');
INSERT INTO MEMBERS VALUES('BBB','star','5678','010-8576-7458','SUWON');

--문제4
CREATE TABLE BOOKS(
CODE NUMBER(4),
TITLE VARCHAR2(50) NOT NULL,
COUNT NUMBER(6) NOT NULL,
PRICE NUMBER(10) NOT NULL,
PUBLISH VARCHAR2(50) NOT NULL
);
ALTER TABLE BOOKS ADD CONSTRAINT BOOKS_CODE_PK PRIMARY KEY(CODE);
INSERT INTO BOOKS VALUES(1111,'Twilight',102321,17000,'트와일라잇');
INSERT INTO BOOKS VALUES(1112,'Aladdin',134544,15000,'알라딘');
--문제5
CREATE TABLE CUSTOMER(
CUS_NO NUMBER(10),
CUS_NAME CHAR(10),
AGE NUMBER(2),
PHONE NUMBER(15),
ADDRESS VARCHAR2(50));
ALTER TABLE CUSTOMER ADD CONSTRAINT CUSTOMER_CUS_NO_PK PRIMARY KEY(CUS_NO);

CREATE TABLE VIDEO(
VID_NO NUMBER(10),
TITLE VARCHAR2(10),
GENRE VARCHAR2 (10),
RENTAL_PRICE NUMBER(10),
RENTAL_KIND VARCHAR2(10),
LAUNCH_COMPANY VARCHAR2(10),
LAUNCH_DATE VARCHAR2(10),
WATCH_AGE NUMBER(2)
);
ALTER TABLE VIDEO ADD CONSTRAINT VIDEO_VID_NO_PK PRIMARY KEY(VID_NO);

CREATE TABLE RE(
RETURN_NO NUMBER(10),
VID_NO NUMBER(10),
CUS_NO NUMBER(10),
RE_DATE VARCHAR2(10),
RE_SCDATE VARCHAR2(10),
RE_TOTAL NUMBER(10)
);
ALTER TABLE RE ADD CONSTRAINT RE_RETURN_NO_PK PRIMARY KEY(RETURN_NO);
ALTER TABLE RE ADD CONSTRAINT RE_CUS_NO_FK FOREIGN KEY(CUS_NO) REFERENCES CUSTOMER(CUS_NO);
ALTER TABLE RE ADD CONSTRAINT RE_VID_NO_FK FOREIGN KEY(VID_NO) REFERENCES VIDEO(VID_NO);
------------------------------------------------------------------------------------------------------------------
--학과 테이블
CREATE TABLE SUBJECT( 
NO NUMBER(2), 
NUM NUMBER(2),--학과 번호 참조키
NAME VARCHAR2(15)
);
DROP TABLE SUBJECT;

ALTER TABLE SUBJECT ADD CONSTRAINT SUBJECT_NUM_PK PRIMARY KEY(NUM);
INSERT INTO SUBJECT VALUES(1,01,'컴퓨터학과');
INSERT INTO SUBJECT VALUES(2,02,'교육학과');


--학생 테이블
CREATE TABLE STUDENT(
NO NUMBER(10),
NUM NUMBER(8), --학번 참조키
NAME CHAR (10),
ID VARCHAR2(10),
PASSWD VARCHAR2(10),
SNUM NUMBER(10), --학과 번호
JUMIN NUMBER(15),
PHONE NUMBER(11),
ADDRESS VARCHAR2(50),
EMAIL VARCHAR2(20),
TODATE VARCHAR2(20)
);

ALTER TABLE STUDENT ADD CONSTRAINT STUDENT_NUM_PK PRIMARY KEY(NUM);
ALTER TABLE STUDENT ADD CONSTRAINT STUDENT_SNUM_UK UNIQUE KEY(SNUM);

INSERT INTO SUBJECT VALUES(21102286,'김수아','javajsp''서울시 서대문구 창전동',TODATE(sysdate, 'YYYY/MM/DD')
INSERT INTO SUBJECT VALUES(95010002,'김수현','jdbmania','서울시 관악구 봉천동',DATE(sysdate, 'YYYY/MM/DD')
);

--과목 테이블
CREATE TABLE LESSON(
NO NUMBER(10),
NUM CHAR(1),
NAME VARCHAR2(10)
);
ALTER TABLE LESSON ADD CONSTRAINT LESSON_NUM_PK PRIMARY KEY(NUM);

INSERT INTO SUBJECT VALUES('1','K','국어');
INSERT INTO SUBJECT VALUES('2','M','수학');
INSERT INTO SUBJECT VALUES('3','E','영어');

--수강 테이블
CREATE TABLE TRAINEE(
NO NUMBER(10),  --학생테이블에 있는 학번만 입력 가능
NUM NUMBER(10),
INUM NUMBER(10), --과목번호  과목테이블에 있는 과목 번호만 입력되어야 함
SECTION CHAR(10),
DATE CHAR(10)
);

ALTER TABLE TRAINEE ADD CONSTRAINT TRAINEE_NUM_FK FOREIGN KEY(NUM) REFERENCES STUDENT(NUM);
ALTER TABLE TRAINEE ADD CONSTRAINT TRAINEE_INUM_FK FOREIGN KEY(NUM) REFERENCES LESSON(NUM);

select DATE(sysdate, 'YYYY/MM/DD') from TRAINEE;














