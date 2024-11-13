-- susan 부서 아이디 보기
select department_id from employees where first_name = 'Susan';

-- 부서테이블에서 40번인 부서명을 조회
select department_name from departments where department_id = 40;

--susan이 소속되어 있는 부서명을 검색하시오.
select * from employees where first_name = 'Susan';
select * from departments where department_id = 40;

select E.first_name, D.department_name from departments D inner join employees E on D.department_id = E.department_id
where upper(first_name) = upper('Susan');

--단일행은 비교, 크기, 연산이 가능하다.
--다중행은 비교, 크기, 연산이 불가능하다. (IN(OR), ANY(1개 이상), ALL(모두), EXISTS(존재하면 TRUE 아니면 FALSE)
select department_id from employees where first_name = 'Susan'; --단일행 검사 방식
select * from departments where department_id = 
(select department_id from employees where first_name = 'Susan');

--EMPLOYEES 테이블에서 LEX와 같은 부서에(10번 부서)있는 모든 사원의 이름과
--입사일자 ( 형식: 1981-11-17)를 출력하는 SELECT문을 작성하시오
select department_id from employees where first_name = 'Lex';
select department_id from employees where first_name = 'Lex';
select first_name, to_char(hire_date, 'yyyy-mm-dd') from employees 
where department_id = (select department_id from employees where first_name = 'Lex');

--문제) EMPLOYYES 테이블에서 CEO에게 보고하는 직원들의 모든 정보 출력
select * from employees where manager_id = 100;
select * from employees where manager_id = (select employee_id from employees where manager_id is null); 

-->상사가 null 인 사람은 ceo
select employee_id from employees where manager_id is null;

--고용테이블에서 전체 연봉편균
select round(avg(salary)) as salary from employees group by department_id;

--전체 평균연봉보다 높은 직원 정보 출력
select * from employees where salary > (select round(avg(salary)) as salary from employees);
--다중행이면 비교 가능할까
select * from employees where EXISTS(select round(avg(salary)) as salary from employees group by department_id);
select * from employees where 1 = 0;

--복사는 제약조건(6가지-프라이머리 뽈인 유니크 낫널 체크 디폴트)의 not null 제약조건만 복사됨
drop table imsiTBL CASCADE;
create table imsiTBL
as
select * from employees where 1 = 1;--(0을 넣으면 구조만 복사됨)
select * from imsiTBL;
select * from user_constraints where table_name = upper('imsiTBL');   --not null만 복사됨

-- 월급이 13000 이상인 사람의 부서를 보여주시오
select distinct department_id from employees where salary >= 13000;
select * from employees where department_id in (90, 80, 20);
select * from employees where department_id in (select distinct department_id from employees where salary >= 13000);

--EMPLOYEES 테이블에서 Susan 또는 Lex 월급
select first_name, salary from employees where upper(first_name) = upper('Susan') or upper(first_name) = upper('Lex');  --자신 없으면 upper 사용

--EMPLOYEES 테이블에서 Susan 또는 Lex와 월급이 같은 직원의 이름, 업무, 급여를 출력하는 SELECT문(Susan, Lex는 제외)
select * from employees where salary in (17000, 6500) and first_name <> 'Susan' and first_name <> 'Lex';
select * from employees where salary in (17000, 6500) and first_name not in ('Susan','Lex');
select * from employees where salary in 
(select first_name, salary from employees where upper(first_name) = upper('Susan') or upper(first_name) = upper('Lex')) 
and first_name <> 'Susan' and first_name <> 'Lex';

--한 명 이상으로부터 보고를 받는다 = 나는 매니저로 등록되어있다. null = ceo
select distinct manager_id from employees where manager_id is not null or manager_id is null;
select distinct manager_id as "상사" from employees;
-- 한 명 이상으로부터 보고를 받을 수 있는 직원의 직원번호, 이름, 업무, 부서번호를 출력
select employee_id, first_name, job_id, department_id from employees
where manager_id in (select distinct manager_id from employees);

--문제2)EMPLOYEES 테이블에서 Accounting 부서에서 근무하는 직원과 같은 업무를 하는 직원의 이름,업무명를 출력하는 SELECT문을 작성하시오
--순서대로 하기
select * from employees;
select * from departments;

select * from departments where department_name = 'Accounting';
select department_id from departments where department_name = 'Accounting';

select first_name, job_id from employees where department_id = 110;
select distinct job_id from employees where department_id = 110;

select first_name, job_id from employees
where department_id = (select department_id from departments where department_name = 'Accounting')
and job_id in ('AC_MGR','AC_ACCOUNT');

select first_name, job_id from employees
where department_id = (select department_id AS ID from departments where department_name = 'Accounting')
and job_id in (select distinct job_id from employees 
where department_id = (select department_id AS ID from departments where department_name = 'Accounting'));

--department_id = (select department_id AS ID from departments where department_name = 'Accounting')=>A
select first_name, job_id from employees
where job_id = (select distinct job_id from employees where department_id = 110);

select first_name, job_id from employees where job_id in (
(select distinct job_id from employees 
where department_id =(select department_id from departments where department_name = 'Accounting')));

