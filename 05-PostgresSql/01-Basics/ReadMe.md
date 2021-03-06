# List Of Sql commands while learning postgresql

## What is Database?

A database is a place where you can store, manipulate and delete the data. The data is stored in the form of tables in case of RDBMS.

## Connecting to the Postgres using psql client

`psql -h <psql server address> -p <port> -U <Valid user to connect>`

`\l`              --> lists all the databases in the server <br />
`\c`              --> connecting to a specific database <br />
`\d`              --> list all the tables in a database <br />
`\d <table-name>` --> To describe the strcuture of the table <br />
`\i` <File Path>  --> To give input as a file which has commands to execute <br />

## Create A database

`CREATE DATABASE <name of the database>;`

It can be in caps or the small letters but is usually considered as a best practice to keep the sql syntax in Capitals

`CREATE DATABASE test;`

## Delete A Database

`DROP DATABASE <database name>;`

It is a dangerous command and has to be used with caution as it deletes the database and all its contents.

`DROP DATABASE test;`

## Structure Of A Table

A table consists of 3 things column + type of the data + constraints (optional) <br />

` CREATE TABLE table_name ( 
    column_name + datatype + constraints if any 
);` <br />

You can read more about different data type available --> https://www.postgresql.org/docs/9.5/datatype.html <br />

## Creating A Table Without Constraints

`CREATE TABLE person (          
    id             UUID,         
    first_name     VARCHAR(50),  
    last_name      VARCHAR(50),  
    gender         CHAR(10),     
    date_of_birth  DATE          
);`  <br />                       


## Delete A Table 

You can delete a table the same way we did for a database using `DROP` command <br />

`DROP TABLE <Table Name>;` <br />

`DROP TABLE person;`   <br />

## Create A Table With Constraints

You can have only one primary key (unique and is not null) for a table.  <br />

` CREATE TABLE person (
    id              BIGSERIAL     PRIMARY KEY,
    first_name      VARCHAR(50)   NOT NULL,
    last_name       VARCHAR(50)   NOT NULL,
    gender          CHAR(10)      NOT NULL,
    date_of_birth   DATE          NOT NULL,
    email           VARCHAR(100)
); ` <br />


## Insert Into A Table

You can add records into the table by using `INSERT` command. <br />

`INSERT INTO table_name (
    column name
)Values ('values')`

`INSERT INTO person (
    first_name,
    last_name,
    gender,
    date_of_birth,
    email
)
VALUES ('Anurag','Parchuri','Male', DATE '1995/06/30', 'imanurag309@gmail.com');`

## View The Contents Of A Table

One can see the data inside the table using `SELECT` command. <br /> 

`SELECT * FROM <table name>` <br />

Here * lists all the records inside of a table. you can get mock data at https://www.mockaroo.com/ which can be used to practice commads with clauses.
