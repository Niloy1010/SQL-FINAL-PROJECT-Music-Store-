/*INSERT INTO CLIENT TABLE*/
INSERT INTO clients
VALUES(9,"as","kaur","simran@abc.com","a","b","c");
/*Insert Into order_items*/
INSERT INTO order_items
VALUES (1,"2020-04-16 02:02:33",4,1,1);


INSERT INTO order_items
VALUES (2,"2020-04-12 01:02:33",2,3,2);


INSERT INTO order_items
VALUES (3,"2020-04-15 15:02:33",4,5,3);


INSERT INTO order_items
VALUES (4,"2020-04-17 17:02:33",3,2,4);

INSERT INTO order_items
VALUES (5,"2020-04-11 5:02:33",5,4,5);

/* PRODUCT REMAINING TEST */
INSERT INTO order_items
VALUES (6,"2020-02-01 11:02:33",4,8,6);

/* INVALID */
INSERT INTO order_items
VALUES (7,"2020-04-17 4:02:33",1,4,3);



INSERT INTO order_items
VALUES (7,"2020-02-19 6:02:33",8,3,7);

INSERT INTO order_items
VALUES (8,"2020-02-19 1:02:33",4,1,8);



/*INSERT INTO rent_items*/
INSERT INTO rent_items
VALUES(1,2,"2020-04-17",1,2,"2020-04-17 12:00:00","Due");

INSERT INTO rent_items
VALUES(2,5,"2020-04-10",2,1,"2020-04-17 12:00:00","Overdue");


INSERT INTO rent_items
VALUES(3,2,"2020-04-03",3,6,"2020-04-10 12:00:00","Returned");

INSERT INTO rent_items
VALUES(4,2,"2020-04-04",8,7,"2020-04-17 12:00:00","Overdue");

INSERT INTO rent_items
VALUES(5,1,"2020-04-10",4,8,"2020-04-15 12:00:00","Due");

INSERT INTO rent_items
VALUES(6,1,"2020-04-17",2,4,"2020-04-23 12:00:00","Due");

INSERT INTO rent_items
VALUES(7,1,"2020-04-18",2,3,"2020-04-25 12:00:00","Due");

INSERT INTO rent_items
VALUES(8,1,"2020-04-18",7,5,"2020-04-10 12:00:00","Due");


/* INVALID */
INSERT INTO rent_items
VALUES(8,1,"2018-01-01",2,7,"2020-04-25 12:00:00","Due");



