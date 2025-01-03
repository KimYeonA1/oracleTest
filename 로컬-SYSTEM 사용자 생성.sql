--1 사용자가 정의한 테이블스페이스 만들기
create TABLESPACE firstdata
datafile 'C:\oraclexe\oradata\XE\first01.dbf' size 10M;
--2 용량이 부족시 테이블 스페이스 확장하기
alter tablespace firstdata
add datafile 'C:\oraclexe\oradata\XE\first02.dbf' size 1M;
--3 용량이 부족시 테이블 스페이스 용량을 확대하기
alter database
datafile 'C:\oraclexe\oradata\XE\first02.dbf' resize 10M;
--4 용량이 부족시 자동으로 1M씩 확장하고 최대 20M까지 확장하도록 설정
alter database
datafile 'C:\oraclexe\oradata\XE\first02.dbf'
AUTOEXTEND ON
next 1M
MAXSIZE 20M;
--5 자바프로젝트를 위해서 사용자 계정 및 테이블스페이스(javadata), 파일명(app_data.dbf) 생성하기
create TABLESPACE javadata
DATAFILE 'C:\oraclexe\oradata\XE\app_data.dbf' size 20M
AUTOEXTEND on
next 3M
MAXSIZE 500M;   --1번. 프로젝트 할 때 이거부터 만들기

--5 자바프로젝트 사용자 계정 생성하기 
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
DROP USER  javauser CASCADE; -- 기존 사용자 삭제
CREATE USER javauser IDENTIFIED BY 123456 -- 사용자 이름: Model, 비밀번호 : 1234
    DEFAULT TABLESPACE javadata  --데이터 저장소
    TEMPORARY TABLESPACE TEMP;  --임시저장 장소
GRANT connect, resource, dba TO javauser; -- 권한 부여

--7 접속기능 진행


















