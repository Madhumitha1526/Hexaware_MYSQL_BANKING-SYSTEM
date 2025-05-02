use HMBank;

-- 1. Retrieve the customers with the highest account balance --
select * from Customers where customer_id in (select customer_id from accounts where balance=(select max(balance) from Accounts));

-- 2. calculate the average account balance for the customers who have more than one account --
select c.customer_id, c.first_name, c.last_name, round(avg(a.balance), 2) as avg_balance
from accounts a join customers c on a.customer_id = c.customer_id
where a.customer_id in (select customer_id from accounts group by customer_id having count(*) > 1)
group by c.customer_id, c.first_name, c.last_name;

-- 3.Retrieve accounts with transactions whose amounts exceed the average transaction amount --
select * from Transactions 
where amount > (select avg(amount) from Transactions);

-- 4.Identify customers who have no recorded transactions--
select * from customers where customer_id not in (select distinct a.customer_id from accounts a join transactions t on a.account_id = t.account_id);

-- 5.Calculate the total balance of accounts with no recorded transactions --
select a.account_id, a.balance as total_balance
from accounts a
where a.account_id not in (select distinct account_id from transactions);

-- 6.Retrieve transactions for accounts with the lowest balance --
select * from transactions where account_id in (select account_id from accounts where balance = (select min(balance) from accounts));

-- 7.Identify customers who have accounts of multiple types --
select c.customer_id, c.first_name, c.last_name from Customers c
where c.customer_id in (select customer_id from Accounts group by customer_id 
    having count(distinct account_type) > 1);
 
-- 8.Calculate the percentage of each account type out of the total number of accounts --
select account_type,round((count(*) * 100.0) / (select count(*) from accounts), 2) as percentage from Accounts 
group by account_type;

-- 9.Retrieve all transactions for a customer with a given customer_id --
select * from Transactions where account_id in (select account_id from Accounts 
where customer_id = 1);

-- 10.Calculate the total balance for each account type, including a subquery within the SELECT clause --
select account_type,(select sum(balance) from Accounts a2 where a2.account_type = a1.account_type) as total_balance from Accounts a1
group by account_type;



