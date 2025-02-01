.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- -- Valid input  
-- INSERT INTO payments (payment_id, member_id, amount, payment_date, payment_method, payment_type) VALUES  
-- (1, 1, 49.99, '2023-10-01 09:00:00', 'Credit Card', 'Monthly membership fee'),  
-- (2, 2, 9.99, '2023-10-02 10:30:00', 'Bank Transfer', 'Day pass'),  
-- (3, 3, 49.99, '2023-10-03 11:15:00', 'PayPal', 'Monthly membership fee');  
-- -- Expected result: All rows should be inserted successfully.  
-- -- PASS  
  
-- -- Invalid input: Duplicate PRIMARY KEY  
-- INSERT INTO payments (payment_id, member_id, amount, payment_date, payment_method, payment_type) VALUES  
-- (1, 4, 29.99, '2023-10-04 12:00:00', 'Credit Card', 'Day pass'),  
-- (2, 5, 49.99, '2023-10-05 13:45:00', 'Bank Transfer', 'Monthly membership fee'),  
-- (3, 6, 9.99, '2023-10-06 14:30:00', 'PayPal', 'Day pass');  
-- -- Expected result: All rows should fail due to duplicate primary key.  
-- -- PASS  
  
-- -- Invalid input: Non-existent member_id (Foreign Key Constraint, assuming there's a members table)  
-- INSERT INTO payments (payment_id, member_id, amount, payment_date, payment_method, payment_type) VALUES  
-- (4, 999, 49.99, '2023-10-07 15:00:00', 'Credit Card', 'Monthly membership fee'),  
-- (5, 998, 9.99, '2023-10-08 16:30:00', 'Bank Transfer', 'Day pass'),  
-- (6, 997, 49.99, '2023-10-09 17:15:00', 'PayPal', 'Monthly membership fee');  
-- -- Expected result: All rows should fail due to foreign key constraint violation.  
-- -- FAIL  
        -- INPUT WAS ALLOWeD SHOULD HAVE FAILED


-- -- Invalid input: Incorrect payment_date format  
-- INSERT INTO payments (payment_id, member_id, amount, payment_date, payment_method, payment_type) VALUES  
-- (7, 7, 49.99, '2023/10/10 18:00:00', 'Credit Card', 'Monthly membership fee'),  
-- (8, 8, 9.99, '2023-10-11', 'Bank Transfer', 'Day pass'),  
-- (9, 9, 49.99, '20231012 19:00:00', 'PayPal', 'Monthly membership fee');  
-- -- Expected result: All rows should fail due to incorrect payment_date format.  
-- -- PASS  
  
-- -- Invalid input: Negative amount  
-- INSERT INTO payments (payment_id, member_id, amount, payment_date, payment_method, payment_type) VALUES  
-- (19, 19, -49.99, '2023-11-01 09:00:00', 'Credit Card', 'Monthly membership fee'),  
-- (20, 20, -9.99, '2023-11-02 10:30:00', 'Bank Transfer', 'Day pass'),  
-- (21, 21, -100.00, '2023-11-03 11:15:00', 'PayPal', 'Monthly membership fee');  
-- -- Expected result: All rows should fail due to amount constraint (assuming amount must be non-negative).  
-- -- FAIL  
        -- INPUT WAS ALLOWeD SHOULD HAVE FAILED


-- -- Invalid input: Non-numeric amount  
-- INSERT INTO payments (payment_id, member_id, amount, payment_date, payment_method, payment_type) VALUES  
-- (22, 22, 'forty-nine', '2023-11-04 12:00:00', 'Credit Card', 'Monthly membership fee'),  
-- (23, 23, 'nine', '2023-11-05 13:45:00', 'Bank Transfer', 'Day pass'),  
-- (24, 24, 'hundred', '2023-11-06 14:30:00', 'PayPal', 'Monthly membership fee');  
-- -- Expected result: All rows should fail due to amount being non-numeric.  
-- -- FAIL
        -- INPUT WAS ALLOWeD SHOULD HAVE FAILED
  
-- -- Invalid input: Excessive decimal places  
-- INSERT INTO payments (payment_id, member_id, amount, payment_date, payment_method, payment_type) VALUES  
-- (25, 25, 49.9999, '2023-11-07 15:00:00', 'Credit Card', 'Monthly membership fee'),  
-- (26, 26, 9.9999, '2023-11-08 16:30:00', 'Bank Transfer', 'Day pass'),  
-- (27, 27, 100.9999, '2023-11-09 17:15:00', 'PayPal', 'Monthly membership fee');  
-- -- Expected result: All rows should fail if the database does not support more than two decimal places.  
-- -- FAIL
        -- INPUT WAS ALLOWeD SHOULD HAVE FAILED
  
-- -- Invalid input: Amount as a string (without quotes)  
-- INSERT INTO payments (payment_id, member_id, amount, payment_date, payment_method, payment_type) VALUES  
-- (28, 28, '49.99', '2023-11-10 18:00:00', 'Credit Card', 'Monthly membership fee'),  
-- (29, 29, '9.99', '2023-11-11 19:30:00', 'Bank Transfer', 'Day pass'),  
-- (30, 30, '100.00', '2023-11-12 20:15:00', 'PayPal', 'Monthly membership fee');  
-- -- Expected result: All rows should fail if the amount is stored as a string instead of a numeric type.  
-- -- FAIL
        -- INPUT WAS ALLOWeD SHOULD HAVE FAILED

-- -- Invalid input: Incorrect payment_method value  
-- INSERT INTO payments (payment_id, member_id, amount, payment_date, payment_method, payment_type) VALUES  
-- (10, 10, 49.99, '2023-10-13 20:00:00', 'Cash', 'Monthly membership fee'),  
-- (11, 11, 9.99, '2023-10-14 21:30:00', 'Cheque', 'Day pass'),  
-- (12, 12, 49.99, '2023-10-15 22:15:00', 'Debit Card', 'Monthly membership fee');  
-- -- Expected result: All rows should fail due to payment_method check constraint.  
-- -- PASS
  
-- -- Invalid input: Incorrect payment_type value  
-- INSERT INTO payments (payment_id, member_id, amount, payment_date, payment_method, payment_type) VALUES  
-- (13, 13, 49.99, '2023-10-16 23:00:00', 'Credit Card', 'Annual membership fee'),  
-- (14, 14, 9.99, '2023-10-17 23:30:00', 'Bank Transfer', 'Weekly pass'),  
-- (15, 15, 49.99, '2023-10-18 23:45:00', 'PayPal', 'One-time fee');  
-- -- Expected result: All rows should fail due to payment_type check constraint.  
-- -- PASS  
  
-- -- Valid input to verify successful insertion after handling previous errors  
-- INSERT INTO payments (payment_id, member_id, amount, payment_date, payment_method, payment_type) VALUES  
-- (16, 16, 49.99, '2023-10-19 08:00:00', 'Credit Card', 'Monthly membership fee'),  
-- (17, 17, 9.99, '2023-10-20 09:30:00', 'Bank Transfer', 'Day pass'),  
-- (18, 18, 49.99, '2023-10-21 10:15:00', 'PayPal', 'Monthly membership fee');  
-- -- Expected result: All rows should be inserted successfully.  
-- -- PASS  