# Day 7: Linux SSH Authentication

<img width="1423" height="758" alt="image" src="https://github.com/user-attachments/assets/2ddfbc8e-4f80-4c7c-ae8b-5a8ffbad780c" />


The system admins team of xFusionCorp Industries has set up some scripts on jump host that run on regular intervals and perform operations on all app servers in Stratos Datacenter. 
To make these scripts work properly we need to make sure the thor user on jump host has password-less SSH access to all app servers through their respective sudo users (i.e tony for app server 1). 

Based on the requirements, perform the following:

Set up a password-less authentication from user thor on jump host to all app servers through their respective sudo users.

```sh
thor@jumphost ~$ ssh-keygen -t rsa -N ""
Generating public/private rsa key pair.
Enter file in which to save the key (/home/thor/.ssh/id_rsa): y
Your identification has been saved in y
Your public key has been saved in y.pub
The key fingerprint is:
SHA256:km335AfraKTa7kkE4ynColGBjI4mPDjt5W+sjdIy73U thor@jumphost.stratos.xfusioncorp.com
The key's randomart image is:
+---[RSA 3072]----+
|o..              |
|o. .             |
|=..   o          |
|=B. .. *         |
|=o+o. = S . o    |
|.o.... + ..+ o   |
|.  . o. Eo  + .  |
|  + .+++...o .   |
|   *=oo+=.. .    |
+----[SHA256]-----+
thor@jumphost ~$

```


```sh
+----[SHA256]-----+
thor@jumphost ~$ ssh-copy-id tony@172.16.238.10
/usr/bin/ssh-copy-id: ERROR: No identities found
thor@jumphost ~$ ssh-copy-id -i /home/thor/.ssh/authorized_keys 
.bash_logout   .bashrc        .ssh/          y.pub          
.bash_profile  .config/       y              
thor@jumphost ~$ ssh-copy-id -i /home/thor/.ssh/authorized_keys 
.bash_logout   .bashrc        .ssh/          y.pub          
.bash_profile  .config/       y              
thor@jumphost ~$ ssh-copy-id -i /home/thor/.ssh/authorized_keys/y.pub tony@172.16.238.10 

/usr/bin/ssh-copy-id: ERROR: failed to open ID file '/home/thor/.ssh/authorized_keys/y.pub': Not a directory
thor@jumphost ~$ ssh-copy-id -i ~/y.pub tony@172.16.238.10
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/thor/y.pub"
The authenticity of host '172.16.238.10 (172.16.238.10)' can't be established.
ED25519 key fingerprint is SHA256:J2xXxOPYkELtFXHNX6ELgG53RrIx11SHske2EYnzJJg.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
tony@172.16.238.10's password: 

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'tony@172.16.238.10'"
and check to make sure that only the key(s) you wanted were added.

thor@jumphost ~$
```

```sh
thor@jumphost ~$ ssh-copy-id -i ~/y.pub steve@172.16.238.11
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/thor/y.pub"
The authenticity of host '172.16.238.11 (172.16.238.11)' can't be established.
ED25519 key fingerprint is SHA256:uFHbLI4GJ09oj2r5x4GRewQegSDO5DJXx0dhg6HXtC0.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
steve@172.16.238.11's password: 

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'steve@172.16.238.11'"
and check to make sure that only the key(s) you wanted were added.

thor@jumphost ~$
```

```sh
thor@jumphost ~$ ssh-copy-id -i ~/y.pub banner@172.16.238.12
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/thor/y.pub"
The authenticity of host '172.16.238.12 (172.16.238.12)' can't be established.
ED25519 key fingerprint is SHA256:b+mP3d0pnz1Zr9YG1mxfQb9UrmR1EwkPQp3Xg3GY9FI.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
banner@172.16.238.12's password: 

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'banner@172.16.238.12'"
and check to make sure that only the key(s) you wanted were added.

thor@jumphost ~$
```

```sh
thor@jumphost ~$ ssh-keygen -t rsa -N ""
Generating public/private rsa key pair.
Enter file in which to save the key (/home/thor/.ssh/id_rsa): 
Your identification has been saved in /home/thor/.ssh/id_rsa
Your public key has been saved in /home/thor/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:O8I/hh176eSg6qr2Vh2K2vjbbBNbH0RxVVufArMTnI8 thor@jumphost.stratos.xfusioncorp.com
The key's randomart image is:
+---[RSA 3072]----+
|         .o=o....|
|         ..o=   =|
|        .  oo. o.|
|       . . E...  |
|    . o S        |
|   . = o.o       |
|  + . *o=oo.     |
| + oo+.+=*o      |
|o.=*=+o..+o      |
+----[SHA256]-----+
thor@jumphost ~$ rm ~/y ~/y.pub
thor@jumphost ~$ ssh-copy-id tony@172.16.238.10
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/thor/.ssh/id_rsa.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
tony@172.16.238.10's password: 

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'tony@172.16.238.10'"
and check to make sure that only the key(s) you wanted were added.

thor@jumphost ~$ ssh-copy-id steve@172.16.238.11
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/thor/.ssh/id_rsa.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
steve@172.16.238.11's password: 

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'steve@172.16.238.11'"
and check to make sure that only the key(s) you wanted were added.

thor@jumphost ~$ ssh-copy-id banner@172.16.238.12
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/thor/.ssh/id_rsa.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
banner@172.16.238.12's password: 

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'banner@172.16.238.12'"
and check to make sure that only the key(s) you wanted were added.

thor@jumphost ~$ ssh tony@172.16.238.10
[tony@stapp01 ~]$
```

<img width="1653" height="1130" alt="image" src="https://github.com/user-attachments/assets/6279c458-19af-4809-82ce-d5caaacb19b4" />

<img width="705" height="785" alt="image" src="https://github.com/user-attachments/assets/99209c30-1983-46a0-88ea-9883af899ead" />

<img width="707" height="842" alt="image" src="https://github.com/user-attachments/assets/6bfeb2d8-1b43-49ba-9129-a051be9b98aa" />

```sh
SSH Authentication Setup
Step 1: Generate SSH Keys on Jump Host
Log in to the jump host as user thor and generate a new SSH key pair without a passphrase:
ssh-keygen -t rsa -N ""
Step 2: Copy Public Key to App Servers
Copy the generated public key (~/.ssh/id_rsa.pub) to each application server for their respective sudo users (e.g., tony on app server 1):
ssh-copy-id tony@app_server_1_ip
Repeat this for all app servers and their corresponding users.
Step 3: Test Password-less Access
Verify that user thor can log in to the app servers without being prompted for a password:
ssh tony@app_server_1_ip
Answer:
Password-less SSH access has been successfully configured from the thor user on the jump host to the specified sudo users on all application servers in the Stratos Datacenter.
```
