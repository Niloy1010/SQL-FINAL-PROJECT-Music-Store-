DROP TRIGGER IF EXISTS new_cliient_rent;
DELIMITER //
CREATE TRIGGER new_cliient_rent
BEFORE INSERT ON rent_items
FOR EACH ROW
BEGIN
	DECLARE client_id_new_var INT;
    DECLARE client_id_client_var INT;
     DECLARE row_not_found tinyint DEFAULT FALSE;
 
    
    
    DECLARE client_id_cursor CURSOR FOR
		SELECT  client_id
        FROM rent_items;
        
	DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET row_not_found = TRUE;
	   
    SELECT new.client_id 
    INTO client_id_new_var;
    
    OPEN client_id_cursor;
		WHILE row_not_found = FALSE DO
        
        FETCH client_id_cursor into client_id_client_var;
			IF client_id_client_var = client_id_new_var THEN
		SIGNAL SQLSTATE 'HY000'
			SET MESSAGE_TEXT = "Client already exists. Delete client row first from rent_items";
		END IF;
        
        
		END WHILE;
	CLOSE client_id_cursor;
    

    
	
END//
DELIMITER ;