// 단일행 함수

//1. 문자함수

//1)inicap()함수 - 첫글자만 대문자
select ename, initcap(ename) "INITCAP"
from emp
where deptno =10;
//2)lower() and upper()
select ename, lower(ename) "Lower", upper(ename) "Upper"
from emp
where deptno = 10;
//3) length()/lengthb()
select ename, length(ename),lengthb(ename) 문자 반환 / 바이트 반환 (한영구분 필요)
from emp
where deptno = 20;
//4)concat() - || 연결 연산자와 동일 기능
select concat(ename, job)
from emp
where deptno = 10;
//5) substr()

col "3,2" for a6
col "-3,2" for a6
col "-3,4" for a6

select substr('abcde',3,2) "3,2",
    substr('abcde',-3,2) "-3,2",
    substr('abcde',-3,4) "-3,4"
from dual;

select name, substr(jumin,3,4) "birthday",
            substr(jumin,3,4) -1 "birthday -1"
from student
where deptno1 = 101;

//6) substrb()
select '서진수' "NAME", substr('서진수', 1,2) "substr0",
                        substrb('tjwlstn',1,2) "substrb"
from dual;
                        
// instr(문자열,찾는 글자, 시작위치, 몇번째인지(기본값은 1))

select 'A-B-C-D' , instr('A-B-C-D','-',1,3) "instr"
from dual; //6

select 'A-B-C-D' , instr('A-B-C-D','-',3,1) "instr"
from dual; //4


// 예제1
select name, tel, instr(tel,')')
from student
where deptno1= 201;

// 예제2
select name, tel, instr(tel,'3')
from student
where deptno1 = 101;

//연습문제 
select name, tel, substr (tel,1, instr(tel,')')-1)
from student
where deptno1 =201;

//lpad() 함수
select name, id ,lpad(id,10,'*')
from student
where deptno1 = 201;

//lpad()퀴즈 (문자열, 자릿수, 채울문자)
select ename ,lpad(ename,10,'123456789')
from emp
where deptno = 10;

//rpad() 함수
select ename, rpad(ename, 10,'-') "RPAD"
from emp
where deptno = 10;

//rpad() 함수 (문자열, 자릿수, 채울문자)
select ename, rpad(ename, 10, SUBSTR('123456789', LENGTHB(ename)+1)) "RPAD"
from emp
where deptno = 10;

//ltrim() 함수
select ename from emp
where deptno =10;
select ltrim(ename,'C')
from emp
where deptno = 10;

//rtrim() 함수
select ename, rtrim(ename,'R') "RTRIM"
from emp
where deptno = 10;

//replace() 함수
select ename, replace(ename, substr(ename,1,2),'**' ) "replace"
from emp
where deptno = 10;

//replace() 퀴즈1
select ename, replace(ename, substr(ename,2,2),'--') 
from emp
where deptno = 20;

//replace() 퀴즈2
select name, jumin, replace(jumin, substr(jumin,8,7),'-/-/-/-')
from student
where deptno1 = 101;

//replace() 퀴즈3
select name, tel, replace(tel, instr(tel,'-',4),'****')
from student
where deptno1 =102;

//replace() 퀴즈4

select name, tel, replace(tel, substr(tel, instr(tel, '-')+1,4) ,'****')
from student
where deptno1 = 101;


//2. 숫자함수
//1) round() 함수
select round(987.654,2) "round1",
round(987.654,0) "round2",
round(987.654,-1) "round3"
from dual;

//2) trunc() 함수
select trunc(987.654,2) "trunc1",
trunc(987.654,0) "trunc2",
trunc(987.654,-1) "trunc3"
from dual;

//3) mod(), ceil(), floor()
select mod(123,10) "mod", --나머지
ceil(123.45) "ceil", --주어진 숫자에서 가장 가까운 큰 정수
floor(123.45) "floor" -- 주어진 함수와 가까운 작은 정수
from dual;

