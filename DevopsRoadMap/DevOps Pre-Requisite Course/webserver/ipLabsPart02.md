```sh
thor@host01 ~$ ip addr show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
14: eth0@if15: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 02:42:ac:10:ee:03 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 172.16.238.3/24 brd 172.16.238.255 scope global eth0
       valid_lft forever preferred_lft forever
18: eth1@if19: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 02:42:ac:10:ef:02 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 172.16.239.2/24 brd 172.16.239.255 scope global eth1
       valid_lft forever preferred_lft forever
22: eth2@if23: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1410 qdisc noqueue state UP group default 
    link/ether 02:42:ac:11:00:05 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 172.17.0.5/16 brd 172.17.255.255 scope global eth2
       valid_lft forever preferred_lft forever
thor@host01 ~$ sudo sed -i 's/8080/9090/g' /opt/apache-tomcat-8.5.53/conf/server.xml
thor@host01 ~$ 
thor@host01 ~$ sudo /opt/apache-tomcat-8.5.53/bin/startup.sh
Using CATALINA_BASE:   /opt/apache-tomcat-8.5.53
Using CATALINA_HOME:   /opt/apache-tomcat-8.5.53
Using CATALINA_TMPDIR: /opt/apache-tomcat-8.5.53/temp
Using JRE_HOME:        /
Using CLASSPATH:       /opt/apache-tomcat-8.5.53/bin/bootstrap.jar:/opt/apache-tomcat-8.5.53/bin/tomcat-juli.jar
Tomcat started.
thor@host01 ~$ 
```

![image](https://github.com/user-attachments/assets/3e779e2a-0063-4b60-b322-55f98670af35)

![image](https://github.com/user-attachments/assets/e18e9031-89d4-4111-bb43-773ce4444d48)

![image](https://github.com/user-attachments/assets/7d8a0636-989b-41f2-983a-a663815e870c)

![image](https://github.com/user-attachments/assets/e1b3141c-68ec-42a1-902b-d51d00432b80)

![image](https://github.com/user-attachments/assets/ca188271-b771-4691-8d82-47287080d201)

![image](https://github.com/user-attachments/assets/5bfbdbb9-6a7b-435d-a34b-c418458d9535)

![image](https://github.com/user-attachments/assets/b2f71c86-c15a-4623-b77b-507e244eb3a4)

![image](https://github.com/user-attachments/assets/9369f37b-54db-4b5e-bb8b-34b28195dc86)

![image](https://github.com/user-attachments/assets/fb0e3066-9506-42f3-8e73-2b55660b97ea)

![image](https://github.com/user-attachments/assets/798c762f-5f0f-4ac5-933a-649c77b2c363)

![image](https://github.com/user-attachments/assets/27637888-3ea6-49cd-8a62-97c162681c52)

![image](https://github.com/user-attachments/assets/72302d69-4f98-494f-82a3-98ed5f95a759)

d![image](https://github.com/user-attachments/assets/3e7ab36f-856f-48ad-9cbb-ab8f890ef7a9)

![image](https://github.com/user-attachments/assets/6268753f-a95f-4c99-84e6-6c1a66d8cfe1)

![image](https://github.com/user-attachments/assets/db69d849-be66-4681-bf45-35b63b559ea6)

![image](https://github.com/user-attachments/assets/9c6ded1a-5ae9-4622-8be4-052a415f6677)

![image](https://github.com/user-attachments/assets/2bdd117f-a342-410b-ad51-bdf0016c4416)

![image](https://github.com/user-attachments/assets/d4a60913-a8a6-4fe0-bce5-095de21a8200)

![image](https://github.com/user-attachments/assets/67c5fa38-f7c5-4e85-9a1c-624769cb5c9b)

![image](https://github.com/user-attachments/assets/fb26f1c3-5873-48d4-b5e4-8c212ca89679)

![image](https://github.com/user-attachments/assets/e32e4bb5-3ced-4bf0-9472-f7136384025b)


thor@app01 /opt/simple-webapp-flask$ sudo sed -i 's/172.16.239.30/0.0.0.0/g' /opt/simple-webapp-flask/app.py; sudo pkill python3; cd /opt/simple-webapp-flask/; nohup python3 app.py &
thor@app01 /opt/simple-webapp-flask$ sudo sed -i 's/172.16.239.30/0.0.0.0/g' /opt/simple-webapp-flask/app.py; sudo pkill python3; cd /opt/simple-webapp-flask/; nohup python3 app.py &
[1] 10037
thor@app01 /opt/simple-webapp-flask$ nohup: ignoring input and appending output to '/home/thor/nohup.out'

![image](https://github.com/user-attachments/assets/9be0d467-2ab2-4eac-a37c-530719046cc9)
