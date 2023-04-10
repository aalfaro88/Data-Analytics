USE sakila;
SHOW TABLES;

SELECT * FROM film; #SELECT film.title (Conexión => film.film_id = inventory.film_id
SELECT * FROM rental; #SELECT rental.customer_id, rental.rental_date, rental.rental_id (Conexión => rental.inventory_id = inventory.inventory_id
SELECT * FROM inventory; #inventory_id 

SELECT rental.rental_id AS "rental_id", rental.customer_id as "customer_id", CONCAT(SUBSTRING(rental.rental_date, 6, 2), '-', SUBSTRING(rental.rental_date, 1, 4)) AS "rental(mm-yyyy)", film.title as "rented_film"
FROM film
JOIN inventory
ON film.film_id = inventory.film_id
JOIN rental 
ON rental.inventory_id = inventory.inventory_id
WHERE CONCAT(SUBSTRING(rental.rental_date, 6, 2), '-', SUBSTRING(rental.rental_date, 1, 4)) = "05-2005"
ORDER BY rental_date ASC;

#Create a table rentals_may to store the data from rental table with information for the month of May.

DROP TABLE rentals_may;
CREATE TABLE rentals_may (
  rental_id INT,
  customer_id INT,
  rental_date TEXT,
  rented_film TEXT
);

#Insert values in the table rentals_may using the table rental, filtering values only for the month of May.
INSERT INTO rentals_may (rental_id, customer_id, rental_date, rented_film)
SELECT rental.rental_id AS rental_id, rental.customer_id AS customer_id, 
       CONCAT(SUBSTRING(rental.rental_date, 6, 2), '-', SUBSTRING(rental.rental_date, 1, 4)) AS rental_date, 
       film.title AS rented_film
FROM film
JOIN inventory 
ON film.film_id = inventory.film_id
JOIN rental 
ON rental.inventory_id = inventory.inventory_id
WHERE CONCAT(SUBSTRING(rental.rental_date, 6, 2), '-', SUBSTRING(rental.rental_date, 1, 4)) = '05-2005'
ORDER BY rental_date ASC;

SELECT * FROM rentals_may;

#Create a table rentals_june to store the data from rental table with information for the month of June.
DROP TABLE rentals_june;
CREATE TABLE rentals_june (
  rental_id INT,
  customer_id INT,
  rental_date TEXT,
  rented_film TEXT
  );

#Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
  
INSERT INTO rentals_june (rental_id, customer_id, rental_date, rented_film)
SELECT rental.rental_id AS rental_id, rental.customer_id AS customer_id, 
       CONCAT(SUBSTRING(rental.rental_date, 6, 2), '-', SUBSTRING(rental.rental_date, 1, 4)) AS rental_date, 
       film.title AS rented_film
FROM film
JOIN inventory 
ON film.film_id = inventory.film_id
JOIN rental 
ON rental.inventory_id = inventory.inventory_id
WHERE CONCAT(SUBSTRING(rental.rental_date, 6, 2), '-', SUBSTRING(rental.rental_date, 1, 4)) = '06-2005'
ORDER BY rental_date ASC;
  
SELECT * FROM rentals_june;

#Check the number of rentals for each customer for May.
SELECT customer_id, count(rental_id)
FROM rentals_may
GROUP BY customer_id
ORDER BY customer_id ASC;


#Check the number of rentals for each customer for June.
SELECT customer_id, count(rental_id)
FROM rentals_june
GROUP BY customer_id
ORDER BY customer_id ASC;


#____________________IN PHYTON___________________________
#Create a Python connection with SQL database and retrieve the results of the last two queries (also mentioned below) as dataframes:

#Check the number of rentals for each customer for May

#Check the number of rentals for each customer for June
#Hint: You can store the results from the two queries in two separate dataframes.

#Write a function that checks if customer borrowed more or less films in the month of June as compared to May.
#Hint: For this part, you can create a join between the two dataframes created before, using the merge function available for pandas dataframes. Here is a link to the documentation for the merge function.


