//자바에서 CallableStatement test
DROP TABLE EMP1;
CREATE TABLE EMP1
AS
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID, SALARY FROM EMPLOYEES;

SELECT * FROM EMP1 ORDER BY DEPARTMENT_ID;

--부서별 번호와 인상율을 입력하면 해당되는 부서만 인상률로 적용하는 SQL문을 프로시저로 작성
CREATE OR REPLACE PROCEDURE BOOKS_PROCEDURE(
    VID IN BOOKS.ID%TYPE, VPRICE IN BOOKS.PRICE%TYPE)
IS
BEGIN
    UPDATE BOOKS 
    SET PRICE = PRICE + VPRICE WHERE ID = VID;
    COMMIT;
END;
/
EXECUTE BOOKS_PROCEDURE(1, 10000);

SELECT * FROM EMP1 ORDER BY DEPARTMENT_ID;

------------------------------------------------
CREATE OR REPLACE FUNCTION BOOKS_FUNCTION(VID IN BOOKS.ID%TYPE)RETURN VARCHAR2
IS
    VBOOKS_RT BOOKS%ROWTYPE;
    VMESSAGE VARCHAR2(100);
BEGIN
    --UPDATE BOOKS 
    --SET PRICE = PRICE + VPRICE WHERE ID = VID;
    --COMMIT;
    SELECT * INTO VBOOKS_RT FROM BOOKS WHERE ID = VID;
    VMESSAGE := VBOOKS_RT.ID||'번호의 총 금액은'||VBOOKS_RT.PRICE ||'입니다';
    RETURN VMESSAGE;
END;
/

SELECT BOOKS_FUNCTION(3) FROM DUAL;