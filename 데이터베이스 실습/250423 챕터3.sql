--3장 



--1)count() 함수
select count(*), count(comm)
from emp;

--2) sum() 함수
select count(comm), sum(comm)
from emp;

set null --null--;
select ename, comm
from emp;

--3) avg() 함수
select count(comm), sum(comm), avg(comm)
from emp;

--4) max()/ min()
select max(sal), min(sal)
from emp;

alter session set nls_date_format = 'yy/mm/dd';
alter session set nls_date_format = 'dd-mon-yy';
select max(hiredate) "max",
min(hiredate) "min"
from emp;

--5)stddev()/variance()
select stddev(sal), variance(sal)
from emp;

select deptno, avg(nvl(sal,0)) "AVG"
from emp
group by deptno;

select deptno, job, avg(nvl(sal,0)) "avg_sal"
from emp
group by deptno, job --최근 버전에서는 자동 정렬이 안되므로 반드시 order by 사용
order by 1,2; 


--기타) rollup() 자동으로 소계 및 합계
select deptno,job,round(avg(sal),1) avg_sal,count(*) cnt_emp
from emp
group by rollup(deptno,job); -- 순서가 존재함


create table professor2
as select deptno,position,pay
from professor;

select * from professor2;

insert into professor2 values(101,'instructor', 100);
insert into professor2 values(101,'a full professor', 100);
insert into professor2 values(101,'assistant professor', 100);
commit;

--group by 순서
select deptno, position,sum(pay)
from professor2
group by deptno, rollup(position);


--2)cube 함수 -소계와 전체 합계까지 출력 
select deptno, null job, round(avg(sal),1) avg_sal, count(*) cnt_emp
from emp
group by deptno
union all

select null deptno, job, round(avg(sal),1) avg_sal, count(*) cnt_emp
from emp
group by job
union all

select deptno, job, round(avg(sal),1) avg_sal, count(*) cnt_emp
from emp
group by deptno,job
union all

select null deptno,null job, round(avg(sal),1) avg_sal,count(*) cnt_emp
from emp
order by deptno, job;

--3) grouping sets
select grade, count(*)
from student
group by grade
union
select deptno1, count(*)
from student
group by deptno1;

select grade, deptno1, count(*)
from student
group by grouping sets(grade, deptno1);

select grade, deptno1,count(*) ,sum(height), sum(weight)
from student
group by grouping sets(grade, deptno1);


--4) listagg()함수

set lin 200
col listagg for a50
select deptno,
    listagg(ename,'->') within group(order by hiredate) "listagg"
from emp
group by deptno; --4000 BYTE 가 넘을 경우 XMLAGG XML 함수

--5) pivot() 함수

// decode를 사용한 기존 방법

col sun for a4
col mon for a4
col tue for a4
col wed for a4
col thu for a4
col fri for a4
col sat for a4

select max(decode(day,'SUN',dayno)) SUN,
    max(decode(day,'MON',dayno)) MON,
    max(decode(day,'TUE',dayno)) TUE,
    max(decode(day,'WED',dayno)) WED,
    max(decode(day,'THU',dayno)) THU,
    max(decode(day,'FRI',dayno)) FRI,
    max(decode(day,'SAT',dayno)) SAT
FROM CAL
GROUP BY WEEKNO
ORDER BY WEEKNO;

SELECT DECODE(DAY,'SUN',DAYNO)SUN,
    DECODE(DAY,'MON',DAYNO)MON,
    DECODE(DAY,'TUE',DAYNO)TUE,
    DECODE(DAY,'WED',DAYNO)WED,
    DECODE(DAY,'THU',DAYNO)THU,
    DECODE(DAY,'FRI',DAYNO)FRI,
    DECODE(DAY,'SAT',DAYNO)SAT
FROM CAL;

select max(decode(day,'SUN',dayno)) SUN,
    max(decode(day,'MON',dayno)) MON,
    max(decode(day,'TUE',dayno)) TUE,
    max(decode(day,'WED',dayno)) WED,
    max(decode(day,'THU',dayno)) THU,
    max(decode(day,'FRI',dayno)) FRI,
    max(decode(day,'SAT',dayno)) SAT
FROM CAL;

//ASCII 코드 
SELECT ASCII('2'),
    ASCII('29'),
    ASCII('8') 
FROM DUAL;

