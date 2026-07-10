# Day 86: Ansible Ping Module Usage

The Nautilus DevOps team is planning to test several Ansible playbooks on different app servers in Stratos DC. Before that, some pre-requisites must be met. Essentially, the team needs to set up a password-less SSH connection between Ansible controller and Ansible managed nodes. One of the tickets is assigned to you; please complete the task as per details mentioned below:

a. Jump host is our Ansible controller, and we are going to run Ansible playbooks through thor user from jump host.

b. There is an inventory file /home/thor/ansible/inventory on jump host. Using that inventory file test Ansible ping from jump host to App Server 2, make sure ping works.


<img width="867" height="602" alt="image" src="https://github.com/user-attachments/assets/aa12cd22-71fa-4712-b9db-816629838f0c" />

---

```sh
thor@jump-host ~$ ssh-keygen -t rsa -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key (/home/thor/.ssh/id_rsa): 
Enter passphrase for "/home/thor/.ssh/id_rsa" (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/thor/.ssh/id_rsa
Your public key has been saved in /home/thor/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:tdLiPPOvtEDpJtYjz45qJU6fN/T0l4UDyXV36QjapH4 thor@jump-host
The key's randomart image is:
+---[RSA 4096]----+
|                .|
|           o  ..+|
|          *..oo.o|
|         * o+. . |
|        S o  . . |
|    o .*.+.E  o .|
|   o ++o@oo.   + |
|    o.oBoB... o  |
|   ....o+.+o..   |
+----[SHA256]-----+
thor@jump-host ~$ ls -la .ssh/
total 20
drwx------ 2 thor thor 4096 Jul 10 13:47 .
drwx------ 1 thor thor 4096 Jul 10 13:45 ..
-rw------- 1 thor thor 3381 Jul 10 13:47 id_rsa
-rw-r--r-- 1 thor thor  740 Jul 10 13:47 id_rsa.pub
thor@jump-host ~$ ls -la /home/thor/ansible/inventory 
-rw-r--r-- 1 thor thor 99 Jul 10 13:45 /home/thor/ansible/inventory
thor@jump-host ~$ cat /home/thor/ansible/inventory 
stapp01 ansible_ssh_pass=Ir0nM@n
stapp02 ansible_ssh_pass=Am3ric@
stapp03 ansible_ssh_pass=BigGr33nthor@jump-host ~$ 
thor@jump-host ~$ 
thor@jump-host ~$ ssh-cop-id tony@stapp01
bash: ssh-cop-id: command not found
thor@jump-host ~$ ssh-copy-id tony@stapp01
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/thor/.ssh/id_rsa.pub"
The authenticity of host 'stapp01 (10.244.73.174)' can't be established.
ED25519 key fingerprint is SHA256:AljvdWZlyAjuZYZ8WcJAf1MTONxkBbYrcPWRCVD8Mak.
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
The authenticity of host 'stapp02 (10.244.81.58)' can't be established.
ED25519 key fingerprint is SHA256:piuk6aVICMokfdNoe7Iy9BJKn7TVOgFfODcwd1ianj8.
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
The authenticity of host 'stapp03 (10.244.81.37)' can't be established.
ED25519 key fingerprint is SHA256:kJqaEVcKF+sIjyy6i4iGJfYIhCq+mvhyUrOSpwP3oWM.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
banner@stapp03's password: 

Number of key(s) added: 1

Now try logging into the machine, with: "ssh 'banner@stapp03'"
and check to make sure that only the key(s) you wanted were added.

thor@jump-host ~$


```



### Step-2: Modify the inventory file.

<img width="1461" height="1171" alt="image" src="https://github.com/user-attachments/assets/32e7e141-cfcd-4823-ba4d-8a5ddb9df298" />

```sh
thor@jump-host ~$ cat /home/thor/ansible/inventory 
stapp01 ansible_ssh_pass=Ir0nM@n
stapp02 ansible_ssh_pass=Am3ric@
stapp03 ansible_ssh_pass=BigGr33nthor@jump-host ~$ 
thor@jump-host ~$ 
thor@jump-host ~$ vi /home/thor/ansible/inventory 
thor@jump-host ~$ cat /home/thor/ansible/inventory 
# Content of the inventory file.
stapp01 ansible_user=tony
stapp02 ansible_user=steve
stapp03 ansible_user=banner
thor@jump-host ~$ cd /home/thor/ansible/
thor@jump-host ~/ansible$ ansible stapp01 -i /home/thor/ansible/inventory -m ping
stapp01 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
thor@jump-host ~/ansible$ ansible stapp02 -i /home/thor/ansible/inventory -m ping
stapp02 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
thor@jump-host ~/ansible$ ansible stapp03 -i /home/thor/ansible/inventory -m ping
stapp03 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
thor@jump-host ~/ansible$ 


```

<img width="2152" height="1177" alt="image" src="https://github.com/user-attachments/assets/bf224da7-b705-43cf-8753-5cbf478e5d91" />

<img width="2017" height="1191" alt="image" src="https://github.com/user-attachments/assets/753abcc8-c596-4750-870f-46e4a1a39de6" />









