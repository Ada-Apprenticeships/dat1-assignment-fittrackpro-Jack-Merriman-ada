-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support

-- Class Scheduling Queries

-- 1. List all classes with their instructors
-- TODO: Write a query to list all classes with their instructors
-- SELECT cl.name AS class_name, s.first_name ||' '|| s.last_name AS instructor_name -- use ||' '|| to join names together into one attribute
-- FROM classes cl
-- JOIN class_schedule cs 
-- ON cl.class_id = cs.class_id
-- JOIN staff s 
-- ON cs.staff_id = s.staff_id

-- 2. Find available classes for a specific date
-- TODO: Write a query to find available classes for a specific date
SELECT cl.name AS class_name, cs.start_time ||' - '|| cs.end_time AS class_date_and_time
FROM classes cl
JOIN class_schedule cs 
ON cl.class_id = cs.class_id


-- 3. Register a member for a class
-- TODO: Write a query to register a member for a class


-- 4. Cancel a class registration
-- TODO: Write a query to cancel a class registration

-- 5. List top 5 most popular classes
-- TODO: Write a query to list top 5 most popular classes

-- 6. Calculate average number of classes per member
-- TODO: Write a query to calculate average number of classes per member