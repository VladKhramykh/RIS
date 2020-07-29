create database RIS4_6;
create database RIS4_6_Resource1;
create database RIS4_6_Resource2;

drop database RIS4_6;
drop database RIS4_6_Resource1;
drop database RIS4_6_Resource2;

use RIS4_6;
create table data_entries
(
	id int(11),
    field1 int(11), 
    field2 nvarchar(255)
);

delete from ris4_6.data_entries where id > 0;
delete from RIS4_6_Resource2.data_entries where id > 0;
delete from RIS4_6_Resource1.data_entries where id > 0;

SELECT * FROM ris4_6.data_entries;
select * from RIS4_6_Resource2.data_entries;
select * from RIS4_6_Resource1.data_entries;

