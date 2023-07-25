
-- 1. CREATE DATABASE name
CREATE DATABASE clinic;

-- CREATE TABLE patients
CREATE TABLE patients(
 id INT NOT NULL PRIMARY KEY,
 name VARCHAR(100),
 date_of_birth DATE
 );

--  CREATE TABLE medical_histories
 CREATE TABLE medical_histories(
 id INT NOT NULL PRIMARY KEY,
 admitted_at TIMESTAMP,
 patient_id INT,
 status VARCHAR(50)
 );

--  ADD CONSTRAINT TO MEDICAL HISTORIES TABLE

ALTER TABLE medical_histories ADD CONSTRAINT patient_fk FOREIGN KEY(patient_id) REFERENCES patients(id);
-- FOREIGN INDEX FOR medical_histories
CREATE INDEX patient_id_asc ON medical_histories(patient_id ASC);

-- CREATE TABLE invoices
CREATE TABLE invoices(
 id INT NOT NULL PRIMARY KEY,
 total_amount DECIMAL(8,2),
 generated_at TIMESTAMP,
 payed_at TIMESTAMP,
 medical_history_id INT
 );

