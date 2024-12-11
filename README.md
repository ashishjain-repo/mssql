# Section 1
## Database Setup
### Set Up AdventureWorks Database
We are going to add AdventureWorks database in our database to learn about SQL Server. We are going to check our SQL SERVER version to download the compatilble database files. To check the vreesion we can use this command `SELECT @@VERSION`. This will return the information about our sql server. Now after downloading the compatible version we are going to add that .bak file in the backup folder in our sql server. Now we are going to use Restore Database to get the database up and running.

### Explore Database Structure
In this database we have multiple schemas, and every schema have their own tables, when we want to query data from any schema or a table, we have to specifiy the name of the Schema and then the name of the table. Our database name is AdventureWorks but it has multiple schemas like HR, Person, Production and more, so when referring to the table lets sat Address and all the schema have address table, we can specify the particular name of the schema and then the name of the table to get the accurate results. For example: `Person.Address`. We can also chain it with the database name something like this: `AdventureWorks.HumanResources.Department`. When the tables are created without the schema name they are created in the default schema, which generally starts with `dbo`.

## Introduction to Data Definition Language
### Create Database with SQL Commands
To create the database we use the reserved keyword `CREATE DATABASE` after this we specify the name of the Database. It is a good practice to not add spaces in the naming of Database, Schema or Columns. Instead we should use CamelCase, or SnakeCase.

### Drop Database with SQL Commands
To drop or remove the database from the system we have to use the keyword `DROP DATABASE` and then the name of the database that needs to be dropped.

### Create and Drop Tables with SQL Commands
To create a table first we have to target a database which can be done using the `USE` keyword and the name of the database. Then we use the keyword `CREATE TABLE` and the name of the table to create table, but we also have to add the columns that are going to be added in it, for which we use `()` and pass the name of the columns, their type, any constraints. This is a Create table operation: -
```
CREATE TABLE Employees
(
	Id INTEGER PRIMARY KEY IDENTITY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	DateOfBirth DATETIME2 NULL
);
```
Here IDENTITY is auto-increment, and DATETIME2 is the type which contains wide range of the datetime values. Id is a primary key and VARCHAR is the string and we are limiting it to 50 charachters. We are also telling the table that when the data is being entered for this table FirstName and LastName cannot be null there has to be a value, but DateOfBirth can be null.
We use the command or the reserved keyword `DROP TABLE` then name of the table and then upon run the selected table is removed.

### Alter Tables and Add Relationships
We have created a table Employees previously now we added a new table named JobTitle. But now to make a relationship between these two tables we have to introduce a Foreign Key in the Employees table, for that we are going to use the Reserverd Keyword `ALTER TABLE nameOfTheTable` then we specifiy what we want to do, for this example we want to add the column in the table and create a relationship. To create a column in an existing table we will use the following:
```
ALTER TABLE Employees
ADD JobTitleId INTEGER NOT NULL
```
To add a relationship we will do the following: -
```
ALTER TABLE Employee
ADD FOREIGN KEY (JobTitleId) REFERENCES JobTitles(Id);
```
In this we are adding a Foreign Key which is going to be the existing column now JobTitleId and the reference would be the Id Column in the JobTitle table.

### Unique and Default constraints
Unique constraint is used when we want a value in a table only occuring once, for example in the table Employee we might want an employee id and every employee should have a unique id. TO make that happen in the database we mark them as unique so when a value is being added our sql server will check if that value already exists, if not it will be added otherwise an error will occur. Let's alter the table and add that column with unique constraint.
```
ALTER TABLE Employee
ADD EmployeeId VARCHAR(10) UNIQUE NOT NULL;
```

Default constraint is used when some of the input might not be available at that time, for example our employee table can have a EmploymentDate column and the date can be generated default whenever the employee is added, if the date is not provided in that creation, a default date will be given. So instead of it being null we are going to use the function called `GetDate` which return the current date based on computer time.
```
ALTER TABLE Employee
ADD EmploymentDate DateTime2 DEFAULT GetDate();
```

