# List Of Sql commands while learning postgresql

## What is Database?

A database is a place where you can store, manipulate and delete the data. The data is stored in the form of tables in case of RDBMS.

## Connecting to the Postgres using psql

`psql -h <psql server address> -p <port> -U <Valid user to connect>`

`\l` --> lists all the databases in the server <br />
`\c` --> connecting to a specific database <br />

## Create A database

`CREATE DATABASE <name of the database>;`

It can be in caps or the small letters but is usually considered as a best practice to keep the sql syntax in Capitals

`CREATE DATABASE test;`

## Delete A Database

`DROP DATABASE <database name>;`

It is a dangerous command and has to be used with caution as it deletes the database and all its contents.

`DROP DATABASE test;`

## Create A Table

A table consists of 3 things column + 

