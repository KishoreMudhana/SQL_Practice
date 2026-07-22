use d17;
select*from emp;
-- 1) Write a Query to display all the details of employee if the salary ranges between 500 and 250 and department number either 10, 20, 30.
select * from emp where sal between 250 and 500 and deptno in (10,20,30);
-- 2) Write a Query to display all the employee who belongs to department number 10 or 20 and 
-- comm between 1000 and 3000 and were hired during 1980 to 1983.
select * from emp where deptno in (10,20) and comm between 1000 and 3000 and year(hiredate) between 1980 and 1983;
-- 3) Write a Query to display all the details of employee if he is not having the reporting manager.
select*from emp where mgr is null;
-- 4) List the employee where salary is between 2000 and 3000.
select ename from emp where sal between 2000 and 3000;
-- 5) List all the salesman in department number 30 and having salary greater than 5000.
select ename,job from emp where job='salesman' and deptno=30 and sal>5000;
-- 6) List all the employees who are having reporting manager in department 10.
select * from emp e join emp m on e.mgr=m.empno where m.deptno=10;
-- 7) Write a Query to display all the details of the employee if their job is having one _ (underscore) in it.
select * from emp where job like '%@_%' escape "@";
-- 8) Write a Query to display who are having % in their names.
select * from emp where ename like '%@%%' escape "@";
-- 9) Write a Query to display who are having _(underscore) as second character in their name.
select ename from emp where ename like '_@_%' escape "@";
-- 10) Write a Query to display all the employee who are getting some comm with their designation is neither manager nor analyst.
select * from emp where comm is not null and job not in ('manager','analyst');
-- 11) Write a Query to display all the manager whose annual salary is ending with 0.
select ename, (sal*12) as annual_salary from emp where job='manager' and sal*12 like '%0';
-- 12) Write a Query to display all the employee who are clerk and analyst with salary greater than 1000.
select * from emp where job in ('clerk','analyst') and sal>1000;
-- 13) Write a Query to display all the employee who are joined after year 81.
select * from emp where year(hiredate)=1981;
-- 14) Write a Query to display all the employees who are joined in Feb.
select *  from emp where hiredate like '%_02_%';
-- 15) List the employee who are not working as manager and clerk in depart no 10 and 20 with salary in the range of 1000 to 3000.
select ename from emp where (job not in ('clerk','manager') and deptno in (10,20)) and sal between 1000 and 3000;
-- 16) List the employees whose salary not in the range of 1000 to 2000 in depart no 10, 20, 30 except all salesman.
select ename from emp where sal not between 1000 and 2000 and deptno in (10,20,30) and job!="salesman";
-- 17) Write a Query to display maximum salary, minimum salary and average salary of the 
-- organization by excluding employees who is working as salesman.
select max(sal) as Max_salary, min(sal) as Min_salary, avg(sal) as Avg_salary from emp where job!='salesman';
-- 18) Write a Query to display number of employees by their total salary who are working in department number 20,30.
select count(*) as No_of_Emp, sum(sal) as Total_Sal from emp where deptno in (20,30) group by deptno;
-- 19)Write a Query to display max salary,min salary only if the name is start with A or S or M.
select max(sal) as Max_salary, min(sal) as Min_salary from emp where ename like 'a%' or ename like 's%' or ename like 'm%';
-- 20) Write a Query to display number of employee in department number 30 working as salesman.
select count(*) as No_of_Emp from emp where deptno=30 and job='salesman';
-- 21) Write a Query to display average salary given to the manager of the organization.
select avg(sal) as Average_sal from emp where job='manager';
-- 22) Write a query to display number of employee department number 10 and number of employee in department number 30.
select count(*) as No_of_Emp,deptno from emp  group by deptno having deptno in (10,30); 
-- 23) Write a Query to display total salary and average salary for every department.
select deptno, sum(sal) as Total_Sal, avg(sal) as Average_Sal from emp group by deptno;
-- 24) Write a Query to display max sal and min sal in each designation.
select job, max(sal) as Max_Sal, min(sal) as Min_sal from emp group by job;
-- 25) Write a Query to display total salary of every department by excluding employee whose salary is greater than 3000.
select deptno,sum(sal) as Total_sal from emp where sal not in (sal>3000) group by deptno;
-- 26) Write a Query to display job wise max salary in each department.
select job,deptno,max(sal) as Max_sal from emp group by job,deptno;
-- 27) Write a Query to display department number of more than 4 employees.
select deptno from emp group by deptno having count(*)>4                ;
-- 28) Write a Query to display job wise highest salary only if the highest salary is more than 1500.
select job, max(sal) as Highest_sal from emp where sal>1500 group by job;
-- 29) Write a Query to display job wise highest salary only if the highest salary is more than 1500 excluding department number 30
select job, max(sal) as Highest_sal from emp where sal>1500 and deptno!=30 group by job;
-- 30) Write a Query to display department number along with number of employees in it.
select deptno,count(*) as No_of_Emp from emp group by deptno;
-- 31) Write a Query to display the department number which are having more than 4 employee in them.
select deptno from emp group by deptno having count(*)>4;
-- 32) Write a Query to display the max salary for each of the job excluding all the employee whose name end with S.
select job,max(sal) as Max_sal from emp where ename like '%s' group by job;
-- 33) Write a Query to display the department number which are having more than 9000 as their departmental total salary.
select deptno from emp group by deptno having sum(sal) > 9000;
-- 34) Write a Query to display department wise highest salary only if the highest salary in
-- between 5000 and 10000 and total salary of department is below 10000.
select deptno,max(sal) as Highest_Sal from emp group by deptno having max(sal) between 5000 and 10000 and sum(sal)<10000;
-- 35)Write a Query to display job wise total salary in each department only if department number 10, 20 total salary is less than 10000.
select job,deptno,sum(sal) as Total_Sal from emp where deptno in (10,20) group by job,deptno having sum(sal)<10000;
-- 36) Write a Query to display average salary of each department by excluding all employees who do not have reporting manager.
select avg(sal) as Avarage_sal from emp where mgr is null group by deptno ;
-- 37) Write a Query to display max, min, sum, average, commission and salaries for all the
-- department which is having employee hired within 1980 and 1985.
select deptno, max(sal) as Max_sal,min(sal) as Min_sal,sum(sal) as Total_Sal,avg(sal) as Avarage_sal,sum(comm) from emp 
where year(hiredate) between 1980 and 1985 group by deptno;
-- 38) Write a Query to display all the details of employee whose designation is same as martin.
select * from emp where job=(select job from emp where ename='martin');
-- 39) Write a Query to display all the employee who were hired after recruiting miller.
select * from emp where hiredate > (select hiredate from emp where ename='miller');
-- 40) Write a Query to display name of an employee along with the annual salary if the employee is working in newyork.
select ename ,sal*12 as annual_salary from emp where deptno=(select deptno from dept where loc='newyork');
-- 41) Write a Query to display all the details of employee who are working in same department of smith or allen.
select * from emp where deptno in (select deptno from emp where ename in ('smith','allen'));
-- 44) Write a Query to display duplicate names in an employee table.
select ename from emp group by ename having count(*)>1;
-- 45) Write a Query to display all the names of the employee only, if their name starts with vowel and their location ends with vowel.
select ename from emp where (ename like 'a%' or ename like 'e%' or ename like 'i%' or ename like 'o%' or ename like 'u%')
 and deptno in (select deptno from dept where loc like '%a' or loc like '%e' or loc like '%i' or loc like '%o' or loc like '%u');
