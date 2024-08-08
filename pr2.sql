create table part(
   pid int primary key,
   pname varchar(20),
   pcolor varchar(20)
);
 create table supplier(
   sid int primary key,
   sname varchar(20),
   saddr varchar(20)
  );
  create table supply(
    id int primary key ,
    pid int,
    sid int,
    qan int,
    foreign key(pid) references  part(pid)  on  delete cascade,
    foreign key(sid) references  supplier(sid) on delete  cascade
  );
  
  insert into part values(11,'part a','red');
  insert into part values(22,'part b','blue');
  
  insert into supplier values(121,'akash','xyz');
  insert into supplier values(122,'naveen','MSR');
  
 insert into supply values(1,11,121,12);
 insert into supply values(2,22,122,13);
 insert into supply values(3,22,121,14);
 
1) select * from part where 
    pid in(select pid from supply where sid in(select sid from supplier where sname='akash'));
    
2) select sname from supplier where sid in
  (select sid from supply where pid in(select pid from part where pname='part b'));   
  
 3) delete from part
     where pcolor='red';
     
     select * from part;
