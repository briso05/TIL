-- 실행 전 접속 계정 확인
show user;

-- 원하는 조건을 충족하는 레코드만 출력 : where 조건식!
-- where 조건식에 올 수 있는 연산자
-- (1) 비교 연산자! >, <, >=, <=, =
-- 동일값 비교는 = (== 아님)
-- 숫자 비교
select employee_id, last_name, job_id, salary
from employees
where salary >= 10000;
-- 문자리터럴 비교 **리터럴은 대소문자 구분 O
select employee_id, last_name, job_id, salary
from employees
where last_name = 'King';
select employee_id, last_name, job_id, salary
from employees
where last_name = 'KING';
-- 날짜리터럴 비교 **날짜 리터럴도 '' (홑따옴표 표시)
select employee_id, last_name, salary, hire_date
from employees
where hire_date > '07/12/31';

-- (2) 범위 연산자 : 컬럼명 between A and B ( B도 범위 포함 )
-- 숫자 범위 지정
select employee_id, last_name, salary, hire_date
from employees
where salary between 7000 and 8000;
-- 날짜 범위 지정
select employee_id, last_name, salary, hire_date
from employees
where hire_date between '07/01/01' and '08/12/31';

-- (3) in 연산자 : 컬럼명 in (값1, 값2, ... ) = OR 연산과 동일
-- 일치하는 값 여러개 선택시
-- 컬럼명 = 값1 OR 컬럼명 = 값2 OR ... 와 동일하다
-- in (숫자 값,   ) 
select employee_id, last_name, salary, hire_date
from employees
where employee_id in (100,200,300);
-- in (문자 값,  )   ** 날짜도 가능!
select employee_id, last_name, salary, hire_date
from employees
where last_name in ('King', 'Abel', 'Jones');
-- in (날짜 값,  ) 
select employee_id, last_name, salary, hire_date
from employees
where hire_date in ('01/01/13', '07/02/07');

-- (4) like 연산자 : like 패턴값 : 지정한 문자열이 포함된 것 찾기
-- i. 와일드카드 %: 0개 이상의 문자열
-- % 맨 뒤에 오기 - J로 시작하는 문자
select employee_id, last_name, salary
from employees
where last_name like 'J%';
-- % 맨 앞뒤로 오기 - ai 가 포함된 문자
select employee_id, last_name, salary
from employees
where last_name like '%ai%';
-- % 맨 앞에 오기 - in으로 끝나는 문자
select employee_id, last_name, salary
from employees
where last_name like '%in';

-- ii. 와일드카드 _ : 1개의 문자
-- 두번째 문자가 b 인 문자 찾기
select employee_id, last_name, salary
from employees
where last_name like '_b%';
-- 5글자이면서 a로 끝나는 문자 찾기
select employee_id, last_name, salary
from employees
where last_name like '____a';

-- iii. ESCAPE 옵션 사용 : 와일드카드에 해당하는 %,_가 들어간 문자 찾기
-- 찾고자 하는 문자에 와일드카드에 해당하는 문자가 들어간 경우,
-- 와일드카드를 escape해서 와일드카드가 아님을 알려줘야하
-- 방식 : like '패턴$_입니다.' escape '$'; 
-- escape 문자로 사용할 문자는 $가 아닌 임의의 문자가 올 수 있음
-- 예시 ) 뒤에서 세번째 문자가 '_' 인 문자열 찾기
select employee_id, last_name, salary, job_id
from employees
where job_id like '%A___' escape 'A';
-- 예시 ) '_' 문자가 들어간 문자열 찾기
-- 실패 케이스 : '%_%' : 모든 레코드 출력
select employee_id, last_name, salary, job_id
from employees
where last_name like '%_%';
-- 성공 케이스 : '%\_%' escape '\' : escape 키워드 다음에 오는 문자를 escape해주는 문자로 취급
select employee_id, last_name, salary, job_id
from employees
where last_name like '%\_%' escape '\';

-- (5) 논리연산자 : and , or , not
-- i. and : 두 조건 만족하는 것
select employee_id, last_name, salary, job_id
from employees
where job_id = 'IT_PROG' and salary >= 5000;
-- ii. or : 두 조건 중 하나 이상 만족하는 것
select employee_id, last_name, salary, job_id
from employees
where job_id = 'IT_PROG' or salary >= 5000;
-- iii. not : 해당 조건을 만족하지 않는 것
-- -- 가. 비교 연산자와 함께 : not 컬럼명 = a, not 컬럼명 > a
select employee_id, last_name, salary
from employees
where not salary >= 5000;
-- -- 나. 범위 연산자와 함께 : not 컬럼명 between a and b : a~b 범위 내 없는 것
-- -- 다. in 연산자와 함께 : not in (값1, 값2, ...) : 값1, 값2,.. 어디에도 해당하지 않는 것 
-- -- 라. like 연산자와 함께 : not like '%패턴_' : 해당 패턴에 일치하지 않는 것
-- -- 마. null 이 아닌 것** : is not null (** 주의 not is null 아님) : 널이 아닌 것

-- (6) is null / is not null 연산자
-- i. is null 연산자 : 컬럼명 is null : 해당 컬럼명이 null인 경우
select employee_id, last_name, salary, commission_pct
from employees
where commission_pct is null;
-- ii. is not null 연산자 : 컬럼명 is not null : 해당 컬럼명이 null인 아닌 경우
select employee_id, last_name, salary, commission_pct
from employees
where commission_pct is null;

-- 연산자 우선순위
-- 괄호 - NOT - 비교 - AND - OR
-- *** AND가 OR보다 높다!
-- 케이스1) 괄호 X
SELECT last_name,job_id,salary,commission_pct
FROM employees
WHERE job_id ='AC_MGR' OR job_id='MK_REP'
AND commission_pct IS NULL
AND salary >=4000
AND salary <= 9000;
-- 케이스2) 괄호 O
SELECT last_name,job_id,salary,commission_pct
FROM employees
WHERE ( job_id ='AC_MGR' OR job_id='MK_REP' )  
AND commission_pct IS NULL
AND salary >=4000
AND salary <= 9000;
