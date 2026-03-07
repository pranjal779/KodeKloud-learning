# Day 13: IPtables Installation And Configuration

<img width="1216" height="681" alt="image" src="https://github.com/user-attachments/assets/508fae9f-3675-42ef-bb1c-75288a4a291e" />
<img width="955" height="740" alt="image" src="https://github.com/user-attachments/assets/1d90bb67-921c-4710-a0b8-1e145f147c74" />


We have one of our websites up and running on our Nautilus infrastructure in Stratos DC. 
Our security team has raised a concern that right now Apache’s port i.e 8087 is open for all since there is no firewall installed on these hosts. 
So we have decided to add some security layer for these hosts and after discussions and recommendations we have come up with the following requirements:

1. Install iptables and all its dependencies on each app host.

2. Block incoming port 8087 on all apps for everyone except for LBR host.

3. Make sure the rules remain, even after system reboot.

----------------


<img width="850" height="480" alt="image" src="https://github.com/user-attachments/assets/02128cf7-3c0c-4e15-a293-1e85faecff57" />

We have one of our websites up and running on our Nautilus infrastructure in Stratos DC. 
Our security team has raised a concern that right now Apache’s port i.e 6400 is open for all since there is no firewall installed on these hosts. 
So we have decided to add some security layer for these hosts and after discussions and recommendations we have come up with the following requirements:



1. Install iptables and all its dependencies on each app host.


2. Block incoming port 6400 on all apps for everyone except for LBR host.


3. Make sure the rules remain, even after system reboot.


```sh
thor@jump-host ~$ ssh tony@172.16.238.10
ssh: connect to host 172.16.238.10 port 22: Connection timed out
thor@jump-host ~$ ssh tony@172.16.238.10
```

To secure the Nautilus infrastructure in Stratos DC based on your requirements, you need to install iptables, configure rules to restrict access to port 8087, and ensure these rules persist across reboots.
The LBR host IP for this specific Nautilus/Stratos environment is typically 172.16.238.14.
Step 1: Install iptables
On each app host (e.g., stapp01, stapp02, stapp03), install the necessary packages and start the service.

sudo yum install -y iptables-services
or
sudo yum install iptables -y
sudo systemctl enable iptables
sudo systemctl start iptables or sudo systemctl restart iptables 

------------------------------
Step 2: Configure Firewall Rules
You must first allow traffic from the LBR host and then block all other traffic to port 8087. Note: Order matters; the allow rule must come before the block rule.

   1. Allow the LBR host:
   
   sudo iptables -I INPUT -p tcp -s 172.16.238.14 --dport 8087 -j ACCEPT
   
   2. Block everyone else:
   
   sudo iptables -A INPUT -p tcp --dport 8087 -j DROP
   
   
------------------------------
Step 3: Ensure Persistence
By default, iptables rules are lost after a reboot. Use the iptables-services utility to save the current configuration to the persistent rule file. 

sudo service iptables save

latest command to save:
sudo iptables-save | sudo tee /etc/sysconfig/iptables

Verification
To confirm your rules are correctly applied and see their order, run:

sudo iptables -L INPUT -n --line-numbers

The rule for IP 172.16.238.14 should appear above the generic DROP rule for port 8087. 


------------------------------



<img width="1362" height="910" alt="image" src="https://github.com/user-attachments/assets/169d8d88-fb0f-499e-954b-21713d9a1d59" />


