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
7 rows in set (0.04 sec)

mysql> create table sponsers(sponser_id int,sponser_name varchar(20),cricket_Id int);
Query OK, 0 rows affected (0.15 sec)

mysql> show tables;
+-------------------+
| Tables_in_sqlprac |
+-------------------+
| cricketers        |
| sponsers          |
+-------------------+
2 rows in set (0.03 sec)

mysql> select Name from cricketers;
+---------+
| Name    |
+---------+
| Rohit   |
| Virat   |
| Dhoni   |
| Sachin  |
| Hardik  |
| ponting |
| Smith   |
+---------+
7 rows in set (0.00 sec)

mysql> select * from sponsers;
+------------+--------------+------------+
| sponser_id | sponser_name | cricket_Id |
+------------+--------------+------------+
|          1 | CEAT         |         45 |
|          2 | MRF          |         18 |
|          3 | Reebok       |          7 |
|          4 | MRF          |         10 |
|          5 | SG           |         33 |
|          6 | Kookaburra   |         14 |
|          7 | New Balance  |         49 |
+------------+--------------+------------+
7 rows in set (0.00 sec)

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

mysql> ALTER table sponsers CHANGE cricket_Id cricketer_Id int;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from sponsers;
+------------+--------------+--------------+
| sponser_id | sponser_name | cricketer_Id |
+------------+--------------+--------------+
|          1 | CEAT         |           45 |
|          2 | MRF          |           18 |
|          3 | Reebok       |            7 |
|          4 | MRF          |           10 |
|          5 | SG           |           33 |
|          6 | Kookaburra   |           14 |
|          7 | New Balance  |           49 |
+------------+--------------+--------------+
7 rows in set (0.00 sec)

mysql> select * from cricketers JOIN sponsers ON cricketers.Id=sponsers.cricketer_Id;
+------+---------+------+---------+----------+------------+--------------+--------------+
| Id   | Name    | Age  | Address | Salary   | sponser_id | sponser_name | cricketer_Id |
+------+---------+------+---------+----------+------------+--------------+--------------+
|   45 | Rohit   |   37 | India   | 50000.00 |          1 | CEAT         |           45 |
|   18 | Virat   |   36 | India   | 59000.00 |          2 | MRF          |           18 |
|    7 | Dhoni   |   43 | India   | 35500.00 |          3 | Reebok       |            7 |
|   10 | Sachin  |   52 | India   | 25000.00 |          4 | MRF          |           10 |
|   33 | Hardik  |   31 | India   | 45000.50 |          5 | SG           |           33 |
|   14 | ponting |   50 | Aus     | 30000.80 |          6 | Kookaburra   |           14 |
|   49 | Smith   |   36 | Aus     | 47505.50 |          7 | New Balance  |           49 |
+------+---------+------+---------+----------+------------+--------------+--------------+
7 rows in set (0.00 sec)

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

mysql> select * from sponsers;
+------------+--------------+--------------+
| sponser_id | sponser_name | cricketer_Id |
+------------+--------------+--------------+
|          1 | CEAT         |           45 |
|          2 | MRF          |           18 |
|          3 | Reebok       |            7 |
|          4 | MRF          |           10 |
|          5 | SG           |           33 |
|          6 | Kookaburra   |           14 |
|          7 | New Balance  |           49 |
+------------+--------------+--------------+
7 rows in set (0.00 sec)

mysql> select * from cricketers JOIN sponsers ON cricketers.Id=sponsers.cricketer_Id;
+------+---------+------+---------+----------+------------+--------------+--------------+
| Id   | Name    | Age  | Address | Salary   | sponser_id | sponser_name | cricketer_Id |
+------+---------+------+---------+----------+------------+--------------+--------------+
|   45 | Rohit   |   37 | India   | 50000.00 |          1 | CEAT         |           45 |
|   18 | Virat   |   36 | India   | 59000.00 |          2 | MRF          |           18 |
|    7 | Dhoni   |   43 | India   | 35500.00 |          3 | Reebok       |            7 |
|   10 | Sachin  |   52 | India   | 25000.00 |          4 | MRF          |           10 |
|   33 | Hardik  |   31 | India   | 45000.50 |          5 | SG           |           33 |
|   14 | ponting |   50 | Aus     | 30000.80 |          6 | Kookaburra   |           14 |
|   49 | Smith   |   36 | Aus     | 47505.50 |          7 | New Balance  |           49 |
+------+---------+------+---------+----------+------------+--------------+--------------+
7 rows in set (0.00 sec)

mysql> select * from sponsers;
+------------+--------------+--------------+
| sponser_id | sponser_name | cricketer_Id |
+------------+--------------+--------------+
|          1 | CEAT         |           45 |
|          2 | MRF          |           18 |
|          3 | Reebok       |            7 |
|          4 | MRF          |           10 |
|          5 | SG           |           33 |
|          6 | Kookaburra   |           14 |
|          7 | New Balance  |           49 |
+------------+--------------+--------------+
7 rows in set (0.00 sec)

