-- 실행 전 접속 계정 확인
show user;

-- select ~ from 테이블명; : 전체 레코드 대상에서 출력하기
-- select 절에 올 수 있는 요소
-- (1) * (와일드카드) : 모든 컬럼 보기
select * 
from employees;
select * 
from departments;

-- (2) 컬럼명 : 보고 싶은 컬럼만 확인
select employee_id, last_name, hire_date, salary
from employees;

-- (3) 산술 연산자 : 연산 가능!
select last_name, salary, salary * 12
from employees;

-- (4) 컬럼 별칭 : as "별칭" -- as 생략 가능하지만 가독성을 위해 붙이는 것 권장
select last_name as 이름, salary as 월급, salary * 12 as 연봉
from employees;
-- 별칭에 공백 및 특수문자 사용 -- ""으로 감싸준다.  cf. 별칭이 아닌 일반 리터럴 부분에서는 ''(홑따옴표)로 감싸준다.
select last_name as "사원 이름", salary as "사원 월급", salary * 12 as "연 봉"
from employees;

-- (5) 함수 : NVL(컬럼명, 대체값) -> 해당 컬럼에서 값이 null일 때, 연산할 수 있도록 다른 값으로 대체하는 함수
-- Sales 사원은 수수료(commision_pct)를 연봉에 반영해주어야 함
select last_name as 이름, salary as 월급, commission_pct as 수수료, salary * 12 + commission_pct as 연봉
from employees;
-- 수수료가 없는 사원은 연봉이 null 로 나옴
-- null 을 다른 값과 연산하면 결과는 null 이 나온다
-- 제대로 연봉을 출력하기 위해서 null 값을 연산 가능한 값으로 치환하여 연산해야 함 -- nvl(컬럼명, 치환값)
-- 모든 사원의 연봉을 제대로 출력하기
select last_name as 이름, salary as 월급, commission_pct as 수수료, salary * 12 + nvl(commission_pct, 0) as 연봉
from employees;

-- (6) 연결 연산자 (||) : 컬러명을 연결하여 하나의 컬럼으로 출력
-- i. 컬럼끼리 연결
select last_name || salary as "이름 월급"
from employees;
-- ii. 컬럼 + 리터럴(** 홑따옴표(')로 감싸주기) 연결
select last_name || ' 사원' 
from employees;
-- iii. 컬럼명 + 리터럴 여러개 혼합하여 연결 및 별칭 주기
select last_name || '의 직업은 ' || job_id || ' 입니다.' as "사원별 직급"
from employees;

-- (7) DISTINCT 연산자 : distinct 컬럼명 - 해당 컬럼에서 중복된 값 제거후 출력 : 
select distinct job_id
from employees;
