![image](https://github.com/user-attachments/assets/f02d408d-aab5-42ef-9a6a-0513451e904b)

![image](https://github.com/user-attachments/assets/48f6f9a9-b994-4735-acc9-f0b3297f28c0)

![image](https://github.com/user-attachments/assets/f5bd0819-7032-434a-b268-e0c7a29e3b29)

![image](https://github.com/user-attachments/assets/2943e110-1483-4144-9680-f64e1743dd60)

![image](https://github.com/user-attachments/assets/614c2bcb-87b5-4eed-b978-2c67e885f0c6)

![image](https://github.com/user-attachments/assets/6dab17c5-9174-424a-b672-1dba72bd22e4)

thor@host01 ~$ sudo sed -i 's/8080/9090/g' apache-tomcat-8.5.53/conf/server.xml

not running on 
Tomcat running on port 9090?

root@host01 /opt/apache-tomcat-8.5.53/conf# ^C
root@host01 /opt/apache-tomcat-8.5.53/conf# vi server.xml 
root@host01 /opt/apache-tomcat-8.5.53/conf# sudo ./apache-tomcat-8.5.53/bin/startup.sh
sudo: ./apache-tomcat-8.5.53/bin/startup.sh: command not found
root@host01 /opt/apache-tomcat-8.5.53/conf# cd ~
root@host01 ~# sudo ./apache-tomcat-8.5.53/bin/startup.sh
sudo: ./apache-tomcat-8.5.53/bin/startup.sh: command not found
root@host01 ~# sudo ./apache-tomcat-8.5.53/bin/startup.sh
sudo: ./apache-tomcat-8.5.53/bin/startup.sh: command not found
root@host01 ~# cd ./apache-tomcat-8.5.53/bin/startup.sh
bash: cd: ./apache-tomcat-8.5.53/bin/startup.sh: No such file or directory
root@host01 ~# sudo /opt/apache-tomcat-8.5.53/bin/startup.sh
Using CATALINA_BASE:   /opt/apache-tomcat-8.5.53
Using CATALINA_HOME:   /opt/apache-tomcat-8.5.53
Using CATALINA_TMPDIR: /opt/apache-tomcat-8.5.53/temp
Using JRE_HOME:        /
Using CLASSPATH:       /opt/apache-tomcat-8.5.53/bin/bootstrap.jar:/opt/apache-tomcat-8.5.53/bin/tomcat-juli.jar
Tomcat started.
root@host01 ~# 

![image](https://github.com/user-attachments/assets/77932171-1c07-4ba4-8a59-8b20288e4440)

![image](https://github.com/user-attachments/assets/513d59b6-e35c-4720-905c-ac3a6959030a)

![image](https://github.com/user-attachments/assets/2845da65-9721-4ed6-ae9a-221b97330b6e)