--4) power() 함수
select power(2,3) from dual;

//3. 날짜함수
--1)sysdate
select sysdate from dual;

--2)months_between
select months_between('14/09/30','14/08/31')
from dual; -- 큰 값을 먼저 써야 양수 출력, 같은 달일 경우, 특정 규칙에 의한 별도값 출현

--2-1) 날짜 형식 지정
alter session set nls_date_format = 'yy/mm/dd';

--3)add_month() 함수 -월 추가
select sysdate, add_months(sysdate,1)
from dual;

--4)next_day() 함수
select sysdate, next_day('14/05/01','월') --주어진 날짜에 가장 가까운 월요일
from dual;

--5)last_day()
select sysdate, last_day(sysdate), last_day('14/05/01')
from dual;

--6) 날짜의 round(), trunc() 함수
alter session set nls_date_format =' yyyy-mm-dd: hh24:mi:ss';
select sysdate, round(sysdate), trunc(sysdate)
from dual;


//4-1. 변환함수) 묵시적 데이터형 변환
--1) 묵시적 형변환
select 2 + to_number('2')
from dual; -- 숫자처럼 생긴 문자만 변환 가능

--2) to_char( 날짜 -> 문자형)
select sysdate, to_char(sysdate,'yyyy') "yyyy",
                 to_char(sysdate,'rrrr') "rrrr",
                  to_char(sysdate,'yy') "yy",
                   to_char(sysdate,'rr') "rr",
                    to_char(sysdate,'year') "year"
from dual;

select sysdate, to_char(sysdate,'mm') "mm",
                 to_char(sysdate,'mon') "mon",
                  to_char(sysdate,'month') "month"
from dual;

select sysdate, to_char(sysdate,'dd') "dd",
                 to_char(sysdate,'day') "day",
                  to_char(sysdate,'ddth') "ddth"
from dual;

--날짜 변환하기 퀴즈1
alter session set nls_date_format ='yy/mm/dd';
select studno, name, birthday
from student
where to_char(birthday,'mm') ='01';

--날짜 변환하기 퀴즈2
alter session set nls_date_format = 'yy/mm/dd';
select empno,ename,hiredate
from emp
where to_char(hiredate,'mm') in ('01','02','03');

--3) to_char(숫자 -> 문자)
--예제1
select empno, ename, sal, comm,
    to_char((sal*12)+comm, '999,999') "salary"
from emp
where ename = 'ALLEN';
--예제2 
select name, pay,bonus,
    to_char((pay*12)+bonus, '999,999') "total"
from professor
where deptno =201 ;


--예제3
SELECT EMPNO, ENAME, HIREDATE, '$'||to_char((SAL*12), '999,999'), '$'||to_char((SAL*12*1.5), '999,999')
FROM EMP
WHERE COMM IS NOT NULL;

--4)to_NUMBER()
SELECT TO_NUMBER('5') FROM DUAL;

--5)TO_DATE()
SELECT TO_DATE('2014/05/31') FROM DAUL;


//4-2. 변환함수) 명시적 데이터형 변환



//5. 일반함수

--1) NVL() 함수 : NULL 값을 만나면 다른 값으로 치환해서 출력하는 함수 (컬럼, 치환할 값)
SELECT ENAME, COMM, NVL(COMM,0), NVL(COMM,100)
FROM EMP
WHERE DEPTNO =30;

SELECT * FROM PROFESSOR;
--NVL 함수 퀴즈
SELECT PROFNO, NAME, PAY, NVL(BONUS,0) , TO_CHAR(PAY*12+NVL(BONUS,0),'9,999') AS TOTAL
FROM PROFESSOR
WHERE DEPTNO =201;

--2) NVL2() 함수 
SELECT EMPNO, ENAME, SAL, COMM,NVL2(COMM,SAL+COMM,SAL*0) "NVL2"
FROM EMP
WHERE DEPTNO =30;


