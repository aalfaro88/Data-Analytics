SHOW databases;

#1
USE sakila;

SHOW tables;
#2
SELECT *
FROM actor, film, customer;

#3
SHOW tables;
SELECT title
FROM film;

#4
SHOW tables;
SELECT DISTINCT language.name as language from language;

#5.1
SHOW tables;
SELECT COUNT(DISTINCT store_id)
FROM customer;

#5.2
SHOW tables;
SELECT COUNT(DISTINCT staff_id)
FROM staff;

SHOW tables;
SELECT first_name as First_Name
FROM staff;



