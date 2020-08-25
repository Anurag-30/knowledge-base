`DDL` stands for Data Definition Language where it only care about how to structure the data i.e deals with the tables and database. CREATE , DROP , ALTER and RENAME falls under the DDL. <br />

CREATE --> used to create database or a table <br />

`CREATE DATABASE test;` <br />

`CREATE TABLE test (
    id BIGSERIAL PRIMARY KEY,
    first_name   VARCHAR(50),
    last_name    VARCHAR(50)
);`                       <br />

DROP --> used to delete a table or a database <br />

`DROP DATABASE test;` <br />

`DROP TABLE test;`    <br />

ALTER --> This is used to change the columns types, add/remove constraints <br />

`ALTER TABLE person ALTER COLUMN id DROP  NOT NULL ;` <br />

RENAME --> It is used along with ALTER to change the DB name or the column name inside a table. <br />

`ALTER TABLE person  RENAME COLUMN id to personal_id;`

