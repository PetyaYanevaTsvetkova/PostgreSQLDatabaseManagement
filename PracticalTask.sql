CREATE DATABASE orders_management;


CREATE TABLE customer (
customer_id serial PRIMARY KEY  NOT NULL,
name VARCHAR(255) NOT NULL,
email VARCHAR(255) UNIQUE NOT NULL,
phone CHAR(13) UNIQUE NOT NULL,
CONSTRAINT chk_phone CHECK (phone not like '%[^0-9]%'),
age SMALLINT CHECK (age>=18) DEFAULT 99, 
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
 
 
--date_profile_deactivated TIMESTAMP,
--set is_profile_active = false;
--set reason_for_deactivation = 'reason';


TRUNCATE TABLE customer;
 
 
INSERT INTO customer (customer_id, name, email, phone, age, address, city, postal_code, country, 
					  consent_status, is_profile_active) 
					 			 
VALUES 
(1, 'Mark', 'mark@abv.bg', +359888444561, 25, 'Bulgaria', 'Sofia', 359, 'BG', true, true), 
(2, 'Alice', 'alice@jit.bg', +359878448561, 26, 'Greece', 'Athens', 478, 'Greece', false, true),
(3, 'Bob', 'bob@fsdg.bg', +359878447561, 46, 'Bulgaria', 'Sliven', 368, 'Bulgaria', true, false),
(4, 'Charlie', 'charlie@gmail.bg', +359678444561, 64, 'Bulgaria', 'Ruse', 258, 'Bulgaria', true, true);
 
 
CREATE INDEX index_name
on customer (name, email, phone);

