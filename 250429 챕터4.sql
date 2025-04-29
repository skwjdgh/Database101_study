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

select name as "stu_name", department.deptno as "deptno1" , department.dname as "dept_name"
from student, department
where student.deptno1 = department.deptno;

--연습문제2)

select emp2.name, emp2.position, TO_CHAR(emp2.pay, '999,999,999') , 
                                TO_CHAR(p_grade.s_pay, '999,999,999') as "low pay" , 
                                TO_CHAR(p_grade.e_pay, '999,999,999') as "high pay"
from emp2, p_grade
where emp2.position = p_grade.position;

--연습문제3)

select * from emp2;
select * from p_grade;

select emp2.name, TRUNC(MONTHS_BETWEEN(SYSDATE, emp2.birthday) / 12) AS age, 
        emp2.position,
        p_grade.position
from emp2, p_grade
where TRUNC(MONTHS_BETWEEN(SYSDATE, emp2.birthday) / 12) between s_age and e_age; --trunc((sysdate-e.birthday)/365,0)


--prof's way
desc emp2;
select * from p_grade;

--연습문제4)
select * from customer;
select * from gift;
select * from customer, gift;

select c.gname as "cust_name", c.point, g.gname
from customer c, gift g
where g.g_start <= c.point and g.gname ='Notebook';

--연습문제5) 셀프 조인 문제

select * from professor;

select p1.profno, p1.name, p1.hiredate, count(p2.profno)  
from professor p1, professor p2
where p2.hiredate(+) < p1.hiredate --(+)자신을 기준으로?
group by p1.profno, p1.name, p1.hiredate
order by count(p2.profno) ASC; 


--연습문제6)

select * from emp;

select e1.empno, e1.ename, e1.hiredate, count(e2.empno)
from emp e1, emp e2
where e2.hiredate(+) < e1.hiredate
group by e1.empno, e1.ename, e1.hiredate
order by count(e2.empno) ASC;
