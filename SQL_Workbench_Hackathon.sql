use sakila;

/* TASK 1 */
select concat(first_name,' ',last_name) as 'Actor Name',last_update from actor;

/* TASK 2 */
/* Task 2.1 */
select a.first_name,a.last_name,a.actor_id from actor a inner join actor ac
where a.first_name=ac.first_name and a.last_name=ac.last_name and a.actor_id<>ac.actor_id;

/*Task 2.2 */
select a.first_name,a.last_name,a.actor_id from actor a inner join actor ac
where a.first_name=ac.first_name and a.last_name=ac.last_name and a.actor_id<>ac.actor_id;

/*Task 2.3*/
select count(distinct concat(first_name,' ',last_name)) as 'names' from actor;

/* TASK 3*/
-- whose names are repeated
select a.first_name,a.last_name,a.actor_id from actor a inner join actor ac
where a.first_name=ac.first_name and a.last_name=ac.last_name and a.actor_id<>ac.actor_id;
-- whose names are not repeated
select distinct concat(first_name,' ',last_name) as 'names' from actor;

/* TASK 4*/
select count(fa.film_id) as 'actor',name from Category c join film_category f
on c.category_id=f.category_id join film fa on f.film_id=fa.film_id 
join film_actor g on fa.film_id=g.film_id
join actor a on a.actor_id=g.actor_id
where name in('Action','Romance','Horror','Mystery') group by name;


/*TASK 5*/
select count(fa.film_id)  as 'count of film',name from category c join film_category f on c.category_id=f.category_id
join film fa on fa.film_id=f.film_id group by name;
select title,name,rating from film f  join film_category fa on f.film_id=fa.film_id
join category c on fa.category_id=c.category_id where rating in('G','PG','R') ;


/*Task 6.1*/
select title,round(replacement_cost,2) as 'Replacement_cost'  from film where replacement_cost<=9.00;


/*Task 6.2*/
select title,replacement_cost from film where replacement_cost between 15 and 20 order by replacement_cost ;

/*Task 6.3*/
select title,replacement_cost,rental_rate from film
where(replacement_cost,rental_rate)in (select max(replacement_cost),min(rental_rate) from film);

/*Task 7*/
select count(a.actor_id) as 'Count of actor',title from film f join film_actor c
on f.film_id=c.film_id join actor a on a.actor_id=c.actor_id group by title order by count(a.actor_id) desc;

/*Task 8*/
select title from film 
where title like'K%' or title like'Q%' group by title;

/*Task 9*/
select first_name, last_name from actor where actor_id in(select actor_id from film_actor  where film_id
in (select film_id from film where title='AGENT TRUMAN'));

/*Task 10*/
select title from film where film_id in(select film_id from film_category  where category_id
in (select category_id from category where name='Family'));

/*Task 11*/
select title,count(rental_rate) as 'Rent' from film f join film_category fc
on f.film_id=fc.film_id join category c on fc.category_id=c.category_id
join inventory i on i.film_id=f.film_id join rental r on r.inventory_id=i.inventory_id group by title order by rent desc;

/*Task 12*/
select (avg(replacement_cost)-avg(rental_rate)) as 'Difference',title from film 
group by title having (avg(replacement_cost)-avg(rental_rate))>15;

/*Task 13*/
select count(film_id),name as 'Genre' from Category c join film_category f
on c.category_id=f.category_id group by name having count(film_id) between 60 and 70;
