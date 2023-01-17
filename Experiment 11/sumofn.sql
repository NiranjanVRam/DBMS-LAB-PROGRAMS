delimiter $$

drop procedure if exists sumofn$$

create procedure sumofn(m int)
begin
	DECLARE n int DEFAULT 0;
	DECLARE g int DEFAULT 0;
	l1:LOOP
		set n=n+1;
		set g=g+n;
		IF n=m THEN
			LEAVE l1;
		END IF;
	END LOOP l1;
	select g as sum;
end$$

delimiter ;
