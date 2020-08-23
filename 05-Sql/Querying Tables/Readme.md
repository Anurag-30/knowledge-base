# SELECT command with ORDER BY

So far we have been doing a `SELECT * FROM <Table Name>` to get all the records in the table. Similarly we can do the following things to get/sort the data. <br />

1. To get data of a specific column we can use. <br />

`SELECT <column_name> FROM <table_name>;` <br />

2. Sorting the ourput using `ORDER BY`. By default the behaviour of `ORDER BY` is that it gives the output in Ascending order, you can specify it to use descending order explicitly. <br />

`SELECT * FROM <table_name> ORDER BY <column_name> DESC;` <br />

The order by is case-sensitive in nature i.e a != A , so at times sort doesn't work as expected. You can convert all the values to `LOWER` or `UPPER` to maintain consistency. <br />

`SELECT first_name FROM person ORDER BY LOWER(first_name);` <br />


# SELECT command with WHERE clause and conditions

Many times you come across a table with 1000's of records or more , you want to search for data that meets a specific criteria for example getting the list of people who are orlder than 25. We can do it using `WHERE` clause and conditions along with it. <br />

` SELECT first_name FROM person WHERE gender = 'female' AND (age > 23 AND age <= 30) ORDER BY DESC;` <br />

The above query can be used to retrieve all the first names from the table `person` where the 




