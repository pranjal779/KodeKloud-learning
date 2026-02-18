In a bid to automate backup processes, the xFusionCorp Industries sysadmin team has developed a new bash script named xfusioncorp.sh. 
While the script has been distributed to all necessary servers, it lacks executable permissions on App Server 2 within the Stratos Datacenter.

Your task is to grant executable permissions to the /tmp/xfusioncorp.sh script on App Server 2. Additionally, ensure that all users have the capability to execute it.

<img width="980" height="581" alt="image" src="https://github.com/user-attachments/assets/d7395959-ee1c-4a0b-a258-2123ebefb85c" />

<img width="706" height="612" alt="image" src="https://github.com/user-attachments/assets/0b113aa3-7513-4a59-94a6-6e4659449361" />

Grant Executable Permissions to Bash Script
Answer: To grant executable permissions to all users for the script, use the command chmod +x /tmp/xfusioncorp.sh on App Server 2.

Step 1: Access the server                 
Log in to App Server 2 within the Stratos Datacenter via terminal.                

Step 2: Grant permissions                 
Execute the following command to make the script executable by all users:                
chmod +x /tmp/xfusioncorp.sh            

Answer:                 
The script /tmp/xfusioncorp.sh now has executable permissions for all users.


```sh
thor@jumphost ~$ ssh steve@172.16.238.11
The authenticity of host '172.16.238.11 (172.16.238.11)' can't be established.
ED25519 key fingerprint is SHA256:eVi6tN/V9H5UPAiLPoF35lThwTqo7vYCjuWHYa6dLNo.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '172.16.238.11' (ED25519) to the list of known hosts.
steve@172.16.238.11's password: 
[steve@stapp02 ~]$ chmod +x /tmp/xfusioncorp.sh
chmod: changing permissions of '/tmp/xfusioncorp.sh': Operation not permitted
[steve@stapp02 ~]$ sudo chmod +x /tmp/xfusioncorp.sh

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for steve: 
[steve@stapp02 ~]$ ls
[steve@stapp02 ~]$ ls -la
total 28
drwx------ 1 steve steve 4096 Aug 29 12:53 .
drwxr-xr-x 1 root  root  4096 Aug 29 12:53 ..
-rw-r--r-- 1 steve steve   18 Feb 15  2024 .bash_logout
-rw-r--r-- 1 steve steve  141 Feb 15  2024 .bash_profile
-rw-r--r-- 1 steve steve  492 Feb 15  2024 .bashrc
[steve@stapp02 ~]$ ls /tmp/
systemd-private-67cb53a3c10243b48b2ee03df34bd593-dbus-broker.service-3Wc88E
systemd-private-67cb53a3c10243b48b2ee03df34bd593-systemd-logind.service-VQUbIx
xfusioncorp.sh
[steve@stapp02 ~]$

[steve@stapp02 ~]$ cat /tmp/xfusioncorp.sh 
cat: /tmp/xfusioncorp.sh: Permission denied
[steve@stapp02 ~]$ sudo cat /tmp/xfusioncorp.sh 
#!/bin/bash

echo "Welcome To KodeKloud"[steve@stapp02 ~]$ 
```

<img width="943" height="618" alt="image" src="https://github.com/user-attachments/assets/35ede637-4508-45f9-a1a2-0b8d20e38eab" />


---------

https://shubhamksawant.medium.com/linux-file-permissions-dd7c1dd314fb

Please give executable permissions to /tmp/xfusioncorp.sh script on App Server 1. Also make sure every user can execute it.

Note :- Perform commands based on your question ie server, user name & other details might be different so modify the commands accordingly

You will be on jump server you need to Login on App server as per the task given “ ssh tony@stapp01 ” and become sudo user with “ sudo su ” command (you can find out the architecture and wiki in side bar )
List the file existing file permission for that use ll or ls -ltr command
“ ls -ltr /tmp/xfusioncorp.sh “
As per the task all other users need to have execute permission for that we use chmod command “ chmod o+rx /tmp/xfusioncorp.sh “

<img width="689" height="204" alt="image" src="https://github.com/user-attachments/assets/8ca2b4b0-61ab-4e60-898b-13f2a593582c" />

or you can use “ chmod 006 /tmp/xfusioncorp.sh “

<img width="977" height="204" alt="image" src="https://github.com/user-attachments/assets/77ed984d-0361-42d9-bc39-20421f257ef3" />

4. Verify the file permissions and execute the script form user
“ ls -lrt /tmp/xfusioncorp.sh “
“ sh /tmp/xfusioncorp.sh “
5. If your able to see the output then Click on Finish & Confirm to complete the task successful

```sh
thor@jumphost ~$ ssh banner@172.16.238.12
The authenticity of host '172.16.238.12 (172.16.238.12)' can't be established.
ED25519 key fingerprint is SHA256:iuPaAIwE3zhg3d1ugPkMthMKG5HzpQsqZmoeiH1b/QE.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '172.16.238.12' (ED25519) to the list of known hosts.
banner@172.16.238.12's password: 
[banner@stapp03 ~]$ ls -ltr /tmp/xfusioncorp.sh 
---------- 1 root root 40 Feb 18 15:54 /tmp/xfusioncorp.sh
[banner@stapp03 ~]$ sudo chmod o+rx /tmp/xfusioncorp.sh 

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for banner: 
[banner@stapp03 ~]$ ls -lrt /tmp/xfusioncorp.sh 
-------r-x 1 root root 40 Feb 18 15:54 /tmp/xfusioncorp.sh
[banner@stapp03 ~]$ sh /tmp/xfusioncorp.sh 
Welcome To KodeKloud
[banner@stapp03 ~]$
```

<img width="2162" height="1152" alt="image" src="https://github.com/user-attachments/assets/012a7c3e-a0db-4959-bd49-77b9858df965" />

<img width="2057" height="1157" alt="image" src="https://github.com/user-attachments/assets/54a8096d-519a-49ed-adab-fcbb7238f2df" />
