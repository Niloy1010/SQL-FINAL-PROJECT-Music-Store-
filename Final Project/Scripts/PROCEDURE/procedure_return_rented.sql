
DROP PROCEDURE IF EXISTS check_renturned_products;
DELIMITER //
CREATE PROCEDURE check_renturned_products(
rent_id_var INT
)
BEGIN
	DECLARE return_date_var DATETIME;
	DECLARE current_status_var VARCHAR(20);
    DECLARE product_remaining_var INT;
    DECLARE album_id_var INT;
    
		SELECT current_status
        INTO current_status_var
        FROM rent_items
        WHERE rent_id = rent_id_var;
        
        SELECT quantity
        INTO product_remaining_var
        FROM rent_items
        WHERE rent_id = rent_id_var;
        
         SELECT album_id
        INTO album_id_var
        FROM rent_items
        WHERE rent_id = rent_id_var;
        
        
        

		IF current_status_var = "Due" OR current_status_var = "Overdue" THEN
					UPDATE albums
                    SET product_remaining = product_remaining + product_remaining_var
                    WHERE album_id = album_id_var;
                    
                   UPDATE rent_items
                    SET current_status = "Returned"
                    WHERE rent_id = rent_id_var;
		ELSE 
        SIGNAL SQLSTATE 'HY000'
			SET MESSAGE_TEXT = "Client already returned the items";
		
		END IF;
	
    
END//
DELIMITER ;

CALL check_renturned_products(7);

