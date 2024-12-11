-- Active: 1733820829230@@127.0.0.1@3306
CREATE DATABASE 
    DEFAULT CHARACTER SET = 'utf8mb4';

SHOW TABLES

SELECT * from memebers

SELECT * from membership

SELECT * from rooms

SELECT * from departments

SELECT * from trainers

SELECT * from appointments

SELECT * from workout_plans



SELECT * from memebers ORDER BY date_of_birth ASC


SELECT DISTINCT gender FROM memebers;

SELECT * from trainers LIMIT 3;

SELECT * from memebers where date_of_birth > "2000-1-1"


SELECT trainers.trainer_id, trainers.first_name, trainers.last_name, departments.department_name
FROM trainers
JOIN departments ON trainers.department_id = departments.department_id
WHERE departments.department_name IN ('Musculation', 'Cardio');


SELECT membership_id, member_id, room_id, start_date
FROM membership
WHERE start_date BETWEEN '2024-12-01' AND '2024-12-07';




SELECT 
    member_id,
    first_name,
    last_name,
    date_of_birth,
    phone_number,
    email,
    CASE
        WHEN date_of_birth > "2001-01-01" THEN "junior"
        WHEN date_of_birth BETWEEN "1995-01-01" AND  "1999-01-01" THEN "adult"
        when date_of_birth < "1995-01-01" THEN "senior"
    END AS age_category
FROM memebers;

SELECT COUNT(*) AS total_appointments
FROM appointments;


SELECT d.department_name, COUNT(t.trainer_id) AS trainer_count
FROM trainers t
JOIN departments d ON t.department_id = d.department_id
GROUP BY d.department_name;

SELECT AVG(TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE())) AS average_age
FROM memebers;

SELECT * from memebers

SELECT max(appointment_time) as latest_time , MAX(appointment_date) as latest_date
FROM appointments


SELECT r.room_number, COUNT(m.membership_id) AS total_memberships
FROM rooms r
JOIN membership m ON r.room_id = m.room_id
GROUP BY r.room_number;

SELECT * from memebers where email IS NULL

SELECT a.appointment_id, 
       a.appointment_date, 
       a.appointment_time, 
       t.first_name AS trainer_first_name, 
       t.last_name AS trainer_last_name, 
       m.first_name AS member_first_name, 
       m.last_name AS member_last_name
FROM appointments a
JOIN trainers t ON a.trainer_id = t.trainer_id
JOIN memebers m ON a.member_id = m.member_id;


DELETE FROM appointments
WHERE appointment_date < '2024-01-01';

INSERT INTO appointments(appointment_date, appointment_time , trainer_id , member_id)
VALUES ("2001-01-02", "10:00:00", 5 , 3 )

SELECT * from appointments

UPDATE departments
SET department_name = 'Force et Conditionnement'
WHERE department_name = 'Musculation';

SELECT * FROM departments

UPDATE departments
SET department_name = 'Musculation'
WHERE department_name = 'Force et Conditionnement';


SELECT gender, COUNT(*) AS member_count
FROM memebers
GROUP BY gender
HAVING COUNT(*) >= 2;

CREATE VIEW active_subscriptions AS
SELECT membership_id, member_id, room_id, start_date
FROM membership
WHERE start_date <= CURDATE();

SELECT * from active_subscriptions

