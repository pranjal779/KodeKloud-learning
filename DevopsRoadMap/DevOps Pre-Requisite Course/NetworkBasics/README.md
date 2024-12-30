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


![image](https://github.com/user-attachments/assets/5cea6500-d1b4-40c5-a2af-ee6189fc9e91)


![image](https://github.com/user-attachments/assets/096a681e-2c81-439f-a040-88b11b4349aa)

![image](https://github.com/user-attachments/assets/0a28f9a0-7288-4355-9f8e-183b65fe93ce)

 ping will go through if wwe set cat /proc/sys/net/ipv4/ip_forward wwhich wwas originally had 0 in it

 to change it to 1, wew need to
 ```sh
 echo 1 > /proc/sys/net/ipv4/ip_forward
```
1
![image](https://github.com/user-attachments/assets/21cb8eae-d873-4f5c-b2f1-b15e21ec6887)

Now remember, simply setting this value does not persist the changes the same value in the etc/sysctl.conf file.
![image](https://github.com/user-attachments/assets/acc5d9f5-d2e5-496c-939a-ab594e0044f4)


# Take Aways 

```sh
ip link

ip addr

ip addr add <ip>/<cidr> dev eth0

route
```
![image](https://github.com/user-attachments/assets/fbcac7b3-3be3-4bce-bc29-a2295ddcc3ab)

```sh

ip route add 192.168.1.0/24 via 192.168.2.1

cat /proc/sys/net/ipv4/ip_forward
# 1


```
![image](https://github.com/user-attachments/assets/4dbbdd60-2f2b-468a-86da-9d2ba730f2d4)

