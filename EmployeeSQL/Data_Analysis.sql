---------------------------------------------------
--
-- SQL-Challenge DanC Data Analysis
--
---------------------------------------------------

-- 1)

select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
  from employees e
  join salaries s
  on (e.emp_no = s.emp_no);

-- 2)

select first_name, last_name, hire_date
  from employees
  where hire_date BETWEEN '1986-01-01' AND '1986-12-31'
  order by hire_date;

-- 3)

select m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name 
  from dept_manager m
  inner join employees e on m.emp_no = e.emp_no
  inner join departments d on m.dept_no = d.dept_no;

-- 4)

select e.emp_no, e.last_name, e.first_name, d.dept_name
  from employees e
  inner join dept_emp de on de.emp_no = e.emp_no
  inner join departments d on d.dept_no = de.dept_no
  order by e.last_name;

-- 5)

select e.first_name, e.last_name, e.sex
  from employees e
  where e.first_name = 'Hercules' and e.last_name Like 'B%'
  order by e.last_name;

-- 6) 

select e.emp_no, e.last_name, e.first_name, d.dept_name
  from employees e
  inner join dept_emp de on de.emp_no = e.emp_no
  inner join departments d on d.dept_no = de.dept_no
  where d.dept_name = 'Sales'
  order by e.last_name;

-- 7)

select e.emp_no, e.last_name, e.first_name, d.dept_name
  from employees e
  inner join dept_emp de on de.emp_no = e.emp_no
  inner join departments d on d.dept_no = de.dept_no
  where d.dept_name = 'Sales' or d.dept_name = 'Development'
  order by e.last_name;

-- 8)

select count(*), last_name
  from employees
  group by last_name
  having COUNT(*) > 0
  order by count(*) desc;

-- Bonus

select t.title, min(s.salary), max(s.salary), round(avg(s.salary))
  from salaries s
  inner join employees em on em.emp_no = s.emp_no
  inner join titles t on t.title_id = em.emp_title_id
  group by t.title_id;

