# Day 84: Copy Data to App Servers using Ansible

The Nautilus DevOps team needs to copy data from the jump host to all application servers in Stratos DC using Ansible. Execute the task with the following details:

a. Create an inventory file /home/thor/ansible/inventory on jump_host and add all application servers as managed nodes.

b. Create a playbook /home/thor/ansible/playbook.yml on the jump host to copy the /usr/src/data/index.html file to all application servers, placing it at /opt/data.

Note: Validation will run the playbook using the command ansible-playbook -i inventory playbook.yml. Ensure the playbook functions properly without any extra arguments.


<img width="822" height="465" alt="image" src="https://github.com/user-attachments/assets/ba242c58-c794-4430-8161-58e8d1b785da" />

```sh
thor@jump-host ~$ ssh-keygen -t rsa -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key (/home/thor/.ssh/id_rsa): 
Created directory '/home/thor/.ssh'.
Enter passphrase for "/home/thor/.ssh/id_rsa" (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/thor/.ssh/id_rsa
Your public key has been saved in /home/thor/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:dxIEOrjfbyqHu21Iz8f+NjnA+okgqI7p5a71+cqYEhQ thor@jump-host
The key's randomart image is:
+---[RSA 4096]----+
|        ...      |
| E   . . .       |
|  . . o   .      |
| .   . .   .     |
|.   .   S.o .    |
| . . ... .oo     |
|  oo..o=.o . .   |
|.++ =.=o*o+.=    |
|*++= ==B+*=o.o   |
+----[SHA256]-----+
thor@jump-host ~$ ls -la .ssh
total 20
drwx------ 2 thor thor 4096 Jul 10 11:21 .
drwx------ 1 thor thor 4096 Jul 10 11:21 ..
-rw------- 1 thor thor 3381 Jul 10 11:21 id_rsa
-rw-r--r-- 1 thor thor  740 Jul 10 11:21 id_rsa.pub
thor@jump-host ~$ ssh-copy-id tony@stapp01
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/thor/.ssh/id_rsa.pub"
The authenticity of host 'stapp01 (10.244.240.118)' can't be established.
ED25519 key fingerprint is SHA256:GgZlhP+TJAQr2VmBL3y1wvXXRNtB+NtnOkHZgrfGM00.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
tony@stapp01's password: 

Number of key(s) added: 1

Now try logging into the machine, with: "ssh 'tony@stapp01'"
and check to make sure that only the key(s) you wanted were added.

thor@jump-host ~$ ssh-copy-id steve@stapp02
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/thor/.ssh/id_rsa.pub"
The authenticity of host 'stapp02 (10.244.97.242)' can't be established.
ED25519 key fingerprint is SHA256:Bky2RwrnMNp+cKrhRuj2bCUkhJ2xmsULPRTFDYCMkd4.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
steve@stapp02's password: 

Number of key(s) added: 1

Now try logging into the machine, with: "ssh 'steve@stapp02'"
and check to make sure that only the key(s) you wanted were added.

thor@jump-host ~$ ssh-copy-id banner@stapp03
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/thor/.ssh/id_rsa.pub"
The authenticity of host 'stapp03 (10.244.247.241)' can't be established.
ED25519 key fingerprint is SHA256:JVIi54R1fcmZwQRkCWNQjDX1EyS8t5qjEoLjKAxVmRk.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
banner@stapp03's password: 

Number of key(s) added: 1

Now try logging into the machine, with: "ssh 'banner@stapp03'"
and check to make sure that only the key(s) you wanted were added.

thor@jump-host ~$


thor@jump-host ~$ ssh tony@stapp01
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ exit
logout
Connection to stapp01 closed.
thor@jump-host ~$ ssh steve@stapp02
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$ exit
logout
Connection to stapp02 closed.
thor@jump-host ~$ ssh banner@stapp03

[banner@stapp03 ~]$ 
[banner@stapp03 ~]$ 
[banner@stapp03 ~]$ 
[banner@stapp03 ~]$ exit
logout
Connection to stapp03 closed.
thor@jump-host ~$ 
thor@jump-host ~$ 
thor@jump-host ~$




```



### Step-2: Create the inventory file.

<img width="1672" height="1187" alt="image" src="https://github.com/user-attachments/assets/611e26b5-6b78-403b-bc77-917f235f147e" />

```sh
thor@jump-host ~$ 
thor@jump-host ~$ vi /home/thor/ansible/inventory
thor@jump-host ~$ cat /home/thor/ansible/inventory 
[app_servers]
stapp01 ansible_host=stapp01 ansible_user=tony
stapp02 ansible_host=stapp02 ansible_user=steve
stapp03 ansible_host=stapp03 ansible_user=banner
thor@jump-host ~$

```

<img width="2352" height="1132" alt="image" src="https://github.com/user-attachments/assets/b9a15f27-a4b8-42f2-a7be-05d570f5c6ec" />




### Step-3: Create the playbook file.

<img width="2072" height="1117" alt="image" src="https://github.com/user-attachments/assets/dcc4aa6e-7b88-487e-b0d2-3642f7404120" />


```sh
thor@jump-host ~$ vi /home/thor/ansible/playbook.yml
thor@jump-host ~$ cat /home/thor/ansible/playbook.yml
---
- hosts: app_servers
  become: yes

  tasks:
    - name: Copy file from the jumphost server to the remote app servers.
      copy:
        src: /usr/src/data/index.html
        dest: /opt/data
thor@jump-host ~$

```


### Step-4: Validate the execution of the playbook against the inventory file.




```sh
thor@jump-host ~$ ssh tony@stapp01
Last login: Fri Jul 10 11:24:06 2026 from 10.244.234.246
[tony@stapp01 ~]$ ls -la /opt/data
total 12
drwxr-xr-x 2 root root 4096 Jul 10 11:18 .
drwxr-xr-x 1 root root 4096 Jul 10 11:18 ..
[tony@stapp01 ~]$


thor@jump-host ~$ cd /home/thor/ansible/
thor@jump-host ~/ansible$ ansible-playbook -i inventory playbook.yml

PLAY [app_servers] *********************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************************
ok: [stapp03]
ok: [stapp02]
ok: [stapp01]

TASK [Copy file from the jumphost server to the remote app servers.] *******************************************************
changed: [stapp02]
changed: [stapp01]
changed: [stapp03]

PLAY RECAP *****************************************************************************************************************
stapp01                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
stapp02                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
stapp03                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

thor@jump-host ~/ansible$


Last login: Fri Jul 10 11:33:23 2026 from 10.244.234.246
[tony@stapp01 ~]$ ls -la /opt/data
total 16
drwxr-xr-x 2 root root 4096 Jul 10 11:33 .
drwxr-xr-x 1 root root 4096 Jul 10 11:18 ..
-rw-r--r-- 1 root root   35 Jul 10 11:33 index.html
[tony@stapp01 ~]$ cat /opt/data/index.html 
Welcome to xFusionCorp Industries ![tony@stapp01 ~]$ 

```

<img width="2407" height="1176" alt="image" src="https://github.com/user-attachments/assets/6ce3428a-b36f-42a5-96bc-768c4410018f" />

<img width="2372" height="1217" alt="image" src="https://github.com/user-attachments/assets/cdeaa521-7288-44c7-b36d-99be7e23cd06" />









