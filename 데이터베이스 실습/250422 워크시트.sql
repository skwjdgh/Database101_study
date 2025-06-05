select * from emp;

select 
    lpad(ename,9, '123456789') as "LPAD", 
    rpad(ename,9, substr( '123456789',lengthb(ename))) as "RPAD"
from emp
where deptno = 10;

select median(length(ename)) from emp;

select * from emp;

select replace(ename,substr(ename,2,2), '--') as "replace" 
from emp
where deptno = 20;

select * from student;

select name, jumin, replace(jumin,substr(jumin,7,7),'-/-/-/-/-') as "REPLACE"
from student
where deptno1 =101 ;

select name, tel, replace(tel, substr(tel,5,3),'***') as "REPLACE"
from student
where deptno1 = 102;

desc student;
select name,tel,replace(tel,substr(tel,instr(tel,')',1)+1,(instr(tel,'-',1)-1 - instr(tel,')',1)),'***') "REPLACE"
from student
where deptno =101;

select name, tel, replace(tel, substr(tel,9,4),'****') as "REPLACE"
from student
where deptno1 = 101;

select sysdate from dual;
select round(12.345,1) from dual;

select 
    mod(12,5),
    ceil(123.45),
    floor(123.45)
from
    dual;
    
    
select 2+ '2' from dual;

select MONTHS_BETWEEN('14/09/30', '14/08/31')
from dual;


alter session set nls_date_format='yy/mm/dd' ;

select sysdate from dual;

select * from student;

alter session set nls_date_format='dd-mm-yy' ;
select studno , name , birthday 
from student
where TO_CHAR(birthday,'mm') = '01';

select * from emp;
alter session set nls_date_format = 'yy/mm/dd';

select empno,ename, hiredate
from emp
where TO_CHAR(hiredate,'MM') in ('01','02','03');


select * from emp;
alter session set nls_date_format = 'yyyy-mm-dd';
select empno, ename, hiredate,
    to_char((sal*12)+comm,'$999,999') as "SAL",
    to_char((sal*12*1.15)+comm,'$999,999') as "15% UP" 
from emp
where comm is not null;

desc emp;


select empno, ename, comm, nvl2(comm,'EXIST','NULL')as "NVL2"
from emp
where deptno = 30;

select * from student;

select name, jumin, decode(substr(jumin,7,1),1,'man','woman') AS GENDER
from student
where deptno1 = 101;

select name, tel, decode(SUBSTR(TEL,1,3),
    '02)','SEOUL',
    '031','GYEONGGI',
    '051','BUSAN',
    '052','ULSAN',
    '055','GYEONGNAM') AS "LOC"
from student
where deptno1 = 101;

SELECT NAME, TEL,
    DECODE(SUBSTR(TEL,1,INSTR(TEL,')',1) -1), //SUBSTR( 범주, 시작점, 끝점 ')'을 제외하기 위해 -1
    '02','SEOUL',
    '031','GYEONGGI',
    '051','BUSAN',
    '052','ULSAN',
    '055','GYEONGNAM') AS "LOC"
from student
where deptno1 = 101;

SELECT * FROM EMP;

DESC SAL FROM EMP;
SELECT EMPNO,ENAME,SAL,
    CASE WHEN SAL BETWEEN 1 AND 1000 THEN 'LEVEL 1'
         WHEN SAL BETWEEN 1001 AND 2000 THEN 'LEVEL 2'
         WHEN SAL BETWEEN 2001 AND 3000 THEN 'LEVEL 3'
         WHEN SAL BETWEEN 3001 AND 4000 THEN 'LEVEL 4'
         ELSE 'LEVEL 5'
    END AS "LEVEL"
FROM EMP
ORDER BY SAL DESC;

select *from t_reg
where regexp_like(text,'[a-z]'); //regexp_like 특정 문자나 숫자를 포함하는 결과 출력

select *from t_reg
where regexp_like(text,'[A-Z]');

select *from t_reg
where regexp_like(text,'[a-zA-Z]');

select *from t_reg
where regexp_like(text,'[a-z] ');

select *from t_reg
where regexp_like(text,'[a-z] [0-9]');

select *from t_reg
where regexp_like(text,'[[:space:]]');

select *from t_reg
where regexp_like(text,'[A-Z]{2}');
select *from t_reg
where regexp_like(text,'[A-Z]{3}');
select *from t_reg
where regexp_like(text,'[A-Z]{4}');

select *from t_reg
where regexp_like(text,'[0-9]{3}');

select *from t_reg
where regexp_like(text,'[A-Z]{3}[0-9]{3}');

select *from t_reg
where regexp_like(text,'[A-Z]');

select *from t_reg
where regexp_like(text,'[[:upper:]]');

select *from t_reg
where regexp_like(text,'^[A-Za-z]');

select *from t_reg
where regexp_like(text,'^[0-9A-Z]');

select *from t_reg
where regexp_like(text,'^[0-9]|^[A-Z]');

select *from t_reg
where regexp_like(text,'[[:alpha:]]$');

select count(*),count(comm)
from emp;

select count(comm), sum(comm)
from emp;

set null '--null--' ;
select ename, comm
from emp;