--3)DECODE() 함수 타 언어의 IF문 DECODE(A,B,'1',NULL)

--예제1)
SELECT DEPTNO, NAME, DECODE(DEPTNO, 101, 'COMPUTER ENGINEERING') "DNAME"
FROM PROFESSOR;
--예제2)
SELECT DEPTNO, NAME, DECODE(DEPTNO, 101, 'COMPUTER ENGINEERING', 'ETC') "DNAME"
FROM PROFESSOR;
--예제3)
SELECT DEPTNO, NAME, DECODE(DEPTNO, 101, 'COMPUTER ENGINEERING',
                                    102, 'MULTIMEDIA ENGINEERING',
                                    103, 'SOFTWARE ENGINEERING',
                                        'ETC') "DNAME"
FROM PROFESSOR;
--예제4)
SELECT DEPTNO, NAME, DECODE(DEPTNO, 101, DECODE(NAME, 'Audie Murphy' ,'BEST!')) "ETC"
FROM PROFESSOR;
--예제5)
SELECT DEPTNO, NAME, DECODE(DEPTNO, 101, DECODE(NAME, 'Audio Murphy','BEST!', 'GOOD!'))  "ETC"
FROM PROFESSOR;
--예제6)
SELECT DEPTNO, NAME, DECODE(DEPTNO, 101, DECODE(NAME, 'Audio Murphy','BEST!', 'GOOD!'),'N/A') "ETC"
FROM PROFESSOR;
--DECODE 연습문제1
SELECT NAME, JUMIN, DECODE(SUBSTR(JUMIN, 7,1) ,'1','남자','2','여자')
FROM STUDENT
WHERE DEPTNO1 = 101;
--DECODE 연습문제2
SELECT 
    NAME, 
    TEL, 
    DECODE(SUBSTR(TEL,1 ,INSTR(TEL, ')') - 1),
                            '02', 'SEOUL',
                            '031', 'GYEONGGI',
                            '051', 'BUSAN',
                            '052', 'ULSAN',
                            '055', 'GYEONGNAM',
                            'UNKNOWN') AS REGION
FROM STUDENT
WHERE DEPTNO1 = 101;


--4) CASE문: CASE 조건 WHEN 결과 1 THEN 출력 1[WHEN결과 2 THEN 출력 2]ELSE출력 3END “컬럼명
--예1)
SELECT NAME, TEL,
    CASE(SUBSTR(TEL,1, INSTR(TEL,')')-1)) WHEN '02' THEN 'SEOUL'
                                            WHEN '031' THEN 'GYEONGGI'
                                            WHEN '051' THEN 'BUSAN'
                                            WHEN '052' THEN 'ULSAN'
                                            WHEN '055' THEN 'GYEONGNAM'
                                                    ELSE 'ETC'
    END  "LOC"
FROM STUDENT
WHERE DEPTNO1 = 201;

--예2)

SELECT NAME, SUBSTR(JUMIN,3,2) "MONTH"
            CASE WHEN SUBSTR(JUMIN,3,2) BETWEEN'01' AND '03' THEN '1/4'
                WHEN SUBSTR(JUMIN,3,2) BETWEEN'04' AND '06' THEN '2/4'
                WHEN SUBSTR(JUMIN,3,2) BETWEEN'07' AND '09' THEN '3/4'
                WHEN SUBSTR(JUMIN,3,2) BETWEEN'10' AND '12' THEN '4/4'
            END "QUARTER"
            
FROM STUDENT ;

--CASE 연습 문제
SELECT empno, ename, sal, 
    CASE 
        WHEN sal BETWEEN 1 AND 1000 THEN 'Level 1'
        WHEN sal BETWEEN 1001 AND 2000 THEN 'Level 2'
        WHEN sal BETWEEN 2001 AND 3000 THEN 'Level 3'
        WHEN sal BETWEEN 3001 AND 4000 THEN 'Level 4'
        WHEN sal > 4000 THEN 'Level 5'
        ELSE 'Unknown'  -- 급여가 0 이하일 경우를 처리
    END "SAL"
