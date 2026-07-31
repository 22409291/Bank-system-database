-- 1. Display all customers
SELECT *
FROM customers;


-- 2. Display active accounts
SELECT account_id,
       customer_id,
       balance,
       account_type,
       currency
FROM accounts
WHERE account_status = 'Active';


-- 3. Display accounts with a balance greater than 30,000
SELECT account_id,
       customer_id,
       balance,
       currency
FROM accounts
WHERE balance > 30000
ORDER BY balance DESC;


-- 4. Display customers and their accounts
SELECT c.customer_id,
       c.first_name,
       c.last_name,
       a.account_id,
       a.account_type,
       a.balance,
       a.currency
FROM customers AS c
JOIN accounts AS a
ON c.customer_id = a.customer_id;


-- 5. Display employees and their branches
SELECT e.employee_id,
       e.first_name,
       e.last_name,
       e.role,
       b.branch_name,
       b.branch_location
FROM employees AS e
JOIN branches AS b
ON e.branch_id = b.branch_id;


-- 6. Display customers who have loans
SELECT c.customer_id,
       c.first_name,
       c.last_name,
       l.loan_id,
       l.loan_amount,
       l.date_issued
FROM customers AS c
JOIN loans AS l
ON c.customer_id = l.customer_id;


-- 7. Display loans with branch information
SELECT l.loan_id,
       l.loan_amount,
       l.date_issued,
       b.branch_name,
       b.branch_location
FROM loans AS l
JOIN branches AS b
ON l.branch_id = b.branch_id;


-- 8. Display transaction details with sender and receiver information
SELECT t.transaction_id,
       t.transaction_type,
       sender.first_name AS sender_first_name,
       sender.last_name AS sender_last_name,
       receiver.first_name AS receiver_first_name,
       receiver.last_name AS receiver_last_name,
       t.amount,
       t.transaction_medium,
       t.date_issued
FROM transactions AS t
JOIN accounts AS sender_account
ON t.from_account_id = sender_account.account_id
JOIN customers AS sender
ON sender_account.customer_id = sender.customer_id
JOIN accounts AS receiver_account
ON t.to_account_id = receiver_account.account_id
JOIN customers AS receiver
ON receiver_account.customer_id = receiver.customer_id;


-- 9. Display transactions processed by employees
SELECT t.transaction_id,
       t.transaction_type,
       t.amount,
       e.first_name,
       e.last_name,
       e.role
FROM transactions AS t
JOIN employees AS e
ON t.processed_by = e.employee_id;


-- 10. Calculate the total balance of all accounts
SELECT SUM(balance) AS total_account_balance
FROM accounts;


-- 11. Calculate the average account balance
SELECT AVG(balance) AS average_account_balance
FROM accounts;


-- 12. Count the number of customers in each city
SELECT city,
       COUNT(*) AS total_customers
FROM customers
GROUP BY city
ORDER BY total_customers DESC;


-- 13. Count the number of employees in each branch
SELECT b.branch_name,
       COUNT(e.employee_id) AS total_employees
FROM branches AS b
LEFT JOIN employees AS e
ON b.branch_id = e.branch_id
GROUP BY b.branch_id,
         b.branch_name;


-- 14. Calculate the total loan amount for each branch
SELECT b.branch_name,
       SUM(l.loan_amount) AS total_loan_amount
FROM branches AS b
JOIN loans AS l
ON b.branch_id = l.branch_id
WHERE l.deleted_at IS NULL
GROUP BY b.branch_id,
         b.branch_name
ORDER BY total_loan_amount DESC;


-- 15. Display customers whose account balance is above the average
SELECT c.customer_id,
       c.first_name,
       c.last_name,
       a.account_id,
       a.balance
FROM customers AS c
JOIN accounts AS a
ON c.customer_id = a.customer_id
WHERE a.balance >
(
    SELECT AVG(balance)
    FROM accounts
);


-- 16. Display the customer with the highest account balance
SELECT c.first_name,
       c.last_name,
       a.account_id,
       a.balance
FROM customers AS c
JOIN accounts AS a
ON c.customer_id = a.customer_id
WHERE a.balance =
(
    SELECT MAX(balance)
    FROM accounts
);


-- 17. Display customers who do not have a loan
SELECT c.customer_id,
       c.first_name,
       c.last_name
FROM customers AS c
LEFT JOIN loans AS l
ON c.customer_id = l.customer_id
WHERE l.loan_id IS NULL;


-- 18. Display non-deleted loans
SELECT loan_id,
       customer_id,
       branch_id,
       loan_amount,
       date_issued
FROM loans
WHERE deleted_at IS NULL;


-- 19. Display total transaction amount by transaction medium
SELECT transaction_medium,
       COUNT(*) AS transaction_count,
       SUM(amount) AS total_amount
FROM transactions
WHERE deleted_at IS NULL
GROUP BY transaction_medium;


-- 20. Display complete loan information
SELECT l.loan_id,
       c.first_name,
       c.last_name,
       b.branch_name,
       l.loan_amount,
       l.date_issued
FROM loans AS l
JOIN customers AS c
ON l.customer_id = c.customer_id
JOIN branches AS b
ON l.branch_id = b.branch_id
WHERE l.deleted_at IS NULL
ORDER BY l.loan_amount DESC;