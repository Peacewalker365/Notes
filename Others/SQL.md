# SQL

### Intro

- DB is any collection of related info
- Computer is great for storing databases
- DBMS is the software to create, maintain, and secure a database.  
  SQL is a language
- DBMS allow you to perform the CRUD operations and other administrative tasks
- Two types of DB, Relational and Non-Relational
- Relational DB use SQL and store data in tables with rows and columes
- Non-Relational data store data using other data structures

### Table and Keys

| emp ID | Name | date | Supervisors ID | Branch ID |
| ------ | ---- | ---- | -------------- | --------- |
| 100    |      |      | Null           | 1         |
| 101    |      |      | 100            | 3         |
| 102    |      |      | 101            | 2         |

Here emp ID is the primary key of the table

brach ID is the foreign key that is the primary key of another table(or itselt)

Foreign key helps to define the relationship of tables

Sometimes we need composite keys which contains multiple atributes(more than one keys) since any one of keys is not able to uniquely identify a row

| emp id | client id | sales |
| ------ | --------- | ----- |
| 107    | 500       | 55456 |
| 107    | 403       | 8765  |
| 102    | 403       | 9963  |

emp id and client id can be foreign keys linking to other tables, and these 2 keys construct the composite key.



### SQL Basics

- SQL varies depending on systems but the concepts are the same
- SQL is a hybrid lang, a 4-in-1 lang
  - Data Query Language(DQL)
    - query the database for info
    - get info already stored there
  - Data Definition Lang(DDL)
    - define database schemas
  - Data Control Lang(DCL)
    - control access to the data
    - permission management
  - Data Manipulation Lang(DML)
    - insert, update, delete data

#### Queries

- SELECT employee.name, employee.age
- FROM employee
- WHERE employee.salary > 30000



### Installment

#### mySQL

- download mySQL database server
- `echo 'export PATH=/usr/local/mysql/bin:$PATH' >> ~/.bash_profile ` Notice it varies, just add the path to the configuration 

#### PopSQL

- popSQL which is kinda textediter



### SQL

#### Create a table

```sql
INT
DECIMAL(10,4)               --total length of 10 and 4 after decimal point
VARCHAR(1)                  
BLOB                        --binary large object, stores large data
DATE                        --YYYY-MM-DD
TIMESTAMP                   --YYYY-MM-DD HH:MM:SS

```



```sql
CREATE TABLE student (
	student_id INT PRIMARY KEY,
  name VARCHAR(20),
  major VARCHAR(20)
  -- PRIMARY KEY(student_id)
);

--or you can define the primary key afterwards like above

DESCRIBE student;

DROP TABLE student;

ALTER TABLE student ADD gpa DECIMAL(3,2); --add column

ALTER TABLE student DROP COLUMN gpa; --drop column

```

#### Insert data

```sql
INSERT INTO student VALUES(1, 'Jack', 'Biology');

INSERT INTO student VALUES(2, 'Kate', 'Sociology');

SELECT * FROM student; --grab all the info from the table

INSERT INTO student(student_id, name) VALUES(3, 'Claire');

INSERT INTO student VALUES(4, 'Jack', 'Biology');

INSERT INTO student VALUES(5, 'Mike', 'Computer Science');

```



#### C

```sql
CREATE TABLE student (
  student_id INT UNIQUE,
  --student_id INT AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL,
  major VARCHAR(20) DEFAULT 'undecided'
);

--then insert all data
--primary key is both not null and unique

```



#### Update and Delete

```sql
UPDATE student
SET major = 'Bio'
WHERE major = 'Biology';

UPDATE student
SET major = 'Comp Sci'
WHERE student_id = 1 OR major = 'Chemistry'

UPDATE student
SET name = 'Tom', Major = 'Undecided'
WHERE student_id = 1;

UPDATE student
SET major = 'undecided';

DELETE FROM student; --delete all columns and rows

DELETE FROM student
WHERE student_id = 5 AND major = 'undecided';
```



#### Basic Queries

```sql
SELECT * FROM student;

SELECT student.name, student.major
FROM student
ORDER BY student_id DESC;

SELECT name, major
FROM student
ORDER BY major, student_id
LIMIT 3
WHERE major = 'Biology' OR name <> 'Kate';

-- <, >, <=, >=, =, <>, AND, OR

SELECT *
FROM student
WHERE name IN ('Claire', 'Kate', 'Mike');


```



#### Company Database Into

