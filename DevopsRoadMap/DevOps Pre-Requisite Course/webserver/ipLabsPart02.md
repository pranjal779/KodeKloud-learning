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

