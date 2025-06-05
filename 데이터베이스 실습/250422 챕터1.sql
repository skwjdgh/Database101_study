//select 명령어

//테이블 정렬
desc dept; 

//한 화면에 출력 가능한 줄 길이 설정
set line 200

//한 페이지에 출력 가능한 줄 수 설정
set pages 50

col empno for 9999

col ename for a8

select * from dept;

//표현식 사용 출력
select name, 'AH,Ha!!!' "Admire_thing"
from professor;

// 따옴표 사용 주의
select ename, ''''||ename||'''' "start"
from emp;

// 중복값 제거 distinct - 중복 값 제거 후 출력, 반드시 select 뒤에 사용
select deptno from emp;
select distinct deptno from emp;

// 연결 연산자 ||
select ename || job from emp;

select ename || ' ''s job is ' || job "NAME and JOB"
from emp;

// 연습문제 1 
select * from student;
select name || ' ''s ID :'|| id ||', Weight is '||weight ||'Kg' as "ID AND WEIGHT" 
from student;
// 연습문제 2
select * from emp;
select ename||'('||job||') , '||ename||''''||job||''''
from emp;
// 연습문제 3
select * from emp;
select ename||'''s sal is $'||sal as "Name and Sal"
from emp;

// where절 사용
select ename, sal
from emp
where empno =7900;

select ename, sal
from emp
where sal < 1000;

select ename, sal
from emp
where ename ='SMITH' ;

select empno,ename,sal
from emp
where hiredate = '80/12/17';

// 산술 연산자 사용
select ename, sal, sal+100
from emp
where deptno = 10;

select ename, sal, sal*1.1
from emp
where deptno = 10;

// 비교 연산자 사용
select empno,ename,sal
from emp
where sal >= 4000;

select empno,ename,sal
from emp
where ename >= 'W';

select ename, hiredate
from emp;

select ename, hiredate
from emp
where hiredate >= '81/12/25';

// between 연산자
select empno, ename, sal
from emp
where sal between 2000 and 3000;
// where sal >= 2000
// and sal <= 3000;

select ename from emp
where ename between 'JAMES' and 'MARTIN'
order by ename;

// in 연산자
select empno, ename, deptno
from emp
where deptno in(10,20);

// like 연산자
select empno, ename, sal
from emp
where sal like '1%';

select empno, ename, hiredate
from emp
where hiredate like '%80';


//is null/is not null 연산자
select empno, ename, comm
from emp
where comm = NULL; // 선택된 로우가 없음

select empno, ename, comm
from emp
where comm is NULL;

select empno, ename, comm
from emp
where comm is not NULL;

//and , or 연산자
select ename, hiredate, sal
from emp
where hiredate > '01-JAN-82'
and sal >= 1300;

select ename, hiredate, sal
from emp
where hiredate > '01-JAN-82'
or sal >= 1300;

// &기호를 사용해서 외부에서 값 입력 받기 가능

select empno, ename, sal
from emp
where empno = &empno;

//order by
select ename, sal, hiredate
from emp
order by ename;
 //두번 정렬하기
select deptno, sal, ename
from emp
order by deptno ASC , sal DESC;

select ename, sal, hiredate
from emp
where sal > 1000
order by 2, 1; // 2=> sal 오름차순 정렬, 만약 sal이 동일한 값을 가진다면 1 => ename 오름차순 정렬
 
 //집합 연산자
 
 //union - studno로 정렬함
 select studno, name, deptno1, 1
 from student
 where deptno1 = 101
 union
 select profno, name, deptno, 2
 from professor
 where deptno =101;


//union all - 정렬되지 않고 출력


//intersect - 교집함
select studno, name
from student
where deptno1 = 101
intersect
select studno, name
from student
where deptno2 = 201 ;

//minus 연산자 
select empno, ename, sal
from emp
minus
select empno, ename, sal
from emp
where sal >2500

//