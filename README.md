<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=blur&height=200&color=gradient&text=SQL101&descAlign=59&section=header">
</p>

# 📘 Database101_study

이 저장소는 SQL 학습을 위한 개인 스터디 공간입니다.  
SQL 기초부터 실습, SQLD 자격증 대비 내용까지 정리되어 있습니다.

---

## 🎯 목표

- 관계형 데이터베이스의 구조와 개념 이해
- 실습 중심의 SQL 문법 학습
- 데이터베이스 설계 및 성능 최적화 기초 습득
- SQL 관련 자격증(SQLD 등) 대비

---

## 🛠️ 개발 환경

- **OS**: Windows 11  
- **DBMS**: Oracle 19c  
- **Tool**: SQL Developer  

### 🧩 Oracle 설치 및 환경 설정

> ※ 수업에서 사용한 설치 방법을 기준으로 작성하였습니다.

1. 오라클 공식 홈페이지에서 다음 파일 다운로드:
   - `WINDOWS.X64_193000_db_home`
   - `sqldeveloper-24.3.1.347.1826-x64`

2. Oracle 설치 진행  
   - `WINDOWS.X64_193000_db_home` 설치

3. 관리자 권한으로 CMD 실행 후 사용자 생성:
   ```sql
   sqlplus / as sysdba
   create user [id] identified by [pw];
   grant connect, resource, dba to [id];
   commit;
   ```

4. SQL Developer 압축 해제 후 실행

---

## 📁 디렉토리 구조

```
Database101/
├── README.md              # 저장소 소개 및 요약
├── CLASS/                 # 수업 관련 자료
│   └── 기타/
├── SQLD/                  # SQLD 자격증 준비 자료
│   └── 기타/
└── EXAMPLE                # 개인 연습 자료                 
    └── 기타/
```
[CLASS](https://github.com/skwjdgh/Database101_study/tree/CLASS)<br>
[SQLD](https://github.com/skwjdgh/Database101_study/tree/SQLD)<br>
[EXAMPLE](https://github.com/skwjdgh/Database101_study/tree/EXAMPLE)
---
