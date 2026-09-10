


       create table tab_x (id  int);

       create table tab_y ( id int);

       insert into tab_x (ID) values

(1),

(1),

(1),

(2),

(3),

(3),

(5),

(5),

(6),

(8)


 
insert into tab_y (ID) values

(1),

(1),

(3),

(3),

(4),

(4),

(6),

(7),

(8),

(8);
 insert into tab_x (ID) values

(null);;

insert into tab_y (ID) values (null);

select * from tab_x;
select * from tab_y;
 
 ----- inner join---- 
select x.*,y.*
from tab_x x inner join tab_y y
on x.id = y.id ;

---- left join------
select x.*,y.*
from tab_x x left join tab_y y
on x.id = y.id ;

----- right join----

select x.*,y.*
from tab_x x right join tab_y y
on x.id = y.id ;

select x.*,y.*
from tab_x x full join tab_y y
on x.id = y.id ;

---count---
inner join ;13
left join ; 17
right join ;17
full join :21