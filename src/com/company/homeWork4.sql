
--1) Вывести всех клиентов из страны Canada
SELECT * FROM customer WHERE country='Canada';

--2) Вывести все страны клиентов
SELECT DISTINCT  country FROM customer;

--3) Вывести количество всех заказов
SELECT COUNT(*) FROM orders;

--4) Вывести максимальную стоимость заказа
SELECT MAX(total_amount) FROM orders; --****

--5) Найти сумму всех заказов
SELECT SUM(total_amount) FROM orders;

--6) Найти сумму всех заказов за 2014 год
SELECT SUM(total_amount) FROM orders WHERE order_date BETWEEN 'Jan  1 2014' AND 'Dec  31 2014';

--7) Найти среднюю стоимость всех заказов
SELECT AVG(total_amount) FROM orders;

--8) Найти среднюю стоимость всех заказов по каждому клиенту
SELECT DISTINCT first_name,last_name, AVG(total_amount) FROM customer,orders GROUP BY first_name,last_name;

--9) Найти всех клиентов, которые живут в Бразилии или Испании
SELECT * FROM customer WHERE country IN ('Brazil','Spain');

--10 Найти все заказы между 2013ым и 2014ым годами, которые стоили меньше 100.00$
SELECT * FROM orders WHERE order_date BETWEEN 'Jan  1 2013' AND 'Dec  31 2014' AND total_amount<100;

--11) Найти всех клиентов, которые в одной из стран: Испания, Италия, Германия, Франция. Отсортируйте по странам
SELECT * FROM customer WHERE country IN ('Spain','Italy','Germany','France') ORDER BY country;

--12) Найти все страны клиентов, страны которых содержаться в таблице поставщиков
SELECT customer.country AS customer_country, supplier.country AS supplier_country FROM customer
JOIN orders ON customer.id = orders.customer_id
JOIN order_item ON orders.id = order_item.order_id
JOIN product ON order_item.product_id = product.id
JOIN supplier ON product.supplier_id = supplier.id;

SELECT DISTINCT customer.country,supplier.country FROM customer,supplier WHERE customer.country=supplier.country;

--13) Найти всех клиентов, имена которых начинаются на ‘Jo’
SELECT * FROM customer WHERE first_name LIKE ('Jo%');

--14) Найти всех клиентов, имена которых заканчиваются на ‘a’ и имеют длину ровно 4 символа
SELECT * FROM customer WHERE first_name LIKE ('%a') AND length(first_name)=4;

--15) Найти количество клиентов по странам
SELECT country AS Страны, COUNT(*) AS Количество_клиентов FROM customer GROUP BY country;

--16) Найти количество клиентов по странам. Вывести в порядке убывания
SELECT country AS Страны, COUNT(*) AS Количество_клиентов FROM customer GROUP BY country ORDER BY COUNT(*) DESC ;

--17) Найти общую сумму стоимости заказов и количество заказов по каждому клиенту (customer_id). Отсортировать по сумме
SELECT first_name AS Имя,last_name AS Фамилия, SUM(total_amount)AS Общая_сумма_заказов,COUNT(orders) AS Количество
FROM customer JOIN orders ON customer.id = orders.customer_id GROUP BY first_name, last_name ORDER BY SUM(total_amount) DESC;

--18) Найти общую сумму стоимости заказов и количество заказов по каждому клиенту (customer_id), у которых общее количество заказов больше 20ти

SELECT first_name AS Имя,last_name AS Фамилия, SUM(total_amount)AS Общая_сумма_заказов,COUNT(orders) AS Количество
FROM customer JOIN orders ON customer.id = orders.customer_id GROUP BY first_name, last_name
HAVING COUNT(orders)>20 ORDER BY SUM(total_amount) DESC;

