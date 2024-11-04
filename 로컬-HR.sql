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
