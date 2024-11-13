--Transaction 
DROP TABLE DEP02;
--테이블복사 (구조만 복사)
CREATE TABLE DEP02
AS
SELECT * FROM DEPARTMENTS WHERE 1 = 0; 
---------------------여기까지 커밋 됨 , 롤백하면 여기 위치까지 됨
--테이블복사 (내용만 복사)
INSERT INTO DEP02 SELECT * FROM DEPARTMENTS; 

SAVEPOINT C1;

DELETE FROM DEP02 WHERE DEPARTMENT_ID = 90;

--복사 확인하기
SELECT * FROM DEP02;

ROLLBACK TO C1; --구조만 보이게 됨

