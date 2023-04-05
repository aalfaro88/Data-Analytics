USE SAKILA;
SHOW tables;
SELECT * FROM actor;

#1
SELECT * FROM actor
WHERE first_name = "Scarlett";

#2
SHOW tables;
SELECT SUM(return_date IS NULL) AS "rented", (COUNT(DISTINCT(inventory_id))-SUM(return_date IS NULL)) AS "available" FROM rental;

#3
SELECT MAX(film.length) AS "max_duration", MIN(film.length) AS "min_duration" FROM film;

#4
SELECT CONCAT(FLOOR((AVG(film.length))/60),":",FLOOR(((AVG(film.length))/60-FLOOR((AVG(film.length))/60))*60)) AS "avg time" FROM film;

#5
SELECT COUNT(DISTINCT(last_name)) FROM actor;

#6
SELECT DATEDIFF(MAX(last_update),MIN(rental_date)) AS dates_operating FROM rental;

#7
SELECT *, MONTH(rental_date) AS month, WEEKDAY(rental_date) AS weekday FROM rental
LIMIT 20;

#8
SELECT *,
CASE
  WHEN WEEKDAY(rental_date) <= 4 THEN 'Workday'
  ELSE 'Weekend'
END AS day_type
FROM rental;

#9
SELECT COUNT(*) AS last_month_activity FROM rental
WHERE rental_date >= DATE_SUB(last_update, INTERVAL 1 MONTH);

#OR

SELECT SUM(rental_date >= DATE_SUB(last_update, INTERVAL 1 MONTH)) AS last_month_activity FROM rental;




