                                                                         -- 3.BANKING SYSTEM --
 -- task1 --
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


create table transactions(
	transaction_id int auto_increment primary key,
    account_id int not null,
    transaction_type ENUM('deposit','withdrawal','transfer') not null,
    amount decimal(12,2) not null check (amount>0),
    transaction_date timestamp default current_timestamp,
    foreign key(account_id) references Accounts(account_id) on delete cascade
);

insert into Customers(customer_id,first_name, last_name, DOB, email, phone_number, address) values
(1, 'Arun', 'Kumar', '1990-05-12', 'arun.kumar@gmail.com', '9876543210', 'Chennai'),
(2, 'Divya', 'Ramesh', '1985-11-20', 'divya.ramesh@gmail.com', '9876543211', 'Bengaluru'),
(3, 'Vikram', 'Reddy', '1992-02-15', 'vikram.reddy@gmail.com', '9876543212', 'Hyderabad'),
(4, 'Anitha', 'Murthy', '1988-07-08', 'anitha.murthy@gmail.com', '9876543213', 'Mysuru'),
(5, 'Rajesh', 'Pillai', '1979-12-01', 'rajesh.pillai@gmail.com', '9876543214', 'Thiruvananthapuram'),
(6, 'Keerthi', 'Sundar', '1995-09-21', 'keerthi.sundar@gmail.com', '9876543215', 'Coimbatore'),
(7, 'Suresh', 'Nair', '1991-04-03', 'suresh.nair@gmail.com', '9876543216', 'Kochi'),
(8, 'Meera', 'Krishna', '1993-06-18', 'meera.krishna@gmail.com', '9876543217', 'Madurai'),
(9, 'Praveen', 'Shetty', '1987-10-05', 'praveen.shetty@gmail.com', '9876543218', 'Mangalore'),
(10, 'Lakshmi', 'Venkat', '1990-01-30', 'lakshmi.venkat@gmail.com', '9876543219', 'Vijayawada');

select * from Customers;

INSERT INTO Accounts (account_id, customer_id, account_type, balance) VALUES
(101, 1, 'savings', 7500.00),
(102, 2, 'current', 15000.00),
(103, 3, 'zero_balance', 0.00),
(104, 4, 'savings', 8500.50),
(105, 5, 'current', 21000.75),
(106, 6, 'savings', 4200.00),
(107, 7, 'zero_balance', 0.00),
(108, 8, 'current', 12300.20),
(109, 9, 'savings', 6600.00),
(110, 10, 'savings', 9700.00);

select * from Accounts;

INSERT INTO Transactions (transaction_id, account_id, transaction_type, amount) VALUES
(1001, 101, 'deposit', 2000.00),
(1002, 102, 'withdrawal', 3000.00),
(1003, 103, 'deposit', 1500.00),
(1004, 104, 'withdrawal', 1200.50),
(1005, 105, 'deposit', 5000.00),
(1006, 106, 'deposit', 700.00),
(1007, 107, 'deposit', 2000.00),
(1008, 108, 'withdrawal', 1700.00),
(1009, 109, 'deposit', 900.00),
(1010, 110, 'withdrawal', 2000.00);

select * from Transactions;



    


    
    
    

