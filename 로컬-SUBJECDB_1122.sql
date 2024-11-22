-- 1. 학과 컴퓨터, 교육, 신문방송학과, 
CREATE TABLE SUBJECT(
    NO NUMBER,                  --pk, seq
    NUM VARCHAR2(2) NOT NULL,   --학과번호 01, 02, 03, 04, 05
    NAME VARCHAR2(24) NOT NULL  --학과이름
   
);    
Alter table subject add constraint subject_no_pk primary key(no);
Alter table subject add constraint subject_num_uk unique(num);

create sequence subject_seq
start with 1
increment by 1;

--2. 학생
create table student( 
    no number,                     --pk, seq
    num varchar2(8) not null,      --학번(년도학과번호)
    name varchar2(12) not null,    --이름
    id varchar2(12) not null,      --아이디
    passwd varchar2(12) not null,  --패스워드
    s_num varchar2(2) not null,    --학과번호(fk)
    birthday varchar2(8) not null, --생년월일
    phone varchar2(15) not null,   --전화번호
    address varchar2(80) not null, --주소
    email varchar2(40) not null,   --이메일
    sdate date default sysdate     --등록일
  
);

Alter table student add constraint student_no_pk primary key(no);
Alter table student add constraint student_id_uk unique(id);
Alter table student add constraint student_num_uk unique(num);
Alter table student add constraint student_subject_num_fk 
 FOREIGN key (s_num) References subject(num) on delete set null;
alter table student drop constraint student_subject_num_fk;

create sequence student_seq
start with 1
increment by 1;

-- 3. lesson 과목
create table lesson( 
    no number ,                   --pk, seq
    abbre varchar2(2) not null,   --과목 별칭
    l_name varchar2(20) not null  --과목 이름
    );
Alter table lesson add constraint lesson_no_pk primary key(no);
Alter table lesson add constraint lesson_abbre_uk unique(abbre);
    
create sequence lesson_seq 
start with 1
increment by 1;

--trainee 수강신청
create table trainee( 
    no number ,                     --pk seq
    s_num varchar2(8) not null,     --student(fk) 학생번호
    abbre varchar2(2) not null,     --lesson (fk) 과목요약
    section varchar2(20) not null,  --전공, 부전공, 교양
    tdate date default sysdate      --수강신청일
   
);
Alter table trainee add constraint trainee_no_pk primary key(no);
Alter table trainee add constraint trainee_student_num_fk 
 FOREIGN key (s_num) References student(num) on delete set null;
 Alter table trainee add constraint trainee_lesson_abbre_fk 
 FOREIGN key (abbre) References lesson(abbre) on delete set null;
 
   
create sequence trainee_seq 
start with 1
increment by 1;







