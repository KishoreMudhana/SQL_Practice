use d17;
show tables;
select * from emp;
-- 1.WAQTD EMPLOYEE NAME WHOSE SALARY IS GREATER THAN 3000 AFTER THE HIKE OF 10%.
select ename from emp where (sal+(sal*(10/100))) > 3000;
-- 2. WAQTD EMPLOYEE NAME ALONG WITH ANNUAL SALARY WITH 10% HIKE IF THE EMPLOYEE WORKING UNDER 7566.
select ename, (sal+(sal*0.1)) as Anual_Salary from emp where empno = 7566;
-- 3. WAQTD EMPLOYEE DETAILS WHOSE NAME STARTS WITH 'K' AND ENDS WITH 'S'.
select*from emp where ename like "K%%S";
-- 4. WAQTD EMPLOLYEE DETAILS WHO HIRED BETWEEN 80-87 AND NAMES STARTS WITH CONSONANTS.
select*from emp where (hiredate between "1980-01-01" and "1987-12-31") and (ename not like "a%" and ename not like "e%" and ename not like "i%" and ename not like "o%" and ename not like "u%") ;
-- 5. WAQTD NAMES STARTS WITH VOWELS AND ENDS WITH CONSONANTS.
select ename from emp where 
(ename like "a%" or ename like "e%" or ename like "i%" or ename like "o%" or ename like "u%") and 
(ename not like "%a" and ename not like "%e" and ename not like "%i" and ename not like "%o" and ename not like "%u");
-- 6. WAQTD NAMES OF EMPLOYESS WHO WORKING AS A MANAGER.
select ename from emp where job = "manager";
-- 7. WAQTD EMPLOYEE NUMBER AND NAME WHO'S EARNING COMMISSION.
select empno, ename from emp where comm is not null;
-- 8. DISPLAY THE NAMES OF THE EMPLOYEES WHO ARE WORKING IN DEPT 10 AND 20 .
select ename from emp where deptno in (10,20);
-- 9.WAQTD NAMES OF ALL THE EMPLOYEES WHO ARE WORKING AS CLERKS AND EARNING A SALARY MORE THAN 3000.
select ename from emp where job = "clerk" and sal > 3000;
-- 10.DISPLAY THE ENAME OF THE EMPLOYEES WHO ARE WORKING AS CLERKS , SALESMAN OR ANALYST AND DRAWING A SALARY MORE THAN 2500.
select ename from emp where job in("clerk","salesman","analyst") and sal > 2500;
-- 11.DISPLAY THE LIST OF EMPLOYEES WHO HAVE JOINED A COMPANY BEFORE 1980 OR AFTER 1988.
select*from emp where hiredate<="1980-01-01" or hiredate>="1988-01-01";
-- 12.WAQTD THE NAMES OF THE EMPLOYEES WORKING IN DEPT 10,20,40 OR EMPLOYEE WORKING AS CLERK,SALESMAN,ANALYST.
select ename from emp where deptno in (10,20,40) or job in ("clerk","salesman","analyst");
-- 13.WAQTD THE NAME OF THE EMPLOYEES WHOSE NAME STARTS WITH 'S' AND HAVING FIVE CHARACTERS.
select ename from emp where ename like "s____";
-- 14.WAQTD THE NAME OF THE EMPLOYEES WHO ARE NOT GET COMM AND WORKING DEPTNO 10,20.
select ename from emp where comm is null and deptno in (10,20);
-- 15.WAQTD DETAILS OF THE EMPLOYEES ALONG WITH ANNUAL SALARY IF THEY ARE WORKING DEPT MANAGER AS 20,30 AND THEIR ANNUAL SALARY GREATER THAN 12000.
select *, sal*12 as Anual_Salary from emp where job = "manager" and deptno in (20,30) and (sal*12) > 12000;
-- 16.WAQTD DETAILS OF EMPLOYEES WHO ARE HIRED FEB.
select * from emp where hiredate like "%-02-%";
-- 17.WAQTD DETAILS OF EMPLOYEES ALONG WITH ANNUAL SALARY WHOSE NAME STARTS 'M' AND LAST BUT FIRST CHARACTER 'S'.
select *, sal*12 as Anual_Salary from emp where ename like "m%s_";
-- 18.WAQTD NAME AND HIREDATE OF EMPLOYEES WHO ARE HIRED BETWEEN JAN-81 AND DEC-81
select ename , hiredate from emp where hiredate like "1981-%-%";
-- 19.WAQTD SALESMAN DETAILS.
select*from emp where job="salesman";
-- 20.WAQTD DEPT DETAILS OF 10,20.
select * from dept where deptno in(10,20);
-- 21.WAQTD THE DETAILS OF EMPLOYESS ALONG WITH HALF TERM SALARY WHO EARNIG SAL GREATER THAN 5000 AND NAME STARTS WITH VOWELS.
select *, (sal*12)/2 as half_term_sal from emp where sal>5000 and 
(ename like "a%" or ename like "e%" or ename like "i%" or ename like "o%" or ename like "u%");
-- 22.WAQTD DETAILS OF EMPLOYESS WHO ARE NOT WORKING AS A MANAGER AND HAVING SAL IN BETWEEN 1000-2000.
select*from emp where job!="manager" and sal between 1000 and 2000;
-- 23.WAQTD NAME OF EMPLOYEES WHO IS WORKING AS A CLERKS OR PRESIDENT.
select ename,job from emp where job in ("clerk","president");
-- 24.WAQTD LIST OF EMPLOYEES WHOSE SALARY RANGE BETWEEN 0-1400.
select * from emp where sal<1400;
-- 25.WAQTD NAMES OF EMPLOYEES WHO'S WORKING IN DEPT 10 AND HAVING SECOND LETTER AS 'M'.
select ename,deptno from emp where deptno=10 and ename like "_m%";
-- 26.WAQTD THE MAXIMUM SALARY OF DEPT 30 AND 20.
select max(sal) as MAX_SAL from emp where deptno in (30,20);
-- 27.WAQTD NAME OF THE EMPLOYEE WHO'S GETTING SALARY LESS THAN SMITH.
 select ename from emp where sal<(select sal from emp where ename="smith");
 -- 28.WAQTD MINIMUM SALARIES GIVEN TO AN EMPLOYEE WORKING IN EACH DEPT.
 select deptno, min(sal) as MIN_SAL from emp group by deptno;
 -- 29.LIST ALL THE DEPT NAME THAT ARE HAVING ATLEAST 3 EMPLOYEES BUT NOT MORE THAN 5 EMPLOYEES IN IT.
 select deptno,count(*) from emp  group by deptno having count(*)<=3 or count(*)<=5; 
 -- 30.WAQTD NUMBER OF EMPLOYEES WORKING IN EACH DEPARTMENT EXCEPT SALESMAN.
 select deptno,count(*) as count_employees from emp where job!="salesman" group by deptno;
 -- 31.WAQTD DETAILS OF EMPLOYEES WHO ARE GETTING THE REPEATED SALARY.
 select sal,count(*) as Rep_SAL from emp group by sal having count(*)>1;
 -- 32.WAQTD NUMBER OF EMPLOYESS WHO ARE HAVING SAME NAME .
 select ename,count(*) as Rep_Name from emp group by ename having count(*)>1;
 -- 33.WAQTD AVG SALARY NEEDED TO PAY ALL THE EMPLOYEES IN EACH DEPT EXCLUDING THE EMPLOYEES OF DEPT 10.
 select deptno,avg(sal) from emp where deptno!=10 group by deptno;
 -- 34.WAQTD NAME AND TOTAL SALARY ODF THE EMPLOYEES IF THE EMPLOYEES ARE EARNING MORE THAN 2500.
 select ename , sal+ifnull(comm,0) as Total_Sal from emp where sal>2500;
 -- 35. Find job roles with average salary between 30,000 and 60,000.
 select job , avg(sal) as AVG_SAL from emp where sal between 30000 and 60000 group by job;
 -- 36. List employees by department number in ascending order, and within each department by salary descending.
 select ename, deptno,sal from emp order by deptno asc, sal desc;
 -- 37. Show all employees ordered alphabetically by job title, then by name.
 select * from emp order by job,ename asc;
 -- 38. Retrieve employees earning more than 30,000 and sort them by salary in descending order.
 select * from emp where sal>30000 order by sal desc;
 -- 39. List employees from department 10, sorted by hire date (oldest first).
 select*from emp where deptno=10 order by hiredate asc;
 -- 40. Display employee names and job titles ordered by job in descending order and salary ascending.
 select ename , job,sal from emp order by job desc,sal asc;
 