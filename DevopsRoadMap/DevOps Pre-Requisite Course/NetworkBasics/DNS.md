# DNS for linux

in linux host

ping 192.168.1.11 (wwe are pinging from ip a {192.168.1.10})
Reply form 192.168.1.11: bytes=32 time=4ms TTL=117
Reply form 192.168.1.11: bytes=32 time=4ms TTL=117

ping db
ping: unknown host db


cat >> /etc/hosts
192.168.1.11       db


ping db
PING db (192.168.1.11) 56(84) bytes of data.
64 bytes from db (192.168.1.11): icmp_seq=1 ttl=64 time=0.052 ms
64 bytes from db (192.168.1.11): icmp_seq=1 ttl=64 time=0.052 ms

(ping db is suuccess)


![image](https://github.com/user-attachments/assets/97c34109-e78c-4c9d-aee5-7555c07d2df8)

![Screenshot 2024-12-31 163720](https://github.com/user-attachments/assets/7c7094c6-e22d-42c8-8282-237ef78399b3)

![image](https://github.com/user-attachments/assets/c4436520-de30-4cc9-9439-a497c2bd6f04)

commands in host A                              Commands in Host B
ping db                                         > hostname
or                                              host-2
ping www.google.com
ssh db
curl http://www.google.co

# Name Resolution
![image](https://github.com/user-attachments/assets/3aedfbb1-8a77-4f03-8e64-3055799a655c)

![image](https://github.com/user-attachments/assets/98cc2cff-d04c-4029-9195-7689b142a167)

![image](https://github.com/user-attachments/assets/b2e9215d-c7e8-45fc-9214-c67669f06306)

![image](https://github.com/user-attachments/assets/a73f22d2-71fe-427b-9b81-96e6d532fa75)

![image](https://github.com/user-attachments/assets/099fddc3-0ffd-44f9-9fba-f3203c01a6fb)
