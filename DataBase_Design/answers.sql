-- CREATE DATABASE Telemedicine;
-- USE Telemedicine;
-- CREATE DATABASE hospital_db;
-- USE hospital_db;
--  CREATE TABLE patients(
--     patient_id INT PRIMARY KEY AUTO_INCREMENT,
--     first_name VARCHAR(50) NOT NULL,
--     last_name VARCHAR(50) NOT NULL,
--     date_of_birth DATE NOT NULL,
--     gender VARCHAR(10),
--     language VARCHAR(20) NOT NULL
-- );-- 

-- CREATE TABLE providers(
--     provider_id INT PRIMARY KEY AUTO_INCREMENT,
--     first_name VARCHAR(50) NOT NULL,
--     last_name VARCHAR(50) NOT NULL,
--     provider_speciality VARCHAR(100),
--     email_address VARCHAR(100),
--     phone_number VARCHAR(30),
--     date_joined DATE 
-- );

-- CREATE TABLE visits(
--     visit_id INT PRIMARY KEY AUTO_INCREMENT,
--     patient_id INT NOT NULL,
--     provider_id INT NOT NULL,
--     date_of_visit DATE NOT NULL,
--     date_scheduled DATE NOT NULL,
--     visit_department_id INT NOT NULL,
--     visit_type VARCHAR(50) NOT NULL,
--     blood_pressure_systollic INT,
--     blood_pressure_diastollic DECIMAL,
--     pulse DECIMAL,
--     visit_status VARCHAR(50) NOT NULL
-- );

-- CREATE TABLE ed_visits(
--     ed_visit_id INT PRIMARY KEY AUTO_INCREMENT,
--     visit_id INT NOT NULL,
--     patient_id INT NOT NULL,
--     acuity INT NOT NULL,
--     reason_for_visit VARCHAR(255) NOT NULL,
--     disposition VARCHAR(50) NOT NULL
-- );

-- CREATE TABLE admissions(
--     admission_id INT PRIMARY KEY AUTO_INCREMENT,
--     patient_id INT NOT NULL,
--     admission_date DATE NOT NULL,
--     discharge_date DATE NOT NULL,
--     discharge_disposition VARCHAR(255) NOT NULL,
--     service VARCHAR(255) NOT NULL,
--     primary_diagnosis VARCHAR(255) NOT NULL
-- );

-- CREATE TABLE discharges(
--     discharge_id INT PRIMARY KEY AUTO_INCREMENT,
--     admission_id INT NOT NULL,
--     patient_id INT NOT NULL,
--     discharge_date DATE NOT NULL,
--     discharge_disposition VARCHAR(255) NOT NULL
-- );



-- Week-2 Assignment on Database Design

-- Part-1: Basic Data Retrieval
                    -- (1.1)
-- Query to retrieve fname,lname, and DOB from patients table 
-- SELECT first_name, last_name, date_of_birth
-- FROM patients;

                    -- (1.2)
-- -- Query to retrieve provider_id,fname, and provider_specialty from providers table 
-- SELECT provider_id, first_name, provider_specialty
-- FROM providers;

-- Part-2: Pattern-Based Filtering
                    -- (2.1)
-- -- Query to retrieve all patients whose fname starts with "Ab". 
-- SELECT *
-- FROM patients
-- WHERE first_name LIKE 'Ab%';    

                    -- (2.2)
-- Query to retrieve all providers whose specialty end with the letter"y". 
SELECT *
FROM providers
WHERE provider_specialty LIKE '%y'  


-- Part-3: Comparison Operators
                  -- (3.1)

-- Query to find all patients born after 1st January 1980.
 SELECT *
 FROM patients
 WHERE date_of_birth > '1980-01-01';

                    -- (3.2)

 -- Query to retrieve visits where the acuity level is 2 or higher.
 SELECT *
 FROM ed_visits
 WHERE acuity >= 2;

-- Part-4: WHERE Clause with Logical Operators
              -- (4.1)
  -- Query to find patients who speak Spanish-- 
 SELECT *
 FROM patients
 WHERE language = Spanish;

              -- (4.2)

  -- Query to retrieve visits where the reason is "Migraine" and the disposition is "Admitted"
 SELECT *
 FROM ed_visits
 WHERE reason_for_visit = 'Migraine' AND ed_disposition = 'Admitted';

                    -- (4.3)
Query to find patients born between 1975 and 1980.                 
SELECT *
FROM patients
WHERE date_of_birth BETWEEN '1975-01-01' AND '1980-12-31';

-- Part-5: Sorting Data

                  -- (5.1)
-- Query to retrieve patient names and sort them in alphabetical order by last name
SELECT first_name, last_name
FROM patients
ORDER BY last_name ASC;


                  -- (5.2)
-- Query to list all visits sorted by the date of the visit, starting from the most recent
SELECT *
FROM visits
ORDER BY date_of_visit DESC;


-- Part 6: Advanced Filtering
                    -- (6.1)

 -- Query to retrieve all admissions where the primary diagnosis is "Stroke" and the discharge disposition is "Home"
SELECT a.*
FROM admissions a
LEFT JOIN discharges d
ON a.admission_id = d.admission_id
WHERE a.primary_diagnosis = 'Stroke'
AND d.discharge_disposition = 'Home';

                -- (6.2)
-- Query to find providers who joined after 1995 and specialize in either Pediatrics or Cardiology
SELECT *
FROM providers
WHERE date_joined > '1995-12-31' AND (provider_specialty = 'Pediatrics' OR 'Cardiology');

-- Bonus Challenge

SELECT*
FROM discharges
WHERE discharge_disposition ='Home' AND discharge_date >= '2018-03-01' AND discharge_date <= '2018-03-08';

               