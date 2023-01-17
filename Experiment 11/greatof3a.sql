delimiter $$

drop procedure if exists greatof3a$$

create procedure greatof3a(a int,b int,c int)
begin
	IF a>b THEN
		IF a>c THEN
			select a as greatest;
		ELSE
			select c as greatest;
		END IF;
	ELSE
		IF b>c THEN
			select b as greatest;
		ELSE
			select c as greatest;
		END IF;
	END IF;
end$$

delimiter ;