//PIVOT 기능을 사용하여 달력 만들기
COL WEEK FOR A4

SELECT * FROM (SELECT WEEKNO "WEEK", DAY, DAYNO FROM CAL)

PIVOT(MAX(DAYNO) FOR DAY IN('SUN' AS "SUN",
                            'MON' AS "MON",
                            'TUE' AS "TUE",
                            'WED' AS "WED",
                            'THU' AS "THU",
                            'FRI' AS "FRI",
                            'SAT' AS "SAT"))
ORDER BY "WEEK";

-- 부서별 각 직급별 인원 수 계산 
SELECT DEPTNO,
    COUNT(DECODE(JOB,'CLECK','0')) "CLERK",
    COUNT(DECODE(JOB,'MANAGER','0')) "MANAGER",
    COUNT(DECODE(JOB,'PRESIDENT','0')) "PRESIDENT",
    COUNT(DECODE(JOB,'ANALYST','0')) "ANALYST",
    COUNT(DECODE(JOB,'SALESMAN','0')) "SALESMAN"
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

COL CLECK FOR A8
COL MANAGER FOR A8
COL PRESIDENT FOR A8
COL ANALYST FOR A8
COL SALESMAN FOR A8

SELECT DEPTNO,
    DECODE(JOB,'CLECK','0')"CLERK",
    DECODE(JOB,'MANAGER','0')"MANAGER",
    DECODE(JOB,'PRESIDENT','0')"PRESIDENT",
    DECODE(JOB,'ANALYST','0')"ANALYST",
    DECODE(JOB,'SALESMAN','0')"SALESMAN"
FROM EMP;

SELECT DEPTNO,
    DECODE(JOB,'CLECK','9')"CLERK",
    DECODE(JOB,'MANAGER','9')"MANAGER",
    DECODE(JOB,'PRESIDENT','9')"PRESIDENT",
    DECODE(JOB,'ANALYST','9')"ANALYST",
    DECODE(JOB,'SALESMAN','9')"SALESMAN"
FROM EMP;


COL CLECK FOR 9999999
COL MANAGER FOR 9999999
COL PRESIDENT FOR 9999999
COL ANALYST FOR 9999999
COL SALESMAN FOR 9999999

SELECT DEPTNO,
    COUNT(DECODE(JOB,'CLECK','9'))"CLERK",
    COUNT(DECODE(JOB,'MANAGER','9'))"MANAGER",
    COUNT(DECODE(JOB,'PRESIDENT','9'))"PRESIDENT",
    COUNT(DECODE(JOB,'ANALYST','9'))"ANALYST",
    COUNT(DECODE(JOB,'SALESMAN','9'))"SALESMAN"
FROM EMP
GROUP BY DEPTNO;
SELECT * FROM( SELECT DEPTNO, JOB, EMPNO FROM EMP)
PIVOT (
COUNT(EMPNO) FOR JOB IN('CLERK' AS "CLECK",
                        'MANAGER' AS "MANAGER",
                        'PRESIDENT' AS "PRESIDENT",
                        'ANALYST' AS "ANALYST",
                        'SALESMAN' AS "SALESMAN"))
ORDER BY DEPTNO;

COL C_COUNT FOR 9999999
COL C_SUM FOR 9999999
COL M_COUNT FOR 9999999
COL M_SUM FOR 9999999
COL P_COUNT FOR 9999999
COL P_SUM FOR 9999999
COL A_COUNT FOR 9999999
COL A_SUM FOR 9999999
COL S_COUNT FOR 9999999
COL S_SUM FOR 9999999

SELECT * FROM(SELECT DEPTNO, JOB , EMPNO, SAL FROM EMP)
PIVOT(
    COUNT(EMPNO) AS COUNT, 
    SUM(NVL(SAL,0)) AS SUM FOR JOB IN('CLERK' AS "C",
                                    'MANAGER' AS "M",
                                    'PRESIDENT' AS "P",
                                    'ANALYST' AS "A",
                                    'SALESMAN' AS "S")
)
ORDER BY DEPTNO;

--6)UNPIVOT()함수 
CREATE TABLE UPIVOT
AS SELECT * FROM( SELECT DEPTNO, JOB, EMPNO FROM EMP)
    PIVOT
    (
    COUNT(EMPNO)
    FOR JOB IN('CLERK' AS "CLERK",
                'MANAGER' AS "MANAGER",
                'PRESIDENT' AS "PRESIDENT",
                'ANALYST' AS "ANALYST",
                'SALESMAN' AS "SALESMAN")
    );
    
