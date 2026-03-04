# Day 11: Install and Configure Tomcat Server

<img width="1401" height="860" alt="image" src="https://github.com/user-attachments/assets/d0c33281-5749-46fc-bc1a-43bf43b2abcf" />

```txt
The Nautilus application development team recently finished the beta version of one of their Java-based applications,
which they are planning to deploy on one of the app servers in Stratos DC. After an internal team meeting,
they have decided to use the tomcat application server. Based on the requirements mentioned below complete the task:

a. Install tomcat server on App Server 3.

b. Configure it to run on port 8087.

c. There is a ROOT.war file on Jump host at location /tmp.


Deploy it on this tomcat server and make sure the webpage works directly on base URL i.e curl http://stapp03:8087
```

```sh
[banner@stapp03 ~]$ ls /etc/t
terminfo/   tmpfiles.d/ tomcat/     tpm2-tss/   
[banner@stapp03 ~]$ ls /etc/t
terminfo/   tmpfiles.d/ tomcat/     tpm2-tss/   
[banner@stapp03 ~]$ ls /etc/tomcat/
Catalina/             jaspic-providers.xml  tomcat-users.xsd
catalina.policy       jaspic-providers.xsd  tomcat.conf
catalina.properties   logging.properties    web.xml
conf.d/               server.xml            
context.xml           tomcat-users.xml      
[banner@stapp03 ~]$ ls /etc/tomcat/server.xml 
/etc/tomcat/server.xml
[banner@stapp03 ~]$


```

<img width="908" height="602" alt="image" src="https://github.com/user-attachments/assets/b96314b5-39d3-4dbb-8e89-9038a1847f15" />

<img width="1622" height="1095" alt="image" src="https://github.com/user-attachments/assets/446ac0b4-81c4-4dda-8d78-142a33681e31" />
<img width="1625" height="1078" alt="image" src="https://github.com/user-attachments/assets/6ae00514-7832-4468-82a0-df6afb523fbe" />

```sh
thor@jumphost ~$ scp /tmp/ROOT.war banner@172.16.238.11
thor@jumphost ~$ history
    1  ssh banner@172.16.238.12
    2  ssh thor@Dynamic
    3  ssh thor@sump_host
    4  ls -la /tmp
    5  scp /tmp/ROOT.war banner@172.16.238.11
    6  history
thor@jumphost ~$

[banner@stapp03 ~]$ whereis ROOT.war
ROOT.war:
[banner@stapp03 ~]$ exit
logout
Connection to 172.16.238.12 closed.
thor@jumphost ~$ scp /tmp/ROOT.war banner@172.16.238.11:/tmp/
banner@172.16.238.11's password: 
Permission denied, please try again.
banner@172.16.238.11's password: 
thor@jumphost ~$ scp /tmp/ROOT.war banner@172.16.238.12:/tmp/
banner@172.16.238.12's password: 
ROOT.war                                         100% 4529     9.2MB/s   00:00    
thor@jumphost ~$ 
```


