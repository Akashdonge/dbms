create table student(
  sid int primary key,name varchar(20),
  gender varchar(20));
  
create table book(
 isbn int primary key,
 title varchar(20),
 author varchar(20),
 publisher varchar(20)
);  
create table borrows(
sid int, isbn int,
foreign key(isbn) references book(isbn),
foreign key(sid) references student(sid)
);
  
insert into student values(1,'ramu','m');
insert into student values(2,'laxmi','f');

insert into book values(123,'database','a1','p1');
insert into book values(124,'t1','a2','p2');
insert into book values(125,'t1','a3','p3');


insert into borrows values(1,125);
insert into borrows values(2,123);
insert into borrows values(2,124);

1)select * from student 
where sid in(select sid from borrows
  where isbn=123 or isbn=124);

2)select * from student 
where gender='f' and sid in(select sid from borrows 
 where isbn in(select isbn from book where title='database' ));

3)select s.name,s.sid,s.gender ,count(b.isbn) as noofbooks
from student s
left join borrows b on s.sid=b.sid
group by s.name,s.sid,s.gender;

#MongoDB
db.createCollection("library")
db.library.insert({"ISBN": 123 , "Title": 'database', "Author": 'ABC', "Publisher": 'WXYZ', "S_Name": 
'jeevan', "S_Gender":'Male'})
db.library.insert({"ISBN": 124, "Title": 'algorithm', "Author": 'DEF', "Publisher": 'ABCD', "S_Name": 
'harsha', "S_Gender":'Male'})
db.library.insert({"ISBN": 125, "Title": 'database', "Author": 'DEF', "Publisher": 'ABCD', "S_Name": 
'namitha', "S_Gender":'Female'})
db.library.insert({"ISBN": 126, "Title": 'java', "Author": 'DEF', "Publisher": 'ABCD', "S_Name": 'anjali', 
"S_Gender":'Female'})
>db.library.find({“Author”: ‘ABC’})
>db.library.find({“Title”: “database”},{“s_name”:1, _id: 0}). pretty()

psql)
set serveroutput on
declare
    a number;
    b number;
    c number;
    i number;
    n number;
begin
     n:=8;
     a:=0;
     b:=1;
     dbms_output.put_line(a);
     dbms_output.put_line(b);
     for i in 1..n-2
     loop
        c:=a+b;
        dbms_output.put_line(c);
        a:=b;
        b:=c;
      end loop; 
end;
/
  
