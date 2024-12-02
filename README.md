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

