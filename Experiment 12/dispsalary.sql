delimiter $$

drop procedure if exists dispsalary$$

create procedure dispsalary(ssn INT)
begin
	select Name,(Basic_pay+DA+HRA+IF(Basic_pay>30000,500,0)) as Salary from employee where SSN=ssn LIMIT 1;

end$$

delimiter ;
