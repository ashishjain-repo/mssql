# T-SQL Fundamentals, 4th Edition Notes:-
## Single-Table Queries
### Elements of the Select statement
This is the order in which SQL query is exectued:-
1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. ORDER BY
The sql query starts with SELECT syntactically but is processed in the order mentioned above.
- The `From` Clause: -
    1. The FROM clause is where we describe which table will be used.
    2. When using Table names specifying the schema name before the table helps SQL Server, and is safe.
    3. We can use these identifiers to get to the table for example:`FROM Sales.Order`, here Sales is a schema and Order is a table.
- The `WHERE` Clause: -
    1. In WHERE clause we specify a predicate or logical expression to filter the rows returned by the FROM.
    2. WHERE clause only return the rows which makes the Logical Expression TRUE.
    3. WHERE clause uses Indexes which can get the required data with less work as compared to applying full table scans.
    4. There are three logical expression values TRUE, FALSE, and UNKNOWN.
- The 'GROUP BY` Clause: -


