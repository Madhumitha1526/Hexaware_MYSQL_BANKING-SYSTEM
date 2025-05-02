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





insert into customers (first_name, last_name, dob, email, phone_number, address) values
('arun', 'kumar', '1980-05-15', 'arun.kumar@123.com', '9876543210', '23 gandhi st, salem'),
('meena', 'raman', '1990-07-20', 'meena.raman@123.com', '8765432109', '56 anna nagar, coimbatore'),
('revathi', 'raj', '1985-03-10', 'revathi.raj@123.com', '7654321098', '88 m.g. road, madurai'),
('sundar', 'vel', '1978-11-25', 'sundar.vel@123.com', '6543210987', '12 srirangam st, trichy'),
('keerthi', 'mohan', '1992-06-30', 'keerthi.mohan@123.com', '5432109876', '99 t nagar, chennai'),
('ganesh', 'murthy', '1983-12-12', 'ganesh.murthy@123.com', '4321098765', '76 salai rd, salem'),
('lakshmi', 'karthik', '1975-09-17', 'lakshmi.karthik@123.com', '3210987654', '45 perundurai rd, erode'),
('vignesh', 'bala', '1991-04-04', 'vignesh.bala@123.com', '2109876543', '31 peelamedu, coimbatore'),
('divya', 'shree', '1988-08-08', 'divya.shree@123.com', '1098765432', '63 fairlands, salem'),
('ravi', 'prakash', '1993-02-18', 'ravi.prakash@123.com', '9988776655', '12 vasanth nagar, tirunelveli');


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





  
    
    

