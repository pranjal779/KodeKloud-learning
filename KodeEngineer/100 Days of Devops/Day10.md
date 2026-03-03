# Day 10: Linux Bash Scripts

<img width="1352" height="820" alt="image" src="https://github.com/user-attachments/assets/c8dba409-ce1f-483a-b6b2-0364364ec8d4" />

<img width="941" height="932" alt="image" src="https://github.com/user-attachments/assets/af81fd66-78ba-4a23-8a2c-e684759fb44d" />

```sh
The production support team of xFusionCorp Industries is working on developing some bash scripts to automate different day to day tasks.
One is to create a bash script for taking websites backup. They have a static website running on App Server 3 in Stratos Datacenter,
and they need to create a bash script named beta_backup.sh which should accomplish the following tasks. (Also remember to place the script under /scripts directory on App Server 3).

a. Create a zip archive named xfusioncorp_beta.zip of /var/www/html/beta directory.

b. Save the archive in /backup/ on App Server 3. This is a temporary storage, as backups from this location will be clean on weekly basis. Therefore, we also need to save this backup archive on Nautilus Backup Server.

c. Copy the created archive to Nautilus Backup Server server in /backup/ location.

d. Please make sure script won't ask for password while copying the archive file. Additionally, the respective server user (for example, tony in case of App Server 1) must be able to run it.

e. Do not use sudo inside the script.

Note:
The zip package must be installed on given App Server before executing the script. This package is essential for creating the zip archive of the website files. Install it manually outside the script.
```

```sh
#!/bin/bash

# Define variables
BACKUP_DIR="/backup"
SOURCE_DIR="/var/www/html/beta"
ZIP_NAME="xfusioncorp_beta.zip"
BACKUP_SERVER_USER="user"
BACKUP_SERVER_IP="nautilus-backup-server-ip"
BACKUP_SERVER_PATH="/backup/"


# a. Create a zip archive
zip -r ${/backup/}/${xfusioncorp_beta.zip} ${/var/www/html/beta}

# b. Archive is saved in /backup/ on App Server 3

# c. Copy the created archieve to Nautilus Backup Server
scp ${/backup/}/${xfusion_beta.zip}@${172.16.238.10}:${/backup/}
~                                                                                  
~                                                                                  
:wq!
````


1st attempt:

Create a Website Backup Script
Step 1: Install Dependencies
Ensure the zip package is installed on App Server 3. If it is not, install it using the package manager.
Code

sudo yum install -y zip # For RHEL/CentOS
# OR
sudo apt install -y zip # For Ubuntu/Debian
Step 2: Configure Passwordless SSH
To satisfy the requirement that the script does not ask for a password when copying files, you must set up SSH key-based authentication from App Server 3 to the Nautilus Backup Server. Generate keys on App Server 3 (if not already done) and copy the public key to the backup server for the specific user running the script.
Code

ssh-keygen -t rsa
ssh-copy-id user@nautilus-backup-server-ip
Step 3: Create the Script
Create the file /scripts/beta_backup.sh and add the following bash commands.
Code

#!/bin/bash

# Define variables
BACKUP_DIR="/backup"
SOURCE_DIR="/var/www/html/beta"
ZIP_NAME="xfusioncorp_beta.zip"
BACKUP_SERVER_USER="user"
BACKUP_SERVER_IP="nautilus-backup-server-ip"
BACKUP_SERVER_PATH="/backup/"

# a. Create a zip archive
zip -r ${BACKUP_DIR}/${ZIP_NAME} ${SOURCE_DIR}

# b. Archive is saved in /backup/ on App Server 3 (implicitly done by above command)

# c. Copy the created archive to Nautilus Backup Server
scp ${BACKUP_DIR}/${ZIP_NAME} ${BACKUP_SERVER_USER}@${BACKUP_SERVER_IP}:${BACKUP_SERVER_PATH}
Step 4: Make Script Executable
Set the appropriate permissions to ensure the user can run the script.
Code

chmod +x /scripts/beta_backup.sh
Answer:
The final script created at /scripts/beta_backup.sh uses zip to create the archive and scp to transfer it, leveraging SSH keys to avoid password prompts.


-------------------

```txt
The production support team of xFusionCorp Industries is working on developing some bash scripts to automate different day to day tasks. One is to create a bash script for taking websites backup. They have a static website running on App Server 1 in Stratos Datacenter, and they need to create a bash script named beta_backup.sh which should accomplish the following tasks. (Also remember to place the script under /scripts directory on App Server 1).