FROM emp;


--6) 정규식 조건
--1 ^ 해당 문자로 시작하는 LINE 출력
--2 $ 해당 문자로 끝나는 LINE 출력
--3 . ‘S....E' S로 시작하여 E 으로 끝나는 line  1 character)
--* 모든이라는 뜻, 글자수가 0일 수도 있음. 
--[] 해당 문자에 해당하는 한 문자 
--[^] 해당 문자에 해당하지 않는 한 문자

SELECT * FROM T_REG;

--1) REGEXP_LIKE 함수
SELECT * FROM T_REG
WHERE REGEXP_LIKE(TEXT, '[A-Z]');

SELECT * FROM T_REG
WHERE REGEXP_LIKE(TEXT, '[a-z]');

SELECT * FROM T_REG
WHERE REGEXP_LIKE(TEXT, '[a-zA-Z]');

SELECT * FROM T_REG
WHERE REGEXP_LIKE(TEXT, '[a-z] ');

SELECT * FROM T_REG
WHERE REGEXP_LIKE(TEXT, '[a-z] [0-9]');

SELECT * FROM T_REG
WHERE REGEXP_LIKE(TEXT, '[[:space:]]'); --대소문자 구분 ,소문자로만

SELECT * FROM T_REG
WHERE REGEXP_LIKE(TEXT, '[A-Z]{2}');

SELECT * FROM T_REG
WHERE REGEXP_LIKE(TEXT, '[A-Z]{3}');

SELECT * FROM T_REG
WHERE REGEXP_LIKE(TEXT, '[A-Z]{4}');

SELECT * FROM T_REG
WHERE REGEXP_LIKE(TEXT, '[0-9]{3}');

SELECT * FROM T_REG
WHERE REGEXP_LIKE(TEXT, '[A-Z][0-9]{3}');

SELECT * FROM T_REG
WHERE REGEXP_LIKE(TEXT, '[A-Z]');
SELECT * FROM T_REG
WHERE REGEXP_LIKE(TEXT, '[[:upper:]]');

SELECT * FROM T_REG
WHERE REGEXP_LIKE(TEXT, '^[A-Za-z]');

SELECT * FROM T_REG
WHERE REGEXP_LIKE(TEXT, '^[0-9A-Z]');

SELECT * FROM T_REG
WHERE REGEXP_LIKE(TEXT, '^[a-z]|^[0-9]');

SELECT NAME, ID
FROM STUDENT
WHERE REGEXP_LIKE(ID, '^M(a|o)'); --MA MO 출력

SELECT * FROM T_REG
WHERE REGEXP_LIKE(TEXT,'[a-zA-Z]$');

SELECT * FROM T_REG
WHERE REGEXP_LIKE(TEXT,'[[:alpha:]]$');

SELECT * FROM T_REG
WHERE REGEXP_LIKE(TEXT,'^[^a-z]'); -- ^^를 통해 시작하지 않는 행 구현

SELECT * FROM T_REG
WHERE REGEXP_LIKE(TEXT,'^[^0-9]');

SELECT *FROM T_REG
WHERE REGEXP_LIKE(TEXT,'[^a-z]'); -- 소문자행 제거

SELECT *FROM T_REG
WHERE NOT REGEXP_LIKE(TEXT,'[a-z]'); --소문자가 들어 있는 모든 행 제거

--예제1)
SELECT NAME, TEL
FROM STUDENT
WHERE REGEXP_LIKE(TEL, '^[0-9]{2}\)[0-9]{4}');

--예제2)
SELECT NAME, ID
FROM STUDENT
WHERE REGEXP_LIKE(ID,'...r.');

--예제3)
SELECT * FROM T_REG2; 
SELECT * FROM T_REG2
WHERE REGEXP_LIKE(IP,'^[10]{2}\.[10]{2}\.[10]{2}') ;
SELECT * FROM T_REG2
WHERE REGEXP_LIKE(IP,'^[172]{3}\.[16]{2}\.[168]{3}') ;

