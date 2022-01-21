--UC-1 Ability to create a
--      Address Book Service DB
CREATE DATABASE addressbook_service_db;
mysql> show databases;
+------------------------+
| Database               |
+------------------------+
| addressbook_service_db |
| information_schema     |
| mysql                  |
| payroll_service        |
| performance_schema     |
| sys                    |
+------------------------+

--UC-2 Ability to create a Address
--       Book Table with first and
--       last names, address, city,
--       state, zip, phone number
--       and email as its attributes

mysql> CREATE TABLE address_book
(Name varchar(40) NOT NULL,
 Address varchar(200) NOT NULL,
City varchar(40) NOT NULL,
State varchar(200) NOT NULL,
Zip int NOT NULL,
Phone_No int NOT NULL,
Email varchar(50) NOT NULL
);

--UC-3 Ability to insert new
--Contacts to AddressBook
mysql> INSERT INTO address_book VALUES ('Nikita','Marathalli Bangalore','Bangalore','Karnataka',560037,98989898,'amarnikitabridgelabzcom'), ('Rama', 'Jaynagar Bangalore', 'Bangalore', 'Karnataka', 560036, 90000000, 'ramabridgelabzcom');
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from address_book;
+--------+----------------------+-----------+-----------+--------+----------+-------------------------+
| Name   | Address              | City      | State     | Zip    | Phone_No | Email                   |
+--------+----------------------+-----------+-----------+--------+----------+-------------------------+
| Nikita | Marathalli Bangalore | Bangalore | Karnataka | 560037 | 98989898 | amarnikitabridgelabzcom |
| Rama   | Jaynagar Bangalore   | Bangalore | Karnataka | 560036 | 90000000 | ramabridgelabzcom       |
+--------+----------------------+-----------+-----------+--------+----------+-------------------------+
2 rows in set (0.00 sec)


--UC-4 Ability to edit
--existing contact
--person using their name
mysql> UPDATE address_book  SET Name = 'Ramnath' WHERE Name = 'Rama';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from address_book;
+---------+----------------------+-----------+-----------+--------+----------+-------------------------+
| Name    | Address              | City      | State     | Zip    | Phone_No | Email                   |
+---------+----------------------+-----------+-----------+--------+----------+-------------------------+
| Nikita  | Marathalli Bangalore | Bangalore | Karnataka | 560037 | 98989898 | amarnikitabridgelabzcom |
| Ramnath | Jaynagar Bangalore   | Bangalore | Karnataka | 560036 | 90000000 | ramabridgelabzcom       |
+---------+----------------------+-----------+-----------+--------+----------+-------------------------+
2 rows in set (0.00 sec)

mysql> INSERT INTO address_book VALUES ('Ashwath','Kundalahalli Bangalore','Bangalore','Karnataka',560037,9000000,'ashwathbridgelabzcom');
Query OK, 1 row affected (0.01 sec)

mysql> select * from address_book;
+---------+------------------------+-----------+-----------+--------+----------+-------------------------+
| Name    | Address                | City      | State     | Zip    | Phone_No | Email                   |
+---------+------------------------+-----------+-----------+--------+----------+-------------------------+
| Nikita  | Marathalli Bangalore   | Bangalore | Karnataka | 560037 | 98989898 | amarnikitabridgelabzcom |
| Ramnath | Jaynagar Bangalore     | Bangalore | Karnataka | 560036 | 90000000 | ramabridgelabzcom       |
| Ashwath | Kundalahalli Bangalore | Bangalore | Karnataka | 560037 |  9000000 | ashwathbridgelabzcom    |
+---------+------------------------+-----------+-----------+--------+----------+-------------------------+
3 rows in set (0.00 sec)


--UC-5Ability to delete a
--person using person's
--name
mysql> DELETE FROM address_book WHERE Name = 'Ramnath';
Query OK, 1 row affected (0.01 sec)

mysql> select * from address_book;
+---------+------------------------+-----------+-----------+--------+----------+-------------------------+
| Name    | Address                | City      | State     | Zip    | Phone_No | Email                   |
+---------+------------------------+-----------+-----------+--------+----------+-------------------------+
| Nikita  | Marathalli Bangalore   | Bangalore | Karnataka | 560037 | 98989898 | amarnikitabridgelabzcom |
| Ashwath | Kundalahalli Bangalore | Bangalore | Karnataka | 560037 |  9000000 | ashwathbridgelabzcom    |
+---------+------------------------+-----------+-----------+--------+----------+-------------------------+
2 rows in set (0.00 sec)

--UC-6 Ability to Retrieve
--Person belonging to
--a City or State from
--the Address Book
mysql> SELECT * FROM address_book WHERE City = 'Bangalore' OR State = 'Karnataka';
+---------+------------------------+-----------+-----------+--------+----------+-------------------------+
| Name    | Address                | City      | State     | Zip    | Phone_No | Email                   |
+---------+------------------------+-----------+-----------+--------+----------+-------------------------+
| Nikita  | Marathalli Bangalore   | Bangalore | Karnataka | 560037 | 98989898 | amarnikitabridgelabzcom |
| Ashwath | Kundalahalli Bangalore | Bangalore | Karnataka | 560037 |  9000000 | ashwathbridgelabzcom    |
+---------+------------------------+-----------+-----------+--------+----------+-------------------------+
2 rows in set (0.00 sec)

