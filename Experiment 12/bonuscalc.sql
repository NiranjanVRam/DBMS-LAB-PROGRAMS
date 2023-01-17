delimiter $$

drop procedure if exists bonuscalc$$

drop table if exists bonus;

create table bonus(SSN INTEGER,Name VARCHAR(30),Bonus INTEGER);

create procedure bonuscalc(ssn VARCHAR(50))
BEGIN
	DECLARE b DECIMAL(18,2);
	DECLARE salary DECIMAL(18,2);
	DECLARE expe INT;
	DECLARE n VARCHAR(30);

	select Years_of_exp into expe from employee where SSN=ssn LIMIT 1;

	select Basic_pay into salary from employee where SSN=ssn LIMIT 1;
	
	select Name into n from employee where SSN=ssn LIMIT 1;

	IF expe < 5 THEN
		SET b = salary; 
	ELSEIF expe < 9 THEN
		SET b = (salary * 0.2 * 12);
	ELSE
		SET b = (salary + (salary * 0.25 * 12));
	END IF;

	insert into bonus values(ssn,n,b);
	select * from bonus LIMIT 1;

END$$

delimiter ;