--예제4)
SELECT * FROM T_REG
WHERE NOT REGEXP_LIKE(TEXT, '[a-zA-Z]');
SELECT * FROM T_REG
WHERE NOT REGEXP_LIKE(TEXT, '[0-9]');

--예제5) 특수문자 찾기
SELECT * FROM T_REG
WHERE REGEXP_LIKE(TEXT,'!');


select *from t_reg
where regexp_like(text,'?');

select *from t_reg
where regexp_like(text,'*');

select *from t_reg
where regexp_like(text,'\?');

select *from t_reg
where regexp_like(text,'\*');

//regexp_replace 함수
regexp_replace(source_char, pattern[, replace_string[, position[, occurrence[,match_param]]]])

--예제 1)
select text,regexp_replace(text,'([0-9])','\1-+') "Add Char"
from t_reg;


--예제 2)
set line 200
col no for 999
col ip for a20
col "don remove" for a20

select no,ip,regexp_replace(ip,'w',',') "dot remove"
from t_reg2;

col replace for a20
select no, ip, regexp_replace(ip,'w.','/',1,1) "replace"
from t_reg2;

select regexp_replace('aaa bbb','( ){1,}','') from dual;


--예제 3)
select regexp_replace('aaa bbb','( ){1,}','')
from dual;

select regexp_replace('aaa bbb',' ( ){2,}','') "one",
        regexp_replace('aaa   bbb','(){2,}','') "two"
from dual;

select regexp_replace('aaa bbb',' ( ){2,}','') "one",
        regexp_replace('aaa   bbb','(){2,}','') "two",
        regexp_replace('aaa      bbb','(){2,}','') "three"
from dual;

--예제 4)
set verify off
select studno, name, id
from student
where id=regexp_replace('&id','( ){1,}','');

select studno, name, id
from student
where id=LOWER(regexp_replace('&id','(){1,}',''));

--예제 5)

select regexp_replace('20141023','([[:digit:]]{4})([[:digit:]]{2})([[:digit:]]{2})','\1-\2-\3')
from dual;


--3) regexp_substr 함수

select regexp_substr('abc* *def $ghi %kjl','[^ ]+[def]') from dual;

--예제 1)
SELECT name, 
       LTRIM(REGEXP_SUBSTR(hpage, 'https?://([^/]+)', 1, 1, NULL, 1)) AS "URL"
FROM professor
WHERE hpage IS NOT NULL;

--예제 2)
col email for a20
col name for a20
col domain for a20

SELECT name,
       LTRIM(REGEXP_SUBSTR(email, '@([[:alnum:].-]+)', 1, 1, NULL, 1)) AS domain
FROM professor
WHERE deptno IN (101, 201);

col result for a10

select regexp_substr('sys/oracle@racdb:1521:racdb','[^:]+',1,3)result
from dual;

select regexp_substr('sys/oracle@racdb:1521:racdb','[^:]+',1,2)result
from dual;

select regexp_substr('sys/oracle@racdb:1521:racdb','[^/:]+',1,2)result
from dual;

select regexp_substr('sys/oracle@racdb:1521:racdb','[^/:]+',1,1)result
from dual;

--1)regexp_count 함수
set pagesize 50 
select text, regexp_count(text,'A')
from t_reg;

select text, regexp_count(text, 'c',3)
from t_reg;

select text, regexp_count(text,'c',1,'i') "result 2"
from t_reg;

SELECT text,
       regexp_count(text, ',') AS result1,
       regexp_count(text, '\.') AS result2
FROM t_reg;

SELECT text,
       regexp_count(text, 'aa') AS result1,
       regexp_count(text, 'a{2}') AS result2,
       regexp_count(text, '(a)(a)') AS result3
FROM t_reg;


101페이지