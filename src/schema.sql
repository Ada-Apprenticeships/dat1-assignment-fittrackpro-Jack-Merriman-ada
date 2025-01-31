-- FitTrack Pro Database Schema

-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS locations;


-- Create your tables here
-- Example:
-- CREATE TABLE table_name (
--     column1 datatype,
--     column2 datatype,
--     ...
-- );

CREATE TABLE locations (
    location_id INTEGER PRIMARY KEY, -- Do not need to specify auto increment in sqlite, as i would in other SQL
    name VARCHAR CHECK(LENGTH(name) BETWEEN 1 and 20), -- Changed to check constraint instead of specifying no. chars, as this is not supported in sqlite
    address VARCHAR,
    phone_number VARCHAR CHECK(LENGTH(phone_number) BETWEEN 10 and 20), 
    email VARCHAR(50) CHECK(email LIKE '%@%\.%' ESCAPE '\'),
    opening_hours VARCHAR CHECK(LENGTH(opening_hours) BETWEEN 11 and 13) -- 'x:xx-x:xx' up to 'xx:xx-xx:xx'
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