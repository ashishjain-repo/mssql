# MSSQL

## Creating a database using Script:
- When creating a database in MSSQL we have to make sure we are using the master database, and to do that we can put `use master;` at the top of the script so when we run the script the system will switch to the master if already is not on master and then run the query.
- To create a database we use the reserved keywords `CREATE DATABASE nameOfTheDatabase;`, this line will run a reserve some space for us and create a database.
- When running queries it is important for us to end it with a semi-colon to tell the system that our query is ready to be dispatched. The semicolon in database is not the statement terminator, but it is a dispatch operator. We can also use `GO` instead of `;` in MSSQL.

## How to remove database: