-- ---------------------
-- Transaction
-- ---------------------
-- Transaction 시작
START TRANSACTION; 

INSERT INTO employees (
	`name`
	,birth
	,gender
	,hire_at
)
VALUE (
	'최민경'
	,'2003-08-21'
	,'F'
	,NOW()
);

-- COMMIT;
ROLLBACK;






