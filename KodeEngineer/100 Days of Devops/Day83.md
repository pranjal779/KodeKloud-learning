# Day 83: Troubleshoot and Create Ansible Playbook

<img width="817" height="490" alt="image" src="https://github.com/user-attachments/assets/eca4bd1b-ac1b-4562-88d0-58bc4fbb1f10" />

An Ansible playbook needs completion on the jump host, where a team member left off. Below are the details:

The inventory file /home/thor/ansible/inventory requires adjustments. The playbook must run on App Server 2 in Stratos DC. Update the inventory accordingly.

Create a playbook /home/thor/ansible/playbook.yml. Include a task to create an empty file /tmp/file.txt on App Server 2.

Note: Validation will run the playbook using the command ansible-playbook -i inventory playbook.yml. Ensure the playbook works without any additional arguments.


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
SHA256:TZQdOlF3oZyAnkc8wl0I1EpxrM4ISx4zPS5omLGG9us thor@jump-host
The key's randomart image is:
+---[RSA 4096]----+
|        o+@*=o..o|
|         *o@+.o. |
|      . o X .+   |
| .   * o B o     |
|. = + B S o      |
|.* o + o o       |
|o o   .          |
|   .             |
|  .E.            |
+----[SHA256]-----+
thor@jump-host ~$ ls -la .ssh
total 20
drwx------ 2 thor thor 4096 Jul  9 19:06 .
drwx------ 1 thor thor 4096 Jul  9 19:05 ..
-rw------- 1 thor thor 3381 Jul  9 19:06 id_rsa
-rw-r--r-- 1 thor thor  740 Jul  9 19:06 id_rsa.pub
thor@jump-host ~$ ssh-copy-id steve@stapp02
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/thor/.ssh/id_rsa.pub"
The authenticity of host 'stapp02 (10.244.164.19)' can't be established.
ED25519 key fingerprint is SHA256:LgC/htp1JtBBG9LS9eMJkkstB1tyyVHYTUMAs9Zjn2Y.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
steve@stapp02's password: 

Number of key(s) added: 1

Now try logging into the machine, with: "ssh 'steve@stapp02'"
and check to make sure that only the key(s) you wanted were added.

thor@jump-host ~$

thor@jump-host ~$ cd /home/thor/ansible/
thor@jump-host ~/ansible$ ls
inventory
thor@jump-host ~/ansible$ cat inventory 
stapp03 ansible_user=banner ansible_ssh_pass=$pwd ansible_ssh_common_args='-o StrictHostKeyChecking=no'thor@jump-host ~/ansible$

thor@jump-host ~$ ls -la /home/thor/ansible/inventory 
-rw-r--r-- 1 thor thor 103 Jul  9 19:04 /home/thor/ansible/inventory
thor@jump-host ~$ 

```

<img width="2391" height="1180" alt="image" src="https://github.com/user-attachments/assets/a4398274-385f-4d6b-a92e-e1f7a320559d" />
<img width="2280" height="1186" alt="image" src="https://github.com/user-attachments/assets/2d0bc407-9acb-4f8c-865d-d5ecf55000a1" />
<img width="2381" height="1147" alt="image" src="https://github.com/user-attachments/assets/6a73f3e1-db92-4865-a6ed-e5d7fb6d7d08" />

```sh
thor@jump-host ~$ 
thor@jump-host ~$ 
thor@jump-host ~$ cd /home/thor/ansible/
thor@jump-host ~/ansible$ vi /home/thor/ansible/inventory 
thor@jump-host ~/ansible$ cat inventory 
stapp01 ansible_user=banner ansible_ssh_pass=$pwd ansible_ssh_common_args='-o StrictHostKeyChecking=no'
thor@jump-host ~/ansible$ 



