delimiter $$

drop procedure if exists withdraw$$

drop table if exists account_master;

create table account_master(acct_no INTEGER,customer_name VARCHAR(30),balance DECIMAL(10,2));

insert into account_master values(1,"John Doe",2000.00),(2,"Jane Jacob",7000.00),(3,"Jack Smith",3000.00);

create procedure withdraw(accno INT,amount DECIMAL(10,2))
BEGIN
	DECLARE curbal DECIMAL(10,2);
	SET curbal = (select balance from account_master where acct_no=accno);

	IF curbal >= amount THEN
	BEGIN
		select 'Transaction success!!' as Message;
		update account_master set balance=balance-amount where acct_no=accno;
		select * from account_master;
	END;
	ELSE
		select 'Insufficient balance!!' as Message;
	END IF;
END$$

delimiter ;
