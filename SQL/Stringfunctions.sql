mysql> -- Length Function
mysql> select LENGTH("MYSQL");
+-----------------+
| LENGTH("MYSQL") |
+-----------------+
|               5 |
+-----------------+
1 row in set (0.02 sec)

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
6 rows in set (0.03 sec)

mysql> select Name,LENGTH(Name) from cricketers;
+--------+--------------+
| Name   | LENGTH(Name) |
+--------+--------------+
| Rohit  |            5 |
| Virat  |            5 |
| Dhoni  |            5 |
| Sachin |            6 |
| Hardik |            6 |
| Smith  |            5 |
+--------+--------------+
6 rows in set (0.02 sec)

mysql> select Name,LENGTH(Name) len from cricketers ORDER BY len ;
+--------+------+
| Name   | len  |
+--------+------+
| Rohit  |    5 |
| Virat  |    5 |
| Dhoni  |    5 |
| Smith  |    5 |
| Sachin |    6 |
| Hardik |    6 |
+--------+------+
6 rows in set (0.02 sec)

mysql> -- UPPER
mysql> select UPPER("caraxes");
+------------------+
| UPPER("caraxes") |
+------------------+
| CARAXES          |
+------------------+
1 row in set (0.02 sec)

mysql> -- LOWER
mysql> select LOWER("CARAXES");
+------------------+
| LOWER("CARAXES") |
+------------------+
| caraxes          |
+------------------+
1 row in set (0.01 sec)

mysql> select UPPER(Name) len from cricketers ORDER BY len ;
+--------+
| len    |
+--------+
| DHONI  |
| HARDIK |
| ROHIT  |
| SACHIN |
| SMITH  |
| VIRAT  |
+--------+
6 rows in set (0.00 sec)

mysql> -- TRIM function to get rid of leading and trailing white spaces 
mysql> select TRIM("    SKY    ");
+---------------------+
| TRIM("    SKY    ") |
+---------------------+
| SKY                 |
+---------------------+
1 row in set (0.02 sec)

mysql> select LTRIM("    SKY    ");
+----------------------+
| LTRIM("    SKY    ") |
+----------------------+
| SKY                  |
+----------------------+
1 row in set (0.01 sec)

mysql> select RTRIM("    SKY    ");
+----------------------+
| RTRIM("    SKY    ") |
+----------------------+
|     SKY              |
+----------------------+
1 row in set (0.01 sec)

mysql> -- LEFT & RIGHT functions
mysql> select Name,Left(Name,3) from cricketers;
+--------+--------------+
| Name   | Left(Name,3) |
+--------+--------------+
| Rohit  | Roh          |
| Virat  | Vir          |
| Dhoni  | Dho          |
| Sachin | Sac          |
| Hardik | Har          |
| Smith  | Smi          |
+--------+--------------+
6 rows in set (0.02 sec)

mysql> select Name,RIGHT(Name,3) from cricketers;
+--------+---------------+
| Name   | RIGHT(Name,3) |
+--------+---------------+
| Rohit  | hit           |
| Virat  | rat           |
| Dhoni  | oni           |
| Sachin | hin           |
| Hardik | dik           |
| Smith  | ith           |
+--------+---------------+
6 rows in set (0.00 sec)

mysql> -- SUBSTRINGS
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
6 rows in set (0.00 sec)

mysql> select Name,Salary from cricketers SUBSTRING(Salary,1,2); 
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SUBSTRING(Salary,1,2)' at line 1
mysql> select Name,Salary ,SUBSTRING(Salary,1,2) from cricketers; 
+--------+----------+-----------------------+
| Name   | Salary   | SUBSTRING(Salary,1,2) |
+--------+----------+-----------------------+
| Rohit  | 50000.00 | 50                    |
| Virat  | 59000.00 | 59                    |
| Dhoni  | 35500.00 | 35                    |
| Sachin | 25000.00 | 25                    |
| Hardik | 45000.50 | 45                    |
| Smith  | 47505.50 | 47                    |
+--------+----------+-----------------------+
6 rows in set (0.01 sec)

