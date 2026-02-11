SELECT * FROM users u CROSS JOIN orders o ORDER BY u.id;
SELECT * FROM users;
SELECT * FROM orders;
SELECT * FROM staff;
SELECT * FROM products;
SELECT * FROM orderdetails;
SELECT u.id, u.username, u.city, u.country, s.id, s.first_name, s.last_name FROM users u JOIN staff s ON u.id = s.id;
SELECT s.id, s.first_name, s.last_name, o.staff_id, order_date FROM staff s JOIN orders o ON s.id = o.staff_id WHERE s.id IN (3,5);
SELECT u.country AS 국가, COUNT(DISTINCT u.id) AS 주문건수 FROM users u JOIN orders o ON u.id = o.user_id GROUP BY u.country ORDER BY 주문건수 DESC;
SELECT o.user_id, 
ROUND(SUM(p.price * od.quantity),2) AS 정상가격, 
ROUND(SUM(p.discount_price * od.quantity),2)AS 할인가격 
FROM orders o LEFT JOIN orderdetails od ON o.id = od.order_id INNER JOIN products p ON od.product_id = p.id 
GROUP BY o.user_id ORDER BY 정상가격 DESC;

(SELECT * FROM users) UNION ALL (SELECT * FROM users) ORDER BY id;
(SELECT id, phone, country, city FROM users) UNION ALL (SELECT id, phone, country, city FROM users) ORDER BY id;

SELECT id, phone, city, country FROM users WHERE country = 'Korea' UNION ALL SELECT id, phone, city, country FROM users WHERE country = 'Mexico' ORDER BY country;

SELECT order_date AS 주문일자 FROM orders WHERE order_date >= '2015-10' AND order_date < '2015-11'
UNION ALL 
SELECT order_date AS 주문일자 FROM orders WHERE order_date >= '2015-12' AND order_date < '2016-01'
ORDER BY 주문일자 DESC;

SELECT id AS 주문, phone AS 연락처, country AS 국가, city AS 도시, is_marketing_agree AS 동의여부 FROM users WHERE is_marketing_agree = 1 AND country = 'USA'
UNION ALL 
SELECT id AS 주문, phone AS 연락처, country AS 국가, city AS 도시, is_marketing_agree AS 동의여부 FROM users WHERE is_marketing_agree = 0 AND country = 'France'
ORDER BY 국가;

SELECT * FROM orderdetails o LEFT JOIN products p ON o.product_id = p.id
UNION
SELECT * FROM orderdetails o RIGHT JOIN products p ON o.product_id = p.id;

SELECT name, price, (SELECT ROUND(AVG(price),2) FROM products) AS 평균가격 FROM products;

SELECT ROUND(AVG(price),2) AS 평균가격 FROM products;

SELECT name, price, AVG(price) AS 평균가격 FROM products;

SELECT AVG(price) FROM products;

SELECT city, COUNT(DISTINCT id) AS 회원수 FROM users GROUP BY city HAVING 회원수 > 2 ORDER BY 회원수 DESC;

SELECT * FROM (SELECT city, COUNT(DISTINCT id) AS 도시별회원수 FROM users GROUP BY city) a WHERE 도시별회원수 >= 3 ORDER BY 도시별회원수 DESC;

SELECT * FROM orders WHERE (staff_id, user_id) IN (SELECT id, user_id FROM staff WHERE last_name IN ('Kyle', 'Scott'));

SELECT * FROM products WHERE discount_price IN (SELECT MAX(discount_price) FROM products);

SELECT * FROM orders o INNER JOIN orderdetails od ON o.id = od.order_id 
WHERE order_date > '2015-07' AND order_date < '2015-08' AND od.quantity >= 50;

SELECT * FROM 
(SELECT * FROM orders WHERE order_date > '2015-07' AND order_date < '2015-08') o 
INNER JOIN 
(SELECT * FROM orderdetails WHERE quantity >= 50) od ON o.id = od.order_id;

SELECT *, ROUND(discount_price / (select MAX(discount_price) FROM products),3) AS ratioPerMaxPrc FROM products;

SELECT * FROM
(SELECT id, phone, country FROM users WHERE country IN ('Korea', 'Italy')) u 
INNER JOIN 
(SELECT * FROM staff WHERE birth_date < '1990-01-01') s ON u.id = s.user_id;

SELECT * FROM (SELECT country, COUNT(DISTINCT id) AS 국가별회원수 FROM users GROUP BY country) u WHERE 국가별회원수 >= 5 ORDER BY 국가별회원수 DESC;

SELECT * FROM products WHERE price IN (SELECT MIN(price) FROM products);

SELECT * FROM users WHERE id IN (SELECT user_id FROM orders WHERE order_date BETWEEN '2016-01-01' AND '2016-12-31');