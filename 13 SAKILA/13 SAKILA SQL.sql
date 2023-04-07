USE sakila;

#________________PART 1:__________________ 
drop table if exists films_2020;
CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` int(6),
  `rental_rate` decimal(4,2),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;

SELECT * FROM films_2020;

show variables like 'local_infile';
set global local_infile = 1;

LOAD DATA LOCAL INFILE "/Users/albertoalfaro/Desktop/ironhack/03 - Labs/Unit 02/13 SAKILA/films_2020.csv"
INTO TABLE films_2020
fields terminated BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(film_id,title,description,release_year,language_id,original_language_id,rental_duration,rental_rate,length,replacement_cost,rating);

SELECT * FROM films_2020;

UPDATE films_2020
SET rental_duration = 3
WHERE rental_duration = 0;

UPDATE films_2020
SET rental_rate = 2.99
WHERE rental_rate = 0.00;

UPDATE films_2020
SET replacement_cost = 8.99
WHERE replacement_cost = 0.00;

#________________PART 2:__________________ 

#2.1

SELECT last_name, COUNT(last_name) FROM actor
GROUP BY last_name
HAVING COUNT(last_name) = 1;

#or

SELECT last_name FROM actor
GROUP BY last_name
HAVING COUNT(last_name) = 1;

#2.2

SELECT last_name FROM actor
GROUP BY last_name
HAVING COUNT(last_name) > 1;

#2.3
SELECT * FROM rental;

SELECT staff_id, count(staff_id) FROM rental
GROUP BY staff_id ;

#2.4
SELECT COUNT(DISTINCT(title)) FROM film;

#2.5
SELECT rating, COUNT(rating) FROM film
GROUP BY rating;

#2.6
SELECT rating , AVG(film.length) FROM film
GROUP BY rating;

#2.7
SELECT rating , AVG(film.length) FROM film
GROUP BY rating
HAVING AVG(film.length)>120;
