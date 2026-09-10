


TASK-1
 
  EID   AGE
  101    19
  102    20
  103    30
 
  ---OUTPUT
 
  EID   AGE     STATUS
  101    19       MINIOR
  102    20      MAJOR
  103    30      MAJOR
 
 
   IF AGE >=20  MAJOR
       ELSE MINIOR
       
       
       
    CASE
       WHEN   AGE >=20 THEN MAJOR ELSE MINOR
   
    END  
   
   
   
   
   
    task :
   
    TABLE
    ID
    1
    2
    3
    4
    5
    6
    7
    8
    9
   
   
    OUTPUT:
   
   
    ID          DAY
    1           MONDAY
    2           TUES
    3           WED
    4
    5
    6
    7           SUN
    8        INVALID DAY
    9        INVALID DAY


    create database employee;

create table employee(e_id int,
                       age int);
insert into employee(e_id,age) values (1,23),
                             (2,43),
                             (3,19),
                             (4,20),
                             (5,15),
                             (6,76),
                             (7,23),
                             (8,34);

select * from employee;
select e_id,age,      
       iff (age > 20,' major' ,' minor') as status from employee;
select * from employee;
alter table employee add column day string;
select day,
       case
       when day=1 then 'monday'
       day=2 then 'tuesday'
       day=3 then 'wednesday'
       day=4 then 'thursday'
       day=5 then 'friday'
       day=6 then 'saturday'
       day=7 then 'sunday'
       day=8 then 'invalid day'
       day=9 then 'invalid day'
       end as days from employee;

       SELECT 
    day,
    CASE 
        WHEN day = 1 THEN 'monday'
        WHEN day = 2 THEN 'tuesday'
        WHEN day = 3 THEN 'wednesday'
        WHEN day = 4 THEN 'thursday'
        WHEN day = 5 THEN 'friday'
        WHEN day = 6 THEN 'saturday'
        WHEN day = 7 THEN 'sunday'
        ELSE 'invalid day'
    END AS status 
FROM employee;