SELECT * FROM UPIVOT;

UNPIVOT(
EMPNO FOR JOB IN(CLERK,MANAGER,PRESIDENT, ANALYST,SALESMAN));


--7) LAG함수 // (출력할 컬럼, OFFSET, 기본 출력값) OVER(QUERY_PARTITION 구문, ORDER BY 정렬할 칼럼)
    
SELECT ENAME, HIREDATE, SAL, LAG(SAL,1,0) OVER (ORDER BY HIREDATE) "LAG"
FROM EMP;

SELECT ENAME, HIREDATE, SAL, LAG(SAL,3,2) OVER(ORDER BY HIREDATE) "LAG"
FROM EMP;


--8)LEAD 함수 
SELECT ENAME, HIREDATE, SAL, LEAD(SAL,2,1) OVER(ORDER BY HIREDATE) " LEAD"
FROM EMP;


--9) RANK 함수

SELECT RANK('SMITH') WITHIN GROUP (ORDER BY ENAME) "RANK"
FROM EMP; --RANK 뒤의 데이터와 ORDER BY 뒤의 데이터는 같은 컬럼

-- 예제1 
SELECT EMPNO, ENAME, SAL,
    RANK() OVER(ORDER BY SAL) AS RANK_ASC,
    RANK() OVER(ORDER BY SAL DESC) AS RANK_DESC
FROM EMP;


-- 예제2

select empno, ename, sal,
    rank() over(order by sal desc) "rank"
from emp
where deptno = 10;

-- 예제3

select empno,ename, sal , deptno,
    rank() over(partition by deptno order by sal desc) "rank"
from emp;

-- 예제4

select empno, ename, sal, deptno,job,
    rank() over(partition by deptno,job order by sal desc) "rank"
from emp;

-- 10)dense_rank 순위 함수

select empno, ename, sal,
    rank() over(order by sal desc) sal_rank,
    dense_rank() over (order by sal desc) sal_dense_rank
from emp;

--11) row_number() 순위 함수
select empno, ename, job, sal,
    rank() over (order by sal desc) sal_rank,
    dense_rank() over(order by sal desc) sal_dense_rank,
    row_number() over(order by sal desc) sal_row_num
from emp;


--12) sum() over를 활용한 누계 구하기
select p_date, p_code, p_qty, p_total,
sum(p_total) over(order by p_total)"total"
from panmae
where p_store = 1000;

--예2)
select p_date, p_code, p_qty,p_total,
    sum(p_total) over(partition by p_code order by p_total) "Total"
from panmae
where p_store = 1000;

--예3)
select p_code, p_store, p_date, p_qty, p_total,
    sum(p_total) over(partition by p_code, p_store order by p_date) "total"
from panmae;

--13) ratio_to_report()

SELECT p_code,SUM(SUM(p_qty)) OVER () AS total_qty,SUM(SUM(p_total)) OVER () AS total_price,
    p_store,p_qty,p_total,
    ROUND(RATIO_TO_REPORT(SUM(p_qty)) OVER () * 100, 2) AS qty_percent,
    ROUND(RATIO_TO_REPORT(SUM(p_total)) OVER () * 100, 2) AS total_percent
FROM panmae
WHERE p_code = 100
GROUP BY p_code, p_store, p_qty, p_total;

--14) lag

SELECT 
    p_store, p_date, p_code, p_qty,
    LAG(p_qty,1) OVER (ORDER BY p_date) AS "D-1 QTY",
    p_qty - LAG(p_qty,1) OVER (ORDER BY p_date) AS "DIFF-QTY",
    p_total,
    LAG(p_total,1) OVER (ORDER BY p_date) AS "D-1 PRICE",
    p_total - LAG(p_total,1) OVER (ORDER BY p_date) AS "DIFF-PRICE"
FROM panmae
WHERE p_store = 1000;

