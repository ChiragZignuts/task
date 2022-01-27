-- Create Department Table
CREATE TABLE DEPARTMENT(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    created_date date
);

-- Create Employee Table
CREATE TABLE EMPLOYEE(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    emp_no int NOT NULL,
    dept_id int NOT NULL,
    join_date date NOT NULL,
    end_date date NOT NULL
);

-- Add Foreign Key to Employee Table
ALTER TABLE EMPLOYEE
ADD FOREIGN KEY (dept_id) REFERENCES DEPARTMENT(id);

-- Create Salary Table
CREATE TABLE SALARY(
	id int PRIMARY KEY AUTO_INCREMENT,
    emp_id int NOT NULL,
    month varchar(3) NOT NULL,
    year year NOT NULL,
    amount int NOT NULL,
    generated_date date
);

-- Add Foreign Key to Salary Table
ALTER TABLE SALARY
ADD FOREIGN KEY (emp_id) REFERENCES EMPLOYEE(id);

-- Insert data into department table
insert into DEPARTMENT(name,created_date) values('sales','2022-01-25');
insert into DEPARTMENT(name,created_date) values('purchase','2022-01-25');
insert into DEPARTMENT(name,created_date) values('HR','2022-01-25');
insert into DEPARTMENT(name,created_date) values('account','2022-01-25');
insert into DEPARTMENT(name,created_date) values('marketing','2022-01-25');

-- Insert data into employee table 
insert into EMPLOYEE(name, emp_no, dept_id, join_date, end_date) value ('Chirag', 1001, 4, '2021-01-25', '2022-01-26');
insert into EMPLOYEE(name, emp_no, dept_id, join_date, end_date) value ('Aman', 1002, 3, '2021-08-20', '2022-01-15');
insert into EMPLOYEE(name, emp_no, dept_id, join_date, end_date) value ('Shivam', 1003, 2, '2020-09-30', '2021-11-11');
insert into EMPLOYEE(name, emp_no, dept_id, join_date, end_date) value ('Nand', 1004, 1, '2021-01-25', '2021-12-31');
insert into EMPLOYEE(name, emp_no, dept_id, join_date, end_date) value ('Pujan', 1005, 5, '2020-08-10', '2021-05-15');

-- Insert data into salary table 
insert into SALARY (emp_id, month, year, amount, generated_date) values (1, 'JAN', 2022, 25000, '2022-01-31');
insert into SALARY (emp_id, month, year, amount, generated_date) values (2, 'JAN', 2022, 15000, '2022-01-31');
insert into SALARY (emp_id, month, year, amount, generated_date) values (3, 'NOV', 2021, 10000, '2021-11-30');
insert into SALARY (emp_id, month, year, amount, generated_date) values (4, 'DEC', 2021, 20000, '2022-01-01');
insert into SALARY (emp_id, month, year, amount, generated_date) values (5, 'MAY', 2021, 15000, '2021-05-31');

-- Query b
select e.id, e.name, e.emp_no, d.name as dept_name, e.join_date, e.end_date, s.amount as salary
from EMPLOYEE e, DEPARTMENT d, SALARY s
where e.dept_id = d.id and e.id = s.emp_id;

-- Query c
update SALARY set amount = 20000 where id = 6;
update EMPLOYEE set name = 'Bhaudip' where id = 5;
update DEPARTMENT set created_date = '2022-01-20' where id =3;

-- Query d
delete from SALARY where id = 6;
delete from EMPLOYEE where id = 5;
delete from DEPARTMENT where id = 5;
