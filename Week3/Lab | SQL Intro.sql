#Review the tables in the database.
#Explore tables by selecting all columns from each table or using the in built review features for your client.
SELECT *
FROM actor;
SELECT *
FROM address;
#Select one column from a table. Get film titles.
SELECT title
FROM film;
#Select one column from a table and alias it. Get unique list of film languages under the alias language. 
#Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.
SELECT DISTINCT original_language_id AS language
FROM film;
  #5.1 Find out how many stores does the company have?
  SELECT count(DISTINCT store_id)
  FROM store;
  #5.2 Find out how many employees staff does the company have?
  SELECT count(DISTINCT staff_id)
  FROM staff;
  #5.3 Return a list of employee first names only?
  SELECT first_name
  FROM staff;