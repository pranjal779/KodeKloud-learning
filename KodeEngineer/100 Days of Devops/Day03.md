# Day 3: Secure Root SSH Access

<img width="1842" height="1011" alt="image" src="https://github.com/user-attachments/assets/84e65dd0-9e56-4256-b455-896ae0c64cc6" />

<img width="1397" height="647" alt="image" src="https://github.com/user-attachments/assets/35540f04-2afe-4e11-b9ba-0e7331fbbad1" />


```
Following security audits, the xFusionCorp Industries security team has rolled out new protocols, including the restriction of direct root SSH login.

Your task is to disable direct SSH root login on all app servers within the Stratos Datacenter.
```

<img width="722" height="1005" alt="image" src="https://github.com/user-attachments/assets/eab4e179-c612-4242-87c8-ce15d03286df" />

Task: Disable Root SSH Login
Step 1: Log in to the Server
SSH into the target app server using a user with administrative (sudo) privileges.
```ssh username@appserverp```

Step 2: Edit SSH Configuration
Open the SSH server configuration file /etc/ssh/sshd_config using a text editor like vi or nano.
```sudo vi /etc/ssh/sshdconfig```

Step 3: Modify Configuration
Locate the line PermitRootLogin. Change its value to no. If the line is commented out with a #, remove the #.
```PermitRootLogin no```


Step 4: Restart SSH Service
Save the file and restart the SSH service to apply the changes.
```sudo systemctl restart sshd```

             
Answer:
The task is completed by setting PermitRootLogin to no in the /etc/ssh/sshd_config file on all relevant servers and restarting the SSH service. 


<img width="885" height="1377" alt="image" src="https://github.com/user-attachments/assets/e1ec3d45-93ae-4393-9a45-026d86d46003" />


To disable direct root SSH login on app servers in the Stratos Datacenter, edit /etc/ssh/sshd_config on each server (stapp01, stapp02, stapp03) to set PermitRootLogin no, then restart the SSH service.
This ensures secure, non-root access, as recommended in security audits. 
Steps to Secure Root SSH Access:
1. SSH into each application server (e.g., ssh tony@stapp01, ssh steve@stapp02, ssh banner@stapp03).
2. Edit the SSH daemon configuration file using sudo:
bash
sudo vi /etc/ssh/sshd_config
3. Locate the PermitRootLogin directive and change it to:
text
PermitRootLogin no
Note: If the line is commented out with #, remove the #.
4. Save and exit the editor (e.g., in vi, press Esc, then type :wq and press Enter).
5. Restart the SSH service to apply the changes:
bash
sudo systemctl restart sshd
(If sshd is not found, use sudo systemctl restart ssh).
6. Verify the change by attempting to log in as root directly; it should be denied.

<img width="2063" height="1152" alt="image" src="https://github.com/user-attachments/assets/82e36bd1-38e8-4b64-800b-63310ed17040" />

```
thor@jumphost ~$ ssh tony@stapp01
The authenticity of host 'stapp01 (172.16.238.10)' can't be established.
ED25519 key fingerprint is SHA256:u5WWRuBgncEe9Nz9v0hwk3Q5vcNhi1mHfKtjfAG9+WE.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp01' (ED25519) to the list of known hosts.
tony@stapp01's password: 
[tony@stapp01 ~]$ sudo vi /etc/ssh/ssh_config

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for tony: 
[tony@stapp01 ~]$ sudo vi /etc/ssh/sshd_config
[sudo] password for tony: 
[tony@stapp01 ~]$ sudo vi /etc/ssh/sshd_config
[tony@stapp01 ~]$ exit
logout
Connection to stapp01 closed.
thor@jumphost ~$ ssh steve@stapp02
The authenticity of host 'stapp02 (172.16.238.11)' can't be established.
ED25519 key fingerprint is SHA256:ZQJ3s3JkMZdJhHYHpariq6kQsWnkDIevyTxu07QNdsY.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp02' (ED25519) to the list of known hosts.
steve@stapp02's password: 
[steve@stapp02 ~]$ sudo vi /etc/ssh/sshd_config

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for steve: 
[steve@stapp02 ~]$ exit
logout
Connection to stapp02 closed.
thor@jumphost ~$ ssh banner@stapp03
The authenticity of host 'stapp03 (172.16.238.12)' can't be established.
ED25519 key fingerprint is SHA256:JcM7mLIqaDy4FbEWVLy32POJ1Xpt8WpQM8bAonK9/SU.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp03' (ED25519) to the list of known hosts.
banner@stapp03's password: 
[banner@stapp03 ~]$ sudo vi /etc/ssh/sshd_config

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for banner: 
[banner@stapp03 ~]$ BigGr33n
-bash: BigGr33n: command not found
[banner@stapp03 ~]$ exit
logout
Connection to stapp03 closed.
thor@jumphost ~$ sudo ssh -t

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for thor: 
usage: ssh [-46AaCfGgKkMNnqsTtVvXxYy] [-B bind_interface]
           [-b bind_address] [-c cipher_spec] [-D [bind_address:]port]
           [-E log_file] [-e escape_char] [-F configfile] [-I pkcs11]
           [-i identity_file] [-J [user@]host[:port]] [-L address]
           [-l login_name] [-m mac_spec] [-O ctl_cmd] [-o option] [-p port]
           [-Q query_option] [-R address] [-S ctl_path] [-W host:port]
           [-w local_tun[:remote_tun]] destination [command]
thor@jumphost ~$ sudo systemctl restart sshd
thor@jumphost ~$ ssh tony@stapp01
tony@stapp01's password: 
Last login: Mon Feb 16 18:14:12 2026 from 172.16.238.3
[tony@stapp01 ~]$ sudo sshd -t
[sudo] password for tony: 
[tony@stapp01 ~]$ sudo systemctl restart sshd
[tony@stapp01 ~]$ exit

Task was not successful 
logout
Connection to stapp01 closed.
thor@jumphost ~$
```

<img width="2021" height="1157" alt="image" src="https://github.com/user-attachments/assets/467e7712-137b-49ad-b8e7-8e61c3e7e3f8" />