-- 46) Display Ename, job of all the managers and clerks who works in accounts and sales department
select ename,job from emp where job in ('manager','clerk') and deptno in (select deptno from dept where loc in ('sales','accounts'));
-- 47)Write a Query to display the second maximum salary.
select max(sal) as second_maximum_salary from emp where sal< (select max(sal) from emp);
-- 48) Write a Query to display the third maximum salary.
select max(sal) as second_maximum_salary from emp where sal< (select max(sal) from emp where sal<(select max(sal) from emp));
-- 49)Write a Query to display all the employees who are earning more than all the managers.
select * from emp where sal> all(select sal from emp where job='manager');
-- 50)Write a Query to display all the employees who are earning more than any of the managers.
select * from emp where sal> any(select sal from emp where job='manager');
-- 51)Select empno, job and salary of all the analyst who are earning more than any of the manager.
select empno,job,sal from emp where job='analyst' and sal>any(select sal from emp where job='manager');
-- 52) Select the department name and location of all the employee working for clark
select dname,loc from dept where deptno in (select deptno from emp where ename='clark');
-- 53) Find employees who earn more than their manager
select * from emp e join emp m on e.mgr=m.empno where e.sal>m.sal;
-- 54). Display the employee hierarchy (employee → manager → manager's manager)
select * from emp e join emp m on e.mgr=m.empno join emp mm on m.mgr=mm.empno;
-- 55). List all departments and the number of managers in each
select d.dname , count(*) from emp e inner join dept d on e.deptno=d.deptno where  e.job='manager' group by d.dname;
-- 56) List the top 3 highest paid employees in each department
-- (Using window function – if supported)
select ename ,row_number() over( partition by deptno order by sal desc) as row_num from emp where row_num<=3;
-- 57). Find employees who joined in the same year as their manager
select e.ename,e.hiredate,m.ename,m.hiredate from emp e join emp m on e.mgr=m.empno where year(e.hiredate)=year(m.hiredate);
-- 58) Find the department with the highest total salary
select deptno, sum(sal) from emp group by deptno order by sum(sal) desc limit 1;
-- or -- 
select d.dname from emp e join dept d on e.deptno=d.deptno group by e.deptno order by sum(e.sal) desc limit 1;
-- 59). Show departments where average salary is higher than company average salary
select deptno ,avg(sal) from emp group by deptno having avg(sal) >(select avg(sal) from emp);
-- 60). For each employee, show the name of the highest-paid person in their department 
select ename,sal,deptno,first_value(ename) over(partition by deptno order by sal desc) as H_S from emp;
-- Bonus: Employees with salaries in the top 10%
select * from(select ename, sal, percent_rank() over(order by sal) as pr from emp) t where pr>=0.9;