```sql
CREATE TABLE employee (
  emp_id INT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_day DATE,
  sex VARCHAR(1),
  salary INT,
  super_id INT,
  branch_id INT
);

CREATE TABLE branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT,
  mgr_start_date DATE,
  FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

CREATE TABLE client (
  client_id INT PRIMARY KEY,
  client_name VARCHAR(40),
  branch_id INT,
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE works_with (
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id, client_id),
  FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
  FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier (
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);


-- -----------------------------------------------------------------------------

-- Corporate
INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

-- Scranton
INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

-- Stamford
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);


-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');

-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

-- WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);
```

Notice that there are some cyclic relations among tables so that we have to insert data by a resonable sequence



#### More Basic Queries

```sql
--Find all employees
SELECT *
FORM employee;

--Find first 5 emp ordered by salary
SELECT *
FROM employee
ORDER BY salary DESC
LIMIT 5;

--Find all emp ordered by sex than name
SELECT *
FROM employee
ORDER BY sex, first_name, last_name;

--Find the forename and surnames of all emp
SELECT first_name AS forename, last_name AS surname
FROM employee;

--Find out all the different genders
SELECT DISTINCT sex
FROM employee;

```



#### Function

```sql
-- Find the number of emp
SELECT COUNT(emp_id)
FROM employee;

--How many emo have supervisor
SELECT COUNT(super_id)
FROM employee;

--Find the num of female emp born after 1970
SELECT COUNT(emp_id)
FROM employee
WHERE sex = 'F' AND birth_date > '1971-01-01';

 --Find the average of all male emp's salary
SELECT AVG(salary)
FROM employee
WHERE SEX = 'M';

--Find the sum of all emp's salaries
SELECT SUM(salary)
FROM employee;

--Find out how many males and females there are
SELECT COUNT(sex),sex
FROM employee
GROUP BY sex;

--Find the total sales of each salesman
SELECT SUM(total_sales), emp_id
FROM works_with
GROUP BY emp_id;
```



#### Wildcards

```sql
--% = any # characters, _ = one character

--Find any client's who are an LLC

SELECT *
FROM client
WHERE client_name LIKE '%LLC';

SELECT *
FROM branch_supplier
WHERE supplier_name LIKE '% Label%';

SELECT *
FROM employee
WHERE birth_day LIKE '____-02%';

SELECT *
FROM client
WHERE client_name LIKE '%school%';
```



#### Union

```sql
--Find a list of employee and branch names

SELECT first_name
FROM employee
UNION
SELECT branch_name
FROM branch
UNION
SELECT client_name
FROM client;

--Find a list of all clients & branch suppliers' names
SELECT client_name, branch_id
FROM client
UNION
SELECT supplier_name, branch_id
FROM branch_supplier;

--Find a list of all money spent or earned by the company
SELECT salary
FROM employee
UNION
SELECT total_sales
FROM works_with;
```



#### Joins

```sql
INSERT INTO branch VALUES(4, 'Buffalo', NULL, NULL);

--find all branches and the names of their managers
SELECT employee.emp_id AS ID, employee.first_name AS forename, branch.branch_name AS Branch
FROM employee
JOIN branch
ON employee.emp_id = branch.mgr_id;

SELECT employee.emp_id AS ID, employee.first_name AS forename, branch.branch_name AS Branch
FROM employee
LEFT JOIN branch
ON employee.emp_id = branch.mgr_id;

SELECT employee.emp_id AS ID, employee.first_name AS forename, branch.branch_name AS Branch
FROM employee
RIGHT JOIN branch
ON employee.emp_id = branch.mgr_id;
```



#### Nested Queries

```sql
--Find names of all employees who have
--sold over 30,000 to a single client
SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.emp_id IN(
    SELECT works_with.emp_id
    FROM works_with
    WHERE works_with.total_sales > 30000
);

--Find all clients who are handled by the branch
--that MIchael Scott manages
--Assume you know Michael's ID
SELECT client.client_name
FROM client
WHERE client.branch_id = (
    SELECT branch.branch_id
    FROM branch
    WHERE branch.mgr_id = 102
    LIMIT 1
);

```



#### On Delete

```sql
 ...(
   FOREIGN KEY(a) REFERENCES branch(b) ON DELETE SET NULL
 );
 -- if b in table branch is deleted, a in the current table would be set to null
 
  ...(
   FOREIGN KEY(a) REFERENCES branch(b) ON DELETE CASCADE
 );
 -- if b in table branch is deleted, the row contains a in the current table would be deleted
```



#### Triggers

