/*1. recuperation de tous les clients*/

SELECT * FROM customer;


/*Écrivez une requête pour afficher les noms ( first_name , last_name ) en utilisant un alias nommé « full_name ».*/


SELECT first_name || ' ' || last_name AS full_name
FROM customer;


/*Permet d'obtenir toutes les dates auxquelles les comptes ont été créés. Écrivez une requête pour sélectionner tous les create_date de la table « client » (il ne doit pas y avoir de doublons).*/

SELECT DISTINCT create_date
FROM customer;


/*Écrivez une requête pour obtenir tous les détails du client à partir de la table des clients, elle doit être affichée dans l'ordre décroissant de leur prénom.*/


SELECT * FROM customer ORDER BY first_name DESC;



/*Rédigez une requête pour obtenir l'ID du film, le titre, la description, l'année de sortie et le tarif de location par ordre croissant en fonction de leur tarif de location.*/

SELECT film_id, title, description, release_year, rental_rate
FROM film
ORDER BY rental_rate ASC;


/*Écrivez une requête pour obtenir l'adresse et le numéro de téléphone de tous les clients vivant dans le district du Texas, ces détails peuvent être trouvés dans le tableau "adresse".
*/

SELECT address, phone,district
FROM address
WHERE district = 'Texas'
  AND address_id IN (
    SELECT address_id
    FROM customer
  );


/*Écrivez une requête pour récupérer tous les détails du film où l'identifiant du film est 15 ou 150.
*/


SELECT *
FROM film
WHERE film_id IN (15, 150);


/*Écrivez une requête qui devrait vérifier si votre film préféré existe dans la base de données. Demandez à votre requête d'obtenir l'ID du film, le titre, la description, la durée et le tarif de location, ces détails peuvent être trouvés dans le tableau "film".
*/


SELECT film_id, title, description, length, rental_rate
FROM film
WHERE LOWER(title) = LOWER('Airport Pollock');


/*Pas de chance de trouver votre film ? Peut-être avez-vous fait une erreur dans l'orthographe du nom. Écrivez une requête pour obtenir l'ID du film, le titre, la description, la durée et le tarif de location de tous les films commençant par les deux premières lettres de votre film préféré.
*/


SELECT film_id, title, description, length, rental_rate
FROM film
WHERE LOWER(title) LIKE LOWER('Air%');



/*Écrivez une requête qui trouvera les 10 films les moins chers.
*/


SELECT film_id, title, rental_rate
FROM film
ORDER BY rental_rate ASC
LIMIT 10;


/*Pas satisfait des résultats. Écrivez une requête qui trouvera les 10 prochains films les moins chers.
Bonus : Essayez de ne pas utiliser LIMIT.
*/

SELECT film_id, title, rental_rate
FROM film
WHERE rental_rate IN (SELECT DISTINCT rental_rate FROM film ORDER BY rental_rate ASC LIMIT 11)
ORDER BY rental_rate ASC;


/*Écrivez une requête qui joindra les données de la table des clients et de la table des paiements. Vous souhaitez obtenir le prénom et le nom de la table client, ainsi que le montant et la date de chaque paiement effectué par un client, classé par son identifiant (de 1 à…).
*/


SELECT c.first_name, c.last_name, p.amount, p.payment_date
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
ORDER BY c.customer_id;


/*Vous devez vérifier votre inventaire. Écrivez une requête pour obtenir tous les films qui ne sont pas dans l'inventaire.
*/

SELECT f.title
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
WHERE i.film_id IS NULL;


/*Rédigez une requête pour trouver quelle ville se trouve dans quel pays.
*/

SELECT city.city AS CityName, Country.country AS CountryName
FROM City
JOIN Country ON City.Country_id = Country.Country_id;


/*Bonus Vous voulez être en mesure de voir comment vos vendeurs s'en sortent ? Écrivez une requête pour obtenir l'identifiant du client, ses noms (prénom et nom), le montant et la date de paiement commandé par l'identifiant du membre du personnel qui lui a vendu le dvd.
*/

SELECT Customer.Customer_ID, Customer.First_Name, Customer.Last_Name, Payment.Amount, Payment.Payment_Date, Staff.Staff_ID
FROM Customer
JOIN Payment ON Customer.Customer_ID = Payment.Customer_ID
JOIN Rental ON Payment.Rental_ID = Rental.Rental_ID
JOIN Staff ON Rental.Staff_ID = Staff.Staff_ID;

