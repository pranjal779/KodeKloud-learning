## Networking Basics

5 Lessons

Module Content

A Quick Reminder 01:10
Networking Basics 11:03
Labs - Switching and Routing
DNS 14:11
Labs - DNS


## Networking Pre-Requisites
 1. Switching
 2. ROuting
 3. Default Gateway
 4. DNS Configuration on Linux

# Commands

# Switiching

```sh
ip link  

ping <ipaddress>

# ip addr add <ip/cidr> dev eth0
# example:
ip addr <ip./24 dev eth 0
```

# Routing
A router helps connect two networks together, it is an intelligent device, so think of it as another server with many network ports.  

# GateWay

```sh
route

ip route add <ip>/24 via <another-ip>


ip route add 192.168.1.0/24 via 192.168.2.1

ip route add default via 192.168.2.1
route
```

### context:  
![image](https://github.com/user-attachments/assets/c1ddd6dc-8ec7-4bc0-8da5-d6cd46858413)


![image](https://github.com/user-attachments/assets/95550a37-e237-4e9c-8441-b7f422b8a836)


example of default or any ip address

![image](https://github.com/user-attachments/assets/fd44f188-99a3-497c-a020-055f58e8d599)

