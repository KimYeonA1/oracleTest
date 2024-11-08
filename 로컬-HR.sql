-- hr resource 있는 테이블 정보(프로젝트 클래스 종류)
select * from tab;
-- employees 테이블 구조(클래스 구조)
desc employees;
-- emplyees 속에 들어있는 레코드(객체들)를 보여주세요.
select * from emplyees;
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
--ORDER BY ASC, DESC












