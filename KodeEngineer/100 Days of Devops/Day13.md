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
sudo systemctl enable iptables
sudo systemctl start iptables

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

Verification
To confirm your rules are correctly applied and see their order, run:

sudo iptables -L INPUT -n --line-numbers

The rule for IP 172.16.238.14 should appear above the generic DROP rule for port 8087. 
