delimiter $$

drop table if exists department$$

drop trigger if exists upperdepartment$$

create table department(dept_num int,dept_name varchar(20),location varchar(15),head_of_dept varchar(20))$$

insert into department values(10,"sales","New York","Ivan")$$
insert into department values(4,"development","London","Mike")$$
insert into department values(7,"support","Alaska","John")$$
insert into department values(10,"sales","New York","Mike")$$
insert into department values(7,"support","Alaska","Jake")$$

create trigger upperdepartment
before insert on department
for each row
BEGIN
	set NEW.dept_name=UPPER(NEW.dept_name);
END$$

delimiter ;

/*
insert into department values(4,"development","London","Ram");
*/
