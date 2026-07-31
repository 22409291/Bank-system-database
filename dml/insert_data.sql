INSERT INTO customers (First_Name, Last_Name, City, Mobile_No, Pancard_No) VALUES
('John', 'Doe', 'New York', '555-0101', 'ABCDE1234F'),
('Jane', 'Smith', 'London', '555-0102', 'FGHIJ5678K'),
('Alice', 'Brown', 'Sydney', '555-0103', 'LMNOP9012Q'),
('Bob', 'Johnson', 'Toronto', '555-0104', 'RSTUV3456W'),
('Charlie', 'Davis', 'Berlin', '555-0105', 'XYZAB7890C');

INSERT INTO branches (branch_name, branch_location, created_at) VALUES
('Downtown Hub', 'New York', '2022-03-15 09:30:00'),
('Westside Branch', 'London', '2022-06-20 14:15:00'),
('East End', 'Sydney', '2023-01-10 11:45:00'),
('North Station', 'Toronto', '2023-08-05 16:20:00'),
('Central Plaza', 'Berlin', '2024-11-12 10:00:00');

INSERT INTO employees (branch_id, First_Name, Last_Name, role, hire_date, phone) VALUES
(1, 'Michael', 'Scott', 'Manager', '2023-01-15', '555-1111'),
(2, 'Dwight', 'Schrute', 'Assistant', '2023-02-01', '555-2222'),
(3, 'Jim', 'Halpert', 'Teller', '2023-03-10', '555-3333'),
(4, 'Pam', 'Beesly', 'Clerk', '2023-04-12', '555-4444'),
(5, 'Angela', 'Martin', 'Accountant', '2023-05-20', '555-5555');


INSERT INTO accounts (Customer_ID, Balance, Account_Statues, Account_Type, Currency) VALUES
(1, 15000, 'Active', 'Checking', 'USD'),
(2, 25000, 'Active', 'Savings', 'GBP'),
(3, 5000, 'Inactive', 'Checking', 'AUD'),
(4, 120000, 'Active', 'Investment', 'CAD'),
(5, 8500, 'Active', 'Savings', 'EUR');

INSERT INTO loans (Loan_ID, customer_id, Branch_ID, Loan_Amount, Date_Issued, Created_At) VALUES
(1001, 1, 1, 50000, '2025-06-01', '2025-06-01 10:15:00'),
(1002, 2, 2, 15000, '2025-07-15', '2025-07-15 14:30:00'),
(1003, 3, 3, 300000, '2025-08-20', '2025-08-20 09:00:00'),
(1004, 4, 4, 10000, '2025-09-10', '2025-09-10 11:20:00'),
(1005, 5, 5, 75000, '2025-10-05', '2025-10-05 16:45:00');

INSERT INTO transactions (transaction_type, from_account_id, to_account_id, date_issued, transaction_medium, amount, processed_by, created_at) VALUES
('Transfer', 1, 2, '2026-07-25', 'Online', 500, 1, '2026-07-25 08:30:00'),
('Transfer', 2, 3, '2026-07-26', 'App', 200, 2, '2026-07-26 12:45:00'),
('Transfer', 4, 1, '2026-07-27', 'Branch', 1500, 3, '2026-07-27 15:10:00'),
('Transfer', 5, 4, '2026-07-28', 'Online', 300, 4, '2026-07-28 09:55:00'),
('Transfer', 3, 5, '2026-07-29', 'App', 75, 5, '2026-07-29 14:20:00');