SELECT 
    p_store, p_date, p_code, p_qty,
    LAG(p_qty,1) OVER (PARTITION BY p_store ORDER BY p_date) AS "D-1 QTY",
    p_qty - LAG(p_qty,1) OVER (PARTITION BY p_store ORDER BY p_date) AS "DIFF-QTY",
    p_total,
    LAG(p_total,1) OVER (PARTITION BY p_store ORDER BY p_date) AS "D-1 PRICE",
    p_total - LAG(p_total,1) OVER (PARTITION BY p_store ORDER BY p_date) AS "DIFF-PRICE"
FROM panmae;

-- 그룹 함수 연습 문제 1
DESC DMP;
SELECT MAX(SAL + NVL(COMM,0)) "MAX", MIN(SAL+NVL(COMM,0)) "MIN",
    ROUND(AVG(SAL+NVL(COMM,0)),1) "AVG"
FROM EMP;

-- 그룹 함수 연습 문제 2
DESC STUDENT;
SELECT COUNT(*)||'EA' "TOTAL",
    COUNT(DECODE(TO_CHAR(BIRTHDAY, 'MM'),'01',0))||'EA' "JAN",
    COUNT(DECODE(TO_CHAR(BIRTHDAY, 'MM'),'02',0))||'EA' "FEB",
    COUNT(DECODE(TO_CHAR(BIRTHDAY, 'MM'),'03',0))||'EA' "MAR",
    COUNT(DECODE(TO_CHAR(BIRTHDAY, 'MM'),'04',0))||'EA' "APR",
    COUNT(DECODE(TO_CHAR(BIRTHDAY, 'MM'),'05',0))||'EA' "MAY",
    COUNT(DECODE(TO_CHAR(BIRTHDAY, 'MM'),'06',0))||'EA' "JUN",
    COUNT(DECODE(TO_CHAR(BIRTHDAY, 'MM'),'07',0))||'EA' "JUL",
    COUNT(DECODE(TO_CHAR(BIRTHDAY, 'MM'),'08',0))||'EA' "AUG",
    COUNT(DECODE(TO_CHAR(BIRTHDAY, 'MM'),'09',0))||'EA' "SEP",
    COUNT(DECODE(TO_CHAR(BIRTHDAY, 'MM'),'10',0))||'EA' "OCT",
    COUNT(DECODE(TO_CHAR(BIRTHDAY, 'MM'),'11',0))||'EA' "NOV",
    COUNT(DECODE(TO_CHAR(BIRTHDAY, 'MM'),'12',0))||'EA' "DEC"
FROM STUDENT;

-- 그룹 함수 연습 문제 3
SELECT COUNT(*) "TOTAL",
    COUNT(DECODE(SUBSTR(TEL,1, INSTR(TEL,')') -1), '02',0)) "SEOUL",
    COUNT(DECODE(SUBSTR(TEL,1, INSTR(TEL,')') -1), '031',0)) "GYEONGGI",
    COUNT(DECODE(SUBSTR(TEL,1, INSTR(TEL,')') -1), '051',0)) "BUSAN",
    COUNT(DECODE(SUBSTR(TEL,1, INSTR(TEL,')') -1), '052',0)) "ULSAN",
    COUNT(DECODE(SUBSTR(TEL,1, INSTR(TEL,')') -1), '053',0)) "DAEGU",
    COUNT(DECODE(SUBSTR(TEL,1, INSTR(TEL,')') -1), '055',0)) "GYEONGNAM"
FROM STUDENT;

-- 그룹 함수 연습 문제 4

INSERT INTO EMP(EMPNO, DEPTNO,ENAME, SAL)VALUES(1000,10,'TIGER',3600);
INSERT INTO EMP(EMPNO, DEPTNO,ENAME, SAL)VALUES(2000,30,'CAT',3000);
COMMIT;

SELECT EMPNO, ENAME, JOB, SAL FROM EMP;

SELECT DEPTNO,
    SUM(DECODE(JOB,'CLERK',SAL,0)) "CLERK",
    SUM(DECODE(JOB,'MANAGER',SAL,0)) "MANAGER",
    SUM(DECODE(JOB,'PRESIDENT',SAL,0)) "PRESIDENT",
    SUM(DECODE(JOB,'ANALYST',SAL,0)) "ANALYST",
    SUM(DECODE(JOB,'SALESMAN',SAL,0)) "SALESMAN",
    SUM(NVL2(JOB , SAL, 0)) "TOTAL"
FROM EMP
GROUP BY ROLLUP(DEPTNO);

-- 그룹 함수 연습 문제 5

