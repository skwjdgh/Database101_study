<p align>
  <img src = "https://capsule-render.vercel.app/api?type=blur&height=200&color=gradient&text=SQL101&descAlign=59&section=header">


# Database101_study

이 저장소는 데이터베이스 기초를 학습하기 위한 개인 스터디 공간입니다.  
SQL 기본 문법부터 시작하여, 점차 복잡한 쿼리 및 데이터 모델링까지 확장할 예정입니다.

---
## How to setup database & sql developer

- 이 설치법은 수업에서 사용한 방법을 기준으로 합니다.
- 오라클 홈페이지 내 WINDOWS.X64_193000_db_home 및 sqldeveloper-24.3.1.347.1826-x64 다운
- WINDOWS.X64_193000_db_home 설치
- cmd 관리자 권한 접속
- sqlplus  / as sysdba 입력
- create user [id] identified by [pw]; 아이디/비밀번호 생성
- grant connect, resource, dba to [id]; 권한 부여
- commit; 내용 적용
- sqldeveloper-24.3.1.347.1826-x64 압축해제
- 접속에서 빈칸을 채움 - 기존값을 기준
- 실행

---
## Repository Structure

현재 파일 구성:

- `250422 챕터1.sql`:  
  SQL 기본 문법 연습 파일입니다.  
  - 데이터베이스 생성 및 삭제
  - 테이블 생성
  - 기본적인 데이터 삽입 및 조회
  - 제약 조건 설정 (PK, FK 등)
  -및 연습문제

---

- `250423 챕터2.sql`:  
  SQL 기본 문법 연습 파일입니다.  
  - 단일행 함수
  - 문자 함수
  - 숫자, 날짜, 일반 함수
  - 변환 함수 (묵시적, 명시적)
  -및 연습문제

---

- `250423 챕터3.sql`:  
  SQL 기본 문법 연습 파일입니다.
  
  -GROUP함수 EX) COUNT, SUM,AVG,MAX,MIN,STDDEV)
  -GROUP BY절
  -ROLLUP, CUBE, GROUPING SETS 등등
  -및 연습문제

---

- `250429 챕터4.sql`:  
  SQL 기본 문법 연습 파일입니다.  
  - JOIN 함수
  - 카티션 곱
  - EQUI JOIN
  - NON EQUI JOIN
  - OUTER AND INNER JOIN
  - SELF JOIN
  - 및 연습문제

---


##  목표

- 관계형 데이터베이스의 구조와 개념 이해
- 실습 중심의 SQL 문법 습득
- 데이터베이스 설계 및 성능 최적화 기초 습득

---