a. Create a zip archive named xfusioncorp_beta.zip of /var/www/html/beta directory.


b. Save the archive in /backup/ on App Server 1. This is a temporary storage, as backups from this location will be clean on weekly basis. Therefore, we also need to save this backup archive on Nautilus Backup Server.


c. Copy the created archive to Nautilus Backup Server server in /backup/ location.


d. Please make sure script won't ask for password while copying the archive file. Additionally, the respective server user (for example, tony in case of App Server 1) must be able to run it.


e. Do not use sudo inside the script.

Note:
The zip package must be installed on given App Server before executing the script. This package is essential for creating the zip archive of the website files. Install it manually outside the script.

```

```sh
[tony@stapp01 ~]$ cd /
[tony@stapp01 /]$ ls -ld /scripts/ /backup/
drwxrwxrwx 2 root root 4096 Mar  3 11:31 /backup/
drwxrwxrwx 2 root root 4096 Mar  3 11:31 /scripts/
[tony@stapp01 /]$

[tony@stapp01 ~]$ ls
[tony@stapp01 ~]$ ls -la
total 32
drwx------ 1 tony tony 4096 Mar  3 11:36 .
drwxr-xr-x 1 root root 4096 Aug 30  2025 ..
-rw-r--r-- 1 tony tony   18 Feb 15  2024 .bash_logout
-rw-r--r-- 1 tony tony  141 Feb 15  2024 .bash_profile
-rw-r--r-- 1 tony tony  492 Feb 15  2024 .bashrc
-rw------- 1 tony tony   20 Mar  3 11:36 .lesshst
[tony@stapp01 ~]$ cd /
[tony@stapp01 /]$ ls -ld /scripts/ /backup/
drwxrwxrwx 2 root root 4096 Mar  3 11:31 /backup/
drwxrwxrwx 2 root root 4096 Mar  3 11:31 /scripts/
[tony@stapp01 /]$ sudo chown tony:tony /scripts/ /backup/

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for tony: 
[tony@stapp01 /]$ ls -ls /scripts/ /backup/
/backup/:
total 0

/scripts/:
total 0
[tony@stapp01 /]$ ls -ld /scripts/ /backup/
drwxrwxrwx 2 tony tony 4096 Mar  3 11:31 /backup/
drwxrwxrwx 2 tony tony 4096 Mar  3 11:31 /scripts/
[tony@stapp01 /]$

[tony@stapp01 /]$ which zip
/usr/bin/which: no zip in (/home/tony/.local/bin:/home/tony/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin)
[tony@stapp01 /]$ sudo yum install zip
Installed:
  unzip-6.0-59.el9.x86_64                                       zip-3.0-35.el9.x86_64                                      

Complete!
[tony@stapp01 /]$

[tony@stapp01 /]$ # Backup server
[tony@stapp01 /]$ # need to set up  Backup server for the task
[tony@stapp01 /]$ exit
logout
Connection to 172.16.238.10 closed.
thor@jumphost ~$

thor@jumphost ~$ ssh clint@172.16.238.16

[clint@stbkp01 ~]$ ls -ltr /s
sbin/ srv/  sys/  
[clint@stbkp01 ~]$ ls -ltr /scripts /backup/
ls: cannot access '/scripts': No such file or directory
/backup/:
total 0
[clint@stbkp01 ~]$

