delimiter $$

drop procedure if exists sumofodd$$

create procedure sumofodd(m int)
begin
	DECLARE n int DEFAULT 1;
	DECLARE g int DEFAULT 0;
	l1:REPEAT
		set g=g+n;
		set n=n+2;
	UNTIL g>m-n
	END REPEAT l1;
	select g as sum;
end$$

delimiter ;
