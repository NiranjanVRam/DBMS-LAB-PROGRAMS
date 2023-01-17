delimiter $$

drop procedure if exists student$$

drop table if exists STUDENT$$

create table STUDENT(RNO int,S1 int,S2 int,S3 int,S4 int,total int,percentage float)$$

insert into STUDENT(RNO,S1,S2,S3,S4) values(1,86,78,100,58)$$
insert into STUDENT(RNO,S1,S2,S3,S4) values(2,72,94,82,76)$$
insert into STUDENT(RNO,S1,S2,S3,S4) values(3,40,28,64,82)$$
insert into STUDENT(RNO,S1,S2,S3,S4) values(4,64,58,72,98)$$
insert into STUDENT(RNO,S1,S2,S3,S4) values(5,82,100,56,74)$$

create procedure student()
BEGIN

	declare r int;
	declare a1 int;
	declare a2 int;
	declare a3 int;
	declare a4 int;
	declare tot int;
	declare perc float;
	declare done int default 0;
	declare cursor1 CURSOR FOR select RNO,S1,S2,S3,S4 from STUDENT;
    declare continue handler for not found set done=1;
    
	OPEN cursor1;
  
	loop1:LOOP
	
		fetch cursor1 into r,a1,a2,a3,a4;
		set tot=a1+a2+a3+a4;
		set perc=tot/4;
		update STUDENT set total=tot,percentage=perc where rno=r;
		
		if done=1 then
			leave loop1;
		end if;
	
	end loop loop1;

	CLOSE cursor1;
	
	select * from STUDENT;

END$$

delimiter ;
