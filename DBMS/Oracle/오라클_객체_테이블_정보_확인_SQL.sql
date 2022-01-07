-- 실행 전 접속 계정 확인
show user;

-- 테이블 정보 (간소하게)
select * from tab;

-- 테이블 세부 정보
select * from user_tables;
-- user_tables 는 metadata 이기 때문에 함부로 접근하면 안되게 함 
-- user_XXXXX 는 system view!(보안을 위해)
-- 오직 view를 통해서만 접근(readonly) 가능
-- user_tables 는 view 인데, 해당 view 는 hr 계정 소유가 아니기 때문에 현재계정명.뷰명 으로 접근 불가!

-- 오라클 객체 정보 접근
select * from user_tables;
select * from user_indexes;
select * from user_sequences;
select * from user_views;
select * from user_synonyms;

-- 테이블 구성정보 보기
-- desc 테이블명;
desc employees;
