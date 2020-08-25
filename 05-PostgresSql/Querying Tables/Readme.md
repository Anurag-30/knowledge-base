## SELECT command with ORDER BY

So far we have been doing a `SELECT * FROM <Table Name>` to get all the records in the table. Similarly we can do the following things to get/sort the data. <br />

1. To get data of a specific column we can use. <br />

`SELECT <column_name> FROM <table_name>;` <br />

2. Sorting the output using `ORDER BY`. By default the behaviour of `ORDER BY` is that it gives the output in Ascending order, you can specify it to use descending order explicitly. <br />

`SELECT * FROM <table_name> ORDER BY <column_name> DESC;` <br />

The order by is case-sensitive in nature i.e a != A , so at times sort doesn't work as expected. You can convert all the values to `LOWER` or `UPPER` to maintain consistency. <br />

`SELECT first_name FROM person ORDER BY LOWER(first_name);` <br />


## SELECT command with WHERE clause and conditions

Many times you come across a table with 1000's of records or more , you want to search for data that meets a specific criteria for example getting the list of people who are orlder than 25. We can do it using `WHERE` clause and conditions along with it. <br />

` SELECT first_name FROM person WHERE gender = 'female' AND (age > 23 AND age <= 30) ORDER BY DESC;` <br />

The above query can be used to retrieve all the first names from the table `person` where the gender is female and age is in between 24 and 30. The output is then sorted by using ORDER BY in descending order. <br />

## LIMIT and OFFSET

`SELECT * FROM person LIMIT 15;` <br />

If you want to limit the number of records that you want to have we can use the `LIMIT`. Using the above query we can restrict the output to the first 15 records of occurence instead of all. <br />

`SELECT * FROM person OFFSET 10 LIMIT 5;` <br />

`OFFSET` can be used to set the starting number of the record. The above statement gives the records between 10 to 15 from the total occurences. <br />

We can provide a list of parameters that we want to query instead of writing a sequence of `OR` or `AND` conditions using `IN`. <br />

`SELECT * FROM person WHERE country_of_birth IN ('India' , 'China' , 'Brazil');` <br />

This statements returns all the records that matches the country value with India, China or Brazil. </br>

## BETWEEN , LIKE and ILIKE

If you want to run queries between a certain range we can use `BETWEEN` to get the records of specified ranges. <br />

`SELECT first_name FROM person WHERE date_of_birth BETWEEN DATE '2019-01-01' AND '2020-01-01' ;` <br />

This statement gets all the first names who were born between 2019 and 2020. <br />

`LIKE` and `ALIKE` commands can be used to search using wildcards. <br />

`SELECT * FROM person WHERE first_name ILIKE '%oe';` <br />

This statement returns all the name that ends with oe.


## GROUP BY , GROUP BY HAVING

`SELECT birth_by_country , COUNT(*) FROM person GROUP BY birth_by_country;` <br />

The above query gets the list of all the countries and prints the number of people from the country. GROUP BY is a powerful command which allows you to show the statastics of your data. <br />


## Aggregate Functions

Aggregate functions are helpful to do computations on the columns like AVG,SUM,COUNT,MIN,MAX etc <br />

`SELECT AVG(income) FROM employee;`

## COALESCE , NOW

If you want to replace an empty feild with a certain value you can use `COALESCE` command. The below statement replaces all the null's in email to email not provided <br />

`SELECT COALESCE(email,'email not provided') from person;` <br />

NOW

