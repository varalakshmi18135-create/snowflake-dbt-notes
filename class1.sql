
create or replace database college;

use college;

create or replace schema college.mits;
create or replace schema college.vit;
create or replace schema college.sgms;

create or replace table college.vit.student(sid int,name string,addres string,phone int,marks int);

INSERT INTO college.vit.student(sid,name,addres,phone,marks) VALUES
    (1, 'Varalakshmi', 'Hindupur', 9876543210, 85),
    (2, 'Aarav Sharma', 'Bangalore', 9876543211, 92),
    (3, 'Diya Patel', 'Hyderabad', 9876543212, 78),
    (4, 'Rohan Verma', 'Chennai', 9876543213, 88),
    (5, 'Ananya Rao', 'Bengaluru', 9876543214, 95),
    (6, 'Karthik Reddy', 'Madanapalle', 9876543215, 64),
    (7, 'Priya Nair', 'Vizag', 9876543216, 81),
    (8, 'Siddharth Sen', 'Tirupati', 9876543217, 73),
    (9, 'Kavya Gupta', 'Vijayawada', 9876543218, 90),
    (10, 'Vikram Singh', 'Chittoor', 9876543219, 82);
select * from college.vit.student;
 COLLEGECOLLEGE.VITCOLLEGE.MITS
delete from college.vit.student where sid= 2;

 select * from college.vit.student;
drop table college.vit.student;

 select * from college.vit.student;

revoke table college.vit.student;

create or replace table college.vit.student(sid int,name string,addres string,phone int,marks int);

INSERT INTO college.vit.student(sid,name,addres,phone,marks) VALUES
    (1, 'Varalakshmi', 'Hindupur', 9876543210, 85),
    (2, 'Aarav Sharma', 'Bangalore', 9876543211, 92),
    (3, 'Diya Patel', 'Hyderabad', 9876543212, 78),
    (4, 'Rohan Verma', 'Chennai', 9876543213, 88),
    (5, 'Ananya Rao', 'Bengaluru', 9876543214, 95),
    (6, 'Karthik Reddy', 'Madanapalle', 9876543215, 64),
    (7, 'Priya Nair', 'Vizag', 9876543216, 81),
    (8, 'Siddharth Sen', 'Tirupati', 9876543217, 73),
    (9, 'Kavya Gupta', 'Vijayawada', 9876543218, 90),
    (10, 'Vikram Singh', 'Chittoor', 9876543219, 82);

    select * from college.vit.student;

    truncate table college.vit.student;

select * from college.vit.student
    union all
select * from college.sgms.student
    union all
select * from college.mits.student
;



    

    

    

    

    

    


