delimiter $$

drop procedure if exists swap$$

create procedure swap(INOUT a int,INOUT b int)
begin
    declare temp int;
    set temp = a;
    set a = b;
    set b = temp;
    select a as a,b as b;
end$$

delimiter ;
