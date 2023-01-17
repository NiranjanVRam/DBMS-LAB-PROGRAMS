delimiter $$

drop table if exists Employee$$

drop table if exists EMP_AUDIT_LOG$$

drop trigger if exists logsupdate$$

drop trigger if exists logsinsert$$

drop trigger if exists logsdelete$$

create table Employee(emp_num int,name varchar(10),dob date,designation varchar(20))$$

insert into Employee values(1,"Jake","1988-06-04","supervisor")$$
insert into Employee values(2,"John","1982-12-14","team leader")$$
insert into Employee values(3,"Jill","1987-03-15","developer")$$
insert into Employee values(4,"Jess","1986-10-23","tester")$$
insert into Employee values(5,"Jim","1995-01-24","architect")$$

create table EMP_AUDIT_LOG(audit_id int NOT NULL AUTO_INCREMENT,emp_num int,name varchar(30),change_date date,action varchar(10),PRIMARY KEY(audit_id))$$

create trigger logsupdate
after update on Employee
for each row
BEGIN
	insert into EMP_AUDIT_LOG(emp_num,name,change_date,action) values(OLD.emp_num,OLD.name,NOW(),'UPDATE');
END$$

create trigger logsinsert
after insert on Employee
for each row
BEGIN
	insert into EMP_AUDIT_LOG(emp_num,name,change_date,action) values(NEW.emp_num,NEW.name,NOW(),'INSERT');
END$$

create trigger logsdelete
after delete on Employee
for each row
BEGIN
	insert into EMP_AUDIT_LOG(emp_num,name,change_date,action) values(OLD.emp_num,OLD.name,NOW(),'DELETE');
END$$

delimiter ;

/*
insert into Employee values(6,"Jessica","1999-06-06","developer");
update Employee set dob="1995-01-26" where emp_num=5;
delete from Employee where emp_num=6;
select * from EMP_AUDIT_LOG;
*/
