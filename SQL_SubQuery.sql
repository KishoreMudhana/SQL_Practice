use d17;
-- 50.WAQTD ALL THE DEATILS OF EMPLOYEES WORKING AS SALESMAN IN THE DEPT 30 ABD
-- EARNING COMM MORE THAN SMITH AND HIRED AFTER KING.
select * from emp where job = "salesman" and deptno=20 and comm > (select comm from emp where ename = "smith" and hiredate > 
(select hiredate from emp where ename = "king"));

-- 51.WAQTD NAMES OF THE EMPLOYEES EARNING MORE THAN SMITH IN SALES DEPT.
select ename from emp where sal > (select sal from emp where ename="smith") and job="salesman";

-- 52.WAQTD DETAILS OF THE EMPLOYEES WORKING AS ANALYST IN THE LOCATION DALLAS.
select * from emp where job = "analyst" and deptno = (select deptno from dept where loc = "dallas");

-- 53.DISPLAY ALL THE EMPLOYEES WHOSE LOCATION NAME ENDING WITH 'S'.
select * from emp where deptno = (select deptno from dept where loc like "%s");

-- 54.WAQTD NAME , ANNUAL SALARY OF THE EMPLOYEES IF THEIR ANNUAL SALARY IS MORE THAN ALL THE MANAGER.
select ename, sal*12 as Annual_Salary from emp where sal*12 > all (select sal*12  from emp where job="manager");

-- 55.WAQTD DETAILS OF EMPLOYESS WHOSE HIREDATE GREATER THAN SALESMAN.
select*from emp where hiredate > all (select hiredate from emp where job="salesman");

-- 56.WAQTD THE PRESIDENT SALARY.
select sal from emp where job = "president";

-- 57.WAQTD THE COUNT OF EMP IN EACH DEPT.
select deptno,count(*) as Count_Emp from emp group by deptno;

-- 58.WAQTD THE DNAME OF EMP OF EACH DEPT.

-- 59.WAQTD SALARY GREATER THAN ALLEN AND SMITH.
select sal from emp where sal> all (select sal from emp where ename IN ('SMITH', 'ALLEN'));

-- 60.WAQTD DETAILS OF AN EMPLOYEE WHOSE SALARY IS GREATER THAN ALLEN AFTER THE HIKE OF 10%.
select * from emp where sal < (select (sal+(10/100)) from emp where ename = "allen");

-- 61.WAQTD DEPARTMENT NAME OF THE EMPLOYEES WHO ARE HIRED AFTER THE ALLEN INTO SALES DEPARTMENT.
select dname from dept where deptno in (select deptno from emp where hiredate > (select hiredate from emp where ename="allen") and 
(select dname from dept where dname="sales"));

-- 62.WAQTD JOINED DATE AND REPOTRTING MANAGER NUMBER IF AN EMPLOYEE WORKING IN BOSTON.
select hiredate,MGR from emp where deptno in (select deptno from dept where loc="boston");

-- 63.WAQTD NAMES AND JOB OF AN EMPLOYEES IN EACH JOB IF THERE ARE TWO EMPLOYEES NAME SHOULD STARTS WITH 'S' OR 'P'.
select ename,job from emp where job in (select job from emp where (ename like "s%" or "p%") group by job having count(*)=2);

-- 64.WAQTD NO OF EMPLOYEES ARE WORKING IN EACH DEPARMENT IN THE CHICAGO.
select deptno,count(*) as No_of_Emp from emp where deptno in (select deptno from dept where loc='chicago') group by deptno ;

-- 65.WAQTD EMP NAME, JOB, LOCATION OF ALL EMPLOYEES WHO ARE WORKING AS A MANAGER AND WORKS AT CHICAGO.

-- 66.LIST EMPLOYEES FROM SALES AND RESEARCH DEPARTMENT HAVING ATLEAST 2 REPORTING EMPLOYEES.
select * from emp where deptno in (select deptno from dept where dname in ("sales","research")
and empno in (select mgr from emp group by mgr having count(*)>1));

-- 67.DISPLAY THE LOCATION OF ALL THE DEPARTMENTS WHICH HAVE EMPLOYEES JOINED IN THE YEAR 81.
select loc from dept where deptno in (select deptno from emp where hiredate like "1981");

-- 68.WAQTD NAME OF THE EMPLOYEES EARNING SALARY MORE THAN THE ANALYST.
select ename from emp where sal> all(select sal from emp where job="analyst");

-- 69.WAQTD NAME OF THE EMPLOYEES IF THE EMPLOYEE EARNS SALARY LESS THAN ATLEAST A MANAGER.
select ename from emp where sal<any(select sal from emp where job='manager');

