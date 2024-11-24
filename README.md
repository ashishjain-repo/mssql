# MSSQL
# Section 1
## Creating a database using Script:
- When creating a database in MSSQL we have to make sure we are using the master database, and to do that we can put `use master;` at the top of the script so when we run the script the system will switch to the master if already is not on master and then run the query.
- To create a database we use the reserved keywords `CREATE DATABASE nameOfTheDatabase;`, this line will run a reserve some space for us and create a database.
- When running queries it is important for us to end it with a semi-colon to tell the system that our query is ready to be dispatched. The semicolon in database is not the statement terminator, but it is a dispatch operator.

## How to remove database:
- We can remove database by using the UI in Sql Server Managment Studio (SSMS).
- To remove database using script we have to make sure we are using Master, and then we use reserverd keywords `DROP DATABASE nameOfTheDatabase;` and this script will remove the database.

## How to change database name:
- Using the script we can use the master and then we use reserved keywords `ALTER DATABASE currentNameOfDB MODIFY NAME = newNameOfDB;`.

### Section 1 End:
- We can use `--` to add comment in our script.

# Section 2
## What is a Database Table?
- A database consists of one or more tables.
- Each table is made up of rows and columns.
    1. Rows are record containing data points on an object
    2. Columns contain data points (text, numbers, dates, etc...)
- Each row or record should be uniquely identifiable using a Primary Key
- Can also have Indexes or Alternative keys
- Primary Keys and Indexes
    1. A primary Key is a unique value
    2. Primary key should never repeat
    3. In SQL Server, we use `IDENTITY` to automatically generate Primary Key values.
    4. Every Table should have a Primary Key, there are also some exceptions
    5. Indexes are other unique values that a record can have. They can increase data lookup speed, but can reduce insert speed.

## Create Entity Data Model
- We can use a diagram to model our database in which we can sketch out the realtionships of one table to another.

## Create a Database Table Using Management Studio
- We can use UI to create a table, by right-clicking on the database table Directory and creating a new table.
- We will be asked to Add the name of the Column, Type of the data that will be stored, and if the Null value is allowed.
- To make a Column a primary key in UI we can right click on the column and choose the option Primary Key.
- To make the key value auto increment, we can choose the Column Properties 'Identity Specification' to Yes, and it will also gives us the option by how many values we would like to increase the value. It will also give options Seed to where to start and how much to skip.
- We can also set a Index on our Columns by right-click and adding the Indexes, where we can specify which Column we are targeting and if we want it to be unique.

## What is SQL?
- SQL is a standard language for storing, manipulating, and retrieving data in databases (Structured Query Langugae)
- DDL (Data Definition Language)
    1. Manipulates the database structure
    2. CREATE, DROP, ALTER are a few commands that performs DDL operations.
- DML (Data Manimulation Language)
    1. Manipulate the data in the database
    2. DELETE, UPDATE, INSER are a few commands that perform DML operations.

## Create a Database table using SQL script
- First to begin with we are going to use the database, in this case it will be the database that we have already created. This should not be master.
- Since we are creating a School Management Database, we are creating a Lecturer table using Script.
- We are going to use the keyword `CREATE TABLE tableName` after this we open parantheses and in that we add `(columnName datatype constraints)`.
- Here is the script: -
```
USE SchoolManagementDB;

CREATE TABLE Lecturer
(
	Id INT PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	DateOfBirth DATE,
	StaffId NVARCHAR(10) NOT NULL UNIQUE
);
```
We have created a table named Lecturer with Five columns. Id column represent that it is a type of an integer and also a PRIMARY KEY, but since we also want it to Auto Increment we added IDENTITY, if we want to pass the Valued to be added and seeds, we can open parantheses after it and pass those values. Then we created First Name and Last Name for which we used NVARCHAR data type with the maximum length of 50 characters, and aslo cannot be NULL, if you omit the NOT NULL it is obvious that the column is Nullable. We created Date of Birth column which have a data type of DATE. Then at last we created staff id which is varchar not null, and UNIQUE which is an index that this value has to be unique in order to be added to the database.