```


<img width="2282" height="1192" alt="image" src="https://github.com/user-attachments/assets/d6175a78-e0e1-4788-bcb7-052193499c65" />
<img width="2261" height="1177" alt="image" src="https://github.com/user-attachments/assets/bf3f82df-ed93-465c-a58e-2ca03b6b0f81" />


```sh
thor@jump-host ~/ansible$ cat inventory 
[app_server]
stapp02 ansible_user=steve ansible_ssh_pass=$pwd ansible_ssh_common_args='-o StrictHostKeyChecking=no'
thor@jump-host ~/ansible$

```


<img width="2182" height="1127" alt="image" src="https://github.com/user-attachments/assets/ce2e8f1e-17aa-4c15-885d-42d26d616413" />

<img width="1772" height="1200" alt="image" src="https://github.com/user-attachments/assets/8b387d88-7dfb-4240-87af-367349ab6797" />


```sh
thor@jump-host ~/ansible$ vi playbook.yml
thor@jump-host ~/ansible$ cat playbook.yml 
# Content for the task:
---
- hosts: app_server
  become: yes
  tasks:
    - name: Create empty file
      file:
        path: /tmp/file.txt
        state: touch
thor@jump-host ~/ansible$



```

#### Step-3: Validate the execution of the playbook against the inventory file.

<img width="2312" height="1132" alt="image" src="https://github.com/user-attachments/assets/c03edb3f-31b9-4e5e-9f29-fadcab35785d" />

<img width="2407" height="1172" alt="image" src="https://github.com/user-attachments/assets/b9fe57d7-6cad-4874-8bbf-d7e7f2d4c7c7" />



```sh
thor@jump-host ~/ansible$ ssh steve@stapp02
[steve@stapp02 ~]$ ls /tmp
systemd-private-c3e880158dfe481c897ec6163084711f-dbus-broker.service-3iqrqw
systemd-private-c3e880158dfe481c897ec6163084711f-rtkit-daemon.service-5n6pe6
systemd-private-c3e880158dfe481c897ec6163084711f-systemd-hostnamed.service-vEZJVm
systemd-private-c3e880158dfe481c897ec6163084711f-systemd-logind.service-Y8VqnY
systemd-private-c3e880158dfe481c897ec6163084711f-upower.service-9reKmp
[steve@stapp02 ~]$ exit
logout
Connection to stapp02 closed.
thor@jump-host ~/ansible$ ansible-playbook -i inventory playbook.yml

PLAY [app_server] **********************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************************
ok: [stapp02]

TASK [Create empty file] ***************************************************************************************************
changed: [stapp02]

PLAY RECAP *****************************************************************************************************************
stapp02                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

thor@jump-host ~/ansible$

thor@jump-host ~/ansible$ ssh steve@stapp02
Last login: Thu Jul  9 19:29:13 2026 from 10.244.195.31
[steve@stapp02 ~]$ ls /tmp
file.txt
systemd-private-c3e880158dfe481c897ec6163084711f-dbus-broker.service-3iqrqw
systemd-private-c3e880158dfe481c897ec6163084711f-rtkit-daemon.service-5n6pe6
systemd-private-c3e880158dfe481c897ec6163084711f-systemd-hostnamed.service-XslMPQ
systemd-private-c3e880158dfe481c897ec6163084711f-systemd-logind.service-Y8VqnY
systemd-private-c3e880158dfe481c897ec6163084711f-upower.service-9reKmp
[steve@stapp02 ~]$

[steve@stapp02 ~]$ cat /tmp/file.txt
[steve@stapp02 ~]$



```





<img width="2395" height="1166" alt="image" src="https://github.com/user-attachments/assets/3d206db2-2dc3-42f0-b820-85b13980f2d2" />


<img width="2322" height="1205" alt="image" src="https://github.com/user-attachments/assets/0eb348ce-c1a9-45d7-9b7b-c04e96ac69ff" />
<img width="2412" height="1212" alt="image" src="https://github.com/user-attachments/assets/c93a5929-b330-4e2c-b192-3bba4ba12d19" />




