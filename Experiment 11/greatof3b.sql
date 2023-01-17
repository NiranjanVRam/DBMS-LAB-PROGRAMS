delimiter $$

drop procedure if exists greatof3b$$

create procedure greatof3b(a int,b int,c int,OUT d int)
begin
	IF a>b THEN
		IF a>c THEN
			set d=a;
		ELSE
			set d=a;
		END IF;
	ELSE
		IF b>c THEN
			set d=a;
		ELSE
			set d=a;
		END IF;
	END IF;
	select @d as greatest;
end$$

delimiter ;
