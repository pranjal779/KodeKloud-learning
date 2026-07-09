# Day 82: Create Ansible Inventory for App Server Testing

<img width="962" height="866" alt="image" src="https://github.com/user-attachments/assets/fdff7cbd-7b87-4b26-aaaa-aca70088687a" />


The Nautilus DevOps team is testing Ansible playbooks on various servers within their stack. They've placed some playbooks under /home/thor/playbook/ directory on the jump host and now intend to test them on app server 1 in Stratos DC. However, an inventory file needs creation for Ansible to connect to the respective app. Here are the requirements:

a. Create an ini type Ansible inventory file /home/thor/playbook/inventory on jump host.

b. Include App Server 1 in this inventory along with necessary variables for proper functionality.

c. Ensure the inventory hostname corresponds to the server name as per the wiki, for example stapp01 for app server 1 in Stratos DC.

Note: Validation will execute the playbook using the command ansible-playbook -i inventory playbook.yml. Ensure the playbook functions properly without any extra arguments.


<img width="897" height="545" alt="image" src="https://github.com/user-attachments/assets/e461da51-9e3f-482c-9ed2-963816aaf791" />
<img width="852" height="597" alt="image" src="https://github.com/user-attachments/assets/cd9dc8e2-4e1b-4bea-bce6-207eace829d6" />
<img width="891" height="671" alt="image" src="https://github.com/user-attachments/assets/00506ba9-a0f8-42d1-96a0-c1197c259859" />


```sh
thor@jump-host ~$ ls -la /home/thor/playbook/
total 20
drwxr-xr-x 2 thor thor 4096 Jul  9 18:14 .
drwx------ 1 thor thor 4096 Jul  9 18:14 ..
-rw-r--r-- 1 thor thor   36 Jul  9 18:14 ansible.cfg
-rw-r--r-- 1 thor thor  250 Jul  9 18:14 playbook.yml
thor@jump-host ~$ cat ansible.cfg
cat: ansible.cfg: No such file or directory
thor@jump-host ~$ ls -la /home/thor/playbook/ansible.cfg 
-rw-r--r-- 1 thor thor 36 Jul  9 18:14 /home/thor/playbook/ansible.cfg
thor@jump-host ~$ cat /home/thor/playbook/ansible.cfg 
[defaults]
host_key_checking = Falsethor@jump-host ~$ cat /home/thor/playbook/
ansible.cfg   playbook.yml
thor@jump-host ~$ cat /home/thor/playbook/playbook.yml 
---
- hosts: all
  become: yes
  become_user: root
  tasks:
    - name: Install httpd package    
      yum: 
        name: httpd 
        state: installed
    
    - name: Start service httpd
      service:
        name: httpd
        state: startedthor@jump-host ~$ 
thor@jump-host ~$ cat /home/thor/playbook/ansible.cfg 
[defaults]
host_key_checking = Falsethor@jump-host ~$ 
thor@jump-host ~$ 


```


<img width="806" height="357" alt="image" src="https://github.com/user-attachments/assets/e7c3cc97-208c-4d35-885d-fd405c804bbd" />
<img width="1656" height="1110" alt="image" src="https://github.com/user-attachments/assets/2147655c-5d6a-48f0-8460-bb64b946cfde" />
<img width="1662" height="1217" alt="image" src="https://github.com/user-attachments/assets/81f9cfbf-4396-40fa-be18-3c4e0a397ddc" />

```sh
thor@jump-host ~$ vi /home/thor/playbook/inventory.ini
thor@jump-host ~$ cat /home/thor/playbook/inventory.ini
[app_server]
stapp01 ansible_host=stapp01 ansible_user=tony
thor@jump-host ~$ 

```

<img width="1591" height="1097" alt="image" src="https://github.com/user-attachments/assets/cb200ef2-2986-48d6-bcaa-475f41dc24dc" />


<img width="1687" height="1192" alt="image" src="https://github.com/user-attachments/assets/dc8d70b0-81b0-4c2c-af1d-d6ecc38778f8" />

<img width="1691" height="1177" alt="image" src="https://github.com/user-attachments/assets/920f7457-0d77-434d-aff4-fd1d2db969f2" />
<img width="1477" height="1067" alt="image" src="https://github.com/user-attachments/assets/6423570c-1a83-4038-a197-674e507a8711" />

