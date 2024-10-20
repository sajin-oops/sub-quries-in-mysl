 create table student(
    -> name varchar(30)NOT NULL,
    -> regno varchar(20) unique,
    -> email varchar(100) unique,
    -> password varchar(40)NOT NULL
    -> );



mysql> DESC student;
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| name     | varchar(30)  | NO   |     | NULL    |       |
| regno    | varchar(20)  | YES  | UNI | NULL    |       |
| email    | varchar(100) | YES  | UNI | NULL    |       |
| password | varchar(40)  | NO   |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)



Insert values
insert into student values("Sajin",222,"sajin21@gmail.com",12345678);
Query OK, 1 row affected (0.04 sec)

To view the values
mysql> select * from student;


+-------+-------+-------------------+----------+
| name  | regno | email             | password |
+-------+-------+-------------------+----------+
| Sajin | 222   | sajin21@gmail.com | 12345678 |
+-------+-------+-------------------+----------+
1 row in set (0.00 sec)


LOGICAL OPERATIONS

mysql> select * from student where regno = 222;
+-------+-------+---------------------+----------+
| name  | regno | email               | password |
+-------+-------+---------------------+----------+
| Sajin | 222   | sajin2888@gmail.com | 12345678 |
+-------+-------+---------------------+----------+
1 row in set (0.00 sec)

mysql> select * from student where regno = 222 and name = "Sajin";
+-------+-------+---------------------+----------+
| name  | regno | email               | password |
+-------+-------+---------------------+----------+
| Sajin | 222   | sajin2888@gmail.com | 12345678 |
+-------+-------+---------------------+----------+
1 row in set (0.00 sec)

mysql> select * from student where regno = 222 and name = "Sajiwwn";
Empty set (0.00 sec)

mysql> select * from student where regno = 222 or name = "Sajkjjjin";
+-------+-------+---------------------+----------+
| name  | regno | email               | password |
+-------+-------+---------------------+----------+
| Sajin | 222   | sajin2888@gmail.com | 12345678 |
+-------+-------+---------------------+----------+
1 row in set (0.00 sec)

mysql>between

//

mysql> select*from student where regno between 2 and 2222;
+-------+-------+---------------------+----------+
| name  | regno | email               | password |
+-------+-------+---------------------+----------+
| Sajin | 222   | sajin2888@gmail.com | 12345678 |
| aaron | 2222  | aaron21@gmail.com   | 123456   |
+-------+-------+---------------------+----------+
2 rows in set (0.00 sec)

//distinct 
mysql> select distinct name from student;
+-------+
| name  |
+-------+
| Sajin |
| aaron |
| jizzz |
+-------+
3 rows in set (0.00 sec)


// LIKE

mysql> select * from student where name like 'S%';
+-------+-------+---------------------+----------+
| name  | regno | email               | password |
+-------+-------+---------------------+----------+
| Sajin | 222   | sajin2888@gmail.com | 12345678 |
+-------+-------+---------------------+----------+
1 row in set (0.00 sec)

--aggregation functions

mysql> -- Create the table
mysql> CREATE TABLE orders (
    ->     order_id INT,
    ->     customer_id INT,
    ->     order_amount DECIMAL(10, 2)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql>
mysql> -- Insert example data
mysql> INSERT INTO orders (order_id, customer_id, order_amount) VALUES
    -> (1, 1, 1000.00),
    -> (2, 2, 500.00),
    -> (3, 1, 750.00),
    -> (4, 3, 300.00),
    -> (5, 2, 1200.00);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0


mysql> select * from orders;
+----------+-------------+--------------+
| order_id | customer_id | order_amount |
+----------+-------------+--------------+
|        1 |           1 |      1000.00 |
|        2 |           2 |       500.00 |
|        3 |           1 |       750.00 |
|        4 |           3 |       300.00 |
|        5 |           2 |      1200.00 |
+----------+-------------+--------------+
5 rows in set (0.00 sec)


mysql> select sum(order_amount) as total_revenue from orders;
+---------------+
| total_revenue |
+---------------+
|       3750.00 |
+---------------+
1 row in set (0.00 sec)

mysql> select count(order_id) as total_orders from orders;
+--------------+
| total_orders |
+--------------+
|            5 |
+--------------+
1 row in set (0.00 sec)

mysql> select avg(order_amount) as average from orders;
+------------+
| average    |
+------------+
| 750.000000 |
+------------+
1 row in set (0.00 sec)


mysql> select min(order_amount) as minimum_amount from orders;
+----------------+
| minimum_amount |
+----------------+
|         300.00 |
+----------------+
1 row in set (0.00 sec)

mysql> select max(order_amount) as maximum_amount from orders;
+----------------+
| maximum_amount |
+----------------+
|        1200.00 |
+----------------+
1 row in set (0.00 sec)


--UPDATE

mysql> update student set email = "sajin2888@gmail.com" where regno=222;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0


--DELETE 

mysql> delete from student where regno = 22;
Query OK, 1 row affected (0.01 sec)

--order by

mysql> select * from orders order by order_amount asc;
+----------+-------------+--------------+
| order_id | customer_id | order_amount |
+----------+-------------+--------------+
|        4 |           3 |       300.00 |
|        2 |           2 |       500.00 |
|        3 |           1 |       750.00 |
|        1 |           1 |      1000.00 |
|        5 |           2 |      1200.00 |
+----------+-------------+--------------+
5 rows in set (0.00 sec)

mysql> select * from orders order by order_amount desc;
+----------+-------------+--------------+
| order_id | customer_id | order_amount |
+----------+-------------+--------------+
|        5 |           2 |      1200.00 |
|        1 |           1 |      1000.00 |
|        3 |           1 |       750.00 |
|        2 |           2 |       500.00 |
|        4 |           3 |       300.00 |
+----------+-------------+--------------+
5 rows in set (0.00 sec)

mysql>

--Sub queries
mysql> select * from orders where order_amount > (select avg(order_amount) from orders);
+----------+-------------+--------------+
| order_id | customer_id | order_amount |
+----------+-------------+--------------+
|        1 |           1 |      1000.00 |
|        5 |           2 |      1200.00 |
+----------+-------------+--------------+
2 rows in set (0.00 sec)

mysql> select * from orders;
+----------+-------------+--------------+
| order_id | customer_id | order_amount |
+----------+-------------+--------------+
|        1 |           1 |      1000.00 |
|        2 |           2 |       500.00 |
|        3 |           1 |       750.00 |
|        4 |           3 |       300.00 |
|        5 |           2 |      1200.00 |
+----------+-------------+--------------+
5 rows in set (0.00 sec)
