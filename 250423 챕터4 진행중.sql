--4장 .JOIN
SELECT A.COL1, B.COL1
FROM TABLE1 A, TALBE2 B
WHERE A.COL2 = B.COL2;


SELECT a.col1, b.col1
FROM table1 a, table2 b
WHERE a.col2 = b.col2;

SELECT table1.col1, table2.col2
FROM table1 alias1 table2 alias2
WHERE table1.col2 = table2.col2;

-- 카티션 곱 : 조인 대상 테이블들의 조건이 누락되었을 경우 발생하는 현상으로 해당 조인에 참여하느 몬 든 대상 행을 다 출력합니다.
-- 1. 데이터를 복제해서 원본 테이블을 반복해서 읽는 것을 피하기 위해
-- 2. 실수로 조인 조건 컬럼 중 일부를 빠뜨리는 경우,.

--2. equi join
--예1) emp
select e.empno , e.ename, d.dname
from emp e , dept d
where e.deptno = d.deptno;

select empno, ename, dname
from emp, dept
where emp.deptno = dept.deptno;

select empno, ename, deptno, dname
from emp e, dept d
where e.deptno = d.deptno;
-- 에러

--예2) 
select s.name "stu_name", p.name "prof_name"
from student s , professor p
where s.profno = p.profno;

--예3)
SELECT s.name "STU_NAME",
       d.dname "DEPT_NAME",
       p.name "PROF_NAME"
FROM student s, department d, professor p
WHERE s.deptno1 = d.deptno
  AND s.profno = p.profno;

--예4)
SELECT s.name "STU_NAME", p.name "PROF_NAME"
FROM student s, professor p
WHERE s.profno = p.profno
  AND s.deptno1 = 101;

--3. non-equi join

--예1)
SELECT c.gname "CUST_NAME",
       TO_CHAR(c.point, '999,999') "POINT",
       g.gname "GIFT_NAME"
FROM customer c, gift g
WHERE c.point BETWEEN g.g_start AND g.g_end;

--예2)
select s.name "STU_NAME", o.total "SCORE" ,h.grade "CREDIT" 
From student s, score o, hakjum h
where s.studno = o.studno
and o.total >= h.min_point
and o.total >= h.max_point;

--4. outer join vs inner join
--예1)
select s.name "STU_NAME", p.name "PROF_NAME"
from student s, professor p
where s.profno = p.profno(+) ;
--예2)
select s.name "STU_NAME", p.name "PROF_NAME"
from student s, professor p
where s.profno(+) = p.profno;
--예3)
select s.name "STU_NAME", p.name "PROF_NAME"
from student s, professor p
where s.profno(+) = p.profno
union
select s.name "stu_name", p.name "PROF_NAME"
from student s, professor p
where s.profno = p.profno(+);


--5. self join
select empno, ename, mgr from emp;

select e1.ename "ename", e2.ename "mgr_ename"
from emp e1, emp e2
where e1.mgr = e2.empno;

--연습문제1)
--연습문제2)
--연습문제3)
--연습문제4)
--연습문제5)
--연습문제6)


31페이지