<img width="1622" height="1102" alt="image" src="https://github.com/user-attachments/assets/b971797c-00bc-40ed-9707-a4bb37d5b040" />

<img width="1622" height="1180" alt="image" src="https://github.com/user-attachments/assets/70119097-01c0-4914-8736-950854d5e68f" />
<img width="1672" height="1267" alt="image" src="https://github.com/user-attachments/assets/a1db57bd-8be9-4a55-b151-82d034e0cac2" />

```sh
thor@jump-host ~$ cd /home/thor/playbook/
thor@jump-host ~/playbook$ ls
ansible.cfg  inventory.ini  playbook.yml
thor@jump-host ~/playbook$ cat inventory.ini 
[app_server]
stapp01 ansible_host=stapp01 ansible_user=tony
thor@jump-host ~/playbook$ ansible all -i inventory -m ping
[WARNING]: Unable to parse /home/thor/playbook/inventory as an inventory source
[WARNING]: No inventory was parsed, only implicit localhost is available
[WARNING]: provided hosts list is empty, only localhost is available. Note that
the implicit localhost does not match 'all'
thor@jump-host ~/playbook$ cd ..
thor@jump-host ~$ vi /home/thor/playbook/inventory
thor@jump-host ~$ ls /home/thor/playbook/inventory
/home/thor/playbook/inventory
thor@jump-host ~$ cat /home/thor/playbook/inventory
[app_server]
stapp01 ansible_host=stapp01 ansible_user=tony
thor@jump-host ~$ 

```


<img width="1652" height="1145" alt="image" src="https://github.com/user-attachments/assets/aca08460-5fcd-4bd0-b2ae-1aee6034dde8" />

```sh
thor@jump-host ~$ cd /home/thor/playbook/
thor@jump-host ~/playbook$ ls
ansible.cfg  inventory.ini  playbook.yml
thor@jump-host ~/playbook$ cat inventory.ini 
[app_server]
stapp01 ansible_host=stapp01 ansible_user=tony
thor@jump-host ~/playbook$ ansible all -i inventory -m ping
[WARNING]: Unable to parse /home/thor/playbook/inventory as an inventory source
[WARNING]: No inventory was parsed, only implicit localhost is available
[WARNING]: provided hosts list is empty, only localhost is available. Note that
the implicit localhost does not match 'all'
thor@jump-host ~/playbook$ cd ..
thor@jump-host ~$ vi /home/thor/playbook/inventory
thor@jump-host ~$ ls /home/thor/playbook/inventory
/home/thor/playbook/inventory
thor@jump-host ~$ cat /home/thor/playbook/inventory
[app_server]
stapp01 ansible_host=stapp01 ansible_user=tony
thor@jump-host ~$ cd /home/thor/playbook/
thor@jump-host ~/playbook$ ansible all -i inventory -m ping
stapp01 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
thor@jump-host ~/playbook$ 

```

<img width="1635" height="1147" alt="image" src="https://github.com/user-attachments/assets/20de47db-0dbf-4c2a-a61b-b49a64c75a72" />


```sh
thor@jump-host ~$ cd /home/thor/playbook/
thor@jump-host ~/playbook$ ansible all -i inventory -m ping
stapp01 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
thor@jump-host ~/playbook$ ls
ansible.cfg  inventory  inventory.ini  playbook.yml
thor@jump-host ~/playbook$ ansible-playbook -i inventory playbook.yml

PLAY [all] ************************************************************************

TASK [Gathering Facts] ************************************************************
ok: [stapp01]

TASK [Install httpd package] ******************************************************
changed: [stapp01]

TASK [Start service httpd] ********************************************************
changed: [stapp01]

PLAY RECAP ************************************************************************
stapp01                    : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

thor@jump-host ~/playbook$

```

<img width="2346" height="1182" alt="image" src="https://github.com/user-attachments/assets/3c4694e3-630c-4bf4-8ccd-8c75e7bb6a61" />

<img width="2355" height="1191" alt="image" src="https://github.com/user-attachments/assets/84e16409-1ba8-43fa-a41c-9848f40828a5" />

