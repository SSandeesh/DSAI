mysql> use sqlprac;
Database changed
mysql> select * from cricketers;
+------+--------+------+---------+----------+
| Id   | Name   | Age  | Address | Salary   |
+------+--------+------+---------+----------+
|   45 | Rohit  |   37 | India   | 50000.00 |
|   18 | Virat  |   36 | India   | 59000.00 |
|    7 | Dhoni  |   43 | India   | 35500.00 |
|   10 | Sachin |   52 | India   | 25000.00 |
|   33 | Hardik |   31 | India   | 45000.50 |
|   49 | Smith  |   36 | Aus     | 47505.50 |
+------+--------+------+---------+----------+
6 rows in set (0.01 sec)

mysql> select * from sponsers;
+------------+--------------+--------------+
| sponser_id | sponser_name | cricketer_Id |
+------------+--------------+--------------+
|          1 | CEAT         |           45 |
|          2 | MRF          |           18 |
|          3 | Reebok       |            7 |
|          4 | MRF          |           10 |
|          5 | SG           |           33 |
|          7 | New Balance  |           49 |
|          6 | Kokaburra    |           14 |
+------------+--------------+--------------+
7 rows in set (0.01 sec)

mysql> select * from cricketers WHERE Id IN
    -> (select cricketer_Id from sponsers Where cricketer_Id < 30);
+------+--------+------+---------+----------+
| Id   | Name   | Age  | Address | Salary   |
+------+--------+------+---------+----------+
|   18 | Virat  |   36 | India   | 59000.00 |
|    7 | Dhoni  |   43 | India   | 35500.00 |
|   10 | Sachin |   52 | India   | 25000.00 |
+------+--------+------+---------+----------+
3 rows in set (0.02 sec)

mysql> select * from cricketers WHERE Id IN
    -> (select cricketer_Id from sponsers Where sponser_Id < 3);
+------+-------+------+---------+----------+
| Id   | Name  | Age  | Address | Salary   |
+------+-------+------+---------+----------+
|   45 | Rohit |   37 | India   | 50000.00 |
|   18 | Virat |   36 | India   | 59000.00 |
+------+-------+------+---------+----------+
2 rows in set (0.00 sec)

mysql> select Name,Salary,(select AVG(Salary) from cricketers)  from cricketers;
+--------+----------+--------------------------------------+
| Name   | Salary   | (select AVG(Salary) from cricketers) |
+--------+----------+--------------------------------------+
| Rohit  | 50000.00 |                         43667.666667 |
| Virat  | 59000.00 |                         43667.666667 |
| Dhoni  | 35500.00 |                         43667.666667 |
| Sachin | 25000.00 |                         43667.666667 |
| Hardik | 45000.50 |                         43667.666667 |
| Smith  | 47505.50 |                         43667.666667 |
+--------+----------+--------------------------------------+
6 rows in set (0.01 sec)

mysql> select Name,Salary,(select AVG(Salary) Average_Salary from cricketers)  from cricketers;
+--------+----------+-----------------------------------------------------+
| Name   | Salary   | (select AVG(Salary) Average_Salary from cricketers) |
+--------+----------+-----------------------------------------------------+
| Rohit  | 50000.00 |                                        43667.666667 |
| Virat  | 59000.00 |                                        43667.666667 |
| Dhoni  | 35500.00 |                                        43667.666667 |
| Sachin | 25000.00 |                                        43667.666667 |
| Hardik | 45000.50 |                                        43667.666667 |
| Smith  | 47505.50 |                                        43667.666667 |
+--------+----------+-----------------------------------------------------+
6 rows in set (0.00 sec)

mysql> select Name,Salary,(select AVG(Salary) as Average_Salary from cricketers)  from cricketers;
+--------+----------+--------------------------------------------------------+
| Name   | Salary   | (select AVG(Salary) as Average_Salary from cricketers) |
+--------+----------+--------------------------------------------------------+
| Rohit  | 50000.00 |                                           43667.666667 |
| Virat  | 59000.00 |                                           43667.666667 |
| Dhoni  | 35500.00 |                                           43667.666667 |
| Sachin | 25000.00 |                                           43667.666667 |
| Hardik | 45000.50 |                                           43667.666667 |
| Smith  | 47505.50 |                                           43667.666667 |
+--------+----------+--------------------------------------------------------+
6 rows in set (0.00 sec)

