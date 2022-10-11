--https://www.youtube.com/watch?v=6f_S7MF4zNk&ab_channel=DhonySilva
--https://dhony.dev/2019/03/02/sql-6-queries-que-podem-ser-solicitadas-em-uma-entrevista/

----------------------------------------------------------------------------------------------
--7 Instruções em SQL (Queries) que podem solicitar em uma entrevista
----------------------------------------------------------------------------------------------

-- 1. retornar o registro de empregado com o maior (max) salário
	select * from Employee 
	where salary = (select max(salary) from Employee)

-- 2. retornar o maior salário da tabela Employee
	select max(salary) from Employee
	
-- 3. retornar o 2o maior salário da tabela Employee
	select max(salary) from employee
	where salary not in (select max(salary) from Employee)


-- 4. selecionar um intervalo de empergados (tabela Employee) baseado no campo id
	select * from Employee
	where employee_id between '2003' and '2008'

-- 5. retornar um emprego com o maior salário e o nome do departamento desse empregado
	select e.first_name, e.last_name, e.salary, d.department_name
	from employee e inner join department d on (e.department_id = d.department_id)
	where salary in (select max(salary) from employee)

-- 6. retornar o maior salário, employee_name, department_name para cada departamento (tabela Department)
	select e.first_name, e.last_name, e.salary, d.department_name
	from employee e inner join department d on (e.department_id = d.department_id)
	where salary in (select max(salary) from employee group by department_id)

-- 7. retornar o 3o maior salário da tabela Employee
	SELECT TOP 1 salary
	FROM (
			SELECT DISTINCT TOP 3 salary
			FROM Employee
			ORDER BY salary DESC
		) AS nthSalary
	ORDER BY salary
