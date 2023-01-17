delimiter $$

drop procedure if exists insertemployee$$

drop table if exists employee$$

create table employee(SSN INT,Name VARCHAR(30),Designation VARCHAR(30),Basic_pay INT,DA INT,HRA INT,Gender VARCHAR(1),Years_of_exp INT);

insert into employee values(1, 'John Smith', 'Developer', 45000, 10000, 5000, 'M', 3);
insert into employee values(2, 'Jane Doe', 'Project Manager', 15000, 7000, 800, 'F', 5);
insert into employee values(3, 'Jack Johnson', 'Tester', 35000, 8000, 4000, 'M', 2);
insert into employee values(4, 'Jill Anderson', 'Analyst', 45000, 10000, 5000, 'F', 4);
insert into employee values(5, 'Jeff Williams', 'Architect', 60000, 2000, 10000, 'M', 6);

create procedure insertemployee(ssn INT)
BEGIN
	DECLARE ts INT;
	DECLARE it INT;

	select Basic_pay+DA+HRA into ts from employee where SSN=ssn LIMIT 1;

	IF ts<=25000 THEN
		SET it=0;
	ELSEIF ts<=50000 THEN
		SET it=(ts-25000)*5/100;
	ELSEIF ts<=100000 THEN
		SET it=1250+(ts-50000)*20/100;
	ELSE
		SET it=11250+(ts-100000)*30/100;
	END IF;

	select it as "Income_tax";
END$$

delimiter ;
