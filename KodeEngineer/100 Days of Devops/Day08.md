# Day 8: Install Ansible

<img width="1496" height="897" alt="image" src="https://github.com/user-attachments/assets/d8962dc2-9b1d-4950-90a5-1854a9d46472" />

<img width="1027" height="675" alt="image" src="https://github.com/user-attachments/assets/17ce4304-655b-4063-b59f-5ddc43593d14" />

```txt
During the weekly meeting, the Nautilus DevOps team discussed about the automation and configuration management solutions that they want to implement.
While considering several options, the team has decided to go with Ansible for now due to its simple setup and minimal pre-requisites.
The team wanted to start testing using Ansible, so they have decided to use jump host as an Ansible controller to test different kind of tasks on rest of the servers.

Install ansible version 4.9.0 on Jump host using pip3 only. Make sure Ansible binary is available globally on this system, i.e all users on this system are able to run Ansible commands.
```

```sh
Install Ansible
Step 1: Install Ansible using pip3
To install Ansible version 4.9.0 globally using pip3, run the following command:
Code

sudo pip3 install ansible==4.9.0
Step 2: Verify Installation
Verify that the Ansible binary is installed and accessible to all users by checking the version:
Code

ansible --version
Answer:
The command sudo pip3 install ansible==4.9.0 installs the specified version of Ansible globally on the Jump host, making it available for all users.
```

```txt
thor@jumphost ~$ sudo pip3 install ansible==4.9.0

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for thor:
```

<img width="701" height="827" alt="image" src="https://github.com/user-attachments/assets/697ef4ff-19f4-4185-a44e-6494147d0ff9" />

```sh
thor@jumphost ~$ ansible --version
ansible [core 2.11.12] 
  config file = None
  configured module search path = ['/home/thor/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.9/site-packages/ansible
  ansible collection location = /home/thor/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/local/bin/ansible
  python version = 3.9.18 (main, Jan 24 2024, 00:00:00) [GCC 11.4.1 20231218 (Red Hat 11.4.1-3)]
  jinja version = 3.1.6
  libyaml = True
thor@jumphost ~$
```

<img width="2402" height="1142" alt="image" src="https://github.com/user-attachments/assets/f189e515-c254-4f0f-a96f-4b70f0cef666" />
