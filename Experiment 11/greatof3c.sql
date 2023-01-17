delimiter $$

drop procedure if exists greatof3c$$

create procedure greatof3c(a int,b int,INOUT c int)
begin
	IF a>b THEN
		IF a>c THEN
			set c=a;
		END IF;
	ELSE
		IF b>c THEN
			set c=b;
		END IF;
	END IF;
	select @c as greatest;
end$$

delimiter ;
