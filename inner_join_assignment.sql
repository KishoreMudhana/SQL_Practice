use d17;
-- 1. WAQTD emp name and dname for all the employees who are working as salesman dept in 30.
select ename,dname from emp inner join dept on emp.deptno=dept.deptno where emp.deptno=30 and emp.job='salesman';

-- 2. WAQTD emp name, job, deptno, and location of all the emp in sales.
select ename,job,emp.deptno,loc,dname from emp inner join dept on emp.deptno=dept.deptno where dept.dname='sales';

-- 3. WAQTD ename, dname, sal for all the employees who’s salary is more than miller and less then king.
select ename,dname,sal from emp inner join dept on emp.deptno=dept.deptno 
where sal>(select sal from emp where ename='miller') and sal<(select sal from emp where ename='king');

-- 4. WAQTD no. of employees working in new york.
select count(*)  from emp inner join dept on emp.deptno=dept.deptno where loc='new york';

-- 5. List all employees with their department names.
select ename,dname from emp inner join dept on emp.deptno=dept.deptno;

-- 6. List the highest-paid employee in each department.
select ename,emp.deptno from emp inner join dept on emp.deptno=dept.deptno where sal in (select max(sal) from emp group by deptno); 
-- without join 
select ename from emp where sal in (select max(sal) from emp group by deptno);

-- 7. List employees along with their department name, sorted by salary descending.
select ename,dept.dname from emp inner join dept on emp.deptno=dept.deptno order by sal desc;

-- 8. List employees and their department names where employees have the same job title as someone in a different department.
select  distinct e1.ename,d.dname from emp e1 inner join emp e2 on e1.job=e2.job 
and e1.deptno!=e2.deptno inner join dept d  on e1.deptno=d.deptno  ;
select count(*),job from emp group by job having count(*)>1;

-- 9.List all departments name along with who hired first
select dname,ename from emp inner join dept on emp.deptno=dept.deptno where hiredate like '%01';

-- 10.display employee student details
select * from emp cross join student_info;
