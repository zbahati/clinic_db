
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

-- FOREIGN KEY FOR medical Histories
ALTER TABLE invoices ADD CONSTRAINT medical_histories_fk FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id);

-- FOREIGN INDEX FOR MEDICAL_HISTORIES
CREATE INDEX medical_histories_asc ON invoices(medical_history_id ASC);

-- CREATE TABLE invoice_items
CREATE TABLE invoice_items(
 id INT NOT NULL PRIMARY KEY,
 unit_price DECIMAL(8,2),
 quantity INT,
 total_price DECIMAL(8,2),
 invoices_id INT,
 treatment_id INT
 );
-- CREATE TABLE treatments
CREATE TABLE treatments(
 id INT NOT NULL PRIMARY KEY,
 type VARCHAR(50),
 name VARCHAR(100)
 );

 -- FOREIGN KEY FOR invoices
ALTER TABLE invoice_items ADD CONSTRAINT invoice_fk FOREIGN KEY(invoices_id) REFERENCES invoices(id);

 -- FOREIGN KEY FOR treatments
ALTER TABLE invoice_items ADD CONSTRAINT treatment_fk FOREIGN KEY(treatment_id) REFERENCES treatments(id);

-- FOREIGN KEY INDEX
CREATE INDEX invoice_id_asc ON invoice_items (invoices_id ASC);
CREATE INDEX treatement_id_asc ON invoice_items (treatment_id ASC);

-- JOIN TABLE FOR medical histories and Treatements table
CREATE TABLE medic_treat_relation(
  treatment_id INT,
  medical_histories_id INT
);

 -- FOREIGN KEY FOR medecal_histories and treatments
ALTER TABLE medic_treat_relation ADD CONSTRAINT treatment_fk FOREIGN KEY(treatment_id) REFERENCES treatments(id);
ALTER TABLE medic_treat_relation ADD CONSTRAINT medical_histories_fk FOREIGN KEY(medical_histories_id) REFERENCES medical_histories(id);

-- FOREIGN KEY INDEX FOR medecal_histories and treatments
CREATE INDEX treatment_id_asc ON  medic_treat_relation(treatment_id ASC);
CREATE INDEX medical_histories_id_asc ON medic_treat_relation (medical_histories_id ASC);