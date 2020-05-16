DROP TRIGGER IF EXISTS new_cliient_entry_client_table;
DELIMITER //
CREATE TRIGGER new_cliient_entry_client_table
BEFORE INSERT ON clients
FOR EACH ROW
BEGIN
	DECLARE email_address_var varchar(20);
    DECLARE client_id_client_var INT;
     DECLARE row_not_found tinyint DEFAULT FALSE;
     DECLARE check_email_address varchar(20);
 
    
    
    DECLARE client_cursor CURSOR FOR
		SELECT  email_address
        FROM clients;
        

	DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET row_not_found = TRUE;

    
    SELECT new.email_address
    INTO email_address_var;
    
    OPEN client_cursor;
		WHILE row_not_found = FALSE DO
        
        FETCH client_cursor into check_email_address;
			IF check_email_address = email_address_var THEN
		SIGNAL SQLSTATE 'HY000'
			SET MESSAGE_TEXT = "Client already exists. Please enter a different client";
		END IF;
        
        
		END WHILE;
	CLOSE client_cursor;
    

    
	
END//
DELIMITER ;