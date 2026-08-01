-- Change the column name from account_statues to account_status
alter table accounts 
rename account_statues to account_status;

--- Add a check constraint to ensure that account_status can only have specific values
alter table accounts
add constraint chk_account_status check (account_status in ('Active', 'Inactive', 'Closed'));

-- Add a check constraint to ensure that balance is non-negative
alter table loans
add constraint chk_loan_amount check (loan_amount > 0);

--- Add a check constraint to ensure that hire_date is not in the future
alter table employees
add constraint chk_hire_date check (hire_date <= current_date);

