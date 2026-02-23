# Day 9: MariaDB Troubleshooting
<img width="1460" height="797" alt="image" src="https://github.com/user-attachments/assets/c65b15e2-b817-409a-8856-800a7981b175" />

<img width="966" height="588" alt="image" src="https://github.com/user-attachments/assets/d49072e1-b21a-4e38-a0bb-b5dbc1b44a6c" />

```sh
There is a critical issue going on with the Nautilus application in Stratos DC.
The production support team identified that the application is unable to connect to the database.
After digging into the issue, the team found that mariadb service is down on the database server.

Look into the issue and fix the same.
```

```sh
[peter@stdb01 ~]$ systemctl status mariadb
○ mariadb.service - MariaDB 10.5 database server
     Loaded: loaded (/usr/lib/systemd/system/mariadb.service; enabled; 
preset: disabled)
     Active: inactive (dead) since Mon 2026-02-23 16:08:43 UTC; 9min ago
   Duration: 6.017s
       Docs: man:mariadbd(8)
             https://mariadb.com/kb/e
n/library/systemd/
    Process: 876 ExecStartPre=/usr/libexec/mariadb-check-socket (code=exited, statu
s=0/SUCCESS)
    Process: 1086 ExecStartPre=/usr/libexec/mariadb-prepare-db-dir mariadb.service 
(code=exited, status=0/SUCCESS)
    Process: 1454 ExecStart=/usr/libexec/mariadbd --basedir=/usr $MYSQLD_OPTS $_WSR
EP_NEW_CLUSTER (code=exited, status=0/SUCCESS)
    Process: 1504 ExecStartPost=/usr/libexec/mariadb-check-upgrade (code=exited, st
atus=0/SUCCESS)
   Main PID: 1454 (code=exited, status=0/SUCCESS)
     Status: "MariaDB server is down"

Feb 23 16:08:42 stdb01.stratos.xfusioncorp.com systemd[1]: 
mariadb.service: Got notification message from PID 1454 (STATUS=Free innodb
 buffer pool, EXTEND_TIMEOUT_USEC=30000000)
Feb 23 16:08:42 stdb01.stratos.xfusioncorp.com systemd[1]: 
mariadb.service: Got notification message from PID 1454 (STATUS=MariaDB ser
ver is down)
Feb 23 16:08:42 stdb01.stratos.xfusioncorp.com systemd[1]: 
mariadb.service: Got notification message from PID 1454 (STATUS=MariaDB ser
ver is down)
Feb 23 16:08:43 stdb01.stratos.xfusioncorp.com systemd[1]: 
mariadb.service: Child 1454 belongs to mariadb.service.
Feb 23 16:08:43 stdb01.stratos.xfusioncorp.com systemd[1]: 
mariadb.service: Main process exited, code=exited, status=0/SUCCESS (succes
s)
Feb 23 16:08:43 stdb01.stratos.xfusioncorp.com systemd[1]: mariadb.service: Deactiv
ated successfully.
Feb 23 16:08:43 stdb01.stratos.xfusioncorp.com systemd[1]: 
mariadb.service: Service restart not allowed.
Feb 23 16:08:43 stdb01.stratos.xfusioncorp.com systemd[1]: 
mariadb.service: Changed stop-sigterm -> dead
Feb 23 16:08:43 stdb01.stratos.xfusioncorp.com systemd[1]: 
mariadb.service: Job 112 mariadb.service/stop finished, result=done
Feb 23 16:08:43 stdb01.stratos.xfusioncorp.com systemd[1]: Stopped MariaDB 10.5 da
```


https://blog.devops.dev/day-9-of-100-days-of-devops-troubleshooting-mariadb-in-production-b12958a61477 

