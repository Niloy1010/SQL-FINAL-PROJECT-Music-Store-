/* QUERY 1  : Display a list of clients that spent more than the average spent by client in the past month*/
SELECT first_name, last_name
FROM clients c JOIN order_items o
ON c.client_id = o.client_id
JOIN albums a
ON o.album_id = a.album_id
WHERE (o.quantity*a.item_price) > (SELECT AVG(o.quantity*a.item_price)
FROM order_items o  JOIN albums a
ON o.album_id = a.album_id)
AND order_date between date_sub(now(),INTERVAL 1 MONTH) and now()
 ORDER BY first_name,last_name;

/*TEST*/
SELECT AVG(o.quantity*a.item_price)
FROM clients c JOIN order_items o
ON c.client_id = o.client_id
JOIN albums a
ON o.album_id = a.album_id
WHERE order_date between date_sub(now(),INTERVAL 1 MONTH) and now();


SELECT o.quantity*a.item_price,order_date FROM clients c JOIN order_items o
ON c.client_id = o.client_id
JOIN albums a
ON o.album_id = a.album_id
WHERE order_date between date_sub(now(),INTERVAL 1 MONTH) and now()
AND first_name="biozid";



/* QUERY 2 The top sold products and least sold products over a week.*/

select max(total) AS "Maximum sold products", min(total) AS "Minimum sold products"
 from (
select album_id,SUM(quantity) as total
 from order_items
 where order_date between date_sub(now(),INTERVAL 1 WEEK) and now()
  group by album_id
) t;

/* TEST */
SELECT album_id, quantity
FROM order_items
 where order_date between date_sub(now(),INTERVAL 1 WEEK) and now();



/*Query 3 The maximum price of products in the same category (for example, rock, pop, country, hip-hop). Use group by to list all the categories and their maximum price*/
select genre.genre, max(albums.item_price) AS "Maximum price" from genre,albums where genre.genre_id=albums.genre_id 
group by albums.genre_id;

/* TEST */
SELECT album_id,item_price,genre FROM albums a JOIN genre g ON a.genre_id = g.genre_id order by album_id;


/* Query 4 List how many customers the system has by location (Country, Province, and City), and then sort them*/
select country,province,city,count(client_id) as "Number of clients" from clients group by country,province,city order by country,city,province;

/*Query 5 List how many products the store has sold for a particular month*/

select sum(quantity) as "Product sold" from order_items where month(order_date)=4;

/*TEST */
SELECT album_id,quantity FROM order_items where month(order_date)=2;

/* Query 6 List how many distinct albums each singer has*/
SELECT singer_name,COUNT(DISTINCT album_id) as "Distinct_albums" FROM song s
GROUP BY singer_name order by Distinct_albums DESC;

/* Query 7 List how many copies of an album are available of a particular singer*/
SELECT DISTINCT a.album_id,album_name, singer_name,  product_remaining AS "ALBUMS REMAINING"
FROM albums a JOIN song s
ON a.album_id = s.album_id;