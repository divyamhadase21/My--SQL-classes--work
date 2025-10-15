1.) Database Concepts
1. What is a database?
A database is a structured collection of data. It's like an organized digital filing cabinet that
stores information in a way that makes it easy to access, manage, and update.
● Real-life example: A company's employee directory, an online store's product catalog,
or a library's book catalog are all databases.

2. What is the difference between a database and a DBMS?
A database is the data itself, while a DBMS (Database Management System) is the software
used to manage that data. The DBMS is the engine that allows you to create, access, and
manipulate the database.
● Real-life example: Think of a library. The books themselves are the database, and the
librarian (who manages the books, helps you find them, and checks them out) is the
DBMS.

3. What are the different types of databases?
Databases can be categorized in many ways, but the most common types are relational
databases (like MySQL and PostgreSQL), which use tables, and NoSQL databases (like
MongoDB and Redis), which are more flexible and don't use the traditional table structure.
4. What is a relational database?
A relational database is a type of database that stores and provides access to data points
that are related to one another. It organizes data into one or more tables (or "relations") of
rows and columns.
● Real-life example: An online store's database with separate tables for customers,
orders, and products. The customers and orders tables are linked by a customer ID,
showing which customer placed which order.
5. What is normalization? Explain its types.
Normalization is the process of organizing data in a database to reduce data redundancy
and improve data integrity. It's like cleaning up and organizing your data to ensure everything
is stored logically.
The most common types (or normal forms) are:
● 1NF (First Normal Form): Each column must contain atomic (single) values, and there
are no repeating groups of data.
● 2NF (Second Normal Form): The table must be in 1NF, and all non-key attributes must
be fully dependent on the primary key.
● 3NF (Third Normal Form): The table must be in 2NF, and there should be no transitive
dependencies (where a non-key attribute depends on another non-key attribute).
6. What is denormalization?
Denormalization is the process of intentionally adding redundant data to a normalized
database. This is often done to improve query performance by reducing the number of joins
needed to retrieve data, especially in data warehousing or reporting scenarios.
7. What is a primary key? How is it different from a unique key?
A primary key is a special column or set of columns used to uniquely identify each record
(row) in a table. It cannot have NULL values. A unique key, on the other hand, also enforces
uniqueness for a column but can have NULL values. A table can only have one primary key,
but multiple unique keys.
● Real-life example: In a students table, the student_id is a good candidate for a primary
key. The email could be a unique key, as each student has a unique email, but it's possible
a record might not have an email yet.
8. What is a foreign key?
A foreign key is a column in one table that references the primary key of another table. It's
used to link the two tables together and enforce referential integrity, ensuring that the
relationships between data are valid.
● Real-life example: In an orders table, the customer_id column would be a foreign key
that links to the customer_id primary key in the customers table.
9. What are indexes? Why are they used?
Indexes are special data structures that improve the speed of data retrieval operations.
They're like the index at the back of a book, allowing you to quickly find specific information
without reading the whole book. They are used to make SELECT queries faster, especially on
large tables.
10. What is a composite key?
A composite key is a primary key that consists of two or more columns. It is used when a
single column isn't enough to uniquely identify a record.
● Real-life example: In a table that stores course enrollments, a combination of student_id
and course_id could be a composite primary key, as a student can enroll in multiple
courses, and a course can have multiple students.
2.) MySQL Commands
11. What is the purpose of the CREATE command?
The CREATE command is used to create new objects in the database, such as databases,
tables, views, or stored procedures. It's the first step in building your database structure.
12. How do you delete a database in MySQL?
You delete a database using the DROP DATABASE command, followed by the database name.
● Syntax: DROP DATABASE database_name;
13. What is the ALTER command used for?
The ALTER command is used to modify the structure of an existing database object. You can
use it to add, delete, or modify columns in a table, or change the data type of a column.
14. How do you create a table in MySQL?
You create a table using the CREATE TABLE command, specifying the table name and the
columns with their data types and any constraints.
● Syntax: CREATE TABLE table_name ( column1 datatype, column2 datatype, ... );
15. What is the DROP command?
The DROP command is used to completely delete a database object from the database. This
includes tables, views, and indexes. It's a permanent and irreversible action.
● Syntax: DROP TABLE table_name;
16. How do you insert data into a table?
You insert data into a table using the INSERT INTO command. You specify the table name, the
columns you're inserting into, and the values for those columns.
● Syntax: INSERT INTO table_name (column1, column2) VALUES (value1, value2);
17. What is the syntax for updating records in a table?
You update existing records using the UPDATE command, specifying the table name, the
column to change, the new value, and a WHERE clause to specify which records to update.
● Syntax: UPDATE table_name SET column1 = new_value WHERE some_column =
some_value;
18. How do you delete records from a table?
You delete records from a table using the DELETE FROM command, followed by a WHERE
clause to specify which rows to delete. Without a WHERE clause, all records in the table will
be deleted.
● Syntax: DELETE FROM table_name WHERE some_column = some_value;
19. What is the SELECT statement used for?
The SELECT statement is used to retrieve data from a database. It's the most common and
fundamental SQL command.
● Syntax: SELECT column1, column2 FROM table_name;
20. How do you retrieve unique records from a table?
To retrieve only unique records, you use the DISTINCT keyword in your SELECT statement.
● Syntax: SELECT DISTINCT column1 FROM table_name;
3.) Clauses and Operators
21. What is the purpose of the WHERE clause?
The WHERE clause is used to filter records. It specifies a condition that must be met for the
records to be included in the result set. It's used in SELECT, UPDATE, and DELETE statements.
22. Explain the ORDER BY clause.
The ORDER BY clause is used to sort the result set in ascending or descending order. By
default, it sorts in ascending order. You can specify ASC for ascending or DESC for
descending.
● Real-life example: SELECT * FROM employees ORDER BY last_name ASC; would retrieve
all employees and sort them alphabetically by last name.
23. What is the GROUP BY clause used for?
The GROUP BY clause is used to group rows that have the same values into summary rows.
It's often used with aggregate functions (like COUNT, MAX, SUM) to perform calculations on
each group.
● Real-life example: To find the number of employees in each department, you would
GROUP BY department.
24. How do you use the HAVING clause?
The HAVING clause is used to filter groups created by the GROUP BY clause. It's similar to the
WHERE clause, but it operates on grouped data rather than individual records.
● Real-life example: To find departments with more than 10 employees, you would GROUP
BY department HAVING COUNT(*) > 10.
25. What are the different comparison operators in MySQL?
MySQL uses standard comparison operators to compare values. These include:
● = (equal to)
● > (greater than)
● < (less than)
● >= (greater than or equal to)
● <= (less than or equal to)
● <> or != (not equal to)
26. What is the BETWEEN operator?
The BETWEEN operator is used to filter values within a given range. The range is inclusive,
meaning it includes both the start and end values.
● Real-life example: SELECT * FROM products WHERE price BETWEEN 100 AND 200;
would find all products with a price between $100 and $200.
27. Explain the LIKE operator.
The LIKE operator is used to search for a specified pattern in a column. It's often used with
wildcards: % (represents zero or more characters) and _ (represents a single character).
● Real-life example: SELECT * FROM employees WHERE last_name LIKE 'S%'; would find
all employees whose last name starts with 'S'.
28. What is the IN operator?
The IN operator allows you to specify a list of possible values for a column in a WHERE clause.
It's a shorthand for multiple OR conditions.
● Real-life example: SELECT * FROM students WHERE city IN ('New York', 'Los Angeles');
would find all students from either New York or Los Angeles.
29. How do you use the NULL operator?
The NULL operator is used to test for NULL values. You must use IS NULL or IS NOT NULL
because NULL is not a value that can be compared with =, !=, or other comparison operators.
● Real-life example: SELECT * FROM employees WHERE manager_id IS NULL; would find
all employees who don't have a manager.
30. What is the difference between AND and OR operators?
The AND operator combines two or more conditions, and all conditions must be true for the
record to be included. The OR operator also combines conditions, but only one of the
conditions needs to be true.
● Real-life example:
○ WHERE country = 'USA' AND city = 'New York'; (Both must be true)
○ WHERE country = 'USA' OR country = 'Canada'; (Either can be true)
4.) Predefined Functions
31. What are aggregate functions? Give examples.
Aggregate functions perform a calculation on a set of values and return a single value. They
are often used with the GROUP BY clause.
● Examples: COUNT(), SUM(), AVG(), MAX(), MIN().
32. What is the COUNT() function?
The COUNT() function returns the number of rows that match a specified criterion. COUNT(*)
counts all rows, while COUNT(column_name) counts the number of non-NULL values in a
specific column.
33. Explain the SUM() function.
The SUM() function calculates the total sum of a numeric column. It ignores NULL values.
● Real-life example: SELECT SUM(salary) FROM employees; would return the total salary
paid to all employees.
34. What is the AVG() function?
The AVG() function calculates the average value of a numeric column. It ignores NULL values.
● Real-life example: SELECT AVG(score) FROM students; would return the average score
of all students.
35. How does the MAX() function work?
The MAX() function returns the largest value in a selected column.
● Real-life example: SELECT MAX(price) FROM products; would return the highest price
of any product.
36. What is the MIN() function?
The MIN() function returns the smallest value in a selected column.
● Real-life example: SELECT MIN(birthdate) FROM employees; would return the earliest
birthdate, effectively finding the oldest employee.
37. Explain string functions in MySQL.
String functions are used to manipulate and process string data. They can perform tasks like
concatenating strings, changing case, extracting parts of a string, and finding the length of a
string.
● Examples: CONCAT(), UPPER(), LOWER(), SUBSTRING(), LENGTH().
38. What is the CONCAT() function?
The CONCAT() function is used to join two or more strings together to create a single string.
● Real-life example: SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM
employees; would combine the first and last name columns with a space in between.
39. How do you use the SUBSTRING() function?
The SUBSTRING() function extracts a substring of a specified length from a string. You need
to provide the string, the starting position, and the length of the substring to extract.
● Real-life example: SELECT SUBSTRING(email, 1, LOCATE('@', email) - 1) FROM users;
would extract the part of the email address before the '@' symbol.
40. What is the NOW() function?
The NOW() function returns the current date and time. It's a handy way to get a timestamp
for when a record was created or updated.
5.) User -Defined Functions
41. What is a user-defined function (UDF) in MySQL?
A user-defined function (UDF) is a function that you create yourself to perform a specific
task. Unlike built-in functions, UDFs are custom and can be called in SQL statements just like
any other function.
42. How do you create a UDF?
You create a UDF using the CREATE FUNCTION command. You define the function name, its
parameters, the data type it returns, and the body of the function.
● Syntax:
CREATE FUNCTION function_name (parameter1 datatype, ...) RETURNS datatype
BEGIN
-- function body
END;
43. What is the syntax for calling a UDF?
You call a UDF in a SELECT statement just like a built-in function, using its name and providing
the required arguments.
● Syntax: SELECT function_name(argument1, ...);
44. Can UDFs return multiple values?
No, UDFs in MySQL can only return a single value. If you need to return multiple values, you
should consider using a stored procedure instead.
45. What are the advantages of using UDFs?
● Reusability: You can write a function once and use it in multiple queries.
● Encapsulation: They hide complex logic, making your SQL queries cleaner and easier to
read.
● Performance: They can improve performance by reducing network traffic, as the logic is
executed on the database server.
6.) Views
46. What is a view in MySQL?
A view is a virtual table based on the result set of an SQL query. It doesn't store data itself but
instead provides a simplified and secure way to access data from one or more underlying
tables.
47. How do you create a view?
You create a view using the CREATE VIEW command, followed by the view name and the AS
keyword, and then the SELECT statement that defines the view's content.
● Syntax: CREATE VIEW view_name AS SELECT column1, ... FROM table_name WHERE
condition;
48. What is the difference between a view and a table?
A table is a physical structure that stores data on disk. A view is a logical or virtual table that
doesn't store data; it's a saved query. When you query a view, it executes the underlying
SELECT statement to retrieve the data.
49. Can you update a view? If yes, how?
Yes, in many cases, you can update a view. However, there are restrictions. To be updatable,
the view must be based on a single table and not contain GROUP BY, HAVING, or aggregate
functions. You use UPDATE or INSERT commands on the view just like you would on a table.
50. How do you drop a view?
You drop a view using the DROP VIEW command, followed by the view name.
● Syntax: DROP VIEW view_name;
7.) Common Table Expressions (CTE)
51. What is a Common Table Expression (CTE)?
A Common Table Expression (CTE) is a temporary, named result set that you can reference
within a SELECT, INSERT, UPDATE, or DELETE statement. It's a way to simplify complex queries
and make them more readable.
52. How do you create a CTE?
You create a CTE using the WITH clause, followed by a name for the CTE and the AS keyword,
which encloses the defining SELECT statement.
● Syntax:
WITH cte_name AS ( SELECT ... )
SELECT ... FROM cte_name;
53. What is the difference between a CTE and a subquery?
A CTE is typically more readable and can be referenced multiple times within the same query.
A subquery is a nested query that is often more difficult to read when complex. CTEs can also
be recursive, which subqueries cannot.
54. Can you use a CTE recursively?
Yes, one of the key features of CTEs is that they can be recursive. A recursive CTE can
reference itself, which is useful for querying hierarchical data like organizational charts or bill
of materials.
55. How do you reference a CTE in a query?
You reference a CTE by its name in the FROM or JOIN clause of the main query that follows
the WITH clause.
● Syntax: WITH my_cte AS (...) SELECT * FROM my_cte;
8.) Joins
56. What is a join in SQL?
A join is a way of combining rows from two or more tables based on a related column
between them. It's the primary way to link data from different tables in a relational database.
57. Explain the different types of joins.
The main types of joins are:
● INNER JOIN: Returns only the rows where there is a match in both tables.
● LEFT JOIN: Returns all rows from the left table and the matched rows from the right
table.
● RIGHT JOIN: Returns all rows from the right table and the matched rows from the left
table.
● FULL OUTER JOIN: Returns all rows when there is a match in one of the tables.
58. What is an INNER JOIN?
An INNER JOIN is the most common type of join. It returns records that have matching values
in both tables, effectively showing the intersection of the two tables.
● Real-life example: Joining an orders table with a customers table to find all orders that
have a matching customer.
59. What is a LEFT JOIN?
A LEFT JOIN returns all records from the "left" table, and the matching records from the
"right" table. If there is no match, the columns from the right table will have NULL values.
● Real-life example: Joining a customers table with an orders table to find all customers,
and their orders if they have any.
60. What is a RIGHT JOIN?
A RIGHT JOIN is the opposite of a left join. It returns all records from the "right" table and the
matching records from the "left" table. If no match, the left table's columns will have NULL.
61. What is a FULL OUTER JOIN?
A FULL OUTER JOIN returns all records from both tables, combining the results of a left join
and a right join. If there's no match, the non-matching columns will have NULL values. (Note:
MySQL doesn't have a direct FULL OUTER JOIN but it can be simulated using a UNION of
LEFT and RIGHT joins.)
62. How do you perform a CROSS JOIN?
A CROSS JOIN returns the Cartesian product of the two tables, meaning it combines every
row from the first table with every row from the second table. This results in a very large result
set.
● Syntax: SELECT * FROM table1 CROSS JOIN table2;
63. What is a self-join?
A self-join is a regular join where a table is joined with itself. It's used when you need to
compare records within the same table.
● Real-life example: In an employees table, you could self-join to find pairs of employees
who work in the same department.
64. How do you join multiple tables?
You join multiple tables by chaining JOIN clauses together. The process is the same as joining
two tables, you just continue adding more JOIN statements for each additional table,
specifying the join condition.
65. What is the difference between a join and a subquery?
A join combines columns from multiple tables to create a single result set. A subquery is a
query nested inside another query, used to return a single value or a list of values that can
then be used to filter the main query. Joins are generally more efficient for combining tables.
9.) Subqueries
66. What is a subquery?
A subquery is a SELECT statement that is nested inside another SQL statement. It's used to
return data that will be used by the outer query to filter or perform calculations.
67. How do you write a subquery in the SELECT statement?
A subquery in the SELECT statement is also known as a scalar subquery. It must return only
one value and one row. It's used to perform a calculation or lookup for each row of the outer
query.
● Real-life example: SELECT name, (SELECT AVG(salary) FROM employees) AS avg_salary
FROM employees;
68. Can you use a subquery in the WHERE clause?
Yes, this is the most common use of subqueries. The subquery is used to filter the data for the
outer query.
● Real-life example: SELECT * FROM products WHERE product_id IN (SELECT product_id
FROM sales WHERE sales_date >= '2025-01-01');
69. What is a correlated subquery?
A correlated subquery is a subquery that depends on the outer query for its values. It
executes once for each row processed by the outer query, which can make it less efficient
than a non-correlated subquery.
70. How do you handle subqueries that return multiple rows?
When a subquery returns multiple rows, you can't use it with comparison operators like =.
Instead, you use operators like IN, NOT IN, ANY, ALL, or EXISTS to handle the list of values
returned by the subquery.
10.) Stored Procedures
71. What is a stored procedure?
A stored procedure is a prepared SQL code that you can save and reuse. It's a group of SQL
statements that have been compiled and stored in the database.
72. How do you create a stored procedure in MySQL?
You create a stored procedure using the CREATE PROCEDURE command, specifying the
procedure name, any parameters, and the body of the SQL code to be executed. You must set
a temporary delimiter to handle the semicolons within the procedure's body.
73. What is the syntax for calling a stored procedure?
You execute a stored procedure using the CALL command, followed by the procedure name
and any required arguments.
● Syntax: CALL procedure_name(argument1, ...);
74. Can stored procedures accept parameters?
Yes, stored procedures can accept parameters, allowing you to pass values to them at
runtime. Parameters can be of three types: IN (input), OUT (output), and INOUT (both input
and output).
75. What are the advantages of using stored procedures?
● Performance: They are pre-compiled, so they execute faster.
● Security: You can grant permissions to execute a procedure without giving direct access
to the underlying tables.
● Modularity: They centralize logic, making maintenance easier.
● Reduced Network Traffic: Instead of sending multiple SQL statements, you just send a
single CALL command.
11.) Triggers
76. What is a trigger in MySQL?
A trigger is a special type of stored procedure that is automatically executed when a specific
event occurs on a table, such as an INSERT, UPDATE, or DELETE.
77. How do you create a trigger?
You create a trigger using the CREATE TRIGGER command. You specify the trigger's name, the
event (e.g., BEFORE INSERT), the table it's associated with, and the SQL statements to be
executed.
78. What are the different types of triggers?
Triggers are classified by when they fire:
● BEFORE triggers execute before the INSERT, UPDATE, or DELETE operation.
● AFTER triggers execute after the INSERT, UPDATE, or DELETE operation.
79. Can a trigger call a stored procedure?
Yes, a trigger can call a stored procedure. This is a common practice for encapsulating
complex logic that needs to be executed automatically.
80. What is the difference between a trigger and a stored procedure?
A stored procedure is executed explicitly by a user or an application using the CALL
statement. A trigger is executed implicitly (automatically) when a specific database event
occurs, without any direct command from the user.
12.) Data Control Language (DCL)
81. What is Data Control Language (DCL)?
Data Control Language (DCL) is a subset of SQL that deals with database permissions and
user rights. It's used to control who can access and manipulate data.
82. What is the purpose of the GRANT command?
The GRANT command is used to give specific privileges to a user or role. These privileges can
include permissions to SELECT, INSERT, UPDATE, DELETE, etc. on a database, table, or other
object.
83. How do you revoke privileges using the REVOKE command?
The REVOKE command is the opposite of GRANT. It is used to remove or take away privileges
from a user or role.
84. What is the difference between a user and a role in MySQL?
A user is a specific individual or application account that can connect to the database. A role
is a named collection of privileges that can be assigned to one or more users. Using roles
simplifies privilege management, as you can grant privileges to the role and then assign the
role to users.
85. How do you create a new user in MySQL?
You create a new user using the CREATE USER command, specifying the username and the
host from which they can connect, and a password.
● Syntax: CREATE USER 'username'@'host' IDENTIFIED BY 'password';
13.) Transaction Control Language (TCL)
86. What is Transaction Control Language (TCL)?
Transaction Control Language (TCL) is a subset of SQL that manages transactions. A
transaction is a single logical unit of work that contains one or more SQL statements. TCL
commands are used to commit, roll back, or save changes within a transaction.
87. What is the purpose of the COMMIT command?
The COMMIT command is used to permanently save the changes made within a transaction.
Once you COMMIT, the changes cannot be undone.
88. How do you use the ROLLBACK command?
The ROLLBACK command is used to undo all the changes made in the current transaction
since the last COMMIT or SAVEPOINT. It's used to revert the database to its previous state.
89. What is the SAVEPOINT command?
The SAVEPOINT command is used to set a temporary marker within a transaction. This allows
you to ROLLBACK to that specific SAVEPOINT instead of rolling back the entire transaction.
90. How do you set the transaction isolation level?
The transaction isolation level determines how a transaction behaves when multiple
transactions are running concurrently. You set the isolation level using the SET TRANSACTION
command. The most common levels are READ UNCOMMITTED, READ COMMITTED,
REPEATABLE READ, and SERIALIZABLE.
14.) Types of Databases
91. What are the different types of databases (e.g., relational,
NoSQL)?
Databases can be broadly categorized as:
● Relational Databases: Organized into tables with a rigid schema.
● NoSQL Databases: Non-relational, with flexible schemas. They are further divided into
key-value, document, column-family, and graph databases.
● Distributed Databases: Spread across multiple computers.
● Cloud Databases: Optimized to run in a cloud environment.
92. What is the difference between SQL and NoSQL databases?
SQL databases are relational, have a predefined schema, and use a structured query
language (SQL). They are best for structured data where data integrity is critical. NoSQL
databases are non-relational, have a dynamic schema, and are often used for large-scale
unstructured or semi-structured data. They are more flexible and can scale horizontally more
easily.
93. What are some examples of NoSQL databases?
● Document Databases: MongoDB, CouchDB
● Key-Value Stores: Redis, Memcached
● Column-Family Stores: Cassandra, HBase
● Graph Databases: Neo4j, Amazon Neptune
94. What is a distributed database?
A distributed database is a database where the data and the database management system
are spread across multiple network-connected computers. This improves scalability, fault
tolerance, and availability.
95. What is a cloud database?
A cloud database is a database that is built, deployed, and delivered through a cloud
computing platform. Users don't need to manage the underlying hardware, as the cloud
provider handles maintenance and scaling.
15.) Database Management Systems (DBMS)
96. What is a Database Management System (DBMS)?
A Database Management System (DBMS) is software that manages databases. It provides
an interface for users and other applications to interact with the database, allowing them to
define, create, query, and manage data.
97. What are the functions of a DBMS?
● Data Definition: Defining the database schema and structure.
● Data Manipulation: Inserting, updating, and deleting data.
● Data Retrieval: Querying the data.
● Data Security and Integrity: Ensuring data is protected and consistent.
● Backup and Recovery: Handling data loss and restoring the database.
98. What is the difference between a DBMS and a RDBMS?
A DBMS is a general term for any software that manages a database. A RDBMS (Relational
Database Management System) is a specific type of DBMS that is based on the relational
model, using tables with rows and columns. All RDBMS are DBMS, but not all DBMS are
RDBMS.
99. What are some popular DBMS software?
● RDBMS: MySQL, PostgreSQL, Oracle, Microsoft SQL Server
● NoSQL DBMS: MongoDB, Cassandra, Redis
100. What is data integrity, and how does a DBMS ensure it?
Data integrity refers to the accuracy, consistency, and reliability of data. A DBMS ensures it
through various mechanisms:
● Constraints: Defining rules like PRIMARY KEY and FOREIGN KEY to enforce relationships
and uniqueness.
● Data Types: Enforcing that data in a column is of a specific type (e.g., INT, VARCHAR).
● Transaction Management (ACID properties): Ensuring that transactions are atomic,
consistent, isolated, and durable.
● Referential Integrity: Using foreign keys to ensure that relationships between tables are
maintained.
