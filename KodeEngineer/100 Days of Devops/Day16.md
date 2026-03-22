# Day 16: Install and Configure Nginx as an LBR

<img width="1376" height="802" alt="image" src="https://github.com/user-attachments/assets/afa16c21-52e4-4087-b966-650d5fca0f7b" />

Day by day traffic is increasing on one of the websites managed by the Nautilus production support team. 
Therefore, the team has observed a degradation in website performance. 
Following discussions about this issue, the team has decided to deploy this application on a high availability stack i.e on Nautilus infra in Stratos DC. 
They started the migration last month and it is almost done, as only the LBR server configuration is pending. Configure LBR server as per the information given below:

a. Install nginx on the LBR (load balancer) server if it is not already installed.

b. Configure load-balancing with the http context making use of all App Servers. Ensure that you update only the main Nginx configuration file located at /etc/nginx/nginx.conf.

c. Make sure you do not update the apache port that is already defined in the apache configuration on all app servers, also make sure apache service is up and running on all the app servers.

d. Once done, you can access the website by running curl http://stlb01:80 in the terminal.

<img width="966" height="741" alt="image" src="https://github.com/user-attachments/assets/a1ca6e16-7fd5-45fe-a945-e4fdf99381cd" />

```sh
[loki@stlb01 ~]$ sudo systemctl status nginx
○ nginx.service - The nginx HTTP and reverse proxy server
     Loaded: loaded (/usr/lib/systemd/system/nginx.service; disabled; preset: disabled)
     Active: inactive (dead)
[loki@stlb01 ~]$

[loki@stlb01 ~]$ sudo systemctl enable nginx
Created symlink /etc/systemd/system/multi-user.target.wants/nginx.service → /usr/lib/systemd/system/nginx.service.
[loki@stlb01 ~]$

[loki@stlb01 ~]$ sudo systemctl start nginx
[loki@stlb01 ~]$

[loki@stlb01 ~]$ sudo systemctl status nginx
● nginx.service - The nginx HTTP and reverse proxy server
     Loaded: loaded (/usr/lib/systemd/system/nginx.service; enabled; preset: disabled)
     Active: active (running) since Sun 2026-03-22 04:35:20 UTC; 35s ago
    Process: 68734 ExecStartPre=/usr/bin/rm -f /run/nginx.pid (code=exited, status=0/SUCCESS)
    Process: 68741 ExecStartPre=/usr/sbin/nginx -t (code=exited, status=0/SUCCESS)
    Process: 68748 ExecStart=/usr/sbin/nginx (code=exited, status=0/SUCCESS)
   Main PID: 68755 (nginx)
      Tasks: 17 (limit: 404712)
     Memory: 17.8M (peak: 18.1M)
        CPU: 52ms
     CGroup: /system.slice/nginx.service
             ├─68755 "nginx: master process /usr/sbin/nginx"
             ├─68756 "nginx: worker process"
             ├─68757 "nginx: worker process"
             ├─68758 "nginx: worker process"
             ├─68759 "nginx: worker process"
             ├─68760 "nginx: worker process"
             ├─68761 "nginx: worker process"
             ├─68762 "nginx: worker process"
             ├─68763 "nginx: worker process"
             ├─68764 "nginx: worker process"
             ├─68765 "nginx: worker process"
             ├─68766 "nginx: worker process"
             ├─68767 "nginx: worker process"
             ├─68768 "nginx: worker process"
             ├─68769 "nginx: worker process"
             ├─68770 "nginx: worker process"
             └─68771 "nginx: worker process"

Mar 22 04:35:20 stlb01 systemd[1]: Starting The nginx HTTP and reverse proxy server...
Mar 22 04:35:20 stlb01 nginx[68741]: nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
Mar 22 04:35:20 stlb01 nginx[68741]: nginx: configuration file /etc/nginx/nginx.conf test is successful
Mar 22 04:35:20 stlb01 systemd[1]: Started The nginx HTTP and reverse proxy server.
[loki@stlb01 ~]$

tony@stapp01's password: 
[tony@stapp01 ~]$ cat /etc/hosts
# Kubernetes-managed hosts file.
127.0.0.1       localhost
::1     localhost ip6-localhost ip6-loopback
fe00::0 ip6-localnet
fe00::0 ip6-mcastprefix
fe00::1 ip6-allnodes
fe00::2 ip6-allrouters
10.244.73.154   stapp01

# Entries added by HostAliases.
10.0.15.5       docker-registry-mirror.kodekloud.com
[tony@stapp01 ~]$

[tony@stapp01 ~]$ sudo ss -tulp | grep httpd

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for tony: 
tcp   LISTEN 0      511                *:lm-x                *:*    users:(("httpd",pid=36448,fd=4),("httpd",pid=36447,fd=4),("httpd",pid=36446,fd=4),("httpd",pid=36438,fd=4))
[tony@stapp01 ~]$

[tony@stapp01 ~]$ sudo systemctl status httpd
● httpd.service - The Apache HTTP Server
     Loaded: loaded (/usr/lib/systemd/system/httpd.service; disabled; preset: disabled)
     Active: active (running) since Sun 2026-03-22 04:13:52 UTC; 27min ago
       Docs: man:httpd.service(8)
   Main PID: 36438 (httpd)
     Status: "Total requests: 0; Idle/Busy workers 100/0;Requests/sec: 0; Bytes served/sec:   0 B/sec"
      Tasks: 177 (limit: 404712)
     Memory: 15.1M
        CPU: 905ms
     CGroup: /system.slice/httpd.service
             ├─36438 /usr/sbin/httpd -DFOREGROUND
             ├─36445 /usr/sbin/httpd -DFOREGROUND
             ├─36446 /usr/sbin/httpd -DFOREGROUND
             ├─36447 /usr/sbin/httpd -DFOREGROUND
             └─36448 /usr/sbin/httpd -DFOREGROUND

Mar 22 04:13:52 stapp01 systemd[1]: Starting The Apache HTTP Server...
Mar 22 04:13:52 stapp01 httpd[36438]: AH00558: httpd: Could not reliably determine the server's fully qualified domain name>
Mar 22 04:13:52 stapp01 httpd[36438]: Server configured, listening on: port 6200
Mar 22 04:13:52 stapp01 systemd[1]: Started The Apache HTTP Server.
lines 1-20/20 (END)




```
