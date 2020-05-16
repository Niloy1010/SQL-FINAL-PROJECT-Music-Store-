SHOW VARIABLES LIKE 'event_scheduler';

SET GLOBAL event_scheduler = ON;


DROP EVENT IF EXISTS event_restocking;

DELIMITER //
CREATE EVENT event_restocking
ON SCHEDULE EVERY 7 DAY
STARTS '2020-04-16 09:35:00'
DO BEGIN
UPDATE albums
SET product_remaining = 10;
END//


DELIMITER ;