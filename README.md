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

## Insert Data into the Table Using SSMS
- We can right click on the table we want to enter data in and can select Edit top 200 rows, and it will give us an editor where we can enter data and save it into the table.
- If the table does not meet the rules that we set while creating, it will TRUNCATE the value and create a new row which will automatically change the Primary Key of that if the primary key is set to IDENTITY.

## Insert Data into the Table Using Script
- To insert the date in the table we use the keyword `INSERT INTO tablename`.
- WHen inserting data in a table where we set up the Primary key to be Identity does not require to add value for it, because it will be done for you.
- We also have to metion the name of the columns in after the table in parantheses, but if we omit the name of the columns and jump straight to the values, we have to follow the order of the values.
- But if we use columns we can set the order based on our preference in the columns and then we can add based on the Columns order we set.
Here is the example: -
```
INSERT INTO tableName
(
    col_1,
    col_2,
    col_3
)
VALUES
(val_1.1, val_2.1, val_3.1),
(val_1.2, val_2.2, val_3.2),
(val_1.3, val_2.3, val_3.3);
```
Here is another way to do it:-
```
INSERT INTO tableName VALUES
(val_1.1, val_2.1, val_3.1),
(val_1.2, val_2.2, val_3.2),
(val_1.3, val_2.3, val_3.3);
```
The only problem with this one is that if we are not specifying the column and we are omiiting the NULLABLE values it will throw an error. But if you mention those columns and then leave the values for those columns blank or omit them the script will run and sucesfully add the data. Make sure you are not leaving UNIQUE Key Constraints NULL because they can cause error since more than one holds the value NULL which breaks the rule of the key being UNIQUE.

## Select Data from Tables - Simple Queries
- `SELECT` is usd to Get the data from the database, and we also have to mention the name of the table.
- We mention names of the Columns after SELECT to get the specific data from particular columns.
- If we want all the columns to show instead of metioneing all the columns what we can do is omit the columns and add `*` in place of Columns.
- Then we use `FROM` to tell the system which table we are using and then after from we just mention the name of the table.
- Here is the example:-
    ```
    SELECT col1, col2 FROM table;
    SELECT * FROM table;
    ```
- In MSSQL we can use `TOP(number of columns)` to get the first total number of column mentioned in the Table. This is how it will look like:-
    ```
    SELECT TOP(100) Col1, Col2
    FROM table;
    ```

## Select Data from Tables - Adding Filters
- `WHERE` we use where caluse when we are filtering the data, this function is conditional and we have to specify what we are looking for. For example: `SELECT Id, Name FROM table WHERE Id = 2;`.
- Make sure you use the accurate datatype when using the column. If the column container integer use interger to filter result, if column is a string use string.
- We can also chain these Conditions using `AND` or `OR`. For example: `SELECT * FROM table WHERE Id = 2 OR Name = 'Jane';` or `SELECT * FROM table WHERE Gender = 'Male' AND Name = 'John';`.
- We can also use Wildcard filter to look for specific data. We use `LIKE` and then the filter is the data we are looking for starts with or endswith or contains something that we have in our filter. The `%` is our wildcard operator. Here is the example: -
    ```
    SELECT * FROM table WHERE FirstName LIKE 'W%'; -- This is for Start with W and does not matter what is after
    SELECT * FROM table WHERE FirstName LIKE '%W'; -- This is for End with W and does not matter what is before
    SELECT * FROM table WHERE FirstName LIKE '%T%'; -- Here we are making sure that data we have should contains 'T' init.
    ```
- Using Where clause with Math Expressions or Logical Operators. Here is the example: -
    ```
    SELECT * FROM table WHERE Age > 20;
    SELECT * FROM table WHERE Age < 60;
    ```