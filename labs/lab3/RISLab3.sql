drop table XXX;
create table XXX(
  x int primary key
);

drop table YYY;
create table YYY(
  y int primary key
);

create DATABASE LINK dpv1_db 
   CONNECT TO system identified by pomazafaP1
   USING 'localhost:1521/orcl';
   
Select * from YYY@dpv1_db;
 
begin
   INSERT INTO YYY@dpv1_db values(1);
   INSERT INTO XXX values(1);
   Commit;
end;
select * from XXX;
select * from YYY@dpv1_db;

begin
   insert into XXX values(3);
   update YYY@dpv1_db SET y=2 where y=1;
   commit;
end;
select * from XXX;
select * from YYY@dpv1_db;

begin
   insert into YYY@dpv1_db values(3);
   update XXX set x=4 where x=1;
   commit;
end;
select * from XXX;
select * from YYY@dpv1_db;

begin
   insert into XXX values(5);
   insert into YYY@dpv1_db values(3);
end;

begin
   insert into XXX values(5);
   update YYY@dpv1_db set y ='x' where y = 2;
end;
  
begin
   delete YYY@dpv1_db;
   update YYY set y ='x' where y = 2;
end;  

begin
   delete XXX;
   delete YYY@dpv1_db;
end;
select * from xxx;
select * from YYY@dpv1_db;
