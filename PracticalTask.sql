CREATE DATABASE orders_management;

DROP TABLE customer;

CREATE TABLE customer (
customer_id serial PRIMARY KEY  NOT NULL,
name VARCHAR(255) NOT NULL,
email VARCHAR(255) UNIQUE NOT NULL,
phone CHAR(13) UNIQUE NOT NULL,
CONSTRAINT chk_phone CHECK (phone not like '%[^0-9]%'),
age SMALLINT DEFAULT 99 CHECK (age>=18), 
address VARCHAR(255),
city VARCHAR(255),
postal_code INT CHECK (postal_code>0),
country VARCHAR(255),
consent_status BOOLEAN NOT NULL,
is_profile_active BOOLEAN NOT NULL,
date_profile_created timestamp DEFAULT CURRENT_timestamp,
date_profile_deactivated timestamp,
reason_for_deactivation VARCHAR(255),
notes TEXT    
);
 
TRUNCATE TABLE customer;
 
 
INSERT INTO customer (customer_id, name, email, phone, age, address, city, postal_code, country, 
					  consent_status, is_profile_active) 
					 			 
VALUES 
(1, 'Mark', 'mark@abv.bg', +359888444561, 25, 'Bulgaria', 'Sofia', 359, 'BG', true, true), 
(2, 'Alice', 'alice@jit.bg', +359878448561, 26, 'Greece', 'Athens', 478, 'Greece', false, true),
(3, 'Bob', 'bob@fsdg.bg', +359878447561, 46, 'Bulgaria', 'Sliven', 368, 'Bulgaria', true, false),
(4, 'Charlie', 'charlie@gmail.bg', +359678444561, 64, 'Bulgaria', 'Ruse', 258, 'Bulgaria', true, true);
 
 
CREATE INDEX index_name
on customer (name);

CREATE INDEX index_email
on customer (email);

CREATE INDEX index_phone
on customer (phone);

--DEACTIVATE PROFILE
UPDATE customer 
SET 
date_profile_deactivated = CURRENT_timestamp, 
is_profile_active = FALSE, 
reason_for_deactivation = 'INVALID PROFILE',
date_profile_created = NULL
WHERE customer_id = 4;

--ACTIVATE PROFILE
UPDATE customer 
SET 
date_profile_deactivated = NULL, 
is_profile_active = TRUE, 
reason_for_deactivation = NULL,
date_profile_created = CURRENT_timestamp
WHERE customer_id = 4;

--ADD NOTES
UPDATE customer 
SET 
notes = 'Lorem Ipsum is simply dummy text 
of the printing and typesetting industry.
 Lorem Ipsum has been the industrys standard
 dummy text ever since the 1500s, when an 
 unknown printer took a galley of type and 
 scrambled it to make a type specimen book. 
 It has survived not only five centuries, 
 but also the leap into electronic typesetting, 
 remaining essentially unchanged. It was 
 popularised in the 1960s with the release 
 of Letraset sheets containing Lorem Ipsum 
 passages, and more recently with desktop 
 publishing software like Aldus PageMaker 
 including versions of Lorem Ipsum.'
WHERE customer_id = 4;


--Backup database:

--through the pgAdmin:
--right button on the base
--choose Backup from the dropdown menu
--click on the folder to find the folder, you wanted to save the backup
--For the Filename put the filepath + the name of the file (for exampe: orders_management.sql)
--Click on Backup button
--The file is created in the folder with the specified path