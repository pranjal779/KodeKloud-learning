# Apache Webserver

- Opensource
- Webserver


```sh
yum install httpd

service httpd start

service httpd status

# if firewall configured in your system then add a rule to allow http
firewall-cmd --permanent --add-service=http

```

## View Logs

```sh
cat /var/log/httpd/access_log

cat /var/log/httpd/error_log
```

## config file example:

/etc/httpd/cof/httpd.conf

![image](https://github.com/user-attachments/assets/20b07fdd-7714-4276-9a00-e367d89ad907)


## Server name
for your domain example: www.houses.com, you dont really need to have this entry, but it is recommended to add the  
current server name here. remeber that for this to work that is when you type in www.houses.com and for it to point to  
your server or your laptop, you must have a DNS entry configured in your network DNS server to point that host to the  
IP address of your system. Otherwise, the browser won't know where to look for this domain name and it will try and search  
the internet for houses.com. Or if you simply want to test this in your local system, a workaround is to simply add  
an entry into the etc hosts file like this pointing www.houses.com to 127.0.0.1, which is your hosts loopback IP address.  

![image](https://github.com/user-attachments/assets/37ec090a-f95e-4623-952f-aea51bc55c71)

![image](https://github.com/user-attachments/assets/b1a7a394-9949-42fe-b266-bdaf226e7e79)

![image](https://github.com/user-attachments/assets/94083922-e9cd-4408-8702-b087c6f164f6)

Also remember that any changes in the configuration file requires you to restart the HTTP service, so you must run the service
httpd restart to restart the service.

```sh
service httpd restart
```
