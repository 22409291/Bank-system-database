-- This SQL script deletes specific records from the 'customers' table based on their customer_id values
DELETE FROM customers
WHERE customer_id IN (1, 2, 3, 4, 5);

--- This SQL script deletes the whole records from the 'branches' table 
delete from branches;

-- this SQL script deletes the the "branches" table from the database if it exists
DROP TABLE IF EXISTS branches;