SELECT DEPTNO, ENAME, SAL,
        SUM(SAL) OVER(ORDER BY SAL) "TOTAL"
FROM EMP;

-- 그룹 함수 연습 문제 6

SELECT * FROM FRUIT;
SELECT SUM(DECODE(NAME, 'APPLE', 100)) APPLE,
        SUM(DECODE(NAME, 'GRAPE', 200)) GRAPE,
        SUM(DECODE(NAME, 'ORANGE', 300)) ORANGE
FROM FRUIT;

-- 그룹 함수 연습 문제 7

SELECT
    COUNT(*) || 'EA (' || ROUND((COUNT(*) / COUNT(*)) * 100, 2) || '%)' AS "TOTAL",
    COUNT(DECODE(SUBSTR(TEL,1, INSTR(TEL,')') -1), '02',0)) || 'EA' AS "SEOUL",
    COUNT(DECODE(SUBSTR(TEL,1, INSTR(TEL,')') -1), '031',0)) || 'EA' AS "GYEONGGI",
    COUNT(DECODE(SUBSTR(TEL,1, INSTR(TEL,')') -1), '051',0)) || 'EA' AS "BUSAN",
    COUNT(DECODE(SUBSTR(TEL,1, INSTR(TEL,')') -1), '052',0)) || 'EA' AS "ULSAN",
    COUNT(DECODE(SUBSTR(TEL,1, INSTR(TEL,')') -1), '053',0)) || 'EA' AS "DAEGU",
    COUNT(DECODE(SUBSTR(TEL,1, INSTR(TEL,')') -1), '055',0)) || 'EA' AS "GYEONGNAM"
FROM STUDENT;

-- 그룹 함수 연습 문제 8

SELECT DEPTNO, ENAME, SAL,
    SUM(SAL) OVER(PARTITION BY DEPTNO ORDER BY SAL) "TOTAL"
FROM EMP;

-- 그룹 함수 연습 문제 9

SELECT DEPTNO, ENAME, SAL,
    SUM(SAL) OVER() "TOTAL SAL",
    ROUND(RATIO_TO_REPORT(SAL) OVER () * 100, 2) AS "%"
FROM EMP
GROUP BY DEPTNO, ENAME, SAL
ORDER BY 5 DESC;

-- 그룹 함수 연습 문제 10

SELECT DEPTNO, ENAME, SAL, 
    SUM(SAL) OVER(PARTITION BY DEPTNO) "SUM_DEPT",
    ROUND((RATIO_TO_REPORT(SUM(SAL)) OVER(PARTITION BY DEPTNO)) * 100, 2) "%"
FROM EMP
GROUP BY DEPTNO, ENAME, SAL
ORDER BY 1;

-- 그룹 함수 연습 문제 11

SELECT * FROM LOAN;
SELECT L_DATE "대출일자", L_CODE "대출종목코드", L_QTY "대출 건수", L_TOTAL "대출 총액",
    SUM(L_TOTAL) OVER(ORDER BY L_DATE) "누적 대출금액"
FROM LOAN
WHERE L_STORE = 1000;

-- 그룹 함수 연습 문제 12

SELECT * FROM LOAN;
SELECT L_DATE "대출일자", L_CODE "대출종목코드", L_QTY "대출 건수", L_TOTAL "대출 총액",
    SUM(L_TOTAL) OVER(PARTITION BY L_CODE, L_STORE ORDER BY L_DATE) "누적 대출금액"
FROM LOAN;

-- 그룹 함수 연습 문제 13
SELECT * FROM LOAN;
SELECT L_DATE "대출일자", L_CODE "대출종목코드", L_QTY "대출 건수", L_TOTAL "대출 총액",
    SUM(L_TOTAL) OVER(PARTITION BY L_CODE ORDER BY L_DATE) "누적 대출금액"
FROM LOAN
WHERE L_STORE = 1000;

-- 그룹 함수 연습 문제 14
SELECT DEPTNO, NAME, PAY,
    SUM(PAY) OVER() " TOTAL PAY",
    ROUND(RATIO_TO_REPORT(SUM(PAY)) OVER() * 100, 2) " RATIO %"
    
FROM PROFESSOR
GROUP BY DEPTNO, NAME, PAY
ORDER BY 5 DESC;

-- 그룹 함수 연습 문제 15