```sh
cat /var/log/mariadb/mariadb.log | tail -30

[peter@stdb01 ~]$ cat /var/log/mariadb/mariadb.log | tail -30
cat: /var/log/mariadb/mariadb.log: Permission denied
[peter@stdb01 ~]$ sudo cat /var/log/mariadb/mariadb.log | tail -30
2026-02-23 16:08:42 0 [Note] /usr/libexec/mariadbd (initiated by: unknown): Normal shutdown
2026-02-23 16:08:42 0 [Note] InnoDB: FTS optimize thread exiting.
2026-02-23 16:08:42 0 [Note] InnoDB: Starting shutdown...
2026-02-23 16:08:42 0 [Note] InnoDB: Dumping buffer pool(s) to /var/lib/mysql/ib_buffer_pool
2026-02-23 16:08:42 0 [Note] InnoDB: Buffer pool(s) dump completed at 260223 16:08:42
2026-02-23 16:08:42 0 [Note] InnoDB: Removed temporary tablespace data file: "ibtmp1"
2026-02-23 16:08:42 0 [Note] InnoDB: Shutdown completed; log sequence number 45091; transaction id 21
2026-02-23 16:08:42 0 [Note] Event Scheduler: Purging the queue. 0 events
2026-02-23 16:08:42 0 [Note] /usr/libexec/mariadbd: Shutdown complete

2026-02-23 16:19:21 0 [Note] Starting MariaDB 10.5.27-MariaDB source revision 6aa47fae304bd1f3efc0ebd2035bc1481ded73a3 server_uid IK/mVBJLGRL/HpCzP44OZedLeZo= as process 2408
2026-02-23 16:19:21 0 [Note] InnoDB: Uses event mutexes
2026-02-23 16:19:21 0 [Note] InnoDB: Compressed tables use zlib 1.2.11
2026-02-23 16:19:21 0 [Note] InnoDB: Number of pools: 1
2026-02-23 16:19:21 0 [Note] InnoDB: Using crc32 + pclmulqdq instructions
2026-02-23 16:19:21 0 [Note] mariadbd: O_TMPFILE is not supported on /var/tmp (disabling future attempts)
2026-02-23 16:19:21 0 [Note] InnoDB: Using Linux native AIO
2026-02-23 16:19:21 0 [Note] InnoDB: Initializing buffer pool, total size = 134217728, chunk size = 134217728
2026-02-23 16:19:21 0 [Note] InnoDB: Completed initialization of buffer pool
2026-02-23 16:19:21 0 [Note] InnoDB: 128 rollback segments are active.
2026-02-23 16:19:21 0 [Note] InnoDB: Creating shared tablespace for temporary tables
2026-02-23 16:19:21 0 [Note] InnoDB: Setting file './ibtmp1' size to 12 MB. Physically writing the file full; Please wait ...
2026-02-23 16:19:21 0 [Note] InnoDB: File './ibtmp1' size is now 12 MB.
2026-02-23 16:19:21 0 [Note] InnoDB: 10.5.27 started; log sequence number 45091; transaction id 20
2026-02-23 16:19:21 0 [Note] Plugin 'FEEDBACK' is disabled.
2026-02-23 16:19:21 0 [Note] InnoDB: Loading buffer pool(s) from /var/lib/mysql/ib_buffer_pool
2026-02-23 16:19:21 0 [Note] InnoDB: Buffer pool(s) load completed at 260223 16:19:21
2026-02-23 16:19:21 0 [Note] Server socket created on IP: '::'.
2026-02-23 16:19:21 0 [ERROR] mariadbd: Can't create/write to file '/run/mariadb/mariadb.pid' (Errcode: 13 "Permission denied")
2026-02-23 16:19:21 0 [ERROR] Can't start server: can't create PID file: Permission denied
[peter@stdb01 ~]$
```

```sh
[peter@stdb01 ~]$ sudo su
[root@stdb01 peter]# chown -R mysql:mysql /run/mariadb
chmod 755 /run/mariadb
[root@stdb01 peter]# systemctl start mariadb
[root@stdb01 peter]# systemctl status mariadb
● mariadb.service - MariaDB 10.5 database server
     Loaded: loaded (/usr/lib/systemd/system/mariadb.service; enabled; preset: disabled)
     Active: active (running) since Mon 2026-02-23 16:24:15 UTC; 10s ago
       Docs: man:mariadbd(8)
             https://mariadb.com/kb/en/library/systemd/
    Process: 2626 ExecStartPre=/usr/libexec/mariadb-check-socket (code=exited, status=0/SUCCESS)
    Process: 2670 ExecStartPre=/usr/libexec/mariadb-prepare-db-dir mariadb.service (code=exited, status=0/SUCCESS)
    Process: 2798 ExecStartPost=/usr/libexec/mariadb-check-upgrade (code=exited, status=0/SUCCESS)
   Main PID: 2765 (mariadbd)
     Status: "Taking your SQL requests now..."
      Tasks: 14 (limit: 411434)
     Memory: 92.6M
     CGroup: /docker/18b618af078d670600460f3eca542e692ac66a8249a01cb736395512a73fe3f3/system.slice/mariadb.service
             └─2765 /usr/libexec/mariadbd --basedir=/usr

Feb 23 16:24:15 stdb01.stratos.xfusioncorp.com systemd[2798]: Remounted /run/systemd/unit-root/run/systemd/incoming.
Feb 23 16:24:15 stdb01.stratos.xfusioncorp.com systemd[2798]: Remounted /run/systemd/unit-root/run/credentials.
Feb 23 16:24:15 stdb01.stratos.xfusioncorp.com systemd[2798]: mariadb.service: Executing: /usr/libexec/mariadb-check-upgrade
Feb 23 16:24:15 stdb01.stratos.xfusioncorp.com systemd[1]: mariadb.service: Child 2798 belongs to mariadb.service.
Feb 23 16:24:15 stdb01.stratos.xfusioncorp.com systemd[1]: mariadb.service: Control process exited, code=exited, status=0/SUCCESS (success)
Feb 23 16:24:15 stdb01.stratos.xfusioncorp.com systemd[1]: mariadb.service: Got final SIGCHLD for state start-post.
Feb 23 16:24:15 stdb01.stratos.xfusioncorp.com systemd[1]: mariadb.service: Changed start-post -> running
Feb 23 16:24:15 stdb01.stratos.xfusioncorp.com systemd[1]: mariadb.service: Job 282 mariadb.service/start finished, result=done
Feb 23 16:24:15 stdb01.stratos.xfusioncorp.com systemd[1]: Started MariaDB 10.5 database server.
Feb 23 16:24:15 stdb01.stratos.xfusioncorp.com systemd[1]: mariadb.service: Failed to send unit change signal for mariadb.service: Connection reset by peer
[root@stdb01 peter]#
```

<img width="2422" height="1206" alt="image" src="https://github.com/user-attachments/assets/a415fc2e-1d18-460f-a572-b1162d87d303" />

<img width="977" height="675" alt="image" src="https://github.com/user-attachments/assets/3f36b848-7c60-45c2-9fc7-791ea09367e3" />
