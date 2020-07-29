alter session set "_ORACLE_SCRIPT"=true;
CREATE USER RIS1 IDENTIFIED BY RIS1;
CREATE USER RIS2 IDENTIFIED BY RIS2;

GRANT ALL PRIVILEGES TO RIS1;
GRANT ALL PRIVILEGES TO RIS2;

drop table Tris1;
drop table Tris2;

--FROM USER RIS1
create table Tris1(id int);
insert into Tris1 values(1);

--FROM USER RIS2
create table Tris2(id int);
insert into Tris2 values(1);

-- system
CREATE PUBLIC DATABASE LINK riscon1
  CONNECT TO RIS1 IDENTIFIED BY "RIS1" USING 'orcl';

CREATE PUBLIC DATABASE LINK riscon2
  CONNECT TO RIS2 IDENTIFIED BY "RIS2" USING 'orcl';

drop public database link riscon1;
drop public database link riscon2;
  
select * from RIS2.Tris2@riscon2;
select * from RIS1.Tris1@riscon1;

begin
   insert into RIS2.Tris2@riscon2 values(228);
   insert into RIS1.Tris1@riscon1 values(228);
   Commit;
end;

begin
   update RIS2.Tris2@riscon2 set id=4 where id=2;
   insert into RIS1.Tris1@riscon1 values(2);
   Commit;
end;

begin
  insert into RIS1.Tris1@riscon1 values(6);
   update RIS2.Tris2@riscon2 set y ='x' where y = 2;   
   Commit;
   exception
    when others
    then
      rollback;
end;


begin
   delete RIS2.Tris2@riscon2;
   delete RIS1.Tris1@riscon1;
end;

