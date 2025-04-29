--5장 ddl 명령과 딕셔너리

--다양한 오라클 명령어 종류들

--DML
--DDL
--DCL
--select

--1. create
--1) create table
--2) 기본 입력 값을 설정하면서 생성
--3) 한글 이름으로 테이블 생성
--4) 글로벌 템프 테이블 - 임시테이블
-- 끄면 사라짐, 다른 세션에서는 사용이 불가능하더
--on commit delete rows 커밋을 하면 데이터가 삭제됨
-- 생성되어 있는 임시 테이블 조회하기
--5) 테이블 복사하기(CTAS라고도 함)
--(1) 모든 컬럼 다 복사하기
--(2) 구조만 가져오고 데이터 안가져오기 

--2. alter 명령
CREATE TABLE DEPT6
AS
SELECT DCODE,DNAME
FROM DEPT2
WHERE DCODE IN(1000,1001,1002);

SELECT *FROM DEPT6;

ALTER TABLE DEPT6
ADD(LOCATION VARCHAR2(10));

SELECT * FROM DEPT6;

ALTER TABLE DEPT6
ADD(LOCATION2 VARCHAR2(10)) DEFAULT 'SEOUL');


--2) 테이블의 컬럼 이름 변경하기
ALTER TAblE dept6 RENAME COLUMN LOCATION2 TO LOC;

RENAME DEPT6 TO dept7;

--3) 컬럼의 데이터 크기 조정하기
DESC dept7;

ALTER TAblE dept7
MODIFY(loc VARCHAR2(20));

--4) 컬럼 삭제하기
alter table dept7 drop column loc;

alter table dept7 drop column loc cascade constraints;

--3. truncate명령
truncate table dept7;

--4. drop 명령
drop table dept7;

--5. delete, truncate, drop 의 차이점
--delete 는 테이블의 내용만 지움, attri는 남김
--truncate 는 att를 제외한 테이블구조를 지워버림
--drop 은 테이블 전체를 지움

--6-1. 읽기 전용 테이블로 변경하기

create table t_readonly
(no Number ,
name varchar2(10));

insert into t_readonly values(1,'AAA');

commit;

select * from t_readonly;

alter table t_readonly read only;

insert into t_readonly values(2,'BBB');
-- 읽기 전용 테이블을 컬럼 추가 시도

-- 읽기 전용 테이블을 다시 읽기, 쓰기로 변경함
alter table t_readonly read write;

drop table t_readonly;


--6-1. 가상 컬럼 테이블 생성하기
create table vt1
( col1 number,
    col2 number,
    col3 number generated always as(col1+ col2));

insert into vt1 values(1,2,3);

insert into vt1 (col1,col2) values(1,2);

insert into vt1 (col1,col2,) values(1,2);

select * from vt1;

update vt1
set col1= 5;

select * from vt1;

alter talbe vt1
add(col4 generated always as ((col1*12) + col2));

select *from vt1;

set line 200
col column_name for a10
col data_type for a10
col dat_default for a25

select column_name,
    data_type,
    data_default
from user_tab_columns
where table_name = 'vt1'
order by column_id;


CREATE TABLE sales10
    (   no   NUMBER,
        pcode CHAR(4),
        pdate CHAR(8),
        pqty NUMBER,
        pbungi NUMBER(1)
 GENERATED ALWAYS AS
 (
    CASE
        WHEN SUBSTR(pdate,5,2) IN ('01','02','03') THEN 1
        WHEN SUBSTR(pdate,5,2) IN ('04','05','06') THEN 2
        WHEN SUBSTR(pdate,5,2) IN ('07','08','09') THEN 3
        ELSE 4
    END ) 
    virtual );


--7.data dictionary


--5장 연습문제
create table new_emp(
    no              number(5),
    name            varchar2(20),
    hiredate        date,
    bonus           number(6,2));
    
--연습문제 2
create table new_emp2
as
    select no, name, hiredate
    from new_emp;
    
--연습문제 3
creat table new_emp3
as
    select * from new_emp2
    where 1-2;
    
--연습문제 4
alter table new_emp2
add(birthday date default sysdate);

--연습문제 5
alter table new_emp2
rename column birthday to birth;

--연습문제 6
alter table new_emp2
modify(no number(7));

desc new_emp2;

--연습문제 7
alter table new_emp2
drop column birth;

--연습문제 8
insert into new_emp2 values (1,'hong',sysdate);
select * from new_emp2;

truncate table new_emp2;

--연습문제 9
drop table new_emp2;

1~9번 까지 문제

