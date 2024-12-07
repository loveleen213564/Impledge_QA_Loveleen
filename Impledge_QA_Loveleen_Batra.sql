
--Include below given SELECT queries before you prepare your SELECT queries:
UPDATE Admissions
SET attending_doctor_id = 29
WHERE attending_doctor_id = 3;
UPDATE Admissions
SET patient_id = 4
WHERE patient_id = 35;
SELECT COUNT(*) FROM admissions WHERE attending_doctor_id = 3;

--Q1 SELECT the details of Doctors(s) who has got Admissions.
SELECT DISTINCT d.*
FROM doctors d
JOIN admissions a ON d.doctor_id = a.attending_doctor_id;
--Q2 SELECT the details of Doctors(s) for whom there is no Admissions.
SELECT d.*
FROM doctors d
LEFT JOIN admissions a ON d.doctor_id = a.attending_doctor_id
WHERE a.attending_doctor_id IS NULL;
--Q3 SELECT the details of Patients(s) whose Admission can’t be completed due to missing doctor details
SELECT DISTINCT p.*
FROM patients p
JOIN admissions a ON p.patient_id = a.patient_id
LEFT JOIN doctors d ON a.attending_doctor_id = d.doctor_id
WHERE a.attending_doctor_id IS NULL OR d.doctor_id IS NULL;