### Drop Columns and Constraints
We can also drop some columns or the constraint in the table. To achieve this we will use ALTER, and after that we will be using DROP and COLUMN keyword then the name of the column. Here is the example:
```
ALTER TABLE Employee
DROP COLUMN DateOfBirth;
```
We can also change the datatype using the ALTER, because in DateOfBirth we are not looking for the time of birth but we used the `DATETIME2` datatype. We can do the following:
```
ALTER COLUMN DateOfBirth DATE;
```
To drop the constraint we have to make sure we have the name of the constraint, because if we do not set up the name of the contraint like keyname, SQL Server will automatically create one for us. Make sure to use that KeyName to drop it. Here is the example:
```
ALTER TABLE Employee
DROP CONSTRAINT UQ__Employee__7AD04F105D8A6AB7;
```
To add the name of the constraint we can do this:
```
ALTER TABLE Employee
ADD CONSTRAINT UQ_EmployeeId UNIQUE(EmployeeId);
```
This code implies that EMployeeId column already exists.

# Section 3
## Reading Data

### Getting Started: SELECT Queries
To read data from a table we use the keyword `SELECT` and then we mention that name of the columns and after we mention the keyword `FROM` to refer to the table that we want the data from, and after this we add the name of the table. To select all the data in the table, which means all the column and row we use this:
```
SELECT * FROM tableName;
```
Make sure you are connected to the database before running any SELECT operation.

Since we are getting all the data from the table this could return a large dataset which might required more resources, and could be tedious to get the information which we are looking for. To limit the number of rows return we can add a filter which will return the only top number of rows. To perform this operation we use the function top with the total numbers of rows we would like to return `TOP(number)`. The query would look somthing like this:
```
SELECT TOP(100) * FROM tableName;
```

To select specific columns what we can do is instead of using `*` which means all, we can use the name of the columns that are in the table. Here is the example:
```
SELECT column1, column2 FROM tableName;
```

Since we are using AdventureWorks database this is the queries for that database that we just learned:
```
USE AdventureWorks2022;
SELECT * FROM HumanResources.Employee;
SELECT TOP(100) * FROM HumanResources.Employee;
SELECT LoginId, jobTitle, HireDate FROM HumanResources.Employee;
```


### Filtering and Sorting Data
There are various methods that we can use to filter data, the very basic filtering methods would be `WHERE` clause, in which we mention that which column contains what and show the results based on that. For example we can look for in a table of Employee where there is a column salary and we would like to see where the salary is above 100,000, in this case we will use the WHERE clause. We can also use the conditional operations like `>, <, >=, <=, <>, =`.
Here is the example:
```
SELECT * FROM Employee
WHERE salary > 100000;
```
We can also pair the conditions with `AND` or `OR` conditions in the where clause. Here is the example:
```
SELECT * FROM Employee
WHERE salary > 10000 AND position = 'Software Developer';
```

We can sort the data by using the `ORDER BY` clause in which we can mention the column which we would like to order based on, since this is not filtering it will return everything that is being asked in the SELECT unless we pair our select statement with WHERE clause. Here is the example:
```
SELECT * FROM employee
ORDER BY HireDate;
```
The default behaviour of the ORDER BY is Ascending order but we can explicitly can tell the Server to make it descending by using `DESC` after the name of the column in the ORDER BY.

Here is the code for the AdventureWorks database:
```
USE AdventureWorks2022;

-- Filtering
SELECT * FROM HumanResources.Employee
WHERE JobTitle = 'Marketing Assistant';

SELECT * FROM HumanResources.Employee
WHERE BusinessEntityID = 20;

SELECT * FROM HumanResources.Employee
WHERE JobTitle = 'Marketing Assistant' AND Gender = 'M';

-- Sorting
SELECT * FROM HumanResources.Employee
ORDER BY HireDate;

SELECT * FROM HumanResources.Employee
ORDER BY HireDate DESC;

```

