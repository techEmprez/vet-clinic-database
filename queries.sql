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


-- QUERY MULTIPLE TABLES

-- create a new table for owners
CREATE TABLE owners(
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(250) NOT NULL,
  age INT NOT NULL,
  PRIMARY KEY(id)
);

-- create a new table for species
CREATE TABLE species (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250) NOT NULL,
  PRIMARY KEY(id)
);


-- modify animals table 

-- remove the species column
ALTER TABLE animals DROP COLUMN species;

-- add a new column species_id to the animal table
ALTER TABLE animals ADD COLUMN species_id INT;

ALTER TABLE animals ADD CONSTRAINT fk_animals_species FOREIGN KEY (species_id) REFERENCES species(id);

-- add a new column owner_id to the animal table
ALTER TABLE animals ADD COLUMN owner_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_animals_owners FOREIGN KEY (owner_id) REFERENCES owners(id);
