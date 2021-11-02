#1.Select all the actors with the first name ‘Scarlett’.
SELECT *
FROM actor
WHERE first_name regexp 'Scarlett';

#2.How many films (movies) are available for rent and how many films have been rented?
SELECT count(distinct inventory_id) as films_available, count(distinct rental_date) as films_rented
FROM rental;

#3.What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT min(length) as max_duration, max(length) as min_duration
FROM film;

#4.What's the average movie duration expressed in format (hours, minutes)?
SELECT substring_index(sec_to_time(avg(length)*60), ":",2) as average_duration
from film;

#5.How many distinct (different) actors' last names are there?
SELECT count(DISTINCT last_name)
FROM actor;

#6.Since how many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF(max(payment_date), min(payment_date))
from payment;

#7.Show rental info with additional columns month and weekday. Get 20 results.
SELECT *,
date_format(convert(substring_index(rental_date,' ',1), date), "%w") as weekdayno,
date_format(convert(substring_index(rental_date,' ',1), date), "%m") as month
FROM rental
LIMIT 20;

#8.Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *,
monthname(rental_date) as month,
weekday(rental_date) as weekday,
CASE
WHEN weekday(rental_date)>=6 then 'weekend'
else 'workday'
end
as day_type
FROM rental
END;

#9.How many rentals were in the last month of activity?
SELECT max(rental_date)
FROM rental;
SELECT COUNT(*)
FROM rental
WHERE rental_date regexp '2006-02';

