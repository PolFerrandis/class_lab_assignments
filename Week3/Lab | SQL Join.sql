#1.List number of films per category.

SELECT fc.category_id, c.name, count(distinct fc.film_id)
from film_category fc
join category c
on fc.category_id = c.category_id
group by category_id, name ;

#2.Display the first and last names, as well as the address, of each staff member.

select s.first_name, s.last_name, a.address, a.district, a.city_id, a.postal_code,a.phone
from staff s 
join address a 
on s.address_id=a.address_id;

#3.Display the total amount rung up by each staff member in August of 2005.

select s.first_name, s.last_name, sum(p.amount) as total_amount
from payment p 
join staff s
on s.staff_id=p.staff_id
where p.payment_date regexp '2005-05'
group by first_name, last_name;
 
#4.List each film and the number of actors who are listed for that film.

select fa.film_id,f.title, count(fa.actor_id)
from film_actor fa
join film f
on fa.film_id = f.film_id
group by film_id;

#5.Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
	#List the customers alphabetically by last name.
    
select c.customer_id,c.first_name,c.last_name,sum(p.amount) as total_paid
from payment p 
join customer c 
on c.customer_id=p.customer_id
group by customer_id
order by last_name;