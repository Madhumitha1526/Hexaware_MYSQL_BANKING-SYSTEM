                                                                         -- 3.BANKING SYSTEM --
 -- task1 --
drop database if exists HMBank;
create database HMBank;
use HMBank; 

create table Customers(
	customer_id int auto_increment primary key ,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    DOB date not null,
    email varchar(100) unique not null,
    phone_number varchar(15) unique not null,
    address varchar(200)
);

create table Accounts(
	account_id int auto_increment primary key,
    customer_id int not null,
    account_type ENUM('savings','current','zero_balance') not null ,
    balance decimal(12,2) default 0.00 ,
    foreign key (customer_id) references Customers(customer_id) on delete cascade
);

alter table Accounts modify account_type ENUM('savings', 'current', 'zero_balance') not null;


create table Transactions(
	transaction_id int auto_increment primary key,
    account_id int not null,
    transaction_type ENUM('deposit','withdrawal','transfer') not null,
    amount decimal(12,2) not null check (amount>0),
    transaction_date date not null,
    foreign key(account_id) references Accounts(account_id) on delete cascade
);





INSERT INTO Customers (first_name, last_name, DOB, email, phone_number, address) VALUES
('John', 'Doe', '1980-05-15', 'john.doe@123.com', '1234567890', '123 Main St, Salem'),
('Jane', 'Smith', '1990-07-20', 'jane.smith@123.com', '0987654321', '456 Elm St, Coimbatore'),
('Alice', 'Johnson', '1985-03-10', 'alice.j@123.com', '2345678901', '789 Oak Ave, Madurai'),
('Bob', 'Williams', '1978-11-25', 'bob.williams@123.com', '3456789012', '321 Pine St, Trichy'),
('Emily', 'Brown', '1992-06-30', 'emily.b@123.com', '4567890123', '654 Cedar St, Chennai'),
('Michael', 'Davis', '1983-12-12', 'mike.d@123.com', '5678901234', '987 Birch Rd, Salem'),
('Linda', 'Miller', '1975-09-17', 'linda.m@123.com', '6789012345', '111 Maple Dr, Erode'),
('David', 'Wilson', '1991-04-04', 'david.w@123.com', '7890123456', '222 Spruce Ln, Coimbatore'),
('Sophia', 'Moore', '1988-08-08', 'sophia.m@123.com', '8901234567', '333 Palm Ct, Salem'),
('James', 'Taylor', '1993-02-18', 'james.t@123.com', '9012345678', '444 Banyan Blvd, Tirunelveli');

select * from Customers;

INSERT INTO Accounts (account_id, customer_id, account_type, balance) VALUES
(101, 1, 'savings', 1500.00),
(102, 1, 'current', 2500.00),
(103, 2, 'savings', 3000.00),
(104, 3, 'current', 4200.00),
(105, 4, 'savings', 0.00),
(106, 5, 'current', 10000.00),
(107, 6, 'savings', 750.00),
(108, 7, 'current', 500.00),
(109, 8, 'savings', 8000.00),
(110, 9, 'savings', 950.00);

select * from Accounts;


INSERT INTO Transactions (transaction_id, account_id, transaction_type, amount, transaction_date)
VALUES
(1001, 101, 'deposit', 500.00, '2025-04-01'),
(1002, 102, 'withdrawal', 200.00, '2025-04-02'),
(1003, 103, 'deposit', 1000.00, '2025-04-03'),
(1004, 104, 'transfer', 1500.00, '2025-04-04'),
(1005, 105, 'deposit', 300.00, '2025-04-05'),
(1006, 106, 'withdrawal', 250.00, '2025-04-06'),
(1007, 107, 'deposit', 1200.00, '2025-04-07'),
(1008, 108, 'withdrawal', 100.00, '2025-04-08'),
(1009, 109, 'deposit', 800.00, '2025-04-09'),
(1010, 110, 'deposit', 650.00, '2025-04-10');


select * from Transactions;





  
    
    