mysql> select Name,Salary,(select AVG(Salary) from cricketers) Average_Salary  from cricketers;
+--------+----------+----------------+
| Name   | Salary   | Average_Salary |
+--------+----------+----------------+
| Rohit  | 50000.00 |   43667.666667 |
| Virat  | 59000.00 |   43667.666667 |
| Dhoni  | 35500.00 |   43667.666667 |
| Sachin | 25000.00 |   43667.666667 |
| Hardik | 45000.50 |   43667.666667 |
| Smith  | 47505.50 |   43667.666667 |
+--------+----------+----------------+
6 rows in set (0.01 sec)

mysql> select address  from cricketers group by address;
+---------+
| address |
+---------+
| India   |
| Aus     |
+---------+
2 rows in set (0.01 sec)

mysql> select address,AVG(Age),MAX(Age),MIN(Age) from cricketers group by address;
+---------+----------+----------+----------+
| address | AVG(Age) | MAX(Age) | MIN(Age) |
+---------+----------+----------+----------+
| India   |  39.8000 |       52 |       31 |
| Aus     |  36.0000 |       36 |       36 |
+---------+----------+----------+----------+
2 rows in set (0.02 sec)

mysql> select Name,Age from cricketers where (Salary,Age)= (select max(Salary),max(Age) from cricketers);
Empty set (0.01 sec)

mysql> select Name,Age from cricketers where (Salary,Age)= (select max(Salary),min(Age) from cricketers);
Empty set (0.00 sec)

mysql> select Name,Salary from cricketers where Salary=(select AVG(Salary) from cricketers);
Empty set (0.00 sec)

mysql> select Name,Salary from cricketers where Salary > (select AVG(Salary) from cricketers);
+--------+----------+
| Name   | Salary   |
+--------+----------+
| Rohit  | 50000.00 |
| Virat  | 59000.00 |
| Hardik | 45000.50 |
| Smith  | 47505.50 |
+--------+----------+
4 rows in set (0.00 sec)

mysql> select Name,Salary from cricketers where Salary < (select AVG(Salary) from cricketers);
+--------+----------+
| Name   | Salary   |
+--------+----------+
| Dhoni  | 35500.00 |
| Sachin | 25000.00 |
+--------+----------+
2 rows in set (0.00 sec)

mysql> select Name,Salary,(select AVG(Salary) from cricketers) from cricketers where Salary < (select AVG(Salary) from cricketers);
+--------+----------+--------------------------------------+
| Name   | Salary   | (select AVG(Salary) from cricketers) |
+--------+----------+--------------------------------------+
| Dhoni  | 35500.00 |                         43667.666667 |
| Sachin | 25000.00 |                         43667.666667 |
+--------+----------+--------------------------------------+
2 rows in set (0.01 sec)

mysql> select Name,Salary,(select AVG(Salary) from cricketers) as Average_Salary from cricketers where Salary < (select AVG(Salary) from cricketers);
+--------+----------+----------------+
| Name   | Salary   | Average_Salary |
+--------+----------+----------------+
| Dhoni  | 35500.00 |   43667.666667 |
| Sachin | 25000.00 |   43667.666667 |
+--------+----------+----------------+
2 rows in set (0.00 sec)

mysql> select Name,Salary,(select AVG(Salary) from cricketers) as Average_Salary from cricketers where Salary > (select AVG(Salary) from cricketers);
+--------+----------+----------------+
| Name   | Salary   | Average_Salary |
+--------+----------+----------------+
| Rohit  | 50000.00 |   43667.666667 |
| Virat  | 59000.00 |   43667.666667 |
| Hardik | 45000.50 |   43667.666667 |
| Smith  | 47505.50 |   43667.666667 |
+--------+----------+----------------+
4 rows in set (0.00 sec)

mysql> exit

