SELECT COUNT(*) AS sayi FROM film
WHERE length > ALL
(
	SELECT ROUND(AVG(length)) FROM film
);

SELECT COUNT(*) AS maxrental FROM film
WHERE rental_rate = ANY
(
	SELECT MAX(rental_rate) FROM film
);

SELECT * FROM film
WHERE rental_rate = ANY
(
	SELECT MIN(rental_rate) FROM film
) AND
replacement_cost = ANY
(
	SELECT MIN(replacement_cost) FROM film
);

SELECT * FROM customer
INNER JOIN payment ON customer.customer_id = payment.customer_id
WHERE amount = ANY (
	SELECT MAX(amount) FROM payment
) ;
