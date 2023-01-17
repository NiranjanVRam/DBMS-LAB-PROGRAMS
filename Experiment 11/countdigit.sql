delimiter $$

drop procedure if exists countdigit$$

create procedure countdigit(n int)
begin
  DECLARE g int DEFAULT 0; 

  WHILE n > 0 DO 
    set n = n / 10; 
    set g = g + 1; 
  END WHILE; 

  select g as count; 
END $$

delimiter ;
