/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


-- UPDATE QUERIES

SELECT COUNT(id) FROM animals;
SELECT COUNT (*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;


/* QUERIES FOR JOIN MULTIPLE TABLES */

-- SELECT table1.column1, table2.column2...
-- FROM table1
-- INNER JOIN table2
-- ON table1.common_field = table2.common_field
-- WHERE table.column = 'value'
-- GROUP BY table.column
-- ORDER BY table1.column1, table2.column2;

-- 1. What animals belong to Melody Pond?
SELECT animals.name FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';

-- 2. List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

-- 3. List all owners and their animals
SELECT owners.full_name,animals.name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;

-- 4. How many animals are there per species?
SELECT species.name, COUNT(animals.name) FROM animals INNER JOIN species ON animals.species_id = species.id GROUP BY species.name;

-- 5. List all Digimon owned by Jennifer Orwell
SELECT animals.name FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Jennifer Orwell';

-- 6. List all animals owned by Dean Winchester that haven't tried to escape
SELECT animals.name FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

-- 7. Who owns the most animals?
SELECT owners.full_name, COUNT(animals.name) FROM owners LEFT JOIN animals ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY COUNT(animals.name) DESC;



/* PROJECT DAY 4 - QUERIES FOR JOIN MULTIPLE TABLES WITH CONDITIONS */

-- Join Tables queries
-- Last animal seen by William Tatcher
SELECT vets.name AS vet_name, animals.name AS animal_name, visits.date_of_visit AS last_visit FROM animals INNER JOIN visits ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vet_id where vets.name='William Tatcher' ORDER BY  date_of_visit DESC LIMIT 1 ; 

-- Different animals seen by Stephanie Mendez
SELECT vets.name AS vet_name , COUNT(visits.date_of_visit) AS number_of_visits FROM visits INNER JOIN vets ON vets.id = visits.vet_id WHERE vets.name='Stephanie Mendez' GROUP BY vets.name;

-- All Vets and specialities including doctors with no specialities
SELECT specializations.species_id, specializations.vet_id, vets.name AS vet_name, species.name AS species_name FROM specializations FULL OUTER JOIN species ON species.id = specializations.species_id FULL OUTER JOIN vets ON vets.id = specializations.vet_id;

-- Animals visited Stephanie Mendez between april 1stand August 30th 2020
SELECT vets.name AS vet_name, animals.name AS animal_name, visits.date_of_visit as visit_date FROM animals INNER JOIN visits ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vet_id WHERE vets.name='Stephanie Mendez' AND  date_of_visit BETWEEN '2020-04-01' And '2020-08-30'; 

-- Animal with the most visit to the vet
SELECT animals.name AS animal_name, COUNT(visits.date_of_visit) AS number_of_visits from visits INNER JOIN animals ON animals.id = visits.animal_id GROUP BY animals.name ORDER BY COUNT(visits.date_of_visit) DESC LIMIT 1 ;

-- Maisy SmithFirst visit
SELECT vets.name AS vet_name, animals.name as animal_name, visits.date_of_visit AS first_visit FROM animals INNER JOIN visits ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vet_id WHERE vets.name='Maisy Smith' ORDER BY  date_of_visit ASC limit 1;   

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.id AS animal_id, animals.name AS animal_name, animals.date_of_birth, vets.id AS vet_id,  vets.name AS vet_name, vets.age AS vet_age, date_of_visit FROM visits INNER JOIN animals ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vet_id;

-- Visits with a vet and did not specialize in animal species
SELECT vets.name AS vet_name, COUNT(*) FROM visits INNER JOIN vets ON vets.id = visits.vet_id INNER JOIN specializations ON specializations.vet_id = visits.vet_id WHERE specializations.species_id IS NULL GROUP BY vets.name;

-- speciality maisy smith consider getting
SELECT vets.name AS vet_name, species.name AS species_name, COUNT(species.name) FROM visits LEFT JOIN animals ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vet_id INNER JOIN species ON species.id = animals.species_id WHERE vets.name = 'Maisy Smith' GROUP BY vets.name, species.name ORDER BY COUNT DESC LIMIT 1;
Footer

/* PROJECT DAY 1 WEEK 1 - database performance audit */
-- Original query
SELECT COUNT(*) FROM visits where animal_id = 4;
-- Modified query
CREATE INDEX animals_visit_index ON visits(animal_id);
SELECT COUNT(*) FROM visits where animal_id = 4;

-- Original query
SELECT * FROM visits where vet_id = 2;
-- Modified query
CREATE INDEX animal_visits ON visits(vet_id);
SELECT animal_id FROM visits where vet_id = 2;


-- Original query
SELECT * FROM owners where email = 'owner_18327@mail.com';
-- Modified query
CREATE INDEX animal_owner_emails ON owner(email);
SELECT * FROM owners where id = 18335;
