delimiter $$

drop procedure if exists gradea$$

create procedure gradea(m int)
begin
	DECLARE g varchar(5);
	CASE
		WHEN m>=90 THEN
			set g='A';
		WHEN m>=80 THEN
			set g='B';
		WHEN m>=60 THEN
			set g='C';
		WHEN m>=50 THEN
			set g='D';
		WHEN m>=40 THEN
			set g='E';
		WHEN m>=30 THEN
			set g='F';
		ELSE
			select "Invalid input.";
	END CASE;
	select g as grade;
end$$

delimiter ;