### Filtering with Wild Cards
Wild card is a pattern of values that helps us filter the result based on that pattern. Upon using wild card the server return the dataset that matches the pattern that is provided, and it can return one to many rows. So if one column contains many names but for example we only want to search for the names that starts with John or first name is Jhon, we can use the following example:
```
SELECT * FROM employee
WHERE name LIKE 'John%';
```
This is not the only way of doing it, we can also use the wild card in many ways to make different patterns. Here is the example for last name (Silva):-
```
SELECT * FROM employee
WHERE name LIKE '%Silva';
```
Here is the example of the substring anywhere in the string, for example (Gavin) anywhere in the string:
```
SELECT * FROM employee
WHERE name LIKE '%Gavin%';
```

Here is the example of the WIld Card with AdventureWorks database:
```
USE AdventureWorks2022;

-- Anywhere in the string
SELECT * FROM HumanResources.Employee
WHERE JobTitle LIKE '%Marketing%';

-- Starts with
SELECT * FROM HumanResources.Employee
WHERE JobTitle LIKE 'Quality%';

-- Ends with
SELECT * FROM HumanResources.Employee
WHERE JobTitle LIKE '%Manager';
```

### Combine Multiple Tables with JOINs
In this example we are going to connect the two tables using Joins, we are using AdventureWorks database and we are using HumanResources Schema in it, we are going to be connection employee and department table together. The easiest join we can make is `INNER JOIN` and in this join we join tables where their data matches, or easiest example would me Many-to-Many relationship tables, because in those table we have a table that joins two tables together it is also called Linking table, or bridge table. Here is the example with AdventureWorks database:
```
SELECT 
	Emp.JobTitle [Job Title]
,	Emp.HireDate [Hire Date]
,	CASE
		WHEN SalariedFlag > 0 THEN 'True'
		ELSE 'False'
	END AS [Paid Employee?]
FROM HumanResources.Employee AS Emp
INNER JOIN HumanResources.EmployeeDepartmentHistory AS Hist
	ON Emp.BusinessEntityID = Hist.BusinessEntityID
INNER JOIN HumanResources.Department AS Dep
	ON Hist.DepartmentID = Dep.DepartmentID
ORDER BY Dep.Name;
```

We have other joins as well which do not directly depend on the relationship between the data. We are going to use Left Joins to achieve the results. The `LEFT JOIN` results in the giving priority to the left columns and if there is some values in the right then show the values otherwise priortize Left. This is the same case with `RIGHT JOIN` but the order is different the preference will be given to the Right table and if the Right Join the only last table the priority goes to itself. Here is the example with AdventureWorks database:
```
SELECT
	Prod.Name
,	Prod.ProductNumber
,	Work.WorkOrderID
,	Work.OrderQty
,	Work.StockedQty
,	Scrap.Name
FROM Production.Product Prod
INNER JOIN Production.WorkOrder Work
	ON Work.ProductID = Prod.ProductID
LEFT JOIN Production.ScrapReason Scrap
	ON Scrap.ScrapReasonID = Work.ScrapReasonID;
```

### UNION and UNION ALL
`UNION` combines the result of two queries and removes duplicates, showing only unique rows. On that other hand `UNION ALL` combines the result of two queries but include all rows allowing duplicates.
Here is the code for both UNION and UNION ALL with AdventureWorks database:
```
SELECT Per.FirstName 
FROM HumanResources.Employee Emp
INNER JOIN Person.Person Per 
	ON Emp.BusinessEntityID = Per.BusinessEntityID
UNION
SELECT Per.FirstName
FROM Sales.Customer Cust
INNER JOIN Person.Person Per
	ON Per.BusinessEntityID = Cust.PersonID;

SELECT Per.FirstName 
FROM HumanResources.Employee Emp
INNER JOIN Person.Person Per 
	ON Emp.BusinessEntityID = Per.BusinessEntityID
		UNION ALL
SELECT Per.FirstName
FROM Sales.Customer Cust
INNER JOIN Person.Person Per
	ON Per.BusinessEntityID = Cust.PersonID;
```

