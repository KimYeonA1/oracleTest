
CREATE TABLE DOCTOR(
DOCID CHAR(6),
DOCNAME VARCHAR2(10),
CLASSID CHAR(6)
);
alter table DOCTOR add constraint DOCTOR_DOCID_pk primary key(DOCID);