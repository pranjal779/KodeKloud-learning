# Day 6: Create a Cron Job

<img width="1467" height="797" alt="image" src="https://github.com/user-attachments/assets/ddbf10f9-c3fd-4e59-a9ce-9d4ec296c92c" />

<img width="963" height="635" alt="image" src="https://github.com/user-attachments/assets/04e7d667-1929-4fce-9b1d-48c124eae673" />

```txt
The Nautilus system admins team has prepared scripts to automate several day-to-day tasks.
They want them to be deployed on all app servers in Stratos DC on a set schedule.
Before that they need to test similar functionality with a sample cron job. Therefore, perform the steps below:

a. Install cronie package on all Nautilus app servers and start crond service.

b. Add a cron */5 * * * * echo hello > /tmp/cron_text for root user.
```


```sh
a. Install cronie package on all Nautilus app servers and start crond service 
Step 1: Install the cronie package
First, install the cronie package using a package manager like yum or apt, depending on the Linux distribution used on the Nautilus app servers. The command would typically be: yum install -y cronie 
Step 2: Start and enable the crond service
After installation, the crond service needs to be started and enabled to ensure it runs automatically on system boot. Use systemctl commands for this:
systemctl start crond
systemctl enable crond 
Answer:
The steps involve running the commands yum install -y cronie, then systemctl start crond, and finally systemctl enable crond on all designated app servers.
b. Add a cron */5 * * * * echo hello > /tmp/cron_text for root user 
Step 1: Access the root user's crontab
To add a cron job for the root user, you can either switch to the root user first (sudo su - or su -) or use the crontab -e -u root command. 
Step 2: Add the cron entry
Edit the crontab file using crontab -e (as root) or by adding the entry directly to the system-wide crontab file, typically located at /etc/crontab.
Add the following line to the file: */5 * * * * root echo hello > /tmp/cron_text 
Step 3: Verify and ensure service is running
Verify the entry was added correctly using crontab -l. The crond service, which was started in part (a), will automatically pick up this new job and run the command every five minutes. 
Answer:
The cron job can be added for the root user by running crontab -e as root and adding the line */5 * * * * echo hello > /tmp/cron_text,
or by adding the line */5 * * * * root echo hello > /tmp/cron_text to the /etc/crontab file
```


reference Doc: https://tundedamian.medium.com/day-6-of-100-days-of-devops-automating-tasks-with-cron-across-distributed-servers-56aff833cec5


```sh
[tony@stapp01 ~]$ history
    1  tum install -y cronie
    2  yum install -y cronie
    3  sudo su
    4  history
[tony@stapp01 ~]$ sudo su
[sudo] password for tony: 
[root@stapp01 tony]# history
    1  yum install -y cronie
    2  systemctl start crond
    3  systemctl enable crond
    4  cron */5 * * * * echo hello > /tmp/cron_text
    5  */5 * * * * echo hello > /tmp/cron_text
    6  */5 * * * * echo hello > /tmp/cron_text
    7  sudo systemctl start crond
    8  sudo systemctl enable crond
    9  echo "*/5 * * * * echo hello > /tmp/cron_text"
   10  echo "*/5 * * * * echo hello > /tmp/cron_text" >> /var/spool/cron/root
   11  systemctl restart crond
   12  cat /tmp/cron_text
   13  ls /var/spool/cron/root 
   14  ls -la /var/spool/cron/root 
   15  sudo cat /tmp/cron_text
   16  sudo cat /tmp/cron_text
   17  echo "*/5 * * * * echo hello > /tmp/cron_text" >> /etc/crontab
   18  systemctl restart crond
   19  exit
   20  history
[root@stapp01 tony]#
```

```sh
[root@stapp02 steve]# history
    1  yum install -y cronie
    2  systemctl start crond
    3  systemctl enable crond
    4  echo "*/5 * * * * echo hello > /tmp/cron_text" >> /etc/crontab
    5  systemctl restart crond
    6  history
[root@stapp02 steve]# 
```

```sh
[root@stapp03 banner]# history
    1  yum install -y cronie
    2  systemctl start crond
    3  systemctl enable crond
    4  echo "*/5 * * * * echo hello > /tmp/cron_text" >> /etc/crontab
    5  systemctl restart crond
    6  history
[root@stapp03 banner]#
```

<img width="2127" height="1151" alt="image" src="https://github.com/user-attachments/assets/895b8b18-c1d1-4908-8ba1-f205f3ae651f" />

<img width="962" height="711" alt="image" src="https://github.com/user-attachments/assets/0769b4af-e7fe-47ce-8731-2c5219cf19aa" />