mysql> -- Delete a column 
mysql> DELETE from sponsers where sponser_Id=6;
Query OK, 1 row affected (0.02 sec)

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
+------------+--------------+--------------+
6 rows in set (0.00 sec)

mysql> select * from cricketers JOIN sponsers ON cricketers.Id=sponsers.cricketer_Id;
+------+--------+------+---------+----------+------------+--------------+--------------+
| Id   | Name   | Age  | Address | Salary   | sponser_id | sponser_name | cricketer_Id |
+------+--------+------+---------+----------+------------+--------------+--------------+
|   45 | Rohit  |   37 | India   | 50000.00 |          1 | CEAT         |           45 |
|   18 | Virat  |   36 | India   | 59000.00 |          2 | MRF          |           18 |
|    7 | Dhoni  |   43 | India   | 35500.00 |          3 | Reebok       |            7 |
|   10 | Sachin |   52 | India   | 25000.00 |          4 | MRF          |           10 |
|   33 | Hardik |   31 | India   | 45000.50 |          5 | SG           |           33 |
|   49 | Smith  |   36 | Aus     | 47505.50 |          7 | New Balance  |           49 |
+------+--------+------+---------+----------+------------+--------------+--------------+
6 rows in set (0.00 sec)

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
7 rows in set (0.05 sec)

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
+------------+--------------+--------------+
6 rows in set (0.00 sec)

mysql> select * from cricketers JOIN sponsers ON cricketers.Id=sponsers.sponser_id;
+------+-------+------+---------+----------+------------+--------------+--------------+
| Id   | Name  | Age  | Address | Salary   | sponser_id | sponser_name | cricketer_Id |
+------+-------+------+---------+----------+------------+--------------+--------------+
|    7 | Dhoni |   43 | India   | 35500.00 |          7 | New Balance  |           49 |
+------+-------+------+---------+----------+------------+--------------+--------------+
1 row in set (0.00 sec)

mysql> select * from cricketers JOIN sponsers ON cricketers.Id=sponsers.sponser_id;
+------+-------+------+---------+----------+------------+--------------+--------------+
| Id   | Name  | Age  | Address | Salary   | sponser_id | sponser_name | cricketer_Id |
+------+-------+------+---------+----------+------------+--------------+--------------+
|    7 | Dhoni |   43 | India   | 35500.00 |          7 | New Balance  |           49 |
+------+-------+------+---------+----------+------------+--------------+--------------+
1 row in set (0.00 sec)

mysql> select * from cricketers JOIN sponsers ON cricketers.Id=sponsers.cricketer_Id;
+------+--------+------+---------+----------+------------+--------------+--------------+
| Id   | Name   | Age  | Address | Salary   | sponser_id | sponser_name | cricketer_Id |
+------+--------+------+---------+----------+------------+--------------+--------------+
|   45 | Rohit  |   37 | India   | 50000.00 |          1 | CEAT         |           45 |
|   18 | Virat  |   36 | India   | 59000.00 |          2 | MRF          |           18 |
|    7 | Dhoni  |   43 | India   | 35500.00 |          3 | Reebok       |            7 |
|   10 | Sachin |   52 | India   | 25000.00 |          4 | MRF          |           10 |
|   33 | Hardik |   31 | India   | 45000.50 |          5 | SG           |           33 |
|   49 | Smith  |   36 | Aus     | 47505.50 |          7 | New Balance  |           49 |
+------+--------+------+---------+----------+------------+--------------+--------------+
6 rows in set (0.00 sec)

mysql> -- Aliasing in joins
mysql> select * from cricketers AS cr JOIN sponsers AS sp ON cr.Id=sp.cricketer_Id;
+------+--------+------+---------+----------+------------+--------------+--------------+
| Id   | Name   | Age  | Address | Salary   | sponser_id | sponser_name | cricketer_Id |
+------+--------+------+---------+----------+------------+--------------+--------------+
|   45 | Rohit  |   37 | India   | 50000.00 |          1 | CEAT         |           45 |
|   18 | Virat  |   36 | India   | 59000.00 |          2 | MRF          |           18 |
|    7 | Dhoni  |   43 | India   | 35500.00 |          3 | Reebok       |            7 |
|   10 | Sachin |   52 | India   | 25000.00 |          4 | MRF          |           10 |
|   33 | Hardik |   31 | India   | 45000.50 |          5 | SG           |           33 |
|   49 | Smith  |   36 | Aus     | 47505.50 |          7 | New Balance  |           49 |
+------+--------+------+---------+----------+------------+--------------+--------------+
6 rows in set (0.00 sec)

mysql> select cr.Id,cr.Name,sp.sponser_name from cricketers AS cr JOIN sponsers AS sp ON cr.Id=sp.cricketer_Id;
+------+--------+--------------+
| Id   | Name   | sponser_name |
+------+--------+--------------+
|   45 | Rohit  | CEAT         |
|   18 | Virat  | MRF          |
|    7 | Dhoni  | Reebok       |
|   10 | Sachin | MRF          |
|   33 | Hardik | SG           |
|   49 | Smith  | New Balance  |
+------+--------+--------------+
6 rows in set (0.02 sec)

