# Day 74: Jenkins Database Backup Job

[reference 1](https://medium.com/@janemils/kodekloud-engineer-day-74-jenkins-database-backup-job-fd651378c7f6)   
[reference 2](https://dev.to/wycliffealphus/100-days-of-devops-day-74-1a3o)  
[reference 3](https://youtu.be/5klMUdDXCao?si=XdlHiwDC2wuTwlEn)   


There is a requirement to create a Jenkins job to automate the database backup. Below you can find more details to accomplish this task:  

Click on the Jenkins button on the top bar to access the Jenkins UI. Login using username admin and password Adm!n321.  

Create a Jenkins job named database-backup.  

Configure it to take a database dump of the kodekloud_db01 database present on the App server (stapp01) in Stratos Datacenter, the database user is kodekloud_roy and password is asdfgdsd.  

The dump should be named in db_$(date +%F).sql format, where date +%F is the current date.  
Copy the db_$(date +%F).sql dump to the Storage server (ststor01) under location /home/natasha/db_backups.  
Further, schedule this job to run periodically at */10 * * * * (please use this exact schedule format).  

Note:
You might need to install some plugins and restart Jenkins service. So, we recommend clicking on Restart Jenkins when installation is complete and no jobs are running on plugin installation/update page i.e update centre. Also, Jenkins UI sometimes gets stuck when Jenkins service restarts in the back end. In this case please make sure to refresh the UI page.  
Please make sure to define you cron expression like this */10 * * * * (this is just an example to run job every 10 minutes).  
For these kind of scenarios requiring changes to be done in a web UI, please take screenshots so that you can share it with us for review in case your task is marked incomplete. You may also consider using a screen recording software such as loom.com to record and share your work.  

<img width="1157" height="666" alt="image" src="https://github.com/user-attachments/assets/cf5665c7-175c-471b-bb58-e5e9174bd363" />


<img width="876" height="1222" alt="image" src="https://github.com/user-attachments/assets/916e04e4-f02f-4ca0-b39d-069f876f7b3f" />
<img width="2216" height="1165" alt="image" src="https://github.com/user-attachments/assets/b4c94377-9afd-4599-bae0-b19c60ad25e9" />


```sh
# Shell command to take the backup of the database from the stapp01 server and copy between the servers.
# And, do make sure you use the '\' while naming the copy, so that it actually creates the backup file name in that format.
ssh tony@stapp01 "
  mysqldump -u kodekloud_roy -pasdfgdsd kodekloud_db01 > /tmp/db_\$(date +%F).sql &&
  scp /tmp/db_\$(date +%F).sql natasha@ststor01:/home/natasha/db_backups/
"
```

<img width="930" height="840" alt="image" src="https://github.com/user-attachments/assets/8ce90d26-ec41-40aa-9be8-644d84c20dc7" />
<img width="1557" height="641" alt="image" src="https://github.com/user-attachments/assets/53f5f357-af51-4500-83b7-b35c02a78877" />

```sh
thor@jumphost ~$ ssh jenkins@jenkins
The authenticity of host 'jenkins (10.244.195.40)' can't be established.
ED25519 key fingerprint is SHA256:tyX2fFBjS0A5pNlRaih+266sGG9JD0LpsFdIAX9iMzA.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'jenkins' (ED25519) to the list of known hosts.
jenkins@jenkins's password: 
Welcome to Ubuntu 24.04.4 LTS (GNU/Linux 6.8.0-94-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

This system has been minimized by removing packages and content that are
not required on a system that users do not log into.

To restore this content, you can run the 'unminimize' command.

The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

jenkins@jenkins:~$ ssh-keygen -t rsa -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key (/var/lib/jenkins/.ssh/id_rsa): 
Created directory '/var/lib/jenkins/.ssh'.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /var/lib/jenkins/.ssh/id_rsa
Your public key has been saved in /var/lib/jenkins/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:NeU6iUIfX0aezxuFCAClHHiCvOCymwoUy0Wc6WFlkd0 jenkins@jenkins.stratos.xfusioncorp.com
The key's randomart image is:
+---[RSA 4096]----+
| ..o+=*o+.. o    |
|. +*+o.+ E * o . |
|.ooo.o+ . o B . .|
|o.=. . . = * o . |
|.=    . S =   +  |
|o      .   .   o |
|.o            .  |
|+                |
|o                |
+----[SHA256]-----+
jenkins@jenkins:~$ ssh-copy-id tony@stapp01
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/var/lib/jenkins/.ssh/id_rsa.pub"
The authenticity of host 'stapp01 (10.244.221.77)' can't be established.
ED25519 key fingerprint is SHA256:yEyN8qvzhNxfcKVE+H05zwQPmQMKCXj4JyGWuOP1HIg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
tony@stapp01's password: 

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'tony@stapp01'"
and check to make sure that only the key(s) you wanted were added.

jenkins@jenkins:~$ ssh 'tony@stapp01'
[tony@stapp01 ~]$ ssh-keygen -t rsa -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key (/home/tony/.ssh/id_rsa): 
Enter passphrase for "/home/tony/.ssh/id_rsa" (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/tony/.ssh/id_rsa
Your public key has been saved in /home/tony/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:zeac4l70KCn/mUIDaAzymSKn8NgxPboUTl/YzPxGHv4 tony@stapp01
The key's randomart image is:
+---[RSA 4096]----+
|                 |
|. .              |
| o * B           |
|+ X B B oo       |
|oX B o *S.=      |
|o * .   B* +     |
| . .  .o+o* .    |
|  .    +.+Eo     |
|       .+o+      |
+----[SHA256]-----+
[tony@stapp01 ~]$ ssh-copy-id natasha@ststor01
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/tony/.ssh/id_rsa.pub"
The authenticity of host 'ststor01 (10.244.247.254)' can't be established.
ED25519 key fingerprint is SHA256:yEyN8qvzhNxfcKVE+H05zwQPmQMKCXj4JyGWuOP1HIg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? 
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
The authenticity of host 'ststor01 (10.244.247.254)' can't be established.
ED25519 key fingerprint is SHA256:yEyN8qvzhNxfcKVE+H05zwQPmQMKCXj4JyGWuOP1HIg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? 

/usr/bin/ssh-copy-id: ERROR: Host key verification failed.

[tony@stapp01 ~]$ exit
logout
Connection to stapp01 closed.
jenkins@jenkins:~$ ssh 'tony@stapp01'
Last login: Sat Jun 20 06:53:28 2026 from 10.244.195.40
[tony@stapp01 ~]$ exit
logout
Connection to stapp01 closed.
jenkins@jenkins:~$ exit
logout
Connection to jenkins closed.
thor@jumphost ~$ ssh tony@stapp01
The authenticity of host 'stapp01 (10.244.221.77)' can't be established.
ED25519 key fingerprint is SHA256:yEyN8qvzhNxfcKVE+H05zwQPmQMKCXj4JyGWuOP1HIg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp01' (ED25519) to the list of known hosts.
tony@stapp01's password: 
Last login: Sat Jun 20 06:56:34 2026 from 10.244.195.40
[tony@stapp01 ~]$ ssh-keygen -t rsa -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key (/home/tony/.ssh/id_rsa): 
/home/tony/.ssh/id_rsa already exists.
Overwrite (y/n)? y
Enter passphrase for "/home/tony/.ssh/id_rsa" (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/tony/.ssh/id_rsa
Your public key has been saved in /home/tony/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:797wZ1I5NYFBoM3DtRLIonyhXWWXSpdS0llTJLf4lC8 tony@stapp01
The key's randomart image is:
+---[RSA 4096]----+
|        . o*=*O+=|
|       o +*o=Bo++|
|    . + +..*+o +.|
|     + o   .o o.o|
|      . S     E+o|
|         .    +. |
|          o  . . |
|         . +. o  |
|         .o o+   |
+----[SHA256]-----+
[tony@stapp01 ~]$ ssh-copy-id natasha@ststor01
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/tony/.ssh/id_rsa.pub"
The authenticity of host 'ststor01 (10.244.247.254)' can't be established.
ED25519 key fingerprint is SHA256:yEyN8qvzhNxfcKVE+H05zwQPmQMKCXj4JyGWuOP1HIg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
natasha@ststor01's password: 

Number of key(s) added: 1

Now try logging into the machine, with: "ssh 'natasha@ststor01'"
and check to make sure that only the key(s) you wanted were added.

[tony@stapp01 ~]$ ssh 'natasha@ststor01'
[natasha@ststor01 ~]$ ssh-keygen -t rsa -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key (/home/natasha/.ssh/id_rsa): 
Enter passphrase for "/home/natasha/.ssh/id_rsa" (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/natasha/.ssh/id_rsa
Your public key has been saved in /home/natasha/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:OjhOrz7c47G7VC9ICZPQqDVxkMVoJsTzYJHeZdDt2Hg natasha@ststor01
The key's randomart image is:
+---[RSA 4096]----+
|oo*@= .          |
|.*Ooo= .         |
|o*=.* =          |
|.. o = E         |
|      + S        |
|     o + .       |
|   .+.* . .      |
|   oo+o+ .       |
|   .++*+         |
+----[SHA256]-----+
[natasha@ststor01 ~]$
```


<img width="1102" height="866" alt="image" src="https://github.com/user-attachments/assets/c0311730-8ee3-407e-b41e-e7a505c9b3e6" />

<img width="1507" height="612" alt="image" src="https://github.com/user-attachments/assets/5eb4862e-4553-4714-baba-ca06e6abf06f" />



```sh
thor@jumphost ~$ ssh tony@stapp01
The authenticity of host 'stapp01 (10.244.221.77)' can't be established.
ED25519 key fingerprint is SHA256:yEyN8qvzhNxfcKVE+H05zwQPmQMKCXj4JyGWuOP1HIg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp01' (ED25519) to the list of known hosts.
tony@stapp01's password: 
Last login: Sat Jun 20 06:56:34 2026 from 10.244.195.40
[tony@stapp01 ~]$ ssh-keygen -t rsa -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key (/home/tony/.ssh/id_rsa): 
/home/tony/.ssh/id_rsa already exists.
Overwrite (y/n)? y
Enter passphrase for "/home/tony/.ssh/id_rsa" (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/tony/.ssh/id_rsa
Your public key has been saved in /home/tony/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:797wZ1I5NYFBoM3DtRLIonyhXWWXSpdS0llTJLf4lC8 tony@stapp01
The key's randomart image is:
+---[RSA 4096]----+
|        . o*=*O+=|
|       o +*o=Bo++|
|    . + +..*+o +.|
|     + o   .o o.o|
|      . S     E+o|
|         .    +. |
|          o  . . |
|         . +. o  |
|         .o o+   |
+----[SHA256]-----+
[tony@stapp01 ~]$ ssh-copy-id natasha@ststor01
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/tony/.ssh/id_rsa.pub"
The authenticity of host 'ststor01 (10.244.247.254)' can't be established.
ED25519 key fingerprint is SHA256:yEyN8qvzhNxfcKVE+H05zwQPmQMKCXj4JyGWuOP1HIg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
natasha@ststor01's password: 

Number of key(s) added: 1

Now try logging into the machine, with: "ssh 'natasha@ststor01'"
and check to make sure that only the key(s) you wanted were added.

[tony@stapp01 ~]$ ssh 'natasha@ststor01'
[natasha@ststor01 ~]$ ssh-keygen -t rsa -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key (/home/natasha/.ssh/id_rsa): 
Enter passphrase for "/home/natasha/.ssh/id_rsa" (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/natasha/.ssh/id_rsa
Your public key has been saved in /home/natasha/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:OjhOrz7c47G7VC9ICZPQqDVxkMVoJsTzYJHeZdDt2Hg natasha@ststor01
The key's randomart image is:
+---[RSA 4096]----+
|oo*@= .          |
|.*Ooo= .         |
|o*=.* =          |
|.. o = E         |
|      + S        |
|     o + .       |
|   .+.* . .      |
|   oo+o+ .       |
|   .++*+         |
+----[SHA256]-----+
[natasha@ststor01 ~]$ exit
logout
Connection to ststor01 closed.
[tony@stapp01 ~]$ ls /tmp
db_2026-06-20.sql
systemd-private-02b42a984482424a877c720e7172ccdb-dbus-broker.service-Bewq90
systemd-private-02b42a984482424a877c720e7172ccdb-httpd.service-NrjFzB
systemd-private-02b42a984482424a877c720e7172ccdb-mariadb.service-gYigK6
systemd-private-02b42a984482424a877c720e7172ccdb-rtkit-daemon.service-KDAq38
systemd-private-02b42a984482424a877c720e7172ccdb-systemd-logind.service-HXZEPG
systemd-private-02b42a984482424a877c720e7172ccdb-upower.service-e3vW18
[tony@stapp01 ~]$ cat db_2026-06-20.sql
cat: db_2026-06-20.sql: No such file or directory
[tony@stapp01 ~]$ cat /temp/db_2026-06-20.sql
cat: /temp/db_2026-06-20.sql: No such file or directory
[tony@stapp01 ~]$ cat /tmp/db_2026-06-20.sql
/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.29-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: kodekloud_db01
-- ------------------------------------------------------
-- Server version       10.5.29-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-20  7:11:00
[tony@stapp01 ~]$


[tony@stapp01 ~]$ ssh 'natasha@ststor01'
Last login: Sat Jun 20 07:01:34 2026 from 10.244.221.77
[natasha@ststor01 ~]$ ls /home/natasha/db_backups/
db_2026-06-20.sql
[natasha@ststor01 ~]$ cat ls /home/natasha/db_backups/db_2026-06-20.sql 
cat: ls: No such file or directory
/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.29-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: kodekloud_db01
-- ------------------------------------------------------
-- Server version       10.5.29-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-20  7:11:00
[natasha@ststor01 ~]$ 
```
<img width="2097" height="1187" alt="image" src="https://github.com/user-attachments/assets/38f1a9fe-b603-4117-8a20-758b5a05809a" />
<img width="2177" height="1177" alt="image" src="https://github.com/user-attachments/assets/b8f0f003-54da-4437-a313-b3fd2b0c8127" />
- job 'database-backup' build is not configured to run periodically at '*/10 * * * *'

