

windows functions
set operators
CTE

-----window functions------

--row_number -row number
--rank  - skip the rank
--DENSE_RANK -do not skip any rank
--LEAD -second highes
--LAG -before first highest

select * from employees

select employee_id,
       salary,
 row_number() over (order by salary desc) as RID,
 rank () over (order by salary desc) as rnk,
 dense_rank() over (order by salary desc) as drnk, 
 lead(salary) over ( order by salary desc) as lds,
 lag(salary) over (order by salary desc) as lgsal from employees;

 

cte-with cte_lavi as
(
select * from employees
)
select * from cte_lavi;
 
 
with cte_lavi as
(
select first_name from employees
   minus
select first_name from dependents