A foreign key is a key used to link two tables together. This is sometimes also called as a referencing key. <br />

A Foreign Key is a column or a combination of columns whose values match a Primary Key in a different table. <br />

The relationship between 2 tables matches the Primary Key in one of the tables with a Foreign Key in the second table. <br />

If a table has a primary key defined on any field(s), then you cannot have two records having the same value of that field(s). <br />

Example
Consider the structure of the following two tables.

CUSTOMERS table

CREATE TABLE CUSTOMERS(
   ID   INT              PRIMARY KEY,
   NAME VARCHAR (20)     NOT NULL,
   AGE  INT              NOT NULL,
   ADDRESS  CHAR (25) ,
   SALARY   DECIMAL (18, 2),       
   
);
ORDERS table

CREATE TABLE ORDERS (
   ID          INT        NOT NULL,
   DATE        DATETIME, 
   CUSTOMER_ID INT references CUSTOMERS(ID),
   AMOUNT     double,
   PRIMARY KEY (ID)
);
If the ORDERS table has already been created and the foreign key has not yet been set, the use the syntax for specifying a foreign key by altering a table.

ALTER TABLE ORDERS 
   ADD FOREIGN KEY (Customer_ID) REFERENCES CUSTOMERS (ID);
DROP a FOREIGN KEY Constraint
To drop a FOREIGN KEY constraint, use the following SQL syntax.

ALTER TABLE ORDERS
   DROP FOREIGN KEY;