mysql> select Name,right(Name,3),left(Name,3),SUBSTRING(Salary,1,2) from cricketers;
+--------+---------------+--------------+-----------------------+
| Name   | right(Name,3) | left(Name,3) | SUBSTRING(Salary,1,2) |
+--------+---------------+--------------+-----------------------+
| Rohit  | hit           | Roh          | 50                    |
| Virat  | rat           | Vir          | 59                    |
| Dhoni  | oni           | Dho          | 35                    |
| Sachin | hin           | Sac          | 25                    |
| Hardik | dik           | Har          | 45                    |
| Smith  | ith           | Smi          | 47                    |
+--------+---------------+--------------+-----------------------+
6 rows in set (0.00 sec)

mysql> -- REPLACE
mysql> select Name,REPLACE(Name,"i","I") from cricketers;
+--------+-----------------------+
| Name   | REPLACE(Name,"i","I") |
+--------+-----------------------+
| Rohit  | RohIt                 |
| Virat  | VIrat                 |
| Dhoni  | DhonI                 |
| Sachin | SachIn                |
| Hardik | HardIk                |
| Smith  | SmIth                 |
+--------+-----------------------+
6 rows in set (0.02 sec)

mysql> select Name,REPLACE(Name,"i","II")from cricketers;
+--------+------------------------+
| Name   | REPLACE(Name,"i","II") |
+--------+------------------------+
| Rohit  | RohIIt                 |
| Virat  | VIIrat                 |
| Dhoni  | DhonII                 |
| Sachin | SachIIn                |
| Hardik | HardIIk                |
| Smith  | SmIIth                 |
+--------+------------------------+
6 rows in set (0.00 sec)

mysql> -- LOCATE
mysql> select Name,LOCATE("hi",Name) from cricketers;
+--------+-------------------+
| Name   | LOCATE("hi",Name) |
+--------+-------------------+
| Rohit  |                 3 |
| Virat  |                 0 |
| Dhoni  |                 0 |
| Sachin |                 4 |
| Hardik |                 0 |
| Smith  |                 0 |
+--------+-------------------+
6 rows in set (0.02 sec)

mysql> select Name,LOCATE("hi","Name") from cricketers;
+--------+---------------------+
| Name   | LOCATE("hi","Name") |
+--------+---------------------+
| Rohit  |                   0 |
| Virat  |                   0 |
| Dhoni  |                   0 |
| Sachin |                   0 |
| Hardik |                   0 |
| Smith  |                   0 |
+--------+---------------------+
6 rows in set (0.00 sec)

mysql> -- CONCAT
mysql> select Name,Address,CONCAT(Name,Address) from cricketers;
+--------+---------+----------------------+
| Name   | Address | CONCAT(Name,Address) |
+--------+---------+----------------------+
| Rohit  | India   | RohitIndia           |
| Virat  | India   | ViratIndia           |
| Dhoni  | India   | DhoniIndia           |
| Sachin | India   | SachinIndia          |
| Hardik | India   | HardikIndia          |
| Smith  | Aus     | SmithAus             |
+--------+---------+----------------------+
6 rows in set (0.01 sec)

mysql> select Name,Address,CONCAT(Name," ",Address) from cricketers;
+--------+---------+--------------------------+
| Name   | Address | CONCAT(Name," ",Address) |
+--------+---------+--------------------------+
| Rohit  | India   | Rohit India              |
| Virat  | India   | Virat India              |
| Dhoni  | India   | Dhoni India              |
| Sachin | India   | Sachin India             |
| Hardik | India   | Hardik India             |
| Smith  | Aus     | Smith Aus                |
+--------+---------+--------------------------+
6 rows in set (0.00 sec)

mysql> -- CASE STATEMENTS
mysql> select Name,Age,
    -> CASE
    ->     WHEN age <=30 THEN "Young Adulthood"
    -> 	   WHEN age BETWEEN 31 and 50 THEN "Middle Adulthood"
    -> END
    -> from cricketers;
+--------+------+----------------------------------------------------------------------------------------------------------+
| Name   | Age  | CASE
    WHEN age <=30 THEN "Young Adulthood"
	   WHEN age BETWEEN 31 and 50 THEN "Middle Adulthood"
