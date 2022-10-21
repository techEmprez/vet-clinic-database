/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, true, 11);

/* Additional data update */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '2020-02-08', 0, false, -11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('plantmon', '2021-11-15', 2, true, -5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '1993-04-02', 3, false, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '2005-06-12', 1, true, -45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '2005-06-07', 7, true, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '1998-10-13', 3, true, 17);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', '2022-05-14', 4, true, 22);


/* INSERT INTO OWNERS TABLES DATA */
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

/* INSERT INTO SPECIES TABLES DATA */
INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');


/* UPDATE COLUMN SPECIES_ID IN ANIMALS DATA */
UPDATE animals SET species_id=2 WHERE name LIKE '%mon';
UPDATE animals SET species_id=1 WHERE species_id IS NULL;

/* UPDATE COLUMN OWNER_ID IN ANIMALS DATA */
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name='Gabumon' OR name='Pikachu';
UPDATE animals SET owner_id = 3 WHERE name='Devimon' OR name='plantmon';
UPDATE animals SET owner_id = 4 WHERE name='Charmander' OR name='Squirtle' OR name='Blossom';
UPDATE animals SET owner_id = 5 WHERE name='Angemon' OR name='Boarmon';

-- id 1 = Sam Smith owns Agumon
-- id 2 = Jennifer Orwell owns Gabumon and Pikachu.
-- id 3 = Bob owns Devimon and Plantmon.
-- id 4 = Melody Pond owns Charmander, Squirtle, and Blossom.
-- id 5 = Dean Winchester owns Angemon and Boarmon.


/* JOINING-TABLES */

/* INSERT DATA FOR VETS */
INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');


/* INSERT DATA FOR SPECIALIZATIONS */

INSERT INTO specializations(species_id, vet_id) VALUES((SELECT id FROM species WHERE name = 'Pokemon'),

-- William Tatcher is specialized in Pokemon.
INSERT INTO specializations (species_id, vets_id) VALUES (1, 1);

-- Stephanie Mendez is specialized in Digimon and Pokemon.
INSERT INTO specializations (species_id, vets_id) VALUES (1, 2);
INSERT INTO specializations (species_id, vets_id) VALUES (2, 2);

-- Jack Harkness is specialized in Digimon.
INSERT INTO specializations (species_id, vets_id) VALUES (2, 4);
INSERT INTO specializations (species_id, vets_id) VALUES (
  (SELECT id FROM species WHERE name = 'Digimon'), 
  (SELECT id FROM vets WHERE name = 'Jack Harkness')
);


/* INSERT DATA FOR VISITS */

1.
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT id from animals WHERE name = 'Agumon'),
  (SELECT id FROM vets WHERE name = 'William Tatcher'),
  '2020-05-24'
);

2. 
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT id from animals WHERE name = 'Agumon'),
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  '2020-07-22'
);

3. 
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Gabumon'),
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  '2021-02-02'
);

4. 
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Pikachu'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  '2020-01-05'
);

5.
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (
  (SELECT id FROM animals WHERE name = 'Pikachu'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  '2020-03-08'
);