-- 70.WAQTD EMP NAMES IF EMPLOYEES ARE HIRED AFTER ALL THE EMPLOYEES OF DEPT 30.
select ename from emp where hiredate > all(select hiredate from emp where deptno=30);

-- 71.WAQTD DETAILS IF THE EMPLOYEES WORKING IN NEWYORK OR DALLAS.
select*from emp where deptno in (select deptno from dept where loc="newyork" or loc="dallas");

-- 72.WAQTD LOC OF THE EMPLOYEES IF THEY EARN COMISSION IN DEPT 20.
select loc from dept where deptno in (select deptno from emp where comm is not null and deptno=20);

-- 73.WAQTD ALL THE DETAILS OF EMPLOYEES WORKING IN THE SAME DESIGNATION AS JONES AND WORKS IN LOCATION CHICAGO.
select*from emp where job = (select job from emp where ename="jones" and deptno in (select deptno from dept where loc='chicago'));

-- 74.WAQTD NAMES OF THE EMPLOYEES WHO EARNING MORE THAN SCOTT.
select ename from emp where sal>(select sal from emp where ename="scott");

-- 75.WAQTD NUMBER OF EMPLOYEES AND AVG SALARY NEEDED TO PAY THE EMPLOYEES WHOSE SALARY GREATER THAN 3000 IN EACH DEPT.
select count(*),avg(sal),deptno from emp where sal>3000 group by deptno;

-- 76.WAQTD ENAME AND SAL OF ALL THE EMPLOYEE WHO ARE EARNING MORE THAN CLARK BUT LESS THAN CLARK.
select ename,sal from emp where sal >(select sal from emp where ename='clark') and sal<(select sal from emp where ename='clark');

-- 77.WAQTD DETAILS OF ALL THE EMPLOYEES WORKING IN DEPT 30 AND WORKING IN THE SAME DESIGNATION AS JAMES.
select*from emp where deptno=30 and job=(select job from emp where ename='james');

-- 78.WAQTD NAME OF THE EMPLOYEES WHO'S NAME STARTS WITH 'B' AND WORK IN THE SAME DESIGNATION AS CLARK.
select ename from emp where ename like 'b%' and job=(select job from emp where ename='clark');

-- 79.WAQTD LOC AND DNAME OF THE EMPLOYEES WHOS SALARY IS 1250 RUPEES.
select loc,dname from dept where deptno in (select deptno from emp where sal=1250);

-- 80.WAQTD DNAME AND LOC OF THE EMPLOYEES WHO'S NAME HAS CHARACTER 'M' IN IT.
select dname,loc from dept where deptno in (select deptno from emp where ename like '%m%');

-- 81.WAQTD DEPTNO OF THERE ARE ATLEAST 4 EMP IN EACH DEPT WHOSE NAME HAS CHARACTER 'A' IN IT.
select deptno from emp where ename like '%a%' group by deptno having count(*)>3;

-- 82.WAQTD ENAME AND SAL OF THE EMPLOYEES IF THEY ARE WORKING AS SALESMAN.
select ename, sal from emp where job='salesman';

-- 83.WAQTD ENAME OF THE EMPLOYEES IF THEY ARE EARNING SALARY GREATER THAN 2000 AND HIRED BETWEEN 80-86 AND THEIR NAME ENDS WITH VOWELS.
select ename from emp where sal >2000 and hiredate between '1980-01-01' and '1986-12-31' and 
(ename like '%a' or ename like '%e' or ename like '%i' or ename like '%o' or ename like '%u');

-- 84.WAQTD NAMES AND HIREDATE OF THE EMPLOYEES IF THEY HIRED DURING THE YEAR 82-85 AND EARNING THE SALARY IN BETWEEN 1000-2800.
select ename,hiredate from emp where (hiredate between '1982-01-01' and '1985-12-31') and  (sal between 1000 and 2800);

-- 85.WAQTD THE PLACE WHICH ARE DUPLICATED IN DEPT TABLE.
select loc from dept group by loc having count(*)>1;

-- 86.WAQTD NUMBER OF EMPS WHO HAS HIRED ON THE SAME DAY IN EACH DEPT.
SELECT deptno, hiredate, COUNT(*) AS num_of_employees FROM emp GROUP BY deptno, hiredate HAVING COUNT(*) > 1;

-- 87.WAQTD NAMES OF THE EMPLOYEES EARNING LESS THAN KING , FORD.
select ename from emp where sal<all(select sal from emp where ename in ('king','ford'));

-- 88.WAQTD DETAILS OF EMPLOYEES WORKING NEWYORK OR CHICAGO.
