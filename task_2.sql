-- task 2 --

use HMBank;

-- 1. a SQL query to retrieve the name, account type and email of all customers --

select c.first_name, c.last_name, a.account_type, c.email 
from Customers c , Accounts a where c.customer_id = a.customer_id;

-- 2. select all the transactions corresponding customers --

select c.first_name, c.last_name, t.transaction_id, t.transaction_date, t.amount, t.transaction_type
from Customers c , Accounts a, Transactions t 
where c.customer_id = a.customer_id and a.account_id = t.account_id; 

-- 3. query to -- increase the balance of specific account by certain amount ----

update Accounts set balance = balance + 1500 where account_id = 101;
 
 -- 4. Write a SQL query to Combine first and last names of customers as a full_name.--
select concat(first_name, ' ', last_name) as full_name 
from Customers;

-- 5. Write a SQL query to remove accounts with a balance of zero where the account_type is savings --
delete from Accounts where account_type = 'savings' and  balance = 0 and  account_id is not null;
select * from Accounts;  

-- 6. Write a SQL query to Find customers living in a specific city. --
select * from Customers where address like '%Chennai%';

-- 7. Write a SQL query to Get the account balance for a specific account.--
select balance from Accounts where account_id = 101;

-- 8.Write a SQL query to List all current accounts with a balance greater than $1,000.--
select * from Accounts where account_type='current' and  balance>1000;

-- 9.Write a SQL query to Retrieve all transactions for a specific account.--
select * from Transactions where account_id = 101;

-- 10.Write a SQL query to Calculate the interest accrued on savings accounts based on a given interest rate. --
select account_id, balance, balance * 0.05 as interestaccured from Accounts
where account_type= 'savings';

-- 11. Write a SQL query to Identify accounts where the balance is less than a specified overdraft limit.--
select * from Accounts where balance < 600;

-- 12.Write a SQL query to Find customers not living in a specific city.--
select * from Customers where address not like '%Chennai%';