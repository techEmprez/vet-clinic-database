/* CREATE TABLES FOR DIAGRAM */

-- Table for patients
CREATE TABLE patients (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250) NOT NULL,
    date_of_birth DATE NOT NULL,
    PRIMARY KEY(id) 
);
