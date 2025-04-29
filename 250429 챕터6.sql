--6장 DML로 데이터를 관리하는 방법을 배웁니다.

--1. insert( 새로운 데이터 입력)

--1)insert를 사용하여 1행씩 입력하기
--insert into table[(column1,column2)]
--values (value 1, value 2);


insert into dept2(decode, dname, pdept, area)
values(9000, 'temp_1', 1006,'temp area');
-- 모든 컬럼에 입력할 경우, 컬럼 이름 생략 가능

--예2 특정 컬럼에 값을 입력하기

insert into dept2(dcode,dname,pdept)
values(9002,'temp_3',106);

--에3 날짜데이터 입력하기

insert into professor(profno, name, id, position, pay, hiredate)
    values(5001, 'james bond', 'love_me','a full professor', 500,' 2014-10-23');

alter session set nls_date_format ='rrrr-mm-dd:hh24:mi:ss';

insert into professor(profno, name, id, position, pay, hiredate)
    values(5001, 'james bond', 'love_me','a full professor', 500,' 2014-10-23');    
    
    
--예4) null값 입력하기
-- 컬럼에 값을 입력하지 않으면 자동으로 null
-- 입력데이터에 null을 적어둠

--예5)음수 값 입력하기

create table t_minus
    ( no1 number,
        no2 number(3),
        no3 number(3,2));
        
insert into t_minus values(1,1,1);
insert into t_minus values(1.1,1.1,1.1);
insert into t_minus values(-1.1,-1.1,-1.1);

select *from t_minus;

--2) insert 와 서브 쿼리를 사용해서 열 행에 입력하기
create table professor3
as 
select * from professor
 where 1 = 2;
 
 select * from professor3;
 
insert into professor3
select *from professor;

create table professor4
as
select profno, name, pay
from professor
where 1= 2;

insert into professor4
select profno, name, pay
from professor
where profno > 4000;


create table prof_3
(profno    NUMbER,
name       varchar2(25)  );

create table prof_4
(profno    NUMbER,
name       varchar2(25)  );


--예1 ) 다른 테이블의 데이터를 가져와서 입력하기

insert all
when profno between 1000 and 1999 then
into prof_3 values(profno, name)
when profno between 2000 and 2999 then
into prof_4 values(profno, name)
select profno, name
from professor;

select * from prof_3;

select * from prof_4;

--예2) 다른 테이블에 동시에 같은 데이터 입력하기
truncate table prof_3 ;

truncate table prof_4;

insert all
into prof_3 values(profno,name)
into prof_4 values(profno,name)
select profno, name
from professor
where profno between 3000 and 3999;

--2. update

--예1)
update professor
set bonus = 200
where position = 'assistant professor';

--예2)
update professor
set pay = pay * 1.15
where position =(select position
                from professor
                where name = 'sharon stone')
and pay <250;

--3. delete
delete from dept2
where dcode >=9000 and decode <= 9999;

--4. merge

CREATE TABLE charge_01
  ( u_date VARCHAR2(6) ,
  cust_no NUMBER ,
  u_time NUMBER ,
  charge NUMBER );

CREATE TABLE charge_02
  ( u_date VARCHAR2(6) ,
  cust_no NUMBER ,
  u_time NUMBER ,
  charge NUMBER );
  
create table ch_total
  ( u_date VARCHAR2(6) ,
  cust_no NUMBER ,
  u_time NUMBER ,
  charge NUMBER );
  
INSERT INTO charge_01 VALUES('141001',1000,2,1000);
INSERT INTO charge_01 VALUES('141001',1001,2,1000) ;
INSERT INTO charge_01 VALUES('141001',1002,1,500) ;
INSERT INTO charge_02 VALUES('141002',1000,3,1500) ;
INSERT INTO charge_02 VALUES('141002',1001,4,2000) ;
INSERT INTO charge_02 VALUES('141002',1003,1,500) ;
COMMIT;

MERGE INTO ch_total total
USING charge_01 ch01
ON (total.u_date = ch01.u_date)
WHEN MATCHED THEN
UPDATE SET total.cust_no = ch01.cust_no
WHEN NOT MATCHED THEN
INSERT VALUES(ch01.u_date, ch01.cust_no, ch01.u_time, ch01.charge) ;

MERGE INTO ch_total total
USING charge_02 ch02
ON (total.u_date = ch02.u_date)
WHEN MATCHED THEN
UPDATE SET total.cust_no = ch02.cust_no
WHEN NOT MATCHED THEN
INSERT VALUES(ch02.u_date, ch02.cust_no, ch02.u_time, ch02.charge) ;

select * from ch_total;

MERGE INTO ch_total total
USING charge_01 ch01
ON ( total.u_date = ch01.u_date )
WHEN MATCHED THEN
    UPDATE SET total.cust_no = ch01.cust_no
WHEN NOT MATCHED THEN
    INSERT VALUES ( ch01.u_date , ch01.cust_no , ch01.u_time , ch01.charge ) ;
    
    
--6. transaction 관리하기

--연습문제 1
desc dept2;
insert into dept2(dcode, dname, pdept, area)
values(9010,'temp_10', 1006,'temp aria');
select * from dept2;

--연습문제 2
insert into dept2(decode,dname, pdept)
values(9020,'temp_20', 1006);
select * from dept2;

--연습문제 3
select * from professor;
insert into professor4
select profno,name, pay
from professor
where profno <= 3000;

--연습문제 4
update professor
set bonus = NVL(bonus,0) + 100
where name = 'sharon stone';

desc professor;
