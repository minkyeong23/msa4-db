-- VIEW 생성
CREATE VIEW view_avg_salary_by_dept
AS 
-- 부서별 현재 연봉 평균 구해주세요.
-- 부서명(한글), 평균연봉 출력
	SELECT 
		dept.dept_name
		,CEILING(AVG(sal.salary)) avg_sal
	FROM departments dept
		JOIN department_emps depe
			ON dept.dept_code = depe.dept_code
				AND dept.end_at IS NULL 
				AND depe.end_at IS NULL 
		JOIN salaries sal
			ON depe.emp_id = sal.emp_id
				AND sal.end_at IS NULL 
	GROUP BY dept.dept_name
	ORDER BY dept.dept_name
;

-- 뷰 조회하기
SELECT 
	*
FROM view_avg_salary_by_dept
WHERE 
	avg_sal >= 44000000
;

-- VIEW 삭제
DROP VIEW view_avg_salary_by_dept;




