mysql> use sqlprac;
Database changed

mysql> CREATE TABLE Employees (
    ->     emp_id INT PRIMARY KEY,
    ->     emp_name VARCHAR(50) NOT NULL,
    ->     department VARCHAR(30),
    ->     salary DECIMAL(10, 2),
    ->     joining_date DATE,
    ->     city VARCHAR(30)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> INSERT INTO Employees (emp_id, emp_name, department, salary, joining_date, city)
    -> VALUES
    -> (1, 'Alice', 'HR', 50000.00, '2020-01-15', 'Delhi'),
    -> (2, 'Bob', 'IT', 70000.00, '2019-03-10', 'Mumbai'),
    -> (3, 'Charlie', 'IT', 65000.00, '2021-07-01', 'Mumbai'),
    -> (4, 'David', 'Finance', 60000.00, '2020-06-12', 'Delhi'),
    -> (5, 'Eva', 'HR', 52000.00, '2022-02-25', 'Delhi'),
    -> (6, 'Frank', 'Finance', 61000.00, '2023-03-01', 'Bangalore');
Query OK, 6 rows affected (0.03 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> select * from Employees;
+--------+----------+------------+----------+--------------+-----------+
| emp_id | emp_name | department | salary   | joining_date | city      |
+--------+----------+------------+----------+--------------+-----------+
|      1 | Alice    | HR         | 50000.00 | 2020-01-15   | Delhi     |
|      2 | Bob      | IT         | 70000.00 | 2019-03-10   | Mumbai    |
|      3 | Charlie  | IT         | 65000.00 | 2021-07-01   | Mumbai    |
|      4 | David    | Finance    | 60000.00 | 2020-06-12   | Delhi     |
|      5 | Eva      | HR         | 52000.00 | 2022-02-25   | Delhi     |
|      6 | Frank    | Finance    | 61000.00 | 2023-03-01   | Bangalore |
+--------+----------+------------+----------+--------------+-----------+
6 rows in set (0.01 sec)

mysql> CREATE TABLE Sales (
    ->     sale_id INT PRIMARY KEY,
    ->     emp_id INT,
    ->     sale_amount DECIMAL(10, 2),
    ->     sale_date DATE,
    ->     region VARCHAR(30),
    ->     FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> INSERT INTO Sales (sale_id, emp_id, sale_amount, sale_date, region)
    -> VALUES
    -> (101, 1, 15000.00, '2023-01-10', 'North'),
    -> (102, 2, 30000.00, '2023-02-15', 'West'),
    -> (103, 2, 25000.00, '2023-02-25', 'West'),
    -> (104, 3, 20000.00, '2023-03-05', 'West'),
    -> (105, 4, 18000.00, '2023-03-20', 'North'),
    -> (106, 1, 22000.00, '2023-04-10', 'North'),
    -> (107, 5, 21000.00, '2023-04-15', 'South'),
    -> (108, 6, 24000.00, '2023-04-20', 'South');
Query OK, 8 rows affected (0.02 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> select * from Sales;
+---------+--------+-------------+------------+--------+
| sale_id | emp_id | sale_amount | sale_date  | region |
+---------+--------+-------------+------------+--------+
|     101 |      1 |    15000.00 | 2023-01-10 | North  |
|     102 |      2 |    30000.00 | 2023-02-15 | West   |
|     103 |      2 |    25000.00 | 2023-02-25 | West   |
|     104 |      3 |    20000.00 | 2023-03-05 | West   |
|     105 |      4 |    18000.00 | 2023-03-20 | North  |
|     106 |      1 |    22000.00 | 2023-04-10 | North  |
|     107 |      5 |    21000.00 | 2023-04-15 | South  |
|     108 |      6 |    24000.00 | 2023-04-20 | South  |
+---------+--------+-------------+------------+--------+
8 rows in set (0.00 sec)

mysql> select department,AVG(salary) from Employees GROUP BY department; 
+------------+--------------+
| department | AVG(salary)  |
+------------+--------------+
| HR         | 51000.000000 |
| IT         | 67500.000000 |
| Finance    | 60500.000000 |
+------------+--------------+
3 rows in set (0.02 sec)

mysql> select department ,AVG(salary) OVER (PARTITION BY department) from Employees emp JOIN Sales sal ON emp.emp_id=sal.emp_id;
+------------+--------------------------------------------+
| department | AVG(salary) OVER (PARTITION BY department) |
+------------+--------------------------------------------+
| Finance    |                               60500.000000 |
| Finance    |                               60500.000000 |
| HR         |                               50666.666667 |
| HR         |                               50666.666667 |
| HR         |                               50666.666667 |
| IT         |                               68333.333333 |
| IT         |                               68333.333333 |
| IT         |                               68333.333333 |
+------------+--------------------------------------------+
8 rows in set (0.02 sec)

mysql> select * from Employees;
+--------+----------+------------+----------+--------------+-----------+
| emp_id | emp_name | department | salary   | joining_date | city      |
+--------+----------+------------+----------+--------------+-----------+
|      1 | Alice    | HR         | 50000.00 | 2020-01-15   | Delhi     |
|      2 | Bob      | IT         | 70000.00 | 2019-03-10   | Mumbai    |
|      3 | Charlie  | IT         | 65000.00 | 2021-07-01   | Mumbai    |
|      4 | David    | Finance    | 60000.00 | 2020-06-12   | Delhi     |
|      5 | Eva      | HR         | 52000.00 | 2022-02-25   | Delhi     |
|      6 | Frank    | Finance    | 61000.00 | 2023-03-01   | Bangalore |
+--------+----------+------------+----------+--------------+-----------+
6 rows in set (0.01 sec)

mysql> select emp_name,Salary,AVG(salary) OVER(PARTITION BY department) from employees;
+----------+----------+-------------------------------------------+
| emp_name | Salary   | AVG(salary) OVER(PARTITION BY department) |
+----------+----------+-------------------------------------------+
| David    | 60000.00 |                              60500.000000 |
| Frank    | 61000.00 |                              60500.000000 |
| Alice    | 50000.00 |                              51000.000000 |
| Eva      | 52000.00 |                              51000.000000 |
| Bob      | 70000.00 |                              67500.000000 |
| Charlie  | 65000.00 |                              67500.000000 |
+----------+----------+-------------------------------------------+
6 rows in set (0.02 sec)

mysql> select emp_name,Salary,AVG(salary) OVER(PARTITION BY department order by Salary) from employees;
+----------+----------+-----------------------------------------------------------+
| emp_name | Salary   | AVG(salary) OVER(PARTITION BY department order by Salary) |
+----------+----------+-----------------------------------------------------------+
| David    | 60000.00 |                                              60000.000000 |
| Frank    | 61000.00 |                                              60500.000000 |
| Alice    | 50000.00 |                                              50000.000000 |
| Eva      | 52000.00 |                                              51000.000000 |
| Charlie  | 65000.00 |                                              65000.000000 |
| Bob      | 70000.00 |                                              67500.000000 |
+----------+----------+-----------------------------------------------------------+
6 rows in set (0.01 sec)

mysql> 
mysql> select * from Employees;
+--------+----------+------------+----------+--------------+-----------+
| emp_id | emp_name | department | salary   | joining_date | city      |
+--------+----------+------------+----------+--------------+-----------+
|      1 | Alice    | HR         | 50000.00 | 2020-01-15   | Delhi     |
|      2 | Bob      | IT         | 70000.00 | 2019-03-10   | Mumbai    |
|      3 | Charlie  | IT         | 65000.00 | 2021-07-01   | Mumbai    |
|      4 | David    | Finance    | 60000.00 | 2020-06-12   | Delhi     |
|      5 | Eva      | HR         | 52000.00 | 2022-02-25   | Delhi     |
|      6 | Frank    | Finance    | 61000.00 | 2023-03-01   | Bangalore |
+--------+----------+------------+----------+--------------+-----------+
6 rows in set (0.00 sec)

mysql> select * from Sales;
+---------+--------+-------------+------------+--------+
| sale_id | emp_id | sale_amount | sale_date  | region |
+---------+--------+-------------+------------+--------+
|     101 |      1 |    15000.00 | 2023-01-10 | North  |
|     102 |      2 |    30000.00 | 2023-02-15 | West   |
|     103 |      2 |    25000.00 | 2023-02-25 | West   |
|     104 |      3 |    20000.00 | 2023-03-05 | West   |
|     105 |      4 |    18000.00 | 2023-03-20 | North  |
|     106 |      1 |    22000.00 | 2023-04-10 | North  |
|     107 |      5 |    21000.00 | 2023-04-15 | South  |
|     108 |      6 |    24000.00 | 2023-04-20 | South  |
+---------+--------+-------------+------------+--------+
8 rows in set (0.00 sec)

mysql> select emp_name,salary,AVG(salary) OVER (PARTITION BY city) from Employees;
+----------+----------+--------------------------------------+
| emp_name | salary   | AVG(salary) OVER (PARTITION BY city) |
+----------+----------+--------------------------------------+
| Frank    | 61000.00 |                         61000.000000 |
| Alice    | 50000.00 |                         54000.000000 |
| David    | 60000.00 |                         54000.000000 |
| Eva      | 52000.00 |                         54000.000000 |
| Bob      | 70000.00 |                         67500.000000 |
| Charlie  | 65000.00 |                         67500.000000 |
+----------+----------+--------------------------------------+
6 rows in set (0.00 sec)

mysql> select emp_name,salary,AVG(salary) OVER (PARTITION BY city) from Employees emp JOIN Sales ON emp.emp_id=Sales.emp_id ;
+----------+----------+--------------------------------------+
| emp_name | salary   | AVG(salary) OVER (PARTITION BY city) |
+----------+----------+--------------------------------------+
| Frank    | 61000.00 |                         61000.000000 |
| Alice    | 50000.00 |                         53000.000000 |
| Alice    | 50000.00 |                         53000.000000 |
| David    | 60000.00 |                         53000.000000 |
| Eva      | 52000.00 |                         53000.000000 |
| Bob      | 70000.00 |                         68333.333333 |
| Bob      | 70000.00 |                         68333.333333 |
| Charlie  | 65000.00 |                         68333.333333 |
+----------+----------+--------------------------------------+
8 rows in set (0.00 sec)

mysql> select emp.emp_name,emp.salary,AVG(salary) OVER (PARTITION BY city) from Employees emp JOIN Sales ON emp.emp_id=Sales.emp_id ;
+----------+----------+--------------------------------------+
| emp_name | salary   | AVG(salary) OVER (PARTITION BY city) |
+----------+----------+--------------------------------------+
| Frank    | 61000.00 |                         61000.000000 |
| Alice    | 50000.00 |                         53000.000000 |
| Alice    | 50000.00 |                         53000.000000 |
| David    | 60000.00 |                         53000.000000 |
| Eva      | 52000.00 |                         53000.000000 |
| Bob      | 70000.00 |                         68333.333333 |
| Bob      | 70000.00 |                         68333.333333 |
| Charlie  | 65000.00 |                         68333.333333 |
+----------+----------+--------------------------------------+
8 rows in set (0.00 sec)

mysql> select emp_name,salary,SUM(salary) OVER (PARTITION BY city) from Employees  ;
+----------+----------+--------------------------------------+
| emp_name | salary   | SUM(salary) OVER (PARTITION BY city) |
+----------+----------+--------------------------------------+
| Frank    | 61000.00 |                             61000.00 |
| Alice    | 50000.00 |                            162000.00 |
| David    | 60000.00 |                            162000.00 |
| Eva      | 52000.00 |                            162000.00 |
| Bob      | 70000.00 |                            135000.00 |
| Charlie  | 65000.00 |                            135000.00 |
+----------+----------+--------------------------------------+
6 rows in set (0.00 sec)

mysql> select emp_name,salary,SUM(salary) OVER (PARTITION BY city ORDER BY emp_id) from Employees  ;
+----------+----------+------------------------------------------------------+
| emp_name | salary   | SUM(salary) OVER (PARTITION BY city ORDER BY emp_id) |
+----------+----------+------------------------------------------------------+
| Frank    | 61000.00 |                                             61000.00 |
| Alice    | 50000.00 |                                             50000.00 |
| David    | 60000.00 |                                            110000.00 |
| Eva      | 52000.00 |                                            162000.00 |
| Bob      | 70000.00 |                                             70000.00 |
| Charlie  | 65000.00 |                                            135000.00 |
+----------+----------+------------------------------------------------------+
6 rows in set (0.00 sec)

mysql> select emp_name,salary,city,SUM(salary) OVER (PARTITION BY city ORDER BY emp_id) AS Sum from Employees  ;
+----------+----------+-----------+-----------+
| emp_name | salary   | city      | Sum       |
+----------+----------+-----------+-----------+
| Frank    | 61000.00 | Bangalore |  61000.00 |
| Alice    | 50000.00 | Delhi     |  50000.00 |
| David    | 60000.00 | Delhi     | 110000.00 |
| Eva      | 52000.00 | Delhi     | 162000.00 |
| Bob      | 70000.00 | Mumbai    |  70000.00 |
| Charlie  | 65000.00 | Mumbai    | 135000.00 |
+----------+----------+-----------+-----------+
6 rows in set (0.00 sec)

mysql> select emp_id,emp_name,salary,city,SUM(salary) OVER (PARTITION BY city ORDER BY emp_id) AS Sum from Employees  ;
+--------+----------+----------+-----------+-----------+
| emp_id | emp_name | salary   | city      | Sum       |
+--------+----------+----------+-----------+-----------+
|      6 | Frank    | 61000.00 | Bangalore |  61000.00 |
|      1 | Alice    | 50000.00 | Delhi     |  50000.00 |
|      4 | David    | 60000.00 | Delhi     | 110000.00 |
|      5 | Eva      | 52000.00 | Delhi     | 162000.00 |
|      2 | Bob      | 70000.00 | Mumbai    |  70000.00 |
|      3 | Charlie  | 65000.00 | Mumbai    | 135000.00 |
+--------+----------+----------+-----------+-----------+
6 rows in set (0.00 sec)

mysql> -- ROLLING TOTAL
mysql> select emp_id,emp_name,salary,SUM(salary) OVER (PARTITION BY department ORDER BY emp_id) AS Rolling_Total from Employees  ;
+--------+----------+----------+---------------+
| emp_id | emp_name | salary   | Rolling_Total |
+--------+----------+----------+---------------+
|      4 | David    | 60000.00 |      60000.00 |
|      6 | Frank    | 61000.00 |     121000.00 |
|      1 | Alice    | 50000.00 |      50000.00 |
|      5 | Eva      | 52000.00 |     102000.00 |
|      2 | Bob      | 70000.00 |      70000.00 |
|      3 | Charlie  | 65000.00 |     135000.00 |
+--------+----------+----------+---------------+
6 rows in set (0.00 sec)

mysql> select emp_name,salary,SUM(salary) OVER (PARTITION BY department ORDER BY emp_id) AS Rolling_Total from Employees  ;
+----------+----------+---------------+
| emp_name | salary   | Rolling_Total |
+----------+----------+---------------+
| David    | 60000.00 |      60000.00 |
| Frank    | 61000.00 |     121000.00 |
| Alice    | 50000.00 |      50000.00 |
| Eva      | 52000.00 |     102000.00 |
| Bob      | 70000.00 |      70000.00 |
| Charlie  | 65000.00 |     135000.00 |
+----------+----------+---------------+
6 rows in set (0.00 sec)

mysql> -- ROW NUMBER
mysql> select emp_name,salary,ROW_NUMBER() OVER (PARTITION BY department) AS Row_Numbers from Employees  ;
+----------+----------+-------------+
| emp_name | salary   | Row_Numbers |
+----------+----------+-------------+
| David    | 60000.00 |           1 |
| Frank    | 61000.00 |           2 |
| Alice    | 50000.00 |           1 |
| Eva      | 52000.00 |           2 |
| Bob      | 70000.00 |           1 |
| Charlie  | 65000.00 |           2 |
+----------+----------+-------------+
6 rows in set (0.02 sec)

mysql> select emp_name,salary,ROW_NUMBER() OVER () AS Row_Numbers from Employees  ;
+----------+----------+-------------+
| emp_name | salary   | Row_Numbers |
+----------+----------+-------------+
| Alice    | 50000.00 |           1 |
| Bob      | 70000.00 |           2 |
| Charlie  | 65000.00 |           3 |
| David    | 60000.00 |           4 |
| Eva      | 52000.00 |           5 |
| Frank    | 61000.00 |           6 |
+----------+----------+-------------+
6 rows in set (0.00 sec)

mysql> select emp_name,city,ROW_NUMBER() OVER() from Employees;
+----------+-----------+---------------------+
| emp_name | city      | ROW_NUMBER() OVER() |
+----------+-----------+---------------------+
| Alice    | Delhi     |                   1 |
| Bob      | Mumbai    |                   2 |
| Charlie  | Mumbai    |                   3 |
| David    | Delhi     |                   4 |
| Eva      | Delhi     |                   5 |
| Frank    | Bangalore |                   6 |
+----------+-----------+---------------------+
6 rows in set (0.00 sec)

mysql> select emp_name,city,ROW_NUMBER() OVER(PARTITION BY CITY) AS Row_numbers from Employees;
+----------+-----------+-------------+
| emp_name | city      | Row_numbers |
+----------+-----------+-------------+
| Frank    | Bangalore |           1 |
| Alice    | Delhi     |           1 |
| David    | Delhi     |           2 |
| Eva      | Delhi     |           3 |
| Bob      | Mumbai    |           1 |
| Charlie  | Mumbai    |           2 |
+----------+-----------+-------------+
6 rows in set (0.00 sec)

mysql> select emp_name,salary,ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary) AS Row_numbers from Employees;
+----------+----------+-------------+
| emp_name | salary   | Row_numbers |
+----------+----------+-------------+
| David    | 60000.00 |           1 |
| Frank    | 61000.00 |           2 |
| Alice    | 50000.00 |           1 |
| Eva      | 52000.00 |           2 |
| Charlie  | 65000.00 |           1 |
| Bob      | 70000.00 |           2 |
+----------+----------+-------------+
6 rows in set (0.00 sec)

mysql> select emp_name,salary,ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS Row_numbers from Employees;
+----------+----------+-------------+
| emp_name | salary   | Row_numbers |
+----------+----------+-------------+
| Frank    | 61000.00 |           1 |
| David    | 60000.00 |           2 |
| Eva      | 52000.00 |           1 |
| Alice    | 50000.00 |           2 |
| Bob      | 70000.00 |           1 |
| Charlie  | 65000.00 |           2 |
+----------+----------+-------------+
6 rows in set (0.00 sec)

mysql> select emp_name,salary,Department,ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS Row_numbers from Employees;
+----------+----------+------------+-------------+
| emp_name | salary   | Department | Row_numbers |
+----------+----------+------------+-------------+
| Frank    | 61000.00 | Finance    |           1 |
| David    | 60000.00 | Finance    |           2 |
| Eva      | 52000.00 | HR         |           1 |
| Alice    | 50000.00 | HR         |           2 |
| Bob      | 70000.00 | IT         |           1 |
| Charlie  | 65000.00 | IT         |           2 |
+----------+----------+------------+-------------+
6 rows in set (0.00 sec)

mysql> select emp_name,salary,city,ROW_NUMBER() OVER(PARTITION BY city ORDER BY salary DESC) AS Row_numbers from Employees;
+----------+----------+-----------+-------------+
| emp_name | salary   | city      | Row_numbers |
+----------+----------+-----------+-------------+
| Frank    | 61000.00 | Bangalore |           1 |
| David    | 60000.00 | Delhi     |           1 |
| Eva      | 52000.00 | Delhi     |           2 |
| Alice    | 50000.00 | Delhi     |           3 |
| Bob      | 70000.00 | Mumbai    |           1 |
| Charlie  | 65000.00 | Mumbai    |           2 |
+----------+----------+-----------+-------------+
6 rows in set (0.00 sec)

mysql> select * from Employees;
+--------+----------+------------+----------+--------------+-----------+
| emp_id | emp_name | department | salary   | joining_date | city      |
+--------+----------+------------+----------+--------------+-----------+
|      1 | Alice    | HR         | 50000.00 | 2020-01-15   | Delhi     |
|      2 | Bob      | IT         | 70000.00 | 2019-03-10   | Mumbai    |
|      3 | Charlie  | IT         | 65000.00 | 2021-07-01   | Mumbai    |
|      4 | David    | Finance    | 60000.00 | 2020-06-12   | Delhi     |
|      5 | Eva      | HR         | 52000.00 | 2022-02-25   | Delhi     |
|      6 | Frank    | Finance    | 61000.00 | 2023-03-01   | Bangalore |
+--------+----------+------------+----------+--------------+-----------+
6 rows in set (0.00 sec)

mysql> Update Employees set salary=65000 where emp_id=2;
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from Employees;
+--------+----------+------------+----------+--------------+-----------+
| emp_id | emp_name | department | salary   | joining_date | city      |
+--------+----------+------------+----------+--------------+-----------+
|      1 | Alice    | HR         | 50000.00 | 2020-01-15   | Delhi     |
|      2 | Bob      | IT         | 65000.00 | 2019-03-10   | Mumbai    |
|      3 | Charlie  | IT         | 65000.00 | 2021-07-01   | Mumbai    |
|      4 | David    | Finance    | 60000.00 | 2020-06-12   | Delhi     |
|      5 | Eva      | HR         | 52000.00 | 2022-02-25   | Delhi     |
|      6 | Frank    | Finance    | 61000.00 | 2023-03-01   | Bangalore |
+--------+----------+------------+----------+--------------+-----------+
6 rows in set (0.00 sec)

mysql> select emp_name,department ,ROW_NUMBER() OVER(PARTITION BY department) from Employees;
+----------+------------+--------------------------------------------+
| emp_name | department | ROW_NUMBER() OVER(PARTITION BY department) |
+----------+------------+--------------------------------------------+
| David    | Finance    |                                          1 |
| Frank    | Finance    |                                          2 |
| Alice    | HR         |                                          1 |
| Eva      | HR         |                                          2 |
| Bob      | IT         |                                          1 |
| Charlie  | IT         |                                          2 |
+----------+------------+--------------------------------------------+
6 rows in set (0.00 sec)

mysql> select emp_name,salary,ROW_NUMBER() OVER(PARTITION BY department ORDER BY emp_id) AS ROW_NUMBERS from Employees;
+----------+----------+-------------+
| emp_name | salary   | ROW_NUMBERS |
+----------+----------+-------------+
| David    | 60000.00 |           1 |
| Frank    | 61000.00 |           2 |
| Alice    | 50000.00 |           1 |
| Eva      | 52000.00 |           2 |
| Bob      | 65000.00 |           1 |
| Charlie  | 65000.00 |           2 |
+----------+----------+-------------+
6 rows in set (0.00 sec)

mysql> select emp_name,salary,ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS ROW_NUMBERS,RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS RANK_NUM from Employees;
+----------+----------+-------------+----------+
| emp_name | salary   | ROW_NUMBERS | RANK_NUM |
+----------+----------+-------------+----------+
| Frank    | 61000.00 |           1 |        1 |
| David    | 60000.00 |           2 |        2 |
| Eva      | 52000.00 |           1 |        1 |
| Alice    | 50000.00 |           2 |        2 |
| Bob      | 65000.00 |           1 |        1 |
| Charlie  | 65000.00 |           2 |        1 |
+----------+----------+-------------+----------+
6 rows in set (0.02 sec)

mysql> select emp_name,city,ROW_NUMBER() OVER(PARTITION BY city ORDER BY salary DESC) AS ROW_NUMBERS,RANK() OVER(PARTITION BY city ORDER BY salary DESC) AS RANK_NUM from Employees;
+----------+-----------+-------------+----------+
| emp_name | city      | ROW_NUMBERS | RANK_NUM |
+----------+-----------+-------------+----------+
| Frank    | Bangalore |           1 |        1 |
| David    | Delhi     |           1 |        1 |
| Eva      | Delhi     |           2 |        2 |
| Alice    | Delhi     |           3 |        3 |
| Bob      | Mumbai    |           1 |        1 |
| Charlie  | Mumbai    |           2 |        1 |
+----------+-----------+-------------+----------+
6 rows in set (0.00 sec)

mysql> select emp_name,city,salary,ROW_NUMBER() OVER(PARTITION BY city ORDER BY salary DESC) AS ROW_NUMBERS,RANK() OVER(PARTITION BY city ORDER BY salary DESC) AS RANK_NUM from Employees;
+----------+-----------+----------+-------------+----------+
| emp_name | city      | salary   | ROW_NUMBERS | RANK_NUM |
+----------+-----------+----------+-------------+----------+
| Frank    | Bangalore | 61000.00 |           1 |        1 |
| David    | Delhi     | 60000.00 |           1 |        1 |
| Eva      | Delhi     | 52000.00 |           2 |        2 |
| Alice    | Delhi     | 50000.00 |           3 |        3 |
| Bob      | Mumbai    | 65000.00 |           1 |        1 |
| Charlie  | Mumbai    | 65000.00 |           2 |        1 |
+----------+-----------+----------+-------------+----------+
6 rows in set (0.00 sec)

mysql> select emp_name,city,salary,ROW_NUMBER() OVER(PARTITION BY city ORDER BY salary DESC) AS ROW_NUMBERS,RANK() OVER(PARTITION BY city) AS RANK_NUM from Employees;
+----------+-----------+----------+-------------+----------+
| emp_name | city      | salary   | ROW_NUMBERS | RANK_NUM |
+----------+-----------+----------+-------------+----------+
| Frank    | Bangalore | 61000.00 |           1 |        1 |
| David    | Delhi     | 60000.00 |           1 |        1 |
| Eva      | Delhi     | 52000.00 |           2 |        1 |
| Alice    | Delhi     | 50000.00 |           3 |        1 |
| Bob      | Mumbai    | 65000.00 |           1 |        1 |
| Charlie  | Mumbai    | 65000.00 |           2 |        1 |
+----------+-----------+----------+-------------+----------+
6 rows in set (0.00 sec)

mysql> select emp_name,city,salary,ROW_NUMBER() OVER(PARTITION BY city ORDER BY salary DESC) AS ROW_NUMBERS,RANK() OVER(PARTITION BY city) AS RANK_NUM ,DENSE_RANK() OVER(PARTITION BY city) AS DENSE_RANK_num  from Employees;
+----------+-----------+----------+-------------+----------+----------------+
| emp_name | city      | salary   | ROW_NUMBERS | RANK_NUM | DENSE_RANK_num |
+----------+-----------+----------+-------------+----------+----------------+
| Frank    | Bangalore | 61000.00 |           1 |        1 |              1 |
| David    | Delhi     | 60000.00 |           1 |        1 |              1 |
| Eva      | Delhi     | 52000.00 |           2 |        1 |              1 |
| Alice    | Delhi     | 50000.00 |           3 |        1 |              1 |
| Bob      | Mumbai    | 65000.00 |           1 |        1 |              1 |
| Charlie  | Mumbai    | 65000.00 |           2 |        1 |              1 |
+----------+-----------+----------+-------------+----------+----------------+
6 rows in set (0.00 sec)

mysql> select emp_name,city,salary,ROW_NUMBER() OVER(PARTITION BY city ORDER BY salary DESC) AS ROW_NUMBERS,RANK() OVER(PARTITION BY city) AS RANK_NUM ,DENSE_RANK() OVER(PARTITION BY salary order by salary DESC) AS DENSE_RANK_num  from Employees;
+----------+-----------+----------+-------------+----------+----------------+
| emp_name | city      | salary   | ROW_NUMBERS | RANK_NUM | DENSE_RANK_num |
+----------+-----------+----------+-------------+----------+----------------+
| Alice    | Delhi     | 50000.00 |           3 |        1 |              1 |
| Eva      | Delhi     | 52000.00 |           2 |        1 |              1 |
| David    | Delhi     | 60000.00 |           1 |        1 |              1 |
| Frank    | Bangalore | 61000.00 |           1 |        1 |              1 |
| Bob      | Mumbai    | 65000.00 |           1 |        1 |              1 |
| Charlie  | Mumbai    | 65000.00 |           2 |        1 |              1 |
+----------+-----------+----------+-------------+----------+----------------+
6 rows in set (0.00 sec)

mysql> select * from Employees;
+--------+----------+------------+----------+--------------+-----------+
| emp_id | emp_name | department | salary   | joining_date | city      |
+--------+----------+------------+----------+--------------+-----------+
|      1 | Alice    | HR         | 50000.00 | 2020-01-15   | Delhi     |
|      2 | Bob      | IT         | 65000.00 | 2019-03-10   | Mumbai    |
|      3 | Charlie  | IT         | 65000.00 | 2021-07-01   | Mumbai    |
|      4 | David    | Finance    | 60000.00 | 2020-06-12   | Delhi     |
|      5 | Eva      | HR         | 52000.00 | 2022-02-25   | Delhi     |
|      6 | Frank    | Finance    | 61000.00 | 2023-03-01   | Bangalore |
+--------+----------+------------+----------+--------------+-----------+
6 rows in set (0.00 sec)

mysql> select emp_name,salary,city,DENSE_RANK() OVER (PARTITION BY city) from Employees;
+----------+----------+-----------+---------------------------------------+
| emp_name | salary   | city      | DENSE_RANK() OVER (PARTITION BY city) |
+----------+----------+-----------+---------------------------------------+
| Frank    | 61000.00 | Bangalore |                                     1 |
| Alice    | 50000.00 | Delhi     |                                     1 |
| David    | 60000.00 | Delhi     |                                     1 |
| Eva      | 52000.00 | Delhi     |                                     1 |
| Bob      | 65000.00 | Mumbai    |                                     1 |
| Charlie  | 65000.00 | Mumbai    |                                     1 |
+----------+----------+-----------+---------------------------------------+
6 rows in set (0.00 sec)

mysql> select emp_name,salary,city,DENSE_RANK() OVER (PARTITION BY city ORDER BY salary DESC) AS DENSE_RANK_NUM from Employees;
+----------+----------+-----------+----------------+
| emp_name | salary   | city      | DENSE_RANK_NUM |
+----------+----------+-----------+----------------+
| Frank    | 61000.00 | Bangalore |              1 |
| David    | 60000.00 | Delhi     |              1 |
| Eva      | 52000.00 | Delhi     |              2 |
| Alice    | 50000.00 | Delhi     |              3 |
| Bob      | 65000.00 | Mumbai    |              1 |
| Charlie  | 65000.00 | Mumbai    |              1 |
+----------+----------+-----------+----------------+
6 rows in set (0.00 sec)

mysql> insert into Employees values(7, 'Jane', 'Finance', 61000.00, '2023-08-11', 'Mumbai');
Query OK, 1 row affected (0.02 sec)

mysql> select * from Employees;
+--------+----------+------------+----------+--------------+-----------+
| emp_id | emp_name | department | salary   | joining_date | city      |
+--------+----------+------------+----------+--------------+-----------+
|      1 | Alice    | HR         | 50000.00 | 2020-01-15   | Delhi     |
|      2 | Bob      | IT         | 65000.00 | 2019-03-10   | Mumbai    |
|      3 | Charlie  | IT         | 65000.00 | 2021-07-01   | Mumbai    |
|      4 | David    | Finance    | 60000.00 | 2020-06-12   | Delhi     |
|      5 | Eva      | HR         | 52000.00 | 2022-02-25   | Delhi     |
|      6 | Frank    | Finance    | 61000.00 | 2023-03-01   | Bangalore |
|      7 | Jane     | Finance    | 61000.00 | 2023-08-11   | Mumbai    |
+--------+----------+------------+----------+--------------+-----------+
7 rows in set (0.00 sec)

mysql> select emp_name,salary,city,DENSE_RANK() OVER (PARTITION BY city ORDER BY salary DESC) AS DENSE_RANK_NUM from Employees;
+----------+----------+-----------+----------------+
| emp_name | salary   | city      | DENSE_RANK_NUM |
+----------+----------+-----------+----------------+
| Frank    | 61000.00 | Bangalore |              1 |
| David    | 60000.00 | Delhi     |              1 |
| Eva      | 52000.00 | Delhi     |              2 |
| Alice    | 50000.00 | Delhi     |              3 |
| Bob      | 65000.00 | Mumbai    |              1 |
| Charlie  | 65000.00 | Mumbai    |              1 |
| Jane     | 61000.00 | Mumbai    |              2 |
+----------+----------+-----------+----------------+
7 rows in set (0.00 sec)

mysql> select emp_name,salary,city,RANK() OVER (PARTITION BY city ORDER BY salary DESC),DENSE_RANK() OVER (PARTITION BY city ORDER BY salary DESC) AS DENSE_RANK_NUM from Employees;
+----------+----------+-----------+------------------------------------------------------+----------------+
| emp_name | salary   | city      | RANK() OVER (PARTITION BY city ORDER BY salary DESC) | DENSE_RANK_NUM |
+----------+----------+-----------+------------------------------------------------------+----------------+
| Frank    | 61000.00 | Bangalore |                                                    1 |              1 |
| David    | 60000.00 | Delhi     |                                                    1 |              1 |
| Eva      | 52000.00 | Delhi     |                                                    2 |              2 |
| Alice    | 50000.00 | Delhi     |                                                    3 |              3 |
| Bob      | 65000.00 | Mumbai    |                                                    1 |              1 |
| Charlie  | 65000.00 | Mumbai    |                                                    1 |              1 |
| Jane     | 61000.00 | Mumbai    |                                                    3 |              2 |
+----------+----------+-----------+------------------------------------------------------+----------------+
7 rows in set (0.00 sec)

mysql> select emp_name,salary,city,RANK() OVER (PARTITION BY city ORDER BY salary DESC) AS RANK_NUM,DENSE_RANK() OVER (PARTITION BY city ORDER BY salary DESC) AS DENSE_RANK_NUM from Employees;
+----------+----------+-----------+----------+----------------+
| emp_name | salary   | city      | RANK_NUM | DENSE_RANK_NUM |
+----------+----------+-----------+----------+----------------+
| Frank    | 61000.00 | Bangalore |        1 |              1 |
| David    | 60000.00 | Delhi     |        1 |              1 |
| Eva      | 52000.00 | Delhi     |        2 |              2 |
| Alice    | 50000.00 | Delhi     |        3 |              3 |
| Bob      | 65000.00 | Mumbai    |        1 |              1 |
| Charlie  | 65000.00 | Mumbai    |        1 |              1 |
| Jane     | 61000.00 | Mumbai    |        3 |              2 |
+----------+----------+-----------+----------+----------------+
7 rows in set (0.00 sec)

mysql> select emp_name,salary,city,ROW_NUMBER() OVER (PARTITION BY city ORDER BY salary DESC),RANK() OVER (PARTITION BY city ORDER BY salary DESC) AS RANK_NUM,DENSE_RANK() OVER (PARTITION BY city ORDER BY salary DESC) AS DENSE_RANK_NUM from Employees;
+----------+----------+-----------+------------------------------------------------------------+----------+----------------+
| emp_name | salary   | city      | ROW_NUMBER() OVER (PARTITION BY city ORDER BY salary DESC) | RANK_NUM | DENSE_RANK_NUM |
+----------+----------+-----------+------------------------------------------------------------+----------+----------------+
| Frank    | 61000.00 | Bangalore |                                                          1 |        1 |              1 |
| David    | 60000.00 | Delhi     |                                                          1 |        1 |              1 |
| Eva      | 52000.00 | Delhi     |                                                          2 |        2 |              2 |
| Alice    | 50000.00 | Delhi     |                                                          3 |        3 |              3 |
| Bob      | 65000.00 | Mumbai    |                                                          1 |        1 |              1 |
| Charlie  | 65000.00 | Mumbai    |                                                          2 |        1 |              1 |
| Jane     | 61000.00 | Mumbai    |                                                          3 |        3 |              2 |
+----------+----------+-----------+------------------------------------------------------------+----------+----------------+
7 rows in set (0.00 sec)

mysql> select emp_name,salary,city,ROW_NUMBER() OVER (PARTITION BY city ORDER BY salary DESC) AS ROW_NUM,RANK() OVER (PARTITION BY city ORDER BY salary DESC) AS RANK_NUM,DENSE_RANK() OVER (PARTITION BY city ORDER BY salary DESC) AS DENSE_RANK_NUM from Employees;
+----------+----------+-----------+---------+----------+----------------+
| emp_name | salary   | city      | ROW_NUM | RANK_NUM | DENSE_RANK_NUM |
+----------+----------+-----------+---------+----------+----------------+
| Frank    | 61000.00 | Bangalore |       1 |        1 |              1 |
| David    | 60000.00 | Delhi     |       1 |        1 |              1 |
| Eva      | 52000.00 | Delhi     |       2 |        2 |              2 |
| Alice    | 50000.00 | Delhi     |       3 |        3 |              3 |
| Bob      | 65000.00 | Mumbai    |       1 |        1 |              1 |
| Charlie  | 65000.00 | Mumbai    |       2 |        1 |              1 |
| Jane     | 61000.00 | Mumbai    |       3 |        3 |              2 |
+----------+----------+-----------+---------+----------+----------------+
7 rows in set (0.00 sec)

