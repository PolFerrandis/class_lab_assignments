#1.Get release years.
select title as Film, release_year 
from film;

#2.Get all films with ARMAGEDDON in the title.
select title as Film
from film
where title LIKE 'armag%'; 

#3.Get all films which title ends with APOLLO.
select title as Films
from film
where title regexp 'APOLLO$';

#4.Get 10 the longest films.
select title as Films, length as Duration
from film
order by length DESC
LIMIT 10;

#5.How many films include Behind the Scenes content?
select count(distinct title)
from film
where special_features regexp 'behind the scenes';

#6.Drop column picture from staff.

ALTER TABLE staff
DROP COLUMN picture;

#7.A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.

insert into staff (staff_id,first_name,last_name,address_id,email,store_id,active,username) 
VALUES ('3','TAMMY','SANDERS','79','TAMMY.SANDERS@sakilacustomer.org','2','1','Tammy');

#8.Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
#You can use current date for the rental_date column in the rental table. 
#Hint: Check the columns in the table rental and see what information you would need to add there. 
#You can query those pieces of information. For eg., you would notice that you need customer_id information as well. 
#To get that you can use the following query:
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
#Use similar method to get inventory_id, film_id, and staff_id.

select f.film_id, f.title
from film f
where title regexp 'Academy Dinosaur';

select inventory_id 
from inventory
where film_id = 1;

SELECT max(rental_id)
from rental;

insert into rental (rental_id,rental_date,inventory_id,customer_id,return_date,staff_id)
VALUES ('16050','2021-11-03 15:20:00','367','130',null,'1');

#9.Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. 
#Follow these steps:
	#9.1Check if there are any non-active users
	select count(*)
    from customer
    where active=0;
    
    select *
    from customer
    where active=0;
    
	#9.2Create a table backup table as suggested
    #9.3Insert the non active users in the table backup table
    
	CREATE TABLE deleted_users LIKE customer; 
	INSERT deleted_users SELECT * FROM customer
	where active=0;
    
	#9.4Delete the non active users from the table customer
    
    DELETE FROM customer 
    WHERE active= 0;