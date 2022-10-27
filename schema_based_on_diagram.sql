/* CREATE TABLES FOR DIAGRAM */

-- Table for patients
CREATE TABLE patients (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250) NOT NULL,
    date_of_birth DATE NOT NULL,
    PRIMARY KEY(id) 
);

-- Table for medical histories
CREATE TABLE medical_histories (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP NOT NULL,
    patient_id INT NOT NULL,
    status VARCHAR(250) NOT NULL, 
    PRIMARY KEY(id),
    FOREIGN KEY(patient_id)
    REFERENCES patients (id)
    ON DELETE CASCADE
);
