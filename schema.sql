/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250) NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts INT NOT NULL,
    neutered boolean NOT NULL,
    weight_kg decimal NOT NULL,
    PRIMARY KEY(id)
);

/* Add a new column to the table. */

ALTER TABLE animals ADD COLUMN species VARCHAR(250);


/* PROJECT MULTIPLE TABLES */

-- create a new table for owners
CREATE TABLE owners(
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(250) NOT NULL,
  age INT NOT NULL,
  PRIMARY KEY(id)
);

-- create a new table for species
CREATE TABLE species(
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


/* PROJECT - ADD "JOIN TABLE" FOR VISITS */

-- VETS TABLE
CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250) NOT NULL,
    age INT NOT NULL,
    date_of_graduation DATE NOT NULL,
    PRIMARY KEY(id)
);

-- create a many-to-many specializations Table to handle relationship
CREATE TABLE specializations (
    id INT GENERATED ALWAYS AS IDENTITY,
    species_id INT NOT NULL,
    vet_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (species_id) REFERENCES species (id),
    FOREIGN KEY (vet_id) REFERENCES vets (id)
);

-- many-to-many visits Table to handle relationship
CREATE TABLE visits (
    id INT GENERATED ALWAYS AS IDENTITY,
    animal_id INT NOT NULL,
    vet_id INT NOT NULL,
    date_of_visit DATE NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (animal_id) REFERENCES animals (id),
    FOREIGN KEY (vet_id) REFERENCES vets (id)

);

ALTER TABLE visits ADD COLUMN id SERIAL PRIMARY KEY;
ALTER TABLE visits DROP CONSTRAINT visits_pkey;


/* PROJECT PERFOMANCE AUDIT */
 -- Add email to owners table 
ALTER TABLE owners ADD COLUMN email VARCHAR(120);
