mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sqlprac            |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

mysql> use sqlprac;
Database changed
mysql> select * from cricketers;
+------+---------+------+---------+----------+
| Id   | Name    | Age  | Address | Salary   |
+------+---------+------+---------+----------+
|   45 | Rohit   |   37 | India   | 50000.00 |
|   18 | Virat   |   36 | India   | 59000.00 |
|    7 | Dhoni   |   43 | India   | 35500.00 |
|   10 | Sachin  |   52 | India   | 25000.00 |
|   33 | Hardik  |   31 | India   | 45000.50 |
|   14 | ponting |   50 | Aus     | 30000.80 |
|   49 | Smith   |   36 | Aus     | 47505.50 |
+------+---------+------+---------+----------+
7 rows in set (0.00 sec)

mysql> Terminal close -- exit!
