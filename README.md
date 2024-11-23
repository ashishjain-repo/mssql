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
