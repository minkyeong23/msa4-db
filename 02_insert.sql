-- INSERT 문
-- DML중 하나로 신규 데이터를 저장하기 위해 사용하는 쿼리
-- INSERT INTO 테이블명 [(컬럼1, 컬럼2....sal_id.)]
-- VALUES (값1, 값2....);
INSERT INTO employees (
	`name`
	,birth
	,gender
	,hire_at
	,fire_at
	,sup_id
	,created_at
	,updated_at
)
VALUES (
	'최민경'
	,'2003-08-21'
	,'F'
	,NOW()
	,NULL
	,NULL 
	,NOW()
	,NOW()
),
(
	'미어캣'
	,'2090-12-24'
	,'F'
	,NOW()
	,NULL
	,NULL 
	,NOW()
	,NOW()
);

SELECT 
	*
FROM employees
ORDER BY emp_id DESC
LIMIT 10
;

INSERT INTO employees (
	`name`
	,birth
	,gender
	,hire_at
	,fire_at
	,sup_id
	,created_at
	,updated_at
)
SELECT (
	MAX(emp_id),
	'T001',
	NOW(),
	NULL,
	NOW(),
	NOW(),
	NULL
FROM employees
);






