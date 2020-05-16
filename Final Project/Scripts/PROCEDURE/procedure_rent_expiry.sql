
DROP PROCEDURE IF EXISTS check_rented_products;
DELIMITER //
CREATE PROCEDURE check_rented_products()
BEGIN
	DECLARE return_date_var DATETIME;
	DECLARE rent_id_var INT;
	DECLARE current_status_var VARCHAR(20);
    DECLARE row_not_found tinyint DEFAULT FALSE;
    
    DECLARE return_date_cursor CURSOR FOR
		SELECT  current_status,return_date, rent_id
        FROM rent_items;
        
	DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET row_not_found = TRUE;
	
    OPEN return_date_cursor;
		WHILE row_not_found = FALSE DO
        
        FETCH return_date_cursor into current_status_var,return_date_var,rent_id_var;
			IF current_status_var = "Due" THEN
				IF EXTRACT(DAY FROM SYSDATE()) - EXTRACT(DAY FROM return_date_var) > 0 THEN
					UPDATE rent_items
                    SET current_status = "Overdue"
                    WHERE rent_id = rent_id_var;
				END IF;
			END IF;
		END WHILE;
	CLOSE return_date_cursor;
    
END//
DELIMITER ;

CALL check_rented_products();

