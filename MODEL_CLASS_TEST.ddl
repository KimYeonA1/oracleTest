-- 생성자 Oracle SQL Developer Data Modeler 24.3.0.275.2224
--   위치:        2024-11-08 11:47:41 KST
--   사이트:      Oracle Database 21c
--   유형:      Oracle Database 21c



CREATE USER hr IDENTIFIED BY default TABLESPACE USERS 
    QUOTA UNLIMITED ON USERS 
    ACCOUNT UNLOCK 
;

GRANT CREATE DATABASE LINK,
    CREATE SEQUENCE,
    CREATE VIEW,
    CREATE SYNONYM,
    UNLIMITED TABLESPACE,
    ALTER SESSION, CREATE SESSION TO HR 
;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE lesson (
    no             NUMBER(10) NOT NULL,
    num            CHAR(2 CHAR) NOT NULL,
    name           VARCHAR2(20 CHAR) NOT NULL,
    subject_number CHAR(2 CHAR) NOT NULL
)
LOGGING;

ALTER TABLE lesson ADD CONSTRAINT lesson_pk PRIMARY KEY ( no );

CREATE TABLE student (
    no      NUMBER(10) NOT NULL,
    name    CHAR(8 CHAR) NOT NULL,
    id      NVARCHAR2(8) NOT NULL,
    pwd     VARCHAR2(8) NOT NULL,
    code  CHAR(2 CHAR) NOT NULL,
    juminno CHAR(13 CHAR) NOT NULL,
    phone   CHAR(11 CHAR) NOT NULL,
    email   VARCHAR2(40 CHAR),
    enroll  DATE DEFAULT SYSDATE,
    adress  VARCHAR2(20 CHAR)
);

ALTER TABLE student ADD CONSTRAINT student_pk PRIMARY KEY ( code );
ALTER TABLE student ADD CONSTRAINT student_ID_uk UNIQUE( ID );
ALTER TABLE student ADD CONSTRAINT student_juminno_uk UNIQUE( juminno );
ALTER TABLE student ADD CONSTRAINT student_email_uk UNIQUE( email );
ALTER TABLE student ADD CONSTRAINT student_num_fk UNIQUE( num );
    REFERENCES subject (num) ON DELETE CASCADE;

    

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = UPPER('STUDENT') AND CONSTRAINT_TYPE ! = 'C';
SELECT * FROM USER_CONS_COLUMNS WHERE TABLE_NAME = 'STUDENT';




CREATE TABLE subject (
    no   NUMBER(10) NOT NULL,
    num  CHAR(2 CHAR) NOT NULL,
    name VARCHAR2(20 CHAR) NOT NULL
);
ALTER TABLE subject ADD CONSTRAINT subject_pk PRIMARY KEY (NUM);
ALTER TABLE SUBJECT DROP CONSTRAINT SUBJECT_NO_PK;



CREATE TABLE train (
    no           NUMBER(10) NOT NULL,
    code         CHAR(8 CHAR) NOT NULL,
    num          CHAR(2 CHAR) NOT NULL,
    resis        CHAR 
    section      VARCHAR2(10 CHAR) NOT NULL,
--  WARNING: CHAR size not specified 
    resis_1      DATE NOT NULL,
    student_name CHAR(8 CHAR) NOT NULL
);

ALTER TABLE train ADD CONSTRAINT train_pk PRIMARY KEY ( no );

ALTER TABLE lesson
    ADD CONSTRAINT lesson_subject_num_fk
        FOREIGN KEY ( subject_number )
            REFERENCES subject ( "NUMBER" )
            NOT DEFERRABLE;

ALTER TABLE train
    ADD CONSTRAINT train_student_code_fk
        FOREIGN KEY ( student_name )
            REFERENCES student ( name )
            NOT DEFERRABLE;



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             0
-- ALTER TABLE                              6
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              1
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 1