### DISTINCT Versus GROUP BY
We use `DISTINCT` keyword in the SELECT when we have a risk of having duplicate values, DISTINCT will clear up the duplicates and give you a clean data. If not used DISTINCT the query will run and the data will be shown as it is, could differ based on the realtionships. We also have to make sure when we are using data we have to use on the correct column, if used on column that can add the potential duplicates, for example DISTINCT on FirstName but also added LastName in select it will still show the duplicates, because now one firstName can have many last names and vice-versa. Here is the quick example with AdventureWorks database:
```
SELECT DISTINCT Per.FirstName
FROM Sales.Customer Cust
INNER JOIN Person.Person Per
	ON Per.BusinessEntityID = Cust.PersonID;
```

When using DISTINCT it keeps the one unique data and eliminate the rest, but when using `GROUP BY` it kees track of the occurences. Since it keeps track of the data we can pair the GROUP BY with aggregate functions to get more out of the exisiting functionallity of GROUP BY. When using GROUP BY if the column that is added in the GROUP BY is not in the select statment it will throw an error, so make sure to use the column in the select statment or with an aggregate function to use GROUP BY on it. Here is the example with AdventureWorks database:
```
SELECT Per.FirstName
FROM Sales.Customer Cust
INNER JOIN Person.Person Per
	ON Per.BusinessEntityID = Cust.PersonID
GROUP BY Per.FirstName
ORDER BY Per.FirstName;
```

### Aggregate functions
Aggregate functions are type of functions that perform operation on multiple rows to return a single result. Aggregate itself means to combine multiple values into a single summary value. The `COUNT` function count the occurences of the rows, and here is the example of the total number of customer counted in our table:
```
-- Find the numbers of Customers
SELECT COUNT(Per.FirstName)
FROM Sales.Customer Cust
INNER JOIN Person.Person Per
	On Per.BusinessEntityID = Cust.PersonID;
```
Now we are going to use the COUNT function to count the occurences of one name, and this query will return the total number of time that one name or data is reoccured. We can also pair this by `HAVING` clause which can help with the conditional logic in an aggregate column:
```
SELECT Per.FirstName [First Name], COUNT(Per.FirstName) [Total Occurence]
FROM Sales.Customer Cust
INNER JOIN Person.Person Per
	ON Per.BusinessEntityID = Cust.PersonID
GROUP BY Per.FirstName
HAVING COUNT(Per.FirstName) > 1
ORDER BY Per.FirstName;
```
We cannot use the WHERE cluse in this because WHERE applies to the column that are in the SELECT clause not a part of the Aggregate function.

Now we are going to be looking at the function to add the values or Sum them up using `SUM` function. This will add the value from each row and return the sum of the numbers. Same way we count the average using the `AVG` function. We also have function to get the minimum value in the column using `MIN` function and maximum value using `MAX` function. Here is the example:
```
SELECT 
	SUM(TotalDue) [Total Sales Amount]
,	AVG(TotalDue) [Average Sales Amount]
,	MIN(TotalDue) [Minimum Sales Amount]
,	MAX(TotalDue) [Maximum Sales Amount]
FROM Sales.SalesOrderHeader;
```

Now we are going to add multiple tables together and gather all the data of the sales and see the sales individually done by the salesman and perform aggregate functions on the data:
```
SELECT
	P.FirstName
,	P.LastName
,	SUM(H.TotalDue) [Total Sales]
,	AVG(H.TotalDue)	[Average Sales Amount]
,	MIN(H.TotalDue) [Lowest Sale Amount]
,	MAX(H.TotalDue) [Highest Sale Amount]
,	COUNT(H.TotalDue) [Number of Sales]
FROM Sales.SalesPerson S
INNER JOIN Person.Person P
	ON S.BusinessEntityID = P.BusinessEntityID
INNER JOIN Sales.SalesOrderHeader H
	ON H.SalesPersonID = S.BusinessEntityID
GROUP BY P.FirstName, P.LastName
ORDER BY MAX(H.TotalDue) DESC;
```
### String Manipulation
We are going to use String Manipulation functions in the previous query that we used for Aggregate functions and make the Full Name appear and currency with formatted values. 

