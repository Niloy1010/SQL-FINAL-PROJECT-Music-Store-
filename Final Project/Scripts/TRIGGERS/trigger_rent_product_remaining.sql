DROP TRIGGER IF EXISTS rent_product_remaining;
DELIMITER //
CREATE TRIGGER rent_product_remaining
AFTER INSERT ON rent_items
FOR EACH ROW
BEGIN
	DECLARE album_id_var INT;
    DECLARE rented_product_var INT;
    DECLARE product_remaining_var INT;
    
    SELECT new.album_id 
    INTO album_id_var
    ;
    
    SELECT new.quantity
    INTO rented_product_var
    ;
    
    
    SELECT product_remaining - rented_product_var
    INTO product_remaining_var
    FROM albums
    WHERE album_id = album_id_var;
    
    
    UPDATE albums
    SET product_remaining = product_remaining_var
    WHERE album_id = album_id_var;
    
	IF product_remaining_var<0 THEN
		SIGNAL SQLSTATE 'HY000'
			SET MESSAGE_TEXT = "No more items remaining for this product";
    END IF;
END//
DELIMITER ;