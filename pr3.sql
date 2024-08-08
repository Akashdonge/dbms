create table boat(
    bname varchar(20),
    bid int primary key,
    bcolor varchar(20)
);
create table sailor(
    sid int primary key,
    sname varchar(20),
    age int
);
create table reserves(
    sid int,
    bid int,
    foreign key(bid) references boat(bid),
    foreign key(sid) references sailor(sid)
);

insert into boat values('b1',1,'red');
insert into boat values('b2',2,'blue');
insert into sailor values(3,'akash',14);
insert into sailor values(4,'naveen',9);

insert into reserves values(3,1);
insert into reserves values(4,1);
insert into reserves values(4,2);
insert into reserves values(3,2);


select bid from reserves
having count(distinct sid ) = (select count(*) from sailor)
group by bid;


select s.sname, count(r.bid) as numberofboat
from sailor s
left join reserves r on (s.sid=r.sid)
group by s.sname;


set serveroutput on
declare
    n number:=&n;
    j number:=2;
    counter number:=0;
begin
    while(j<=n/2) loop
     if mod(n,j)=0 then
        dbms_output.put_line(n||' not prime number');
        counter:=1;
        exit;
    else
       j:=j+1;
    end if;
    end loop;
    if counter=0 then
       dbms_output.put_line(n ||' is prime number');
    end if;
end;
/
