delimiter $$

drop table if exists WORK$$

drop function if exists workk$$

create table WORK(EMP_NO int,NAME varchar(30),COMPANY_NAME varchar(30),JOIN_DATE date,DESIGNATION varchar(15),SALARY int,DEPT_NO int)$$

insert into WORK values(1,"John","IBM","1987-07-16","Manager",50000,10)$$
insert into WORK values(2,"Mike","Google","1990-05-24","Manager",50000,5)$$
insert into WORK values(3,"David","Amazon","1988-12-14","Supervisor",40000,10)$$
insert into WORK values(4,"Harry","Microsoft","1999-07-01","Team Leader",60000,8)$$
insert into WORK values(5,"Luke","Google","2000-10-03","Clerk",30000,10)$$

create function workk(dno int)
returns int
BEGIN
	DECLARE ts int;
	select SUM(SALARY) into ts from WORK where DEPT_NO=dno;
	return ts;
END$$

delimiter ;
