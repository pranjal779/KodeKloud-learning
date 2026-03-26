# Day 18: Install and Configure DB Server

<img width="917" height="667" alt="image" src="https://github.com/user-attachments/assets/b81a9778-54bc-427b-a5f2-4ca60afdd245" />

We need to setup a database server on Nautilus DB Server in Stratos Datacenter. 
Please perform the below given steps on DB Server:

a. Install/Configure MariaDB server.

b. Create a database named kodekloud_db9.

c. Create a user called kodekloud_joy and set its password to 8FmzjvFU6S.

d. Grant full permissions to user kodekloud_joy on database kodekloud_db9.


```sh
[peter@stdb01 ~]$ sudo systemctl enable --now mariadb
Created symlink /etc/systemd/system/mysql.service → /usr/lib/systemd/system/mariadb.service.
Created symlink /etc/systemd/system/mysqld.service → /usr/lib/systemd/system/mariadb.service.
Created symlink /etc/systemd/system/multi-user.target.wants/mariadb.service → /usr/lib/systemd/system/mariadb.service.
[peter@stdb01 ~]$ sudo systemctl status mariadb
● mariadb.service - MariaDB 10.5 database server
     Loaded: loaded (/usr/lib/systemd/system/mariadb.service; enabled; preset: disabled)
     Active: active (running) since Thu 2026-03-26 01:12:11 UTC; 13s ago
       Docs: man:mariadbd(8)
             https://mariadb.com/kb/en/library/systemd/
    Process: 36962 ExecStartPre=/usr/libexec/mariadb-check-socket (code=exited, status=0/SUCCESS)
    Process: 36984 ExecStartPre=/usr/libexec/mariadb-prepare-db-dir mariadb.service (code=exited, status=0/SUCCESS)
    Process: 37149 ExecStartPost=/usr/libexec/mariadb-check-upgrade (code=exited, status=0/SUCCESS)
   Main PID: 37111 (mariadbd)
     Status: "Taking your SQL requests now..."
      Tasks: 31 (limit: 404712)
     Memory: 67.4M
        CPU: 323ms
     CGroup: /system.slice/mariadb.service
             └─37111 /usr/libexec/mariadbd --basedir=/usr

Mar 26 01:12:11 stdb01 mariadb-prepare-db-dir[37047]: The second is mysql@localhost, it has no password either, but
Mar 26 01:12:11 stdb01 mariadb-prepare-db-dir[37047]: you need to be the system 'mysql' user to connect.
Mar 26 01:12:11 stdb01 mariadb-prepare-db-dir[37047]: After connecting you can set the password, if you would need to be
Mar 26 01:12:11 stdb01 mariadb-prepare-db-dir[37047]: able to connect as any of these users with a password and without sudo
Mar 26 01:12:11 stdb01 mariadb-prepare-db-dir[37047]: See the MariaDB Knowledgebase at https://mariadb.com/kb
Mar 26 01:12:11 stdb01 mariadb-prepare-db-dir[37047]: Please report any problems at https://mariadb.org/jira
Mar 26 01:12:11 stdb01 mariadb-prepare-db-dir[37047]: The latest information about MariaDB is available at https://mariadb.>
Mar 26 01:12:11 stdb01 mariadb-prepare-db-dir[37047]: Consider joining MariaDB's strong and vibrant community:
Mar 26 01:12:11 stdb01 mariadb-prepare-db-dir[37047]: https://mariadb.org/get-involved/
Mar 26 01:12:11 stdb01 systemd[1]: Started MariaDB 10.5 database server.
[peter@stdb01 ~]$


Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 3
Server version: 10.5.29-MariaDB MariaDB Server

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> CREATE DATABASE kodekloud_db9;
Query OK, 1 row affected (0.000 sec)

MariaDB [(none)]> CREATE USER 'kodekloude_joy'@'%' IDENTIFIED BY '8FmzjvFU6S';
Query OK, 0 rows affected (0.000 sec)

MariaDB [(none)]> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.000 sec)

MariaDB [(none)]> EXIT;



```

<img width="2257" height="1140" alt="image" src="https://github.com/user-attachments/assets/da8a6216-78c0-4584-8546-f4f6ed3936f4" />


<img width="865" height="673" alt="image" src="https://github.com/user-attachments/assets/a14bc9ea-a3ca-4a1e-93f3-857da23036bf" />

