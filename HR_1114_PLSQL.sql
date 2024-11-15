-- PL/SQL 
--문제1) EMPLOYEES 테이블에 등록된 총사원의 수와 급여의 평균을 변수에 대입하여 출력(변수 대입 INTO)

DECLARE
    TOTAL_EMPLOYEE NUMBER(4);
    TOTAL_SALARY NUMBER(10);
    AVG_SALARY NUMBER(10);
BEGIN
   SELECT COUNT(EMPLOYEE_ID), SUM(SALARY), ROUND(AVG(SALARY))
   INTO TOTAL_EMPLOYEE,TOTAL_SALARY,AVG_SALARY
   FROM EMPLOYEES;

   DBMS_OUTPUT.PUT_LINE('총사원의 수: '||TOTAL_EMPLOYEE);
   DBMS_OUTPUT.PUT_LINE('급여의 합: '||TOTAL_SALARY);
   DBMS_OUTPUT.PUT_LINE('급여의 평균: '||AVG_SALARY);
END;
/
SELECT COUNT(*), SUM(SALARY), ROUND(AVG(SALARY)) FROM EMPLOYEES; --COUNT를 사용하면 전체가 GROUP BY가 된다
--SELECT DEPARTMENT_ID, COUNT(*), SUM(SALARY), ROUND(AVG(SALARY)) FROM EMPLOYEES GROUP BY DEPARTMENT_ID;

-- PL/SQL 
-- departments 에서 반복문을 이용해서 부서 10, 20, 30, 40 정보를 출력하시오.
DECLARE
    VDEPARTMENTS DEPARTMENTS%ROWTYPE;
BEGIN
    FOR I IN 1..9 LOOP
        select * INTO VDEPARTMENTS from departments where department_id = I*10;
        DBMS_OUTPUT.PUT_LINE(VDEPARTMENTS.DEPARTMENT_ID || ' / ' || VDEPARTMENTS.DEPARTMENT_NAME); 
    END LOOP; 
END;
/

select * from departments where department_id = 10;
select * from departments where department_id = 20;
select * from departments where department_id = 30;
select * from departments where department_id = 40;