mysql> -- Outer joins
mysql> -- Left & Right Joins
mysql> select * from cricketers AS cr LEFT JOIN sponsers AS sp ON cr.Id=sp.cricketer_Id;
+------+---------+------+---------+----------+------------+--------------+--------------+
| Id   | Name    | Age  | Address | Salary   | sponser_id | sponser_name | cricketer_Id |
+------+---------+------+---------+----------+------------+--------------+--------------+
|   45 | Rohit   |   37 | India   | 50000.00 |          1 | CEAT         |           45 |
|   18 | Virat   |   36 | India   | 59000.00 |          2 | MRF          |           18 |
|    7 | Dhoni   |   43 | India   | 35500.00 |          3 | Reebok       |            7 |
|   10 | Sachin  |   52 | India   | 25000.00 |          4 | MRF          |           10 |
|   33 | Hardik  |   31 | India   | 45000.50 |          5 | SG           |           33 |
|   14 | ponting |   50 | Aus     | 30000.80 |       NULL | NULL         |         NULL |
|   49 | Smith   |   36 | Aus     | 47505.50 |          7 | New Balance  |           49 |
+------+---------+------+---------+----------+------------+--------------+--------------+
7 rows in set (0.01 sec)

mysql> -- left join - all rows from left table and matching rows in right table,if no match NULL in right table
mysql> select * from cricketers AS cr RIGHT JOIN sponsers AS sp ON cr.Id=sp.cricketer_Id;
+------+--------+------+---------+----------+------------+--------------+--------------+
| Id   | Name   | Age  | Address | Salary   | sponser_id | sponser_name | cricketer_Id |
+------+--------+------+---------+----------+------------+--------------+--------------+
|   45 | Rohit  |   37 | India   | 50000.00 |          1 | CEAT         |           45 |
|   18 | Virat  |   36 | India   | 59000.00 |          2 | MRF          |           18 |
|    7 | Dhoni  |   43 | India   | 35500.00 |          3 | Reebok       |            7 |
|   10 | Sachin |   52 | India   | 25000.00 |          4 | MRF          |           10 |
|   33 | Hardik |   31 | India   | 45000.50 |          5 | SG           |           33 |
|   49 | Smith  |   36 | Aus     | 47505.50 |          7 | New Balance  |           49 |
+------+--------+------+---------+----------+------------+--------------+--------------+
6 rows in set (0.00 sec)

mysql> insert into sponsers values(6,"Kokaburra",14); 
Query OK, 1 row affected (0.04 sec)

mysql> DELETE from cricketers where Id=14;
Query OK, 1 row affected (0.03 sec)

mysql> select * from cricketers AS cr RIGHT JOIN sponsers AS sp ON cr.Id=sp.cricketer_Id;
+------+--------+------+---------+----------+------------+--------------+--------------+
| Id   | Name   | Age  | Address | Salary   | sponser_id | sponser_name | cricketer_Id |
+------+--------+------+---------+----------+------------+--------------+--------------+
|   45 | Rohit  |   37 | India   | 50000.00 |          1 | CEAT         |           45 |
|   18 | Virat  |   36 | India   | 59000.00 |          2 | MRF          |           18 |
|    7 | Dhoni  |   43 | India   | 35500.00 |          3 | Reebok       |            7 |
|   10 | Sachin |   52 | India   | 25000.00 |          4 | MRF          |           10 |
|   33 | Hardik |   31 | India   | 45000.50 |          5 | SG           |           33 |
|   49 | Smith  |   36 | Aus     | 47505.50 |          7 | New Balance  |           49 |
| NULL | NULL   | NULL | NULL    |     NULL |          6 | Kokaburra    |           14 |
+------+--------+------+---------+----------+------------+--------------+--------------+
7 rows in set (0.00 sec)

mysql> -- UNION
mysql> select Name from cricketers UNION select sponser_name from sponsers;
+-------------+
| Name        |
+-------------+
| Rohit       |
| Virat       |
| Dhoni       |
| Sachin      |
| Hardik      |
| Smith       |
| CEAT        |
| MRF         |
| Reebok      |
| SG          |
| New Balance |
| Kokaburra   |
+-------------+
12 rows in set (0.02 sec)

mysql> select * from cricketers where age>40;
+------+--------+------+---------+----------+
| Id   | Name   | Age  | Address | Salary   |
+------+--------+------+---------+----------+
|    7 | Dhoni  |   43 | India   | 35500.00 |
|   10 | Sachin |   52 | India   | 25000.00 |
+------+--------+------+---------+----------+
2 rows in set (0.02 sec)

mysql> select Id,Name,Age,"Retired" as Label from cricketers where age>40 ;
+------+--------+------+---------+
| Id   | Name   | Age  | Label   |
+------+--------+------+---------+
|    7 | Dhoni  |   43 | Retired |
|   10 | Sachin |   52 | Retired |
+------+--------+------+---------+
2 rows in set (0.00 sec)

mysql> exit
