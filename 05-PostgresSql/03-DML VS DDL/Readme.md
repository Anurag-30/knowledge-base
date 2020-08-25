`DDL` stands for Data Definition Language where it only care about how to structure the data i.e deals with the tables and database. CREATE , DROP , ALTER and RENAME falls under the DDL. <br />

CREATE --> used to create database or a table <br />

`CREATE DATABASE test;` <br />

`CREATE TABLE test (
    id BIGSERIAL PRIMARY KEY,
    first_name   VARCHAR(50),
    last_name    VARCHAR(50)
);`                       <br />

DROP --> used to delete a table or a database <br />

`DROP 