delimiter $$

drop procedure if exists incometax$$

drop table if exists employee;

create table employee (SSN INT PRIMARY KEY,Name VARCHAR(30),Designation VARCHAR(30),Basic_pay DECIMAL(10,2),DA DECIMAL(10,2),HRA DECIMAL(10,2),Gender VARCHAR(1),Years_of_exp INT);

insert into employee VALUES (1, 'John Smith', 'Developer', 45000, 10000, 5000, 'M', 3),(2, 'Jane Doe', 'Project Manager', 55000, 15000, 7000, 'F', 5),(3, 'Jack Johnson', 'Tester', 35000, 8000, 4000, 'M', 2),(4, 'Jill Anderson', 'Analyst', 45000, 10000, 5000, 'F', 4),(5, 'Jeff Williams', 'Architect', 60000, 20000, 10000, 'M', 6);

create procedure incometax(ssn int)
begin

    DECLARE tax DECIMAL(10,2);
    DECLARE salary DECIMAL(10,2);

    select Basic_pay + DA + HRA into salary from employee where SSN=ssn;

    IF salary <= 250000 THEN
        SET tax = 0;
    ELSEIF salary <= 500000 THEN
        SET tax = 0.05 * salary;
    ELSEIF salary <= 1000000 THEN
        SET tax = 0.20 * salary;
    ELSE
        SET tax = 0.30 * salary;
    END IF;

    select ssn as 'SSN No.',salary as 'Total income',tax as Tax;

END$$

delimiter ;