```sh
[peter@stdb01 ~]$ sudo systemctl start mariadb
[peter@stdb01 ~]$ sudo systemctl enable mariadb
Created symlink /etc/systemd/system/mysql.service → /usr/lib/systemd/system/mariadb.service.
Created symlink /etc/systemd/system/mysqld.service → /usr/lib/systemd/system/mariadb.service.
Created symlink /etc/systemd/system/multi-user.target.wants/mariadb.service → /usr/lib/systemd/system/mariadb.service.
[peter@stdb01 ~]$
MariaDB [(none)]> CREATE DATABASE kodekloud_db9;
Query OK, 1 row affected (0.000 sec)

MariaDB [(none)]> CREATE USER 'kodekloud_aim'@'localhost' IDENTIFIED BY 'dCV3szSGNA';
Query OK, 0 rows affected (0.000 sec)
MariaDB [(none)]> GRANT ALL PRIVILEGES ON kodekloude_db9.* TO 'kodekloud_aim'@'localhost';
Query OK, 0 rows affected (0.000 sec)

MariaDB [(none)]>
MariaDB [(none)]> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| kodekloud_db9      |
| mysql              |
| performance_schema |
+--------------------+
4 rows in set (0.000 sec)

MariaDB [(none)]> SELECT user, host FROM mysql.user WHERE user = 'kodekloud_aim';
+---------------+-----------+
| User          | Host      |
+---------------+-----------+
| kodekloud_aim | localhost |
+---------------+-----------+
1 row in set (0.001 sec)

MariaDB [(none)]> SHOW GRANTS FOR 'kodekloud_aim'@'localhost';
+----------------------------------------------------------------------------------------------------------------------+
| Grants for kodekloud_aim@localhost                                                                                   |
+----------------------------------------------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `kodekloud_aim`@`localhost` IDENTIFIED BY PASSWORD '*CBDF3766EDC50C4506732AABB8812FCA8C5DA84E' |
| GRANT ALL PRIVILEGES ON `kodekloude_db9`.* TO `kodekloud_aim`@`localhost`                                            |
+----------------------------------------------------------------------------------------------------------------------+
2 rows in set (0.000 sec)

MariaDB [(none)]> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.000 sec)

MariaDB [(none)]> SHOW GRANTS FOR 'kodekloud_aim'@'localhost';
+----------------------------------------------------------------------------------------------------------------------+
| Grants for kodekloud_aim@localhost                                                                                   |
+----------------------------------------------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `kodekloud_aim`@`localhost` IDENTIFIED BY PASSWORD '*CBDF3766EDC50C4506732AABB8812FCA8C5DA84E' |
| GRANT ALL PRIVILEGES ON `kodekloude_db9`.* TO `kodekloud_aim`@`localhost`                                            |
+----------------------------------------------------------------------------------------------------------------------+
2 rows in set (0.000 sec)

MariaDB [(none)]> EXIT
Bye
[peter@stdb01 ~]$ 
```

<img width="2317" height="1136" alt="image" src="https://github.com/user-attachments/assets/84ba01a7-5c3f-4868-8460-ca32b39d6493" />

<img width="937" height="635" alt="image" src="https://github.com/user-attachments/assets/b34ee7f5-1e10-4b15-831c-71e17e18d271" />

We need to setup a database server on Nautilus DB Server in Stratos Datacenter. Please perform the below given steps on DB Server:

a. Install/Configure MariaDB server.

b. Create a database named kodekloud_db10.

c. Create a user called kodekloud_pop and set its password to BruCStnMT5.

d. Grant full permissions to user kodekloud_pop on database kodekloud_db10.

```sh

[peter@stdb01 ~]$ sudo systemctl start mariadb
[peter@stdb01 ~]$ sudo systemctl enable mariadb
Created symlink /etc/systemd/system/mysql.service → /usr/lib/systemd/system/mariadb.service.
Created symlink /etc/systemd/system/mysqld.service → /usr/lib/systemd/system/mariadb.service.
Created symlink /etc/systemd/system/multi-user.target.wants/mariadb.service → /usr/lib/systemd/system/mariadb.service.
[peter@stdb01 ~]$
MariaDB [(none)]> DROP DATABASE kodekloud_db01;
Query OK, 0 rows affected (0.001 sec)

MariaDB [(none)]> CREATE DATABASE kodekloud_db10;
Query OK, 1 row affected (0.000 sec)

MariaDB [(none)]> CREATE USER 'kodekloud_pop'@'localhost' IDENTIFIED BY 'BruCStnMT5';
ERROR 1396 (HY000): Operation CREATE USER failed for 'kodekloud_pop'@'localhost'
MariaDB [(none)]> CREATE USER 'kodekloud_pop'@'%' IDENTIFIED BY 'BruCStnMT5';
ERROR 1396 (HY000): Operation CREATE USER failed for 'kodekloud_pop'@'%'
MariaDB [(none)]> SELECT user, host FROM mysql.user WHERE user = 'kodekloud_pop';
+---------------+-----------+
| User          | Host      |
+---------------+-----------+
| kodekloud_pop | %         |
| kodekloud_pop | localhost |
+---------------+-----------+
2 rows in set (0.001 sec)

MariaDB [(none)]>


MariaDB [(none)]> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| kodekloud_db10     |
| mysql              |
| performance_schema |
+--------------------+
4 rows in set (0.000 sec)

MariaDB [(none)]>


MariaDB [(none)]> GRANT ALL PRIVILEGES ON kodekloud_db10.* TO 'kodekloud_pop'@'localhost';
Query OK, 0 rows affected (0.000 sec)


MariaDB [(none)]> SHOW GRANTS FOR 'kodekloud_pop'@'localhost';
+----------------------------------------------------------------------------------------------------------------------+
| Grants for kodekloud_pop@localhost                                                                                   |
+----------------------------------------------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `kodekloud_pop`@`localhost` IDENTIFIED BY PASSWORD '*F3B5522F1EDC437B82C6B6F92F26A6224E4F086E' |
| GRANT ALL PRIVILEGES ON `kodekloud_db10`.* TO `kodekloud_pop`@`localhost`                                            |
+----------------------------------------------------------------------------------------------------------------------+
2 rows in set (0.000 sec)

MariaDB [(none)]> 
```



<img width="2355" height="1152" alt="image" src="https://github.com/user-attachments/assets/6d721342-506c-4c8d-8853-8e7dab11a866" />

<img width="983" height="658" alt="image" src="https://github.com/user-attachments/assets/775efd39-f52c-4e01-8d29-457c22d7239e" />
