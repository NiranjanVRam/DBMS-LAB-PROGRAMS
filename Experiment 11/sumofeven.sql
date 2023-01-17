delimiter $$

drop procedure if exists sumofeven$$

create procedure sumofeven(m int)
begin
	DECLARE n int DEFAULT 2;
	DECLARE g int DEFAULT 0;
	WHILE g<m-n DO
		set g=g+n;
		set n=n+2;
	END WHILE;
	select g as sum;
end$$

delimiter ;
