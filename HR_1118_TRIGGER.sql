-- TRIGGER 테스팅
-- EMP01 생성 하고 트리거를 생성한다(입력이 될 때마다 입력값을 출력해주는 트리거를 만든다)
DROP TABLE EMP01;
CREATE TABLE EMP01(
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(20),
    JOB VARCHAR(10)
);
DESC EMP01;

CREATE OR REPLACE TRIGGER EMP01_TRIGGER
    AFTER INSERT ON EMP01
    FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE(:NEW.EMPNO || ',' ||:NEW.ENAME || '신입사원이 입사 했습니다.');
END;
/
--자동 번호 매김
INSERT INTO EMP01 VALUES((SELECT NVL(MAX(EMPNO), 0)+1 FROM EMP01),DBMS_RANDOM.STRING('U',4),'IT_DEV');
SELECT * FROM EMP01;
SELECT * FROM SAL01;
------------------------------------------
CREATE TABLE SAL01(
    SALNO NUMBER(4),
    SAL NUMBER,
    EMPNO NUMBER(4)
);
ALTER TABLE SAL01 ADD CONSTRAINTS SAL01_PK PRIMARY KEY(SALNO);
ALTER TABLE SAL01 ADD CONSTRAINTS SAL01_FK FOREIGN KEY(EMPNO) REFERENCES EMP01(EMPNO);

SELECT * FROM USER_CONS_COLUMNS WHERE TABLE_NAME = 'SAL01';
--시퀀스로 번호 매기기
CREATE SEQUENCE SAL01_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 100000
NOCYCLE
CACHE 2;

CREATE OR REPLACE TRIGGER EMP01_TRIGGER2
AFTER INSERT ON EMP01
FOR EACH ROW
BEGIN
    INSERT INTO SAL01 VALUES(SAL01_SEQ.NEXTVAL, 100000, :NEW.EMPNO);
    DBMS_OUTPUT.PUT_LINE(:NEW.EMPNO || '번호 사원이 SAL01에 잘 들어왔습니다.');
END;
/
--EMP01 에서 사원의 정보를 제거했을 때 SAL01 해당되는 사원의 정보가 삭제되도록 프로그램하시오.
CREATE OR REPLACE TRIGGER EMP01_TRIGGER3
    AFTER DELETE ON EMP01
    FOR EACH ROW
BEGIN
    --SAL01 해당되는 사원의 정보가 삭제
    DELETE FROM SAL01 WHERE EMPNO = :OLD.EMPNO;
    DBMS_OUTPUT.PUT_LINE(:OLD.EMPNO || '번호가 SAL01에서 삭제되었습니다.');
END;
/

DELETE FROM EMP01 WHERE EMPNO = 4;
SELECT * FROM EMP01;
SELECT * FROM SAL01;

--입고 테이블에 상품이 입력되면 입고 수량을 상품 테이블의 재고 수량에 추가하는 트리거 작성
-- 상품테이블
DROP TABLE PRODUCT;
CREATE TABLE PRODUCT(
    CODE CHAR(6),
    NAME  VARCHAR(12) NOT NULL,
    COMPANY VARCHAR(12),
    PRICE NUMBER(8),
    STOCK NUMBER DEFAULT 0
);
ALTER TABLE PRODUCT ADD CONSTRAINTS PRODUCT_CODE_PK PRIMARY KEY(CODE);
DESC PRODUCT;

INSERT INTO PRODUCT VALUES('A00001','세탁기', 'LG', 1500000, 0);
INSERT INTO PRODUCT VALUES('A00002','컴퓨터', 'LG', 1000000, 0);
INSERT INTO PRODUCT VALUES('A00003','냉장고', '삼성', 4500000,0);

SELECT * FROM PRODUCT;
-- 입고테이블
DROP TABLE RECEIVING;
CREATE TABLE RECEIVING(
    NO NUMBER(6),
    CODE CHAR(6),
    RDATE DATE,
    QTY NUMBER(6),
    PRICE NUMBER(8),
    AMOUNT NUMBER(8)
);
ALTER TABLE RECEIVING ADD CONSTRAINTS RECEVING_NO_PK PRIMARY KEY(NO);
ALTER TABLE RECEIVING ADD CONSTRAINTS RECEVING_CODE_PK FOREIGN KEY(CODE) REFERENCES PRODUCT(CODE); 

DESC RECEIVING;

-- 트리거 생성 입고(RECEIVING) 입력이 되면 재고(PRODUCT) 수량의 입고 수량이 저장되는 트리거를 생성할것
CREATE OR REPLACE TRIGGER RECEIVING_TRIGGER01
    AFTER INSERT ON RECEIVING
    FOR EACH ROW
BEGIN
    UPDATE PRODUCT SET STOCK = STOCK + :NEW.QTY WHERE CODE = :NEW.CODE;
END;
/

-- 입고수량을 등록한다.
INSERT INTO RECEIVING(NO,CODE, QTY, PRICE, AMOUNT) 
VALUES( (SELECT NVL(MAX(NO),0)+1 FROM RECEIVING),'A00002', 10, 680000, 780000);

INSERT INTO RECEIVING(NO,CODE, QTY, PRICE, AMOUNT) 
VALUES( (SELECT NVL(MAX(NO),0)+1 FROM RECEIVING),'A00003', 20, 3000000, 3000000);

INSERT INTO RECEIVING(NO,CODE, QTY, PRICE, AMOUNT) 
VALUES( (SELECT NVL(MAX(NO),0)+1 FROM RECEIVING),'A00001', 30, 1000000, 1000000);

INSERT INTO RECEIVING(NO,CODE, QTY, PRICE, AMOUNT) 
VALUES( (SELECT NVL(MAX(NO),0)+1 FROM RECEIVING),'A00001', 10, 1000000, 1000000);

SELECT * FROM PRODUCT;
SELECT * FROM RECEIVING; 

-- 갱신트리거 만들기 입고수량을 30 => 10 진행을 했는데 마지막 10개를 5개수정하면, PRODUCT 재고수량을 수정하는
-- 트리거를 만들것
CREATE OR REPLACE TRIGGER RECEIVING_TRIGGER
    AFTER UPDATE ON RECEIVING
    FOR EACH ROW
BEGIN
    UPDATE PRODUCT SET STOCK = STOCK + (-:OLD.QTY + :NEW.QTY) WHERE CODE = :NEW.CODE;  
END;
/

UPDATE RECEIVING SET QTY = 8, PRICE=1000000, AMOUNT=1000000 WHERE NO = 3 ; 
UPDATE RECEIVING SET QTY = 4, PRICE=1000000, AMOUNT=1000000 WHERE NO = 3 ; 
ROLLBACK;

SELECT * FROM PRODUCT;
SELECT * FROM RECEIVING;
DELETE FROM RECEIVING WHERE NO = 4;

--삭제트리거 (입고부분에서 삭제가 되면 재고부분에서 삭제된 수량을 빼준다)
CREATE OR REPLACE TRIGGER RECEIVING_DEL_TRIGGER
    AFTER DELETE ON RECEIVING
    FOR EACH ROW
BEGIN
    UPDATE PRODUCT SET STOCK = STOCK - (:OLD.QTY) WHERE CODE = :OLD.CODE;  --코드가 같은 경우 뺴라
END;
/
SELECT * FROM RECEIVING;
SELECT * FROM PRODUCT;

DELETE FROM RECEIVING WHERE NO = 3;





