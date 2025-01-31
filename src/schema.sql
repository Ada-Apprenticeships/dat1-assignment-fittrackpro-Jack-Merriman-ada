-- FitTrack Pro Database Schema

-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- DROP TABLE IF EXISTS locations;
-- DROP TABLE IF EXISTS members;
-- DROP TABLE IF EXISTS staff;
-- DROP TABLE IF EXISTS equipment;
DROP TABLE IF EXISTS classes;


-- Create your tables here
-- Example:
-- CREATE TABLE table_name (
--     column1 datatype,
--     column2 datatype,
--     ...
-- );

-- CREATE TABLE locations (
--     location_id INTEGER PRIMARY KEY, -- Do not need to specify auto increment in sqlite, as i would in other SQL
--     name VARCHAR CHECK(LENGTH(name) BETWEEN 1 and 20), -- Changed to check constraint instead of specifying no. chars, as this is not supported in sqlite
--     address VARCHAR,
--     phone_number VARCHAR CHECK(LENGTH(phone_number) BETWEEN 10 and 20), 
--     email VARCHAR(50) CHECK(email LIKE '%@%\.%' ESCAPE '\'),
--     opening_hours VARCHAR CHECK(LENGTH(opening_hours) BETWEEN 9 and 11) -- 'x:xx-x:xx' up to 'xx:xx-xx:xx'
-- );

-- CREATE TABLE members (
--     member_id INTEGER PRIMARY KEY,
--     first_name VARCHAR CHECK(LENGTH(first_name) BETWEEN 1 and 20),
--     last_name VARCHAR CHECK(LENGTH(last_name) BETWEEN 1 and 20),
--     email VARCHAR(50) CHECK(email LIKE '%@%\.%' ESCAPE '\'),
--     phone_number VARCHAR CHECK(LENGTH(phone_number) BETWEEN 10 and 20),
--     date_of_birth DATE, -- NEEDS CHECK CONSTRAINT
--     join_date DATE, -- NEEDS CHECK CONSTRAINT
--     emergency_contact_name VARCHAR CHECK(LENGTH(emergency_contact_name) BETWEEN 2 and 40),
--     emergency_contact_phone VARCHAR CHECK(LENGTH(emergency_contact_phone) BETWEEN 10 and 20)
-- );

-- CREATE TABLE staff (
--     staff_id INTEGER PRIMARY KEY,
--     first_name VARCHAR CHECK(LENGTH(first_name) BETWEEN 1 and 20),
--     last_name VARCHAR CHECK(LENGTH(last_name) BETWEEN 1 and 20),
--     email VARCHAR(50) CHECK(email LIKE '%@%\.%' ESCAPE '\'),
--     phone_number VARCHAR CHECK(LENGTH(phone_number) BETWEEN 10 and 20),
--     position VARCHAR CHECK(position IN ('Trainer', 'Manager', 'Receptionist')),
--     hire_date DATE, --NEEDS CHECK CONSTRAINT
--     location_id INTEGER,
--     FOREIGN KEY (location_id) REFERENCES locations(location_id)
--         ON UPDATE CASCADE
--         ON DELETE SET NULL
-- );

-- CREATE TABLE equipment (
--     equipment_id INTEGER PRIMARY KEY,
--     name VARCHAR CHECK(LENGTH(name) BETWEEN 1 and 30),
--     type VARCHAR CHECK(type IN ('Cardio','Strength')),
--     purchase_date DATE CHECK(purchase_date < last_maintenance_date),
--     last_maintenance_date DATE CHECK(last_maintenance_date BETWEEN purchase_date and next_maintenance_date),
--     next_maintenance_date DATE CHECK(next_maintenance_date > last_maintenance_date),
--     location_id INTEGER,
--     FOREIGN KEY (location_id) REFERENCES locations(location_id)
--         ON UPDATE CASCADE
--         ON DELETE SET NULL
-- );

 CREATE TABLE classes (
    class_id INTEGER PRIMARY KEY,
    name VARCHAR CHECK(LENGTH(name) BETWEEN 1 and 30),
    description TEXT,
    purchase_date DATE,
    capacity INTEGER CHECK(capacity >= 0),
    duration INTEGER CHECK(duration > 0),
    location_id INTEGER,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);


-- TODO: Create the following tables:
-- 1. locations
-- 2. members
-- 3. staff
-- 4. equipment
-- 5. classes
-- 6. class_schedule
-- 7. memberships
-- 8. attendance
-- 9. class_attendance
-- 10. payments
-- 11. personal_training_sessions
-- 12. member_health_metrics
-- 13. equipment_maintenance_log

-- After creating the tables, you can import the sample data using:
-- `.read data/sample_data.sql` in a sql file or `npm run import` in the terminal