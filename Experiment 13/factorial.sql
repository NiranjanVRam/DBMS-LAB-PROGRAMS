delimiter $$

create function factorial(n int)
returns int
BEGIN

	DECLARE fact int DEFAULT 1;
	WHILE n>0
	DO
		set fact=fact*n;
		set n=n-1;
	END WHILE;
return fact;
END$$

delimiter ;