--exitsts
select * from employees where department_id = 10;

--테이블 복사
drop table emp02;
create table emp02
as
select employee_id, first_name from employees;

select * from emp02;

--서브쿼리를 이용해서 데이터 복사
-- 구조만 복사 departments 테이블 생성 (DEP01)
drop table DEP01;
create table DEP01
as
select * from departments where 1 = 0;

--내용을 서브쿼리를 이용해서 저장하시오.
--INSERT INTO DEP01(컬럼명...)VALUES(컬럼값...)
INSERT INTO DEP01(SELECT * FROM DEPARTMENTS);
INSERT INTO DEP01 SELECT * FROM DEPARTMENTS;

--UPTATA 서브쿼리를 활용한다.
--부서 10번에 지역위치를 부서 40번 지역위치로 수정하시오.
UPDATE DEP01 SET LOCATION_ID = (2400) WHERE DEPARTMENT_ID = 10;
UPDATE DEP01 SET LOCATION_ID = (SELECT LOCATION_ID FROM DEPARTMENTS WHERE DEPARTMENT_ID = 40)
WHERE DEPARTMENT_ID = 10;
SELECT LOCATION_ID FROM DEPARTMENTS WHERE DEPARTMENT_ID = 40;

--문제3) 직급이 'ST_MAN'인 직원이 받는 급여들의 최소 급여보다 많이 받는 직원들의 이름과 급여를
--출력하되 부서번호가 20번인 직원은 제외한다.
select min(salry) from employees where job_id = 'ST_MAN';
select salary from employees where job_id = 'ST_MAN';

select first_name, salary, department_id from employees 
where salary > (select min(salary) from employees where job_id = 'ST_MAN') and department_id <> 20
order by employees.department_id asc;
--다른 방법
select first_name, salary from employees 
    where salary < all(select salary from employees where job_id = 'ST_MAN') 
    and department_id <> 20; 
    
--문제4)  EMPLOYEES 테이블에서 Valli라는 이름을 가진 직원과 업무명 및 월급이 같은 사원의 모든 정보
--를 출력하는 SELECT문을 작성하시오. (결과에서 Valli는 제외)
select job_id, salary  from employees where first_name = 'Valli';
select * from employees where job_id = (select job_id from employees where first_name = 'Valli') 
and salary = (select salary  from employees where first_name = 'Valli') 
and first_name <> 'Valli'; 
--다른 방법
select * from employees where job_id=(select job_id from employees where first_name='Valli') 
and salary=(select salary from employees where first_name='Valli') and first_name <> 'Valli';

--문제5)
select department_id from employees where first_name = 'Valli'; --부서명 대입
select round(avg(salary)) from employees where department_id = 60; --발리가 속한 평균 월급

select department_id, first_name, salary from employees 
where salary > (select round(avg(salary)) from employees where department_id = (select department_id from employees where first_name = 'Valli'));



--샘플) HR 부서의 어떤 사원은 급여정보를 조회하는 없무를 맡고 있다. Tucker(last_name) 사원보다
--급여를 많이 받고 있는 사원의 성과 이름(Name으로 별칭), 업무, 급여를 출력하시오

select salary from employees where last_name = 'Tucker'; --Tucker 급여 

select first_name, last_name, job_id, salary from employees 
where salary > (select salary from employees where last_name = 'Tucker');

--과제1)사원의 급여정보 중 업무별 최소 급여를 받고 있는 사원의 성과 이름(Name으로 별칭), 업무,
--급여, 입사일을 출력하시오
select salary from employees where salary = 2100; 

select first_name, last_name, job_id, salary, hire_date from employees 
where salary < 2100;
--답
select job_id, min(salary) from employees group by job_id; 
select min(salary) from employees group by job_id; 
select first_name, job_id, salary, hire_date from employees where job_id = '잡아이디' and salary = '최소금액';
select first_name, job_id, salary, hire_date from employees 
where (job_id, salary)in (select job_id, min(salary) from employees group by job_id);

--과제2)소속 부서의 평균 급여보다 많은 급여를 받는 사원에 대하여 사원의 성과 이름(Name으로 별칭),
--급여, 부서번호, 업무를 출력하시오
select first_name, last_name, department_id, job_id from employees 
where salary > any(select round(avg(salary))from employees group by department_id);
--답
select round(avg(salary)) from employees where department_id = 90 group by department_id;

select first_name, salary, E.department_id, job_id from employees E
where E.salary > (select round(avg(salary)) from employees where department_id
= E.department_id group by department_id)order by department_id;

--과제3)모든 사원의 소속부터 평균급여를 계산하여 사원별로 성과 이름(Name으로 별칭), 업무, 급여, 부서번호,
--부서 평균급여(Department Avg Salary로 별칭)을 출력하시오.
select first_name, last_name, job_id, salary, department_id from employees 
where salary = any(select round(avg(salary))from employees group by department_id);

--답
select round(avg(salary)) from employees where department_id = 90 group by department_id; --평균 급여

select first_name, salary, E.department_id, 
(select round(avg(salary)) from employees where department_id = E.department_id  group by department_id) as "부서평균급여" from employees E;



