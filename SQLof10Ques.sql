1.
select t_id, t_name, sub_id, sub_name
from teacher natural join subject
where t_sal = (select min(t_sal)
                       from teacher
                       where t_sal> (select min(t_sal) from teacher) )

2. 
a. create view stu as
select count(s_id) "Total Students"
from student 
   create view tchr as
select count(t_id) "Total Teachers" 
from teacher

b. create view sal as
select sum(t_sal)*round(months_between(sysdate,'01-MAR-20')) "Total given salary"
from teacher 
where sub_id <> (select sub_id
                from subject
                 where upper(sub_name) = 'CHEMISTRY')
select *
from stu natural join tchr natural join sal

4.  
select teacher.sub_id, t_name, s_name, std_sub.s_id
from student, teacher, subject, std_sub
where subject.sub_id = teacher.sub_id
and std_sub.s_id = student.s_id
and std_sub.s_id = 10

3. 
select s_name, student.s_id, s_email, result.r_id , gpa, cgpa
from student, result, std_email
where student.s_id = std_email.s_id
and result.r_id = student.r_id
and student.r_id not like '%_04'
order by cgpa desc


5.
select question.sub_id, t_id, q_value
from teacher, question
where teacher.sub_id = question.sub_id
order by question.sub_id

6.
select s_name, student.s_id, city, country, gpa,cgpa, s_email
from student, address, result, std_email, std_sub
where student.s_id = std_email.s_id
and student.r_id = result.r_id
and student.adrs_id = address.adrs_id
and student.s_id = std_sub.s_id  
and sub_id = ( select sub_id
               from teacher
               where t_sal = ( select max(t_sal)
                               from teacher ) )
and not s_name like '%Rahman'

7. 
create sequence std_id
start with 900
increment by 6
maxvalue 950
cycle minvalue 550
cache 10

use : values(std_id.nextval)

8.
create view Stu_Cnt as
select s_name, s_id, city ||', '|| country"Address", s_email
from student natural join std_email natural join address

create view Tchr_Cnt as
select t_name, t_id, city ||', '|| country"Address", t_email
from teacher natural join tchr_email natural join address

create view Contact as 
select * 
from Stu_Cnt natural join Tchr_Cnt 

9. 
create view Salary as
select t_id, t_sal
from teacher

select t_id, t_sal "Monthly Salary", (t_sal*12) "Yearly Salary", (t_sal+8000) "December Salary + Bonus"
from Salary
where t_sal > ( select avg(t_sal)
                from Salary )

10. 
Teacher id is primary key. So it can't be unique.
alter table tchr_email add constraint cons_u2 unique(t_email)


                       