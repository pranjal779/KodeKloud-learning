# Day 19: Install and Configure Web Application

<img width="951" height="921" alt="image" src="https://github.com/user-attachments/assets/becabd76-1e46-42cd-a62e-ca09db524846" />

xFusionCorp Industries is planning to host two static websites on their infra in Stratos Datacenter. 
The development of these websites is still in-progress, but we want to get the servers ready. 
Please perform the following steps to accomplish the task:

a. Install httpd package and dependencies on app server 2.

b. Apache should serve on port 5000.

c. There are two website's backups /home/thor/news and /home/thor/demo on jump_host. 
Set them up on Apache in a way that news should work on the link http://localhost:5000/news/ and demo should work on link http://localhost:5000/demo/ on the mentioned app server.

d. Once configured you should be able to access the website using curl command on the respective app server, i.e curl http://localhost:5000/news/ and curl http://localhost:5000/demo/

```sh
[steve@stapp02 ~]$ sudo yum install httpd -y

Complete!
[steve@stapp02 ~]$ sudo sed -i 's/Listen 80/Listen 5000/g' /etc/httpd/conf
conf/           conf.d/         conf.modules.d/ 
[steve@stapp02 ~]$ sudo sed -i 's/Listen 80/Listen 5000/g' /etc/httpd/conf
conf/           conf.d/         conf.modules.d/ 
[steve@stapp02 ~]$ sudo sed -i 's/Listen 80/Listen 5000/g' /etc/httpd/conf/httpd.conf 
[steve@stapp02 ~]$ sudo systemctl start httpd
[steve@stapp02 ~]$ sudo systemctl enable httpd
Created symlink /etc/systemd/system/multi-user.target.wants/httpd.service → /usr/lib/systemd/system/httpd.service.

thor@jump-host ~$ # Assuming the user for stapp02 is 'steve' (check your lab credentials)
scp -r /home/thor/news steve@stapp02:/tmp/
scp -r /home/thor/demo steve@stapp02:/tmp/
steve@stapp02's password: 
Permission denied, please try again.
steve@stapp02's password: 
index.html                                                                                100%  117   333.3KB/s   00:00    
steve@stapp02's password: 
index.html                                                                                100%  117   330.0KB/s   00:00    
thor@jump-host ~$


</html>[steve@stappcurl http://localhost:5000/demo/0/demo/
<!DOCTYPE html>
<html>
<body>

<h1>KodeKloud</h1>

<p>This is a sample page for our demo website</p>

</body>
</html>[steve@stappcurl http://localhost:5000/news/0/news/
<!DOCTYPE html>
<html>
<body>

<h1>KodeKloud</h1>

<p>This is a sample page for our news website</p>

</body>
</html>[steve@stapp02 ~]$ 

```
<img width="2411" height="1212" alt="image" src="https://github.com/user-attachments/assets/08872d51-2ed3-4a43-a54b-44796d125c58" />

<img width="952" height="565" alt="image" src="https://github.com/user-attachments/assets/4ec535e5-e394-447e-9901-9bc13f2eeaa6" />

<img width="895" height="637" alt="image" src="https://github.com/user-attachments/assets/37a1bc8e-83f9-4e87-9110-5aefc34686aa" />
