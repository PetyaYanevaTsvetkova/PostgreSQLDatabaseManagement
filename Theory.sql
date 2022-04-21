--Create Database
CREATE DATABASE testdb;

-- Drop Database
DROP DATABASE IF EXISTS testdb;

--Rename DB
ALTER DATABASE testdb RENAME TO renamedb;

--Backup DB
BACKUP DATABASE databasename
TO DISK = 'filepath';

--full backup
BACKUP DATABASE testDB
TO DISK = 'D:\backups\testDB.bak';

--Create Table
CREATE TABLE [IF NOT EXISTS] table_name (
   column1 datatype(length) column_contraint,
   column2 datatype(length) column_contraint,
   column3 datatype(length) column_contraint,
   table_constraints
);

CREATE TABLE employee(
   employee_ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL
);

--Drop Table
DROP TABLE employee;

  
  --TRUNKATE table -> delete all data in the table 
CREATE TABLE COMPANY(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL,
   JOIN_DATE	  DATE
);

--Delete from table - allows to delete existing records in a table,
-- you can delete particular record pointed in where clause
DELETE FROM table_name WHERE condition;

--Alter Table/Reanme table
ALTER TABLE company ADD isBGN boolean;

ALTER TABLE company DROP COLUMN isbgn;

ALTER TABLE company
RENAME TO company_new_name;

INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY,JOIN_DATE) 
VALUES (1, 'Paul', 32, 'California', 20000.00,'2001-07-13');

INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,JOIN_DATE) 
VALUES (2, 'Allen', 25, 'Texas', '2007-12-13');

INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY,JOIN_DATE) 
VALUES (3, 'Teddy', 23, 'Norway', 20000.00, DEFAULT );

INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY,JOIN_DATE) 
VALUES (4, 'Mark', 25, 'Rich-Mond ', 65000.00, '2007-12-13' ), 
(5, 'David', 27, 'Texas', 85000.00, '2007-12-13');

TRUNCATE TABLE COMPANY;  

--DATES/CURRENT_DATE
CREATE TABLE delivery(
    delivery_id serial PRIMARY KEY,
    product varchar(255) NOT NULL,
    delivery_date DATE DEFAULT CURRENT_DATE
);

INSERT INTO delivery(product)
VALUES('Sample screen protector');


--INDEXES - speed up SELECT queries and WHERE clauses;
--it slows down data input, with UPDATE and INSERT statements. 
--Indexes can be created or dropped with no effect on the data

--does not allow any duplicate values to be inserted into the table
CREATE UNIQUE INDEX index_name
on table_name (column_name);

--index contains entries only for those table
-- rows that satisfy the predicate
--Single column index
CREATE INDEX index_name
ON table_name (column_name);

--Multicolumn Indexes
CREATE INDEX index_name
ON table_name (column1_name, column2_name);

--Unique Indexes -not allow any duplicate values to be inserted into the table
CREATE UNIQUE INDEX index_name
on table_name (column_name);

--Partial Indexes
CREATE INDEX index_name
on table_name (conditional_expression);

--Implicit Indexes
--Implicit indexes are indexes that are automatically created
 --by the database server when an object is created. Indexes
-- are automatically created for primary key constraints and unique constraints.

--Drop index
DROP INDEX salary_index;

--Indexes should not be used on small tables.
--Tables that have frequent, large batch update or insert operations.
--Indexes should not be used on columns that contain a high number of NULL values.
--Columns that are frequently manipulated should not be indexed

--NULL values
SELECT  ID, NAME, AGE, ADDRESS, SALARY
FROM COMPANY
WHERE SALARY IS NOT NULL
   
CREATE TABLE COMPANY(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL
); 

--Constraints:
--NOT NULL Constraint − Ensures that a column cannot have NULL value.
CREATE TABLE COMPANY(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL
);

--UNIQUE & DEFAULLT Constraint − Ensures that all values in a column are different.
CREATE TABLE COMPANY3(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL UNIQUE,
   ADDRESS        CHAR(50),
   SALARY         REAL    DEFAULT 50000.00
);

--PRIMARY Key − Uniquely identifies each row/record in a database table.
CREATE TABLE COMPANY4(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL
);

--FOREIGN Key − Constrains data based on columns in other tables.
CREATE TABLE COMPANY6(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL
);

-- The column EMP_ID is the foreign key 
-- and references the ID field of the table COMPANY6
CREATE TABLE DEPARTMENT1(
   ID INT PRIMARY KEY      NOT NULL,
   DEPT           CHAR(50) NOT NULL,
   EMP_ID         INT      references COMPANY6(ID)
);


--CHECK Constraint − The CHECK constraint ensures that
-- all values in a column satisfy certain conditions.
CREATE TABLE COMPANY5(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL    CHECK(SALARY > 0)
);

--AUTO INCREMENT
CREATE TABLE COMPANY(
   ID  SERIAL PRIMARY KEY,
   NAME           TEXT      NOT NULL,
   AGE            INT       NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL
);


--DROP CONSTRAINTS
ALTER TABLE table_name DROP CONSTRAINT some_name;

--COMMENTS
-- comment goes here
/* comment goes here */

--VIEWS
CREATE [TEMP | TEMPORARY] VIEW view_name AS
SELECT column1, column2.....
FROM table_name
WHERE [condition];

CREATE VIEW COMPANY_VIEW AS
SELECT ID, NAME, AGE
FROM  COMPANY;

DROP VIEW COMPANY_VIEW;

--UPDATE
UPDATE table_name
SET column1 = value1, column2 = value2...., columnN = valueN
WHERE [condition];

--DON'T FORGET THE WHERE CLAUSE :))
UPDATE COMPANY SET SALARY = 15000 WHERE ID = 3;

UPDATE COMPANY SET ADDRESS = 'Texas', SALARY=20000

  