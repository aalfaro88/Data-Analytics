
USE sakila;

SHOW tables;

#1
SELECT title, release_year FROM film;

#2
SELECT * FROM film
WHERE title REGEXP 'armageddon';

#3
SELECT * FROM film
WHERE title REGEXP 'apollo$';

#4
SELECT * FROM film
ORDER BY film.length DESC
LIMIT 10;

#5
SELECT COUNT(*) FROM film
WHERE special_features REGEXP 'behind the scenes';

#6
ALTER TABLE staff
DROP COLUMN picture;
SELECT * FROM staff;

#7
SELECT * FROM customer
WHERE first_name = "TAMMY";
SELECT * FROM staff;

INSERT INTO staff
VALUES (3,"Tammy","Sanders",79,"Tammy.Sanders@sakilastaff.com",2,1,"Tammy","","2006-02-15 03:57:16");
SELECT * FROM staff;

#8
SELECT MAX(rental_id) FROM rental; 
SELECT * FROM rental;

DELETE FROM rental
WHERE rental_id = 16050;

INSERT INTO rental
VALUES (16050,"2006-02-11 21:30:53",1,130,"2006-02-16 21:30:53",1,"2006-02-15 21:30:53");

#9

#Delete non-active users, but first, create a backup table deleted_users to store customer_id, 
#email, and the date for the users that would be deleted. Follow these steps:

#Check if there are any non-active users
#Create a table backup table as suggested
#Insert the non active users in the table backup table
#Delete the non active users from the table customer

SELECT * FROM customer
WHERE active = 0;


DROP TABLE IF EXISTS deleted_users;

CREATE TABLE if not exists deleted_users (
  customer_id int UNIQUE NOT NULL,
  email text,
  date_of_deletion text);
  
SELECT * FROM deleted_users;
  
SELECT * FROM customer
WHERE active = 0;

INSERT INTO deleted_users (customer_id, email,date_of_deletion)
SELECT customer_id, email,create_date
FROM customer
WHERE active = 0;
  
DELETE FROM customer
WHERE active = 0;

SET foreign_key_checks = 0;
