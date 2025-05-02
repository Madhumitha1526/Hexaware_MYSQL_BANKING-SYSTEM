use HMBank;

-- Task 3 --

-- 1.SQL query to find the average account balance for all the customers --
select avg(balance) as average_balance from Accounts;

-- 2.SQL query to retrieve the top 10 highest account balances.--
select account_id, customer_id, balance from Accounts order by balance desc limit 10; 

-- 3.SQL query to calculate the total deposits of all the customers in the specific date -- 
select sum(amount) as total_deposits
from transactions
where transaction_type ='deposit' and transaction_date='2025-04-03';

describe Transactions;
-- 4.SQL query to find the oldest and newest customers --
select * from Customers order by customer_id limit 1;
select * from Customers order by customer_id desc limit 1;

-- 5.SQL query to retrieve transaction details along with the account type--
select t.transaction_id, t.account_id, a.account_type, t.transaction_date, t.amount, t.transaction_type
from Transactions t 
inner join Accounts a on t.account_id = a.account_id; 

-- 6. SQL query to get a list of customers along with their account details --
select c.customer_id, concat(c.first_name, ' ', c.last_name ) as customer_name , a.account_id, a.account_type, a.balance 
from Customers c
inner join Accounts a on c.customer_id = a.customer_id;

-- 7.SQL query to retrieve transaction details along with the customer information for a specific account --
select c.customer_id, concat(c.first_name , ' ' , c.last_name) as customer_name, t.transaction_id,t.transaction_date,t.amount,t.transaction_type
from Customers c
inner join Accounts a on c.customer_id=a.customer_id
inner join Transactions t on a.account_id=t.account_id
where a.account_id=101;

-- 8.SQL query to identify customers who have more than one account --
select c.customer_id, concat(c.first_name, ' ', c.last_name) as customer_name, count(a.account_id) as account_count
from Customers c 
inner join Accounts a on c.customer_id=a.customer_id
group by c.customer_id, c.first_name,c.last_name
having count(a.account_id)>1;

-- 9.SQL query to calculate the difference in transaction amounts and deposits and withdrawals --
select 
	sum(case when transaction_type='deposit' then amount else 0 end) as total_deposits,
    sum(case when transaction_type='withdrawal' then amount else 0 end) as total_withdrawals,
	sum(case when transaction_type='deposit' then amount else 0 end)  -
	sum(case when transaction_type='withdrawal' then amount else 0 end) as difference 
from transactions;

-- 10.SQL query to calculate the average daily balance for each account over a specific period -- 
select 
    a.account_id,
    round((a.balance +
        ifnull(sum(case when t.transaction_type = 'withdrawal' then t.amount * -1
            when t.transaction_type = 'deposit' then t.amount else 0
        end), 0)
    ) / 2, 2) as approx_avg_daily_balance
from Accounts a
left join Transactions t on a.account_id = t.account_id 
    and t.transaction_date between '2025-04-01' and '2025-04-30'
group by a.account_id;

-- 11. Calculate the total balance for each account type --
select account_type, sum(balance) as total_balance
from Accounts
group by account_type; 

-- 12.Identify the accounts with the highest number of transactions ordered by descending order --
select a.account_id ,count(t.transaction_id) as transaction_count
from accounts a
left join transactions t on a.account_id = t.account_id
group by a.account_id
order by transaction_count desc;

-- 13.List customers with high aggregate account balances along with their account types --
select c.customer_id, concat(c.first_name, ' ', c.last_name) as customer_name, a.account_type, sum(a.balance) as total_balance
from Customers c
inner join Accounts a on c.customer_id = a.customer_id
group by c.customer_id, a.account_type
having sum(a.balance) > 5000;

-- 14. SQl query to Identify and list duplicate transactions based on transaction amount, date, and account -- 
select account_id, amount, transaction_date, count(*) as duplicate_count
from Transactions
group by account_id, amount, transaction_date
having count(*) > 1;  -- as we used primary key for transaction_id it does not accepts duplicate key --



