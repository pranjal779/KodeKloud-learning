<img width="2012" height="1188" alt="image" src="https://github.com/user-attachments/assets/b6da736f-58e4-45fc-985f-e1d333607398" />
<img width="2025" height="1115" alt="image" src="https://github.com/user-attachments/assets/376420dc-5d75-470a-8d83-db0a3d010776" />

# IPTABLES
<img width="2006" height="1132" alt="image" src="https://github.com/user-attachments/assets/2eff31da-6fd8-471f-8a68-25ea7c7b1e3d" />


```sh
sudo apt install iptables

sudo iptables -L
```
<img width="2072" height="842" alt="image" src="https://github.com/user-attachments/assets/68b1827e-9aed-4594-b418-b05b51f244b2" />


**6:28**

<img width="1636" height="832" alt="image" src="https://github.com/user-attachments/assets/6ec5f0d1-1752-4722-ba79-5f14c771ea49" />
<img width="1643" height="916" alt="image" src="https://github.com/user-attachments/assets/3bef95a9-d52a-4f52-a6a2-cb18f02ad9fd" />


# IPTABLES - Securing the Environment

```sh
iptables -A INPUT -p tcp -s 172.16.238.187 --dport 22 -j ACCEPT
iptables -L
```
<img width="2062" height="1022" alt="image" src="https://github.com/user-attachments/assets/8638d74f-0081-4c14-94e3-67325f150a4a" />
<img width="2027" height="1017" alt="image" src="https://github.com/user-attachments/assets/ee69c498-d445-49b1-910d-09ec3cbb9c78" />

```sh
iptables -A INPUT -p tcp --dport 22 -j DROP
iptables -L
```
<img width="2020" height="907" alt="image" src="https://github.com/user-attachments/assets/a0df2e38-306b-4461-88fa-34c12b5b9127" />

<img width="2022" height="1101" alt="image" src="https://github.com/user-attachments/assets/f6c9e78f-8134-47e5-bf99-e1924c449d21" />


```sh
iptables -L
```
<img width="2037" height="867" alt="image" src="https://github.com/user-attachments/assets/9fd2d570-1a81-47d3-910d-258a2572450d" />
<img width="1288" height="672" alt="image" src="https://github.com/user-attachments/assets/b5cc072c-f478-4316-b1e2-aa010b46e917" />


```sh
iptables -A OUTPUT -p tcp -d 172.16.238.11 --dport 5432 -j ACCEPT

iptables -A OUTPUT -p tcp -d 172.16.238.15 --dport 80 -j ACCEPT

iptables -A OUTPUT -p tcp --dport 443 -J DROP
iptables -A OUTPUT -p tcp --dport 80 -j DROP

iptables -A INPUT -p tcp -s 172.16.238.187 --dport 80 -j ACCEPT
```

```sh
iptables -L
```

<img width="1893" height="851" alt="image" src="https://github.com/user-attachments/assets/00a1ad0e-8bf7-4d40-a5f3-f24b33b42543" />

```sh
iptables -I OUTPUT   -P TCP -D <IP> --DPORT 443 -j ACCEPT
```
<img width="1868" height="1003" alt="image" src="https://github.com/user-attachments/assets/4b4d4496-4ff6-4e73-bc17-b33098c90205" />

<img width="1901" height="801" alt="image" src="https://github.com/user-attachments/assets/caf15292-7dd1-4ff2-aa2c-f288f0d0da26" />

```sh
iptables -D OUTPUT 5
```

-------------

<img width="1995" height="1040" alt="image" src="https://github.com/user-attachments/assets/d4ec4ca4-9d65-4646-ae65-344ee7fce1a6" />

<img width="1998" height="1085" alt="image" src="https://github.com/user-attachments/assets/501e3412-97f3-4398-9fee-96d7b10534ee" />

```SH
iptables -A OUTPUT -p tcp -d <IP> --dport 5432 -j ACCEPT

iptables -A INPUT -p tcp -s <ip> --dport 5432 -j ACCEPT

iptables -A INPUT -p tcp --dport 5432 -j DROP
```

