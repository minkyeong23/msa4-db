-- 1. 사원의 사원번호, 이름, 직급코드를 출력해 주세요.
SELECT 
	emp.emp_id
	,emp.`name`
	,tit.title_code
FROM employees emp
	JOIN title_emps tit
	ON emp.emp_id = tit.emp_id
;

-- 
SELECT 
	emp.emp_id
	,emp.`name`
	,tie.title_code
FROM employees emp
	JOIN title_emps tie
		ON emp.emp_id = tie.emp_id
			AND emp.fire_at IS NULL 
			AND tie.end_at IS NULL
;		

-- 2. 사원의 사원번호, 성별, 현재 연봉을 출력해 주세요.
SELECT
	emp.emp_id
	,emp.gender
	,sal.salary
FROM employees emp 
	JOIN salaries sal
		ON emp.emp_id = sal.emp_id
			AND sal.end_at IS NULL
;

-- 
SELECT 
	emp.emp_id
	,emp.gender
	,sal.salary
FROM employees emp
	JOIN salaries sal
		ON emp.emp_id = sal.emp_id
WHERE
		emp.fire_at IS NULL 
		AND sal.end_at IS NULL
;

-- 3. 10010 사원의 이름과 과거부터 현재까지 연봉 이력을 출력해 주세요.
SELECT 
	emp.`name`
	,sal.salary
FROM employees emp
	JOIN salaries sal
		ON emp.emp_id = sal.emp_id
WHERE 
	emp.emp_id = 10010
;

-- 
SELECT 
	emp.`name`
	,sal.salary
FROM employees emp
	JOIN salaries sal
		ON emp.emp_id = sal.emp_id
			AND emp.emp_id = 10010
ORDER BY sal.start_at ASC
;

-- 4. 사원의 사원번호, 이름, 소속부서명을 출력해 주세요.
SELECT 
	emp.emp_id
	,emp.`name`
	,dept.dept_name
FROM employees emp
	JOIN department_emps aa
		ON emp.emp_id = aa.emp_id
	JOIN departments dept
		ON aa.dept_code = dept.dept_code	
;

-- 
SELECT 
	emp.emp_id
	,emp.`name`
	,dept.dept_name
FROM employees emp
	JOIN department_emps depe
		ON emp.emp_id = depe.emp_id 
			AND depe.end_at IS NULL 
			AND emp.fire_at IS NULL 
	JOIN departments dept
		ON depe.dept_code = dept.dept_code
			AND dept.end_at IS NULL
ORDER BY emp.emp_id
;

-- 5. 현재 연봉의 상위 10위까지 사원의 사번, 이름, 연봉을 출력해 주세요.
SELECT 
	emp.emp_id
	,emp.`name`
	,sal.salary
FROM employees emp
	JOIN salaries sal
		ON emp.emp_id = sal.emp_id
WHERE sal.end_at IS NULL 
ORDER BY sal.salary DESC
LIMIT 10
;

-- 
SELECT 
	emp.emp_id
	,emp.`name`
	,tmp_sal.salary
FROM employees emp
	JOIN (
		SELECT 
			sal.emp_id
			,sal.salary
		FROM salaries sal
		WHERE 
		 sal.end_at IS NULL
		ORDER BY salary DESC
LIMIT 10
) tmp_sal	
	ON emp.emp_id = tmp_sal.emp_id
	 AND emp.fire_at IS NULL
ORDER BY tmp_sal.salary DESC
;

-- 6. 현재 각 부서의 부서장의 부서명, 이름, 입사일을 출력해 주세요.
SELECT 
	dept.dept_name
	,emp.`name`
	,emp.hire_at
FROM employees emp	
	JOIN department_managers dem
		ON emp.emp_id = dem.emp_id
			AND dem.end_at IS NULL
	JOIN departments dept
		ON dem.dept_code = dept.dept_code
;

-- 
SELECT 
	dept.dept_name
	,emp.`name`
	,emp.hire_at
FROM employees emp
	JOIN department_managers depm
		ON emp.emp_id = depm.emp_id
			AND emp.fire_at IS NULL 
			AND depm.end_at IS NULL 
	JOIN departments dept
		ON depm.dept_code = dept.dept_code
			AND dept.end_at IS null
ORDER BY dept.dept_code ASC 
;
	
-- 7. 현재 직급이 "부장"인 사원들의 연봉 평균을 출력해 주세요.
SELECT 
	AVG(sal.salary)
FROM salaries sal
	JOIN title_emps tie
		ON sal.emp_id = tie.emp_id
			AND tie.end_at IS NULL
	JOIN titles ti
		ON tie.title_code = ti.title_code
WHERE ti.title = '부장'
;

--
SELECT 
	tie.emp_id
	,AVG(sal.salary) avg_sal
FROM title_emps tie
	JOIN titles tit
		ON tie.title_code = tit.title_code
			AND tit.title = '부장'
			AND tie.end_at IS NULL 
	JOIN salaries sal
	 ON sal.emp_id = tie.emp_id
GROUP BY tie.emp_id
;

-- 7-1. (보너스)현재 각 부장별 이름, 연봉평균


-- 8. 부서장직을 역임했던 모든 사원의 이름과 입사일, 사번, 부서번호를 출력해 주세요.
SELECT 
	emp.`name`
	,emp.hire_at
	,dem.emp_id
	,dem.dept_code
FROM employees emp
	JOIN department_managers dem
	 ON emp.emp_id = dem.emp_id
;

-- 
SELECT 
	emp.`name`
	,emp.hire_at
	,emp.emp_id
	,depm.dept_code
FROM department_managers depm
	JOIN employees emp
		ON depm.emp_id = emp.emp_id
ORDER BY depm.dept_code, depm.start_at
;

-- 9. 현재 각 직급별 평균연봉 중 60,000,000이상인 직급의 직급명, 평균연봉(정수)를을 평균연봉 내림차순으로 출력해 주세요.
SELECT 
	tit.title
	,FLOOR(AVG(sal.salary)) avg_sal
FROM title_emps tie
	JOIN salaries sal
		ON tie.emp_id = sal.emp_id
			AND tie.end_at IS NULL 
			AND sal.end_at IS NULL 
	JOIN titles tit
		ON tie.title_code = tit.title_code
GROUP BY tie.title_code, tit.title
	HAVING AVG(sal.salary) >= 60000000
ORDER BY AVG(sal.salary) DESC 
;

-- 10. 성별이 여자인 사원들의 직급별 사원수를 출력해 주세요.
SELECT 
	tie.title_code
	,emp.gender
	,COUNT(*)
FROM employees emp
	JOIN title_emps tie
		ON emp.emp_id = tie.emp_id
			AND emp.fire_at IS NULL 
			AND tie.end_at IS NULL 
-- 			AND emp.gender = 'F'
GROUP BY tie.title_code, emp.gender 
ORDER BY emp.gender, tie.title_code
;





