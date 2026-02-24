
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