```sql
CREATE TABLE trigger_test (
    message VARCHAR(100)
);
------------------------------------
-- write on terminal!
USE giraffe

DELIMITER $$
CREATE
    TRIGGER my_trigger BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
        INSERT INTO trigger_test VALUES('added new employee');
    END$$
DELIMITER ;
--------------------------------------------
INSERT INTO employee
VALUES(109, 'Oscar', 'Martinez', '1968-02-19', 'M', 69000, 106, 3);

SELECT * FROM trigger_test;


------------------------------------
-- write on terminal!
USE giraffe

DELIMITER $$
CREATE
    TRIGGER my_trigger1 BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
        INSERT INTO trigger_test VALUES(NEW.first_name);
    END$$
DELIMITER ;
--------------------------------------------

INSERT INTO employee
VALUES(110, 'Kevin', 'Malone', '1978-02-19', 'M', 69000, 106, 3);

SELECT * FROM trigger_test;

------------------------------------
-- write on terminal!
USE giraffe

DELIMITER $$
CREATE
    TRIGGER my_trigger2 BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
        IF NEW.sex = 'M' THEN
            INSERT INTO trigger_test VALUES('added male employee');
        ELSEIF NEW.sex = 'F' THEN
            INSERT INTO trigger_test VALUES('added female');
            INSERT INTO trigger_test VALUES('added other employee');
        END IF;
    END$$
DELIMITER ;
------------------------------------------------

INSERT INTO employee
VALUES(111, 'Pam', 'Beesly', '1988-02-19', 'F', 69000, 106, 3);

SELECT * FROM trigger_test;

------------------------------------
-- write on terminal!
USE giraffe

DELIMITER $$
CREATE
    TRIGGER my_trigger3 AFTER DELETE
    ON employee
    FOR EACH ROW BEGIN
        IF NEW.sex = 'M' THEN
            INSERT INTO trigger_test VALUES('added male employee');
        ELSEIF NEW.sex = 'F' THEN
            INSERT INTO trigger_test VALUES('added female');
            INSERT INTO trigger_test VALUES('added other employee');
        END IF;
    END$$
DELIMITER ;
------------------------------------------------
DROP TRIGGER my_trigger3;
```

**But how to add varibles in to those strings?**



#### ER Diagrams Intro

We can uses ER Diagrams to design database schemas 

- Entity: Student
- Attribute: name, grade, gpa
  - Primary Key: student_id, gpa
  - Composite Attribute:
    - name
      - first_name
      - last_name
  - Multi-valued Attribute: clubs
  - Derived Attribute: has_honors (can be derived from gpa) (no need to track)
-  Multiple Entitles: Class
  - class_id
  - department
- Relationships: Student ------- Takes \=\=\=\=\=\=\=\= Class
  - partial participation: not all students need to participate the Takes relationship since not all student need to take the class
  - total participation: all classes need to participate the Takes relationship since every class need to be taken by at least one student
- Relationship Carinality: N:M
  - a student can take any numbers of class
  - a class can be taken by any num of student
- Weak Entity
- Identifying relationship

![ER Diagrams](/Users/wenchaoli/Desktop/Images/ER Diagrams.png)



#### Designing an ERD



#### Converting ERD to Schema

![ConvertingERD](/Users/wenchaoli/Desktop/Images/ConvertingERD.png)

![ConvertedERD](/Users/wenchaoli/Desktop/Images/ConvertedERD.png)

1. mapping of regular entity types
   - For each regular entity type create a relation(table) that includes all the simple attributes of that entity
2. mapping of weak entity types
   - For each weak entity type create a relation(table) that includes all simple attributes of the weak entity
   - The primary key of the new relation should be the partial key of the weak entity plus the primary key of its owner
   - in this case, we have the branch_id and supplier_name come together as a composite key
3. mapping of Binary 1:1 relationship types
   - include one side of the relationship as a foreign key in the other favor total participation, which mean the table of which has a total participation will include the primary key of the other as a foreign key
4. mapping of Binary 1:n relationship types
   - inlcudes 1's side's primary key as the n's side's foreign key
5. mapping of Binary m:n relationship types
   - create a new relation who's primary key is a combination of both entites' primary key.  
     also include any relationship attributes
6. link all foreign keys to the place it points to if it's not messy...

**NOTICE: This is a basic ERD, so there may be more advanced and complex ERD in a real situation, keep up your self-learning pace.**

[Explanation](https://www.youtube.com/watch?v=HXV3zeQKqGY)



读写分离（atlas）---垂直分库---垂直分表---水平分表

了解：主从，atlas，高可用

[mysql+redis+mongoDB+TCP/IP](https://www.bilibili.com/video/BV1GJ411K7it?p=8)

[another](https://www.bilibili.com/video/BV157411K7sf?p=172)