--UC-7 Ability to understand
--       the size of address
--       book by City and State
mysql> SELECT COUNT(City), COUNT(State) FROM address_book;
+-------------+--------------+
| COUNT(City) | COUNT(State) |
+-------------+--------------+
|           2 |            2 |
+-------------+--------------+
1 row in set (0.01 sec)

--UC-8 Ability to retrieve entries
--     sorted alphabetically by
--     Person’s name for a
--     given city
mysql> SELECT * FROM address_book WHERE City='Bangalore' ORDER BY Name;
+---------+------------------------+-----------+-----------+--------+----------+-------------------------+
| Name    | Address                | City      | State     | Zip    | Phone_No | Email                   |
+---------+------------------------+-----------+-----------+--------+----------+-------------------------+
| Ashwath | Kundalahalli Bangalore | Bangalore | Karnataka | 560037 |  9000000 | ashwathbridgelabzcom    |
| Nikita  | Marathalli Bangalore   | Bangalore | Karnataka | 560037 | 98989898 | amarnikitabridgelabzcom |
+---------+------------------------+-----------+-----------+--------+----------+-------------------------+
2 rows in set (0.00 sec)


--UC-9 Ability to identify each
--       Address Book with name and
--       Type.

mysql> ALTER TABLE address_book
    -> ADD (Type varchar(30) NOT NULL);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from address_book;
+---------+------------------------+-----------+-----------+--------+----------+-------------------------+------+
| Name    | Address                | City      | State     | Zip    | Phone_No | Email                   | Type |
+---------+------------------------+-----------+-----------+--------+----------+-------------------------+------+
| Nikita  | Marathalli Bangalore   | Bangalore | Karnataka | 560037 | 98989898 | amarnikitabridgelabzcom |      |
| Ashwath | Kundalahalli Bangalore | Bangalore | Karnataka | 560037 |  9000000 | ashwathbridgelabzcom    |      |
+---------+------------------------+-----------+-----------+--------+----------+-------------------------+------+
2 rows in set (0.00 sec)

mysql> UPDATE address_book
    -> SET Type = 'Friend' WHERE Name = 'Nikita';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE address_book SET Type = 'Professional' WHERE Name = 'Ashwath';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from address_book;
+---------+------------------------+-----------+-----------+--------+----------+-------------------------+--------------+
| Name    | Address                | City      | State     | Zip    | Phone_No | Email                   | Type         |
+---------+------------------------+-----------+-----------+--------+----------+-------------------------+--------------+
| Nikita  | Marathalli Bangalore   | Bangalore | Karnataka | 560037 | 98989898 | amarnikitabridgelabzcom | Friend       |
| Ashwath | Kundalahalli Bangalore | Bangalore | Karnataka | 560037 |  9000000 | ashwathbridgelabzcom    | Professional |
+---------+------------------------+-----------+-----------+--------+----------+-------------------------+--------------+
2 rows in set (0.00 sec)

--UC10
mysql> SELECT COUNT(Type) FROM address_book WHERE Type = 'Friend';
+-------------+
| COUNT(Type) |
+-------------+
|           1 |
+-------------+
1 row in set (0.00 sec)


--UC-11

mysql> INSERT INTO address_book VALUES ('Maria', 'JP-nagar Bangalore', 'Bangalore', 'Karnataka', 560067, 90008888, 'mariabridgelabzcom','Friend'), ('Maria', 'JPnagar Bangalore', 'Bangalore','Karnataka', 560067, 90008888, 'mariabridgelabzcom','Family');
Query OK, 2 rows affected (0.02 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from address_book;
+---------+------------------------+-----------+-----------+--------+----------+-------------------------+--------------+
| Name    | Address                | City      | State     | Zip    | Phone_No | Email                   | Type         |
+---------+------------------------+-----------+-----------+--------+----------+-------------------------+--------------+
| Nikita  | Marathalli Bangalore   | Bangalore | Karnataka | 560037 | 98989898 | amarnikitabridgelabzcom | Friend       |
| Ashwath | Kundalahalli Bangalore | Bangalore | Karnataka | 560037 |  9000000 | ashwathbridgelabzcom    | Professional |
| Maria   | JP-nagar Bangalore     | Bangalore | Karnataka | 560067 | 90008888 | mariabridgelabzcom      | Friend       |
| Maria   | JPnagar Bangalore      | Bangalore | Karnataka | 560067 | 90008888 | mariabridgelabzcom      | Family       |
+---------+------------------------+-----------+-----------+--------+----------+-------------------------+--------------+
4 rows in set (0.00 sec)