[sudo] password for clint: 
[clint@stbkp01 ~]$ ls -ltr /backup/
total 0
[clint@stbkp01 ~]$ ls -a /backup/
.  ..
[clint@stbkp01 ~]$ ls -la /backup/
total 8
drwxrwxrwx 2 clint clint 4096 Mar  3 11:31 .
drwxr-xr-x 1 root  root  4096 Mar  3 11:54 ..
[clint@stbkp01 ~]$ ls -ld /backup/
drwxrwxrwx 2 clint clint 4096 Mar  3 11:31 /backup/
[clint@stbkp01 ~]$


thor@jumphost ~$ ssh tony@172.16.238.10
tony@172.16.238.10's password:
Last login: Tue Mar  3 11:35:50 2026 from 172.16.238.3
[tony@stapp01 ~]$ # Generate both the private and public key pair in the app server.
[tony@stapp01 ~]$ ssh-keygen -t rsa -b 3330
Generating public/private rsa key pair.
Enter file in which to save the key (/home/tony/.ssh/id_rsa): 
Created directory '/home/tony/.ssh'.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/tony/.ssh/id_rsa
Your public key has been saved in /home/tony/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:BPajY2YXwwgaieRY22Ywg809hSX2AkzWsWLu+zusUDg tony@stapp01.stratos.xfusioncorp.com
The key's randomart image is:
+---[RSA 3330]----+
|.OX+===          |
|=o=@=* =         |
|..= *.o B        |
| + + . o +       |
|E o   * S        |
| +   + o         |
|. ..             |
| . .o            |
|  oooo           |
+----[SHA256]-----+
[tony@stapp01 ~]$ 

[tony@stapp01 ~]$ # Place the public key (id_rsa.pub) into the stbkp01 user’s authorized_keys file:
[tony@stapp01 ~]$ ssh-copy-id clint@172.16.238.16
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/tony/.ssh/id_rsa.pub"
The authenticity of host '172.16.238.16 (172.16.238.16)' can't be established.
ED25519 key fingerprint is SHA256:FygvejyVTS105M/9O4aqXOfewzMEU7ZH9w2G9ZA9+E8.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
clint@172.16.238.16's password: 

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'clint@172.16.238.16'"
and check to make sure that only the key(s) you wanted were added.


[tony@stapp01 ~]$ ssh clint@172.16.238.16
Last login: Tue Mar  3 11:52:09 2026 from 172.16.238.3
[clint@stbkp01 ~]$

[tony@stapp01 ~]$ ssh clint@172.16.238.16
Last login: Tue Mar  3 11:52:09 2026 from 172.16.238.3
[clint@stbkp01 ~]$ 
[clint@stbkp01 ~]$ 
[clint@stbkp01 ~]$ # Create the ecommerce_backup.sh.
[clint@stbkp01 ~]$ exit
logout
Connection to 172.16.238.16 closed.
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ # Create the beta_backup.sh
[tony@stapp01 ~]$ # Make sure you create the script inside the /scripts directory in the app server.
[tony@stapp01 ~]$