```sh
[tony@stapp01 ~]$ sudo yum install -y iptables-services

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for tony: 
CentOS Stream 9 - BaseOS                                                                     14 MB/s | 8.9 MB     00:00    
CentOS Stream 9 - AppStream                                                                 9.9 MB/s |  27 MB     00:02    
CentOS Stream 9 - Extras packages                                                            72 kB/s |  20 kB     00:00    
Extra Packages for Enterprise Linux 9 - x86_64                                               54 MB/s |  20 MB     00:00    
Extra Packages for Enterprise Linux 9 openh264 (From Cisco) - x86_64                        4.9 kB/s | 2.5 kB     00:00    
Extra Packages for Enterprise Linux 9 - Next - x86_64                                       371 kB/s | 259 kB     00:00    
Package iptables-services-1.8.10-11.1.el9.noarch is already installed.
Dependencies resolved.
Nothing to do.
Complete!
[tony@stapp01 ~]$ sudo systemctl enable iptables
Created symlink /etc/systemd/system/multi-user.target.wants/iptables.service → /usr/lib/systemd/system/iptables.service.
[tony@stapp01 ~]$ sudo systemctl start iptables
Job for iptables.service failed because the control process exited with error code.
See "systemctl status iptables.service" and "journalctl -xeu iptables.service" for details.
[tony@stapp01 ~]$ journalctl -xeu iptables.service
~
~
~
Mar 07 00:55:26 stapp01 systemd[1]: Starting IPv4 firewall with iptables...
░░ Subject: A start job for unit iptables.service has begun execution
░░ Defined-By: systemd
░░ Support: https://access.redhat.com/support
░░ 
░░ A start job for unit iptables.service has begun execution.
░░ 
░░ The job identifier is 15360.
Mar 07 00:55:26 stapp01 iptables.init[7958]: iptables: /sbin/iptables does not exist.[WARNING]
Mar 07 00:55:26 stapp01 systemd[1]: iptables.service: Main process exited, code=exited, status=5/NOTINSTALLED
░░ Subject: Unit process exited
░░ Defined-By: systemd
░░ Support: https://access.redhat.com/support
░░ 
░░ An ExecStart= process belonging to unit iptables.service has exited.
░░ 
░░ The process' exit code is 'exited' and its exit status is 5.
Mar 07 00:55:26 stapp01 systemd[1]: iptables.service: Failed with result 'exit-code'.
░░ Subject: Unit failed
░░ Defined-By: systemd
░░ Support: https://access.redhat.com/support
░░ 
░░ The unit iptables.service has entered the 'failed' state with result 'exit-code'.
Mar 07 00:55:26 stapp01 systemd[1]: Failed to start IPv4 firewall with iptables.
░░ Subject: A start job for unit iptables.service has failed
░░ Defined-By: systemd
░░ Support: https://access.redhat.com/support
░░ 
░░ A start job for unit iptables.service has finished with a failure.
░░ 
░░ The job identifier is 15360 and the job result is failed.
[tony@stapp01 ~]$ 


[tony@stapp01 ~]$ sudo yum update
~
~
~
Complete!
[tony@stapp01 ~]$ sudo yum install iptables -y
[sudo] password for tony: 
Last metadata expiration check: 0:00:27 ago on Sat Mar  7 01:00:00 2026.
Dependencies resolved.
===================================================================================
 Package                    Architecture Version                  Repository  Size
===================================================================================
Installing:
 iptables-legacy            x86_64       1.8.10-11.1.el9          epel        50 k
Installing dependencies:
 iptables-legacy-libs       x86_64       1.8.10-11.1.el9          epel        38 k

Transaction Summary
===================================================================================
Install  2 Packages

Total download size: 88 k
Installed size: 184 k
Downloading Packages:
(1/2): iptables-legacy-libs-1.8.10-11.1.el9.x86_64 3.2 MB/s |  38 kB     00:00    
(2/2): iptables-legacy-1.8.10-11.1.el9.x86_64.rpm  3.6 MB/s |  50 kB     00:00    
-----------------------------------------------------------------------------------
Total                                              576 kB/s |  88 kB     00:00     
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                           1/1 
  Installing       : iptables-legacy-libs-1.8.10-11.1.el9.x86_64               1/2 
  Installing       : iptables-legacy-1.8.10-11.1.el9.x86_64                    2/2 
  Running scriptlet: iptables-legacy-1.8.10-11.1.el9.x86_64                    2/2 
  Verifying        : iptables-legacy-1.8.10-11.1.el9.x86_64                    1/2 
  Verifying        : iptables-legacy-libs-1.8.10-11.1.el9.x86_64               2/2 

Installed:
  iptables-legacy-1.8.10-11.1.el9.x86_64                                           
  iptables-legacy-libs-1.8.10-11.1.el9.x86_64                                      

Complete!
[tony@stapp01 ~]$

[tony@stapp01 ~]$ ^C
[tony@stapp01 ~]$ sudo systemctl enable iptables
[tony@stapp01 ~]$ sudo systemctl restart iptables
[tony@stapp01 ~]$ sudo systemctl status iptables
● iptables.service - IPv4 firewall with iptables
     Loaded: loaded (/usr/lib/systemd/system/iptables.service; enabled; preset: di>
     Active: active (exited) since Sat 2026-03-07 01:04:19 UTC; 18s ago
    Process: 37703 ExecStart=/usr/libexec/iptables/iptables.init start (code=exite>
   Main PID: 37703 (code=exited, status=0/SUCCESS)
        CPU: 12ms

Mar 07 01:04:19 stapp01 systemd[1]: Starting IPv4 firewall with iptables...
Mar 07 01:04:19 stapp01 iptables.init[37703]: iptables: Applying firewall rules: [>
Mar 07 01:04:19 stapp01 systemd[1]: Finished IPv4 firewall with iptables.


[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ sudo iptables -I INPUT -p tcp -s stapp01 --dport 8087 -j ACCEPT
[tony@stapp01 ~]$ sudo iptables -A INPUT -p tcp --dport 8087 -j DROP
[tony@stapp01 ~]$ sudo service iptables save
sudo: service: command not found
[tony@stapp01 ~]$ sudo service iptables save
sudo: service: command not found
[tony@stapp01 ~]$ sudo yum install iptables-services -y
Last metadata expiration check: 0:11:05 ago on Sat Mar  7 01:00:00 2026.
Package iptables-services-1.8.10-11.1.el9.noarch is already installed.
Dependencies resolved.
Nothing to do.
Complete!
[tony@stapp01 ~]$ sudo service iptables save
sudo: service: command not found
[tony@stapp01 ~]$ sudo /sbin/service iptables save
sudo: /sbin/service: command not found
[tony@stapp01 ~]$ sudo iptables -I INPUT -p tcp -s 172.16.238.14 --dport 8087 -j ACCEPT
[sudo] password for tony: 
[tony@stapp01 ~]$ sudo iptables -D INPUT -p tcp -s stapp01 --dport 8087 -j ACCEPT
[tony@stapp01 ~]$ sudo service iptables save
sudo: service: command not found
[tony@stapp01 ~]$ sudo /sbin/service iptables save
sudo: /sbin/service: command not found
[tony@stapp01 ~]$ sudo systemctl enable iptables
[tony@stapp01 ~]$ sudo iptables-save | sudo tee /etc/sysconfig/iptables
# Generated by iptables-save v1.8.10 on Sat Mar  7 01:19:51 2026
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [578:60830]
-A INPUT -s 172.16.238.14/32 -p tcp -m tcp --dport 8087 -j ACCEPT
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p icmp -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT
-A INPUT -j REJECT --reject-with icmp-host-prohibited
-A INPUT -p tcp -m tcp --dport 8087 -j DROP
-A FORWARD -j REJECT --reject-with icmp-host-prohibited
COMMIT
# Completed on Sat Mar  7 01:19:51 2026
[tony@stapp01 ~]$

[tony@stapp01 ~]$ sudo iptables -L INPUT -n --line-numbers
Chain INPUT (policy ACCEPT)
num  target     prot opt source               destination         
1    ACCEPT     tcp  --  172.16.238.14        0.0.0.0/0            tcp dpt:8087
2    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
3    ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           
4    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           
5    ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0            state NEW tcp dpt:22
6    REJECT     all  --  0.0.0.0/0            0.0.0.0/0            reject-with icmp-host-prohibited
7    DROP       tcp  --  0.0.0.0/0            0.0.0.0/0            tcp dpt:8087
[tony@stapp01 ~]$


[steve@stapp02 ~]$ sudo yum install iptables-services -y
Last metadata expiration check: 0:06:45 ago on Sat Mar  7 01:19:58 2026.
Package iptables-services-1.8.10-11.1.el9.noarch is already installed.
Dependencies resolved.
Nothing to do.
Complete!
[steve@stapp02 ~]$ sudo systemctl enable iptables
Created symlink /etc/systemd/system/multi-user.target.wants/iptables.service → /usr/lib/systemd/system/iptables.service.
[steve@stapp02 ~]$ sudo systemctl start iptables
[steve@stapp02 ~]$ sudo iptables -I INPUT -p tcp -s 172.16.238.14 --dport 8087 -j ACCEPT
[steve@stapp02 ~]$ suod iptables -A INPUT -p tcp --dport 8087 -j DROP
-bash: suod: command not found
[steve@stapp02 ~]$ sudo iptables -A INPUT -p tcp --dport 8087 -j DROP
[steve@stapp02 ~]$ sudo iptables-save | sudo tee /etc/sysconfig/iptables
# Generated by iptables-save v1.8.10 on Sat Mar  7 01:30:33 2026
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [197:18056]
-A INPUT -s 172.16.238.14/32 -p tcp -m tcp --dport 8087 -j ACCEPT
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p icmp -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT
-A INPUT -j REJECT --reject-with icmp-host-prohibited
-A INPUT -p tcp -m tcp --dport 8087 -j DROP
-A FORWARD -j REJECT --reject-with icmp-host-prohibited
COMMIT
# Completed on Sat Mar  7 01:30:33 2026
[steve@stapp02 ~]$

[steve@stapp02 ~]$ sudo iptables -L INPUT -n --line-numbers
Chain INPUT (policy ACCEPT)
num  target     prot opt source               destination         
1    ACCEPT     tcp  --  172.16.238.14        0.0.0.0/0            tcp dpt:8087
2    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
3    ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           
4    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           
5    ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0            state NEW tcp dpt:22
6    REJECT     all  --  0.0.0.0/0            0.0.0.0/0            reject-with icmp-host-prohibited
7    DROP       tcp  --  0.0.0.0/0            0.0.0.0/0            tcp dpt:8087
[steve@stapp02 ~]$


Last metadata expiration check: 0:07:03 ago on Sat Mar  7 01:27:07 2026.
Package iptables-services-1.8.10-11.1.el9.noarch is already installed.
Dependencies resolved.
Nothing to do.
Complete!
[banner@stapp03 ~]$ sudo systemctl enable iptables
Created symlink /etc/systemd/system/multi-user.target.wants/iptables.service → /usr/lib/systemd/system/iptables.service.
[banner@stapp03 ~]$ sudo systemctl restart iptables
Job for iptables.service failed because the control process exited with error code.
See "systemctl status iptables.service" and "journalctl -xeu iptables.service" for details.
[banner@stapp03 ~]$ sudo yum install iptables -y
Last metadata expiration check: 0:08:21 ago on Sat Mar  7 01:27:07 2026.
Dependencies resolved.
============================================================================================================================
 Package                               Architecture            Version                          Repository             Size
============================================================================================================================
Installing:
 iptables-legacy                       x86_64                  1.8.10-11.1.el9                  epel                   50 k
Installing dependencies:
 iptables-legacy-libs                  x86_64                  1.8.10-11.1.el9                  epel                   38 k

Transaction Summary
============================================================================================================================
Install  2 Packages

Total download size: 88 k
Installed size: 184 k
Downloading Packages:
(1/2): iptables-legacy-libs-1.8.10-11.1.el9.x86_64.rpm                                      1.5 MB/s |  38 kB     00:00    
(2/2): iptables-legacy-1.8.10-11.1.el9.x86_64.rpm                                           1.9 MB/s |  50 kB     00:00    
----------------------------------------------------------------------------------------------------------------------------
Total                                                                                       437 kB/s |  88 kB     00:00     
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                                    1/1 
  Installing       : iptables-legacy-libs-1.8.10-11.1.el9.x86_64                                                        1/2 
  Installing       : iptables-legacy-1.8.10-11.1.el9.x86_64                                                             2/2 
  Running scriptlet: iptables-legacy-1.8.10-11.1.el9.x86_64                                                             2/2 
  Verifying        : iptables-legacy-1.8.10-11.1.el9.x86_64                                                             1/2 
  Verifying        : iptables-legacy-libs-1.8.10-11.1.el9.x86_64                                                        2/2 

Installed:
  iptables-legacy-1.8.10-11.1.el9.x86_64                     iptables-legacy-libs-1.8.10-11.1.el9.x86_64                    

Complete!
[banner@stapp03 ~]$ sudo systemctl restart iptables
[banner@stapp03 ~]$ sudo systemctl status iptables
● iptables.service - IPv4 firewall with iptables
     Loaded: loaded (/usr/lib/systemd/system/iptables.service; enabled; preset: disabled)
     Active: active (exited) since Sat 2026-03-07 01:35:36 UTC; 17s ago
    Process: 24528 ExecStart=/usr/libexec/iptables/iptables.init start (code=exited, status=0/SUCCESS)
   Main PID: 24528 (code=exited, status=0/SUCCESS)
        CPU: 12ms

Mar 07 01:35:36 stapp03 systemd[1]: Starting IPv4 firewall with iptables...
Mar 07 01:35:36 stapp03 iptables.init[24528]: iptables: Applying firewall rules: [  OK  ]
Mar 07 01:35:36 stapp03 systemd[1]: Finished IPv4 firewall with iptables.
[banner@stapp03 ~]$ 

[banner@stapp03 ~]$ sudo iptables -I INPUT -p tcp -s 172.16.238.14 --dport 8087 -j ACCEPT
[banner@stapp03 ~]$ sudo iptables -A INPUT -p tcp --dport 8087 -j DROP
[banner@stapp03 ~]$ sudo iptables-save | sudo tee /etc/sysconfig/iptables
# Generated by iptables-save v1.8.10 on Sat Mar  7 01:37:06 2026
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [43:5976]
-A INPUT -s 172.16.238.14/32 -p tcp -m tcp --dport 8087 -j ACCEPT
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p icmp -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT
-A INPUT -j REJECT --reject-with icmp-host-prohibited
-A INPUT -p tcp -m tcp --dport 8087 -j DROP
-A FORWARD -j REJECT --reject-with icmp-host-prohibited
COMMIT
# Completed on Sat Mar  7 01:37:06 2026
[banner@stapp03 ~]$

[banner@stapp03 ~]$ sudo iptables -L INPUT -n --line-numbers
Chain INPUT (policy ACCEPT)
num  target     prot opt source               destination         
1    ACCEPT     tcp  --  172.16.238.14        0.0.0.0/0            tcp dpt:8087
2    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
3    ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           
4    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           
5    ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0            state NEW tcp dpt:22
6    REJECT     all  --  0.0.0.0/0            0.0.0.0/0            reject-with icmp-host-prohibited
7    DROP       tcp  --  0.0.0.0/0            0.0.0.0/0            tcp dpt:8087
[banner@stapp03 ~]$ 
```

```
[banner@stapp03 ~]$ history
    1  sudo yum install iptables-services -y
    2  sudo systemctl enable iptables
    3  sudo systemctl restart iptables
    4  sudo yum install iptables -y
    5  sudo systemctl restart iptables
    6  sudo systemctl status iptables
    7  sudo iptables -I INPUT -p tcp -s 172.16.238.14 --dport 8087 -j ACCEPT
    8  sudo iptables -A INPUT -p tcp --dport 8087 -j DROP
    9  sudo iptables-save | sudo tee /etc/sysconfig/iptables
   10  sudo iptables -L INPUT -n --line-numbers
   11  history
[banner@stapp03 ~]$ 
```

<img width="2386" height="1183" alt="image" src="https://github.com/user-attachments/assets/8e73a3ab-f875-4172-9ef4-76cd5b9461e4" />

<img width="2410" height="1137" alt="image" src="https://github.com/user-attachments/assets/516da169-3913-45a9-aadc-eb2bf43559da" />