To join the two columns firstName and lastname we can use the function called `CONCAT` and concatenate the two string together, or use the `+` add sign and join the string. If we are going to use the `CONCAT` function and to pass the space in the middle we can add the gap by using the single quotes with a one character empty space in it, same applies for the sign just seperated byt the `+` instead of commas.

Now our numbers in the results are not formatted and it is hard to read and make the meaning out of those number. We can use the function called `FORMAT` and pass two parameters, first the value itself or column and second the way we want it to be formatted. Since we are dealing with currency here, the option for that is character `'C'`. After applying this to our Total sales column the results start with `$` and there are only 2 digits after decmial and the values are rounded to the nearest hunderd. We also have function called `TRIM` which trims the empty spaces from both ends, similarly we have `LTRIM` for extra space on left and `RTRIM` to do that same on the right.

Here is the code:
```
SELECT
	CONCAT(P.FirstName,' ',P.LastName) [Full Name]
,	FORMAT(SUM(H.TotalDue),'C') [Total Sales]
,	FORMAT(AVG(H.TotalDue), 'C') [Average Sales Amount]
,	FORMAT(MIN(H.TotalDue), 'C') [Lowest Sale Amount]
,	FORMAT(MAX(H.TotalDue), 'C') [Highest Sale Amount]
,	COUNT(H.TotalDue) [Number of Sales]
FROM Sales.SalesPerson S
INNER JOIN Person.Person P
	ON S.BusinessEntityID = P.BusinessEntityID
INNER JOIN Sales.SalesOrderHeader H
	ON H.SalesPersonID = S.BusinessEntityID
GROUP BY P.FirstName, P.LastName
ORDER BY MAX(H.TotalDue) DESC;
```

# Section 4
## More Read Query Concepts

### Using Subqueries
Sub query is a query inside a query. For this we have an example where we want to return a result set of avaergae number of vacations hours used by an empoyee. We can acheive this result by getting the average with one query and then using another query to show the vacation hour on that average. But the vacation hours may change in future and using literal values in the query is not very useful. We can acheive these results by adding that query that gives us the average in the WHERE clause. And we can put the query in the parantheses and the result return by the query will with numericals based on the column we choose and where clause will determine the result based on that. Here is an example:
```
SELECT
	Emp.BusinessEntityID
,	Emp.LoginID
,	Emp.JobTitle
,	Emp.VacationHours
FROM HumanResources.Employee Emp
WHERE Emp.VacationHours > 
(
	SELECT AVG(Emp.VacationHours)
	FROM HumanResources.Employee Emp
);
```

We can also find the average vacation hours based on the Jobtitle by doing a SELF JOIN and using a subquery in the JOIN statement. Here is the example:
```
SELECT 
	Emp.BusinessEntityID
,	Emp.LoginID
,	Emp.JobTitle
,	Emp.VacationHours
,	Sub.[Average Vacation]
FROM HumanResources.Employee Emp
JOIN (
		SELECT
		JobTitle,
		AVG(VacationHours) [Average Vacation]
		FROM HumanResources.Employee
		GROUP BY JobTitle
) Sub
	ON Emp.JobTitle = Sub.JobTitle
	WHERE Emp.VacationHours > Sub.[Average Vacation] AND Emp.JobTitle = 'Accountant'
	ORDER BY Emp.JobTitle;
```

Subqueries is a query nested inside another SQL query. It is used to retrieve data that will be used in the main query. Subquery can be placed anywhere, as long as the syntax and login align with the query requirments.