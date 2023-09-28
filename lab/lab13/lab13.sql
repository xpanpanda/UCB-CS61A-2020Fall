.read data.sql


CREATE TABLE average_prices AS
  SELECT category AS category ,AVG(MSRP)as average_price FROM products GROUP BY category;


CREATE TABLE lowest_prices AS
  SELECT store AS store,item AS item,MIN(price) AS min FROM inventory GROUP BY item;


CREATE TABLE shopping_list AS
  SELECT p.name,l.store FROM products AS p,lowest_prices AS l WHERE p.name=l.item GROUP BY category HAVING MIN(MSRP/rating);


CREATE TABLE total_bandwidth AS
  SELECT SUM(price.Mbs) FROM stores AS price,shopping_list AS list WHERE list.store=price.store;

