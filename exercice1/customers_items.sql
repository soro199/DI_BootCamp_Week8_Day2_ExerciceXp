
CREATE DATABASE public;

/* 2. Create a table called items with the following columns:
    - idItems (int, primary key, not null, auto increment)
    - item_name (varchar, not null)
    - price (int, not null) */
USE public;

CREATE TABLE items (
    idItems SERIAL PRIMARY KEY,
    item_name VARCHAR(255) NOT NULL,
    price INT NOT NULL
);

/* 3. Create a table called customers with the following columns:
    - idCustomers (int, primary key, not null, auto increment)
    - first_name (varchar, not null)
    - last_name (varchar, not null) */
CREATE TABLE customers (
    idCustomers SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);

/* 4. Insert the following data into the items table:
    - Petit bureau, 100
    - Grand bureau, 300
    - Ventilateur, 80 */
INSERT INTO items (item_name, price)
VALUES ('Petit bureau', 100), ('Grand bureau', 300), ('Ventilateur', 80);

/* 5. Insert the following data into the customers table:
    - Greg, Jones
    - Sandra, Jones
    - Scott, Scott
    - Trevor, Vert
    - Melanie, Johnson */
INSERT INTO customers (first_name, last_name)
VALUES ('Greg', 'Jones'), ('Sandra', 'Jones'), ('Scott', 'Scott'), ('Trevor', 'Vert'), ('Melanie', 'Johnson');

/*Tous les articles, classés par prix (du plus bas au plus élevé).*/

SELECT * FROM items ORDER BY price ASC;


/*Articles dont le prix est supérieur à 80 (80 inclus), classés par prix (du plus élevé au plus bas).*/

SELECT * FROM items WHERE price >= 80 ORDER BY price DESC;


/*Les 3 premiers clients par ordre alphabétique du prénom (AZ) – exclure la colonne clé primaire des résultats.*/

SELECT last_name, first_name FROM customers ORDER BY first_name ASC LIMIT 3;



/*Tous les noms de famille (pas d'autres colonnes !), dans l'ordre alphabétique inverse (ZA)*/

SELECT last_name FROM customers ORDER BY last_name DESC;




