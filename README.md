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