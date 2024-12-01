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
- The `GROUP BY` Clause: -
    1. The groups are determined by the elements, or expressions, you specify in the `GROUP BY` clause.
    2. GROUP BY phases produces a group for each disctict combination.
- The `HAVING` Clause: -
    1. The `WHERE` clause is a row filter, and `HAVING` is a group filter.
    2. ONly groups which `HAVING` predicates evaluteas to TRUE are returned by the `HAVING` phase.
    3. Groups that predicate values to FALSE or UNKNOWN are discarded.
- The `SELECT` Clause: -
    1. Specifies columns to return; can exclude expressions.
    2. use `AS` for clean naming; aliasing not usable in WHERE or HAVING clauses.
    3. Missing commas create unintended aliases; repeat expressions instead of relying on aliases
    4. SQL allows duplicate rows, use `DISTINCT` to remove duplicates.
    5. Explicit column listing is preferred over `SELECT *` despite minimal performance impact.
- The `ORDER BY` Clause: -
    1. `ORDER BY` can sort the rows in the output for presentation purposes.
    2. When not explicitly told to SQL Server about the order, it returns the results in any order.
- The `TOP` and `OFFSET-FETCH` filters: -
    1. The `TOP` filter is proprietary T-SQL feature, and it limits the number of rows your query returns.
    2. In order to use this filter we have to specify the number, and order.
    3. This will return the recent number of query data or the top for example we want top 5 and in Descending order. So it will return top 5 rows in descending order.
    4. TOP filter is handled after DISTINCT, which means it is evaluated after duplicate rows have been removed.
    