[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ vi beta_backup.sh
[tony@stapp01 ~]$ cat beta_backup.sh 
#!/bin/bash
# ==============================================
# ecommerce_backup.sh
# Purpose: Backup website ecommerce to local and remote backup server
# ==============================================

# --- Configuration ---
SRC_DIR="/var/www/html/ecommerce"
BACKUP_DIR="/backup"
ARCHIVE_NAME="xfusioncorp_media.zip"
REMOTE_USER="clint"
REMOTE_HOST="stbkp01"
REMOTE_DIR="/backup"

# --- Step 1: Create local backup archive ---
echo "[$(date)] Starting backup process..."
echo "Creating zip archive from $SRC_DIR ..."

zip -r "${BACKUP_DIR}/${ARCHIVE_NAME}" "${SRC_DIR}" > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "Error: Failed to create zip archive. Exiting."
  exit 1
fi

# --- Step 2: Copy archive to remote backup server ---
echo "Copying archive to ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR} ..."
scp "${BACKUP_DIR}/${ARCHIVE_NAME}" "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}/" > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "Error: Failed to copy archive to remote server. Exiting."
  exit 2
fi

echo "[$(date)] Backup completed successfully."
exit 0
[tony@stapp01 ~]$

[tony@stapp01 ~]$ # Tony should be able to run the script (execute permision)
[tony@stapp01 ~]$ sudo chmod 700 beta_backup.sh
[sudo] password for tony: 
[tony@stapp01 ~]$ ls -la
total 44
drwx------ 1 tony tony 4096 Mar  3 12:07 .
drwxr-xr-x 1 root root 4096 Aug 30  2025 ..
-rw------- 1 tony tony  261 Mar  3 11:51 .bash_history
-rw-r--r-- 1 tony tony   18 Feb 15  2024 .bash_logout
-rw-r--r-- 1 tony tony  141 Feb 15  2024 .bash_profile
-rw-r--r-- 1 tony tony  492 Feb 15  2024 .bashrc
-rw------- 1 tony tony   20 Mar  3 11:36 .lesshst
drwx------ 2 tony tony 4096 Mar  3 12:02 .ssh
-rwx------ 1 tony tony 1064 Mar  3 12:07 beta_backup.sh
[tony@stapp01 ~]$


[tony@stapp01 ~]$ # place the beta_backup.sh in scripts folder
[tony@stapp01 ~]$ mkdir /scripts
mkdir: cannot create directory ‘/scripts’: File exists
[tony@stapp01 ~]$ mkdir /scripts/
mkdir: cannot create directory ‘/scripts/’: File exists
[tony@stapp01 ~]$ ls
beta_backup.sh
[tony@stapp01 ~]$ ls /scripts/
[tony@stapp01 ~]$ ls -ld /scripts/
drwxrwxrwx 2 tony tony 4096 Mar  3 11:31 /scripts/
[tony@stapp01 ~]$ mv beta_backup.sh /scripts/
[tony@stapp01 ~]$ ls -la /scripts/
total 12
drwxrwxrwx 2 tony tony 4096 Mar  3 12:12 .
drwxr-xr-x 1 root root 4096 Mar  3 12:10 ..
-rwx------ 1 tony tony 1064 Mar  3 12:07 beta_backup.sh
[tony@stapp01 ~]$

[tony@stapp01 scripts]$ vi beta_backup.sh
[tony@stapp01 scripts]$ cat beta_backup.sh 
#!/bin/bash
# Create a zip archive of the website directory
zip -r /backup/xfusioncorp_beta.zip /var/www/html/beta

# Copy the archive to the Nautilus Backup Server
# Ensure SSH keys are configured for passwordless authentication
scp /backup/xfusioncorp_beta.zip clint@172.16.238.16:/backup/
[tony@stapp01 scripts]$

[tony@stapp01 scripts]$ vi beta_backup.sh
[tony@stapp01 scripts]$ cat beta_backup.sh 
#!/bin/bash
# Create a zip archive of the website directory
zip -r /backup/xfusioncorp_beta.zip /var/www/html/beta

# Copy the archive to the Nautilus Backup Server
# Ensure SSH keys are configured for passwordless authentication
scp /backup/xfusioncorp_beta.zip clint@172.16.238.16:/backup/
[tony@stapp01 scripts]$

[tony@stapp01 scripts]$ ls -la /backup/
total 12
drwxrwxrwx 2 tony tony 4096 Mar  3 12:20 .
drwxr-xr-x 1 root root 4096 Mar  3 12:20 ..
-rw-r--r-- 1 tony tony  588 Mar  3 12:20 xfusioncorp_beta.zip
[tony@stapp01 scripts]$

[tony@stapp01 scripts]$ ssh clint@172.16.238.16
Last login: Tue Mar  3 12:03:15 2026 from 172.16.238.10
[clint@stbkp01 ~]$ ls -la /backup/
total 12
drwxrwxrwx 2 clint clint 4096 Mar  3 12:20 .
drwxr-xr-x 1 root  root  4096 Mar  3 12:21 ..
-rw-r--r-- 1 clint clint  588 Mar  3 12:20 xfusioncorp_beta.zip
[clint@stbkp01 ~]$ unzip -l /backup/xfusioncorp_beta.zip 
Archive:  /backup/xfusioncorp_beta.zip
  Length      Date    Time    Name
---------  ---------- -----   ----
        0  03-03-2026 11:29   var/www/html/beta/
       38  03-03-2026 11:31   var/www/html/beta/index.html
        0  03-03-2026 11:29   var/www/html/beta/.gitkeep
---------                     -------
       38                     3 files
[clint@stbkp01 ~]$

[clint@stbkp01 ~]$ ls -la /
total 80
drwxr-xr-x    1 root   root   4096 Mar  3 12:21 .
drwxr-xr-x    1 root   root   4096 Mar  3 12:21 ..
-rwxr-xr-x    1 root   root      0 Mar  3 11:31 .dockerenv
dr-xr-xr-x    2 root   root   4096 Jun 25  2024 afs
drwxrwxrwx    2 clint  clint  4096 Mar  3 12:20 backup
lrwxrwxrwx    1 root   root      7 Jun 25  2024 bin -> usr/bin
dr-xr-xr-x    2 root   root   4096 Jun 25  2024 boot
drwxr-xr-x    5 root   root    380 Mar  3 11:31 dev
drwxr-xr-x    1 root   root   4096 Mar  3 11:31 etc
drwxr-xr-x    1 root   root   4096 Aug 29  2025 home
lrwxrwxrwx    1 root   root      7 Jun 25  2024 lib -> usr/lib
lrwxrwxrwx    1 root   root      9 Jun 25  2024 lib64 -> usr/lib64
drwx------    2 root   root   4096 Aug 26  2025 lost+found
drwxr-xr-x    2 root   root   4096 Jun 25  2024 media
drwxr-xr-x    2 root   root   4096 Jun 25  2024 mnt
drwxr-xr-x    2 root   root   4096 Jun 25  2024 opt
dr-xr-xr-x 1183 root   root      0 Mar  3 11:31 proc
dr-xr-x---    1 root   root   4096 Aug 29  2025 root
drwxr-xr-x   16 root   root    400 Mar  3 11:31 run
lrwxrwxrwx    1 root   root      8 Jun 25  2024 sbin -> usr/sbin
drwxr-xr-x    2 root   root   4096 Jun 25  2024 srv
dr-xr-xr-x   13 nobody nobody    0 Mar  3 11:31 sys
drwxrwxrwt    1 root   root   4096 Mar  3 12:22 tmp
drwxr-xr-x    1 root   root   4096 Aug 26  2025 usr
drwxr-xr-x    1 root   root   4096 Mar  3 11:31 var
[clint@stbkp01 ~]$ ls -la /backup/
total 12
drwxrwxrwx 2 clint clint 4096 Mar  3 12:20 .
drwxr-xr-x 1 root  root  4096 Mar  3 12:23 ..
-rw-r--r-- 1 clint clint  588 Mar  3 12:20 xfusioncorp_beta.zip
[clint@stbkp01 ~]$ 


```

<img width="1987" height="1170" alt="image" src="https://github.com/user-attachments/assets/3b79b4b6-e6fb-45c5-b102-ceec032095d3" />

<img width="961" height="707" alt="image" src="https://github.com/user-attachments/assets/cf55df0a-ad6b-4818-bab3-cf8eee7be837" />