END |
+--------+------+----------------------------------------------------------------------------------------------------------+
| Rohit  |   37 | Middle Adulthood                                                                                         |
| Virat  |   36 | Middle Adulthood                                                                                         |
| Dhoni  |   43 | Middle Adulthood                                                                                         |
| Sachin |   52 | NULL                                                                                                     |
| Hardik |   31 | Middle Adulthood                                                                                         |
| Smith  |   36 | Middle Adulthood                                                                                         |
+--------+------+----------------------------------------------------------------------------------------------------------+
6 rows in set (0.02 sec)

mysql> select Name,Age,
    -> CASE
    ->     WHEN age <=30 THEN "Young Adulthood"
    -> 	   WHEN age BETWEEN 31 and 55 THEN "Middle Adulthood"
    ->     WHEN age>56 THEN "Older Adulthood"
    -> END AS Adulthood_Under
    -> from cricketers;
+--------+------+------------------+
| Name   | Age  | Adulthood_Under  |
+--------+------+------------------+
| Rohit  |   37 | Middle Adulthood |
| Virat  |   36 | Middle Adulthood |
| Dhoni  |   43 | Middle Adulthood |
| Sachin |   52 | Middle Adulthood |
| Hardik |   31 | Middle Adulthood |
| Smith  |   36 | Middle Adulthood |
+--------+------+------------------+
6 rows in set (0.00 sec)

mysql> Terminal close -- exit!
mysql> select Name,Salary,
    -> CASE
    ->     WHEN Salary < 50000 THEN Salary * 0.5
    ->     WHEN Salary >= 50000 THEN Salary * 0.7
    ->     ELSE Salary
    -> END
    -> from cricketers;
+--------+----------+---------------------------------------------------------------------------------------------------------------+
| Name   | Salary   | CASE
    WHEN Salary < 50000 THEN Salary * 0.5
    WHEN Salary >= 50000 THEN Salary * 0.7
    ELSE Salary
END |
+--------+----------+---------------------------------------------------------------------------------------------------------------+
| Rohit  | 50000.00 |                                                                                                     35000.000 |
| Virat  | 59000.00 |                                                                                                     41300.000 |
| Dhoni  | 35500.00 |                                                                                                     17750.000 |
| Sachin | 25000.00 |                                                                                                     12500.000 |
| Hardik | 45000.50 |                                                                                                     22500.250 |
| Smith  | 47505.50 |                                                                                                     23752.750 |
+--------+----------+---------------------------------------------------------------------------------------------------------------+
6 rows in set (0.00 sec)

mysql> select Name,Salary,
    -> CASE
    ->     WHEN Salary < 50000 THEN Salary * 0.05
    ->     WHEN Salary >= 50000 THEN Salary * 0.07
    -> END as Updated_Salary
    -> from cricketers;
+--------+----------+----------------+
| Name   | Salary   | Updated_Salary |
+--------+----------+----------------+
| Rohit  | 50000.00 |      3500.0000 |
| Virat  | 59000.00 |      4130.0000 |
| Dhoni  | 35500.00 |      1775.0000 |
| Sachin | 25000.00 |      1250.0000 |
| Hardik | 45000.50 |      2250.0250 |
| Smith  | 47505.50 |      2375.2750 |
+--------+----------+----------------+
6 rows in set (0.00 sec)

mysql> select Name,Salary,
    -> CASE
    ->     WHEN Salary < 50000 THEN Salary * 1.05
    ->     WHEN Salary >= 50000 THEN Salary * 1.07
    ->     ELSE Salary
    -> END as Updated_Salary
    -> from cricketers;
+--------+----------+----------------+
| Name   | Salary   | Updated_Salary |
+--------+----------+----------------+
| Rohit  | 50000.00 |     53500.0000 |
| Virat  | 59000.00 |     63130.0000 |
| Dhoni  | 35500.00 |     37275.0000 |
| Sachin | 25000.00 |     26250.0000 |
| Hardik | 45000.50 |     47250.5250 |
| Smith  | 47505.50 |     49880.7750 |
+--------+----------+----------------+
6 rows in set (0.00 sec)

mysql> exit
