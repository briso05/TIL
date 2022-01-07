-- 실행 전 접속 계정 확인
show user;

-- 1. 정렬 : ORDER BY ~ ASC[또는 DESC]
-- 오름차순[asc] 기본 : 값 작은 것 -> 큰 것
-- 내림차순[desc] : 큰 것 -> 작은 것
-- 수 데이터, 날짜 데이터, 문자 데이터(ASCI 코드 기준) 모두 정렬 가능
-- null => 가장 큰 값으로 취급
select employee_id, last_name, salary, commission_pct
from employees
order by commission_pct desc;

-- ORDER BY 뒤에 올 수 있는 표현식
-- (1) 컬럼명 : order by 컬럼명
-- salary 오름차순 정렬
select employee_id, last_name, job_id, salary
from employees
order by salary;
-- salary 내림차순 [desc] 정렬
select employee_id, last_name, job_id, salary
from employees
order by salary desc;

-- (2) 별칭 : order by 별칭 
select employee_id, last_name, job_id, salary as "월급"
from employees
order by 월급 desc;

-- (3) 순서 : order by 숫자 
-- 숫자: select 절에 명시한 컬럼들 중 몇번째 컬럼을 기준으로 할지
-- 4번째 컬럼[salary]을 기준으로 정렬
select employee_id, last_name, job_id, salary
from employees
order by 4 desc;

-- 2. 다중 정렬
-- order by 컬럼명1 [asc|desc], 컬럼명2 [asc|desc]
-- 컬럼명1로 정렬후, 정렬하면서 같았던 데이터만 컬럼명2 기준으로 정렬!
-- salary 로 내림차순 정렬, 같은 것 존재시 같은 것은 hire_date 오름차순 정렬
select employee_id, last_name, salary, hire_date
from employees
order by salary desc, hire_date;
-- 3번째 컬럼으로 내림차순 정렬, 같은 것 존재시 같은 것은 4번째 컬럼으로 오름차순 정렬
select employee_id, last_name, salary, hire_date
from employees
order by 3 desc, 4;
