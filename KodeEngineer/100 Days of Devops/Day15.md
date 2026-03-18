# Day 15: Setup SSL for Nginx

<img width="1376" height="747" alt="image" src="https://github.com/user-attachments/assets/f6f44ef2-6daf-456a-8f58-a4420cc888c3" />


The system admins team of xFusionCorp Industries needs to deploy a new application on App Server 1 in Stratos Datacenter. 
They have some pre-requites to get ready that server for application deployment. Prepare the server as per requirements shared below:

1. Install and configure nginx on App Server 1.
2. On App Server 1 there is a self signed SSL certificate and key present at location /tmp/nautilus.crt and /tmp/nautilus.key. Move them to some appropriate location and deploy the same in Nginx.
3. Create an index.html file with content Welcome! under Nginx document root.
4. For final testing try to access the App Server 1 link (via hostname) from jump host using curl command. For example: curl -Ik https://<app-server-name>/.

<img width="845" height="728" alt="image" src="https://github.com/user-attachments/assets/7cf500eb-1eae-4c8c-bd77-8e12dc415ed4" />

```sh


[tony@stapp01 ~]$ sudo systemctl enable nginx
Created symlink /etc/systemd/system/multi-user.target.wants/nginx.service → /usr/lib/systemd/system/nginx.service.
[tony@stapp01 ~]$

[tony@stapp01 ~]$ sudo mkdir -p /etc/nginx/ssl
[tony@stapp01 ~]$ sudo mv /tmp/nautilus.crt /etc/nginx/ssl/
[tony@stapp01 ~]$ sudo mv /tmp/nautilus.key /etc/nginx/ssl/
[tony@stapp01 ~]$

[tony@stapp01 ~]$ sudo tee /etc/nginx/conf.d/nautilus.conf << 'EOF'
> server {
> listen 443 ssl;
> server_name _;
> ssl_certificate /etc/nginx/ssl/nautilus.crt;
> ssl_certificate_key /etc/nginx/ssl/nautilus.key;
> root /usr/share/nginx/html;
> }
> EOF
server {
listen 443 ssl;
server_name _;
ssl_certificate /etc/nginx/ssl/nautilus.crt;
ssl_certificate_key /etc/nginx/ssl/nautilus.key;
root /usr/share/nginx/html;
}
[tony@stapp01 ~]$

[tony@stapp01 ~]$ echo 'Welcome!' | sudo tee /usr/share/nginx/html/index.html
Welcome!
[tony@stapp01 ~]$
[tony@stapp01 ~]$ sudo nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
[tony@stapp01 ~]$ sudo systemctl reload nginx
nginx.service is not active, cannot reload.
[tony@stapp01 ~]$
[tony@stapp01 ~]$ sudo systemctl start nginx
[tony@stapp01 ~]$ sudo systemctl status nginx
● nginx.service - The nginx HTTP and reverse proxy server
     Loaded: loaded (/usr/lib/systemd/system/nginx.service; enabled; preset: disabled)
     Active: active (running) since Wed 2026-03-18 13:50:34 UTC; 16s ago
    Process: 12399 ExecStartPre=/usr/bin/rm -f /run/nginx.pid (code=exited, status=0/SUCCESS)
    Process: 12400 ExecStartPre=/usr/sbin/nginx -t (code=exited, status=0/SUCCESS)
    Process: 12407 ExecStart=/usr/sbin/nginx (code=exited, status=0/SUCCESS)
   Main PID: 12414 (nginx)
      Tasks: 17 (limit: 404712)
     Memory: 16.5M
        CPU: 54ms
     CGroup: /system.slice/nginx.service
             ├─12414 "nginx: master process /usr/sbin/nginx"
             ├─12415 "nginx: worker process"
             ├─12416 "nginx: worker process"
             ├─12417 "nginx: worker process"
             ├─12418 "nginx: worker process"
             ├─12419 "nginx: worker process"
             ├─12420 "nginx: worker process"
             ├─12421 "nginx: worker process"
             ├─12422 "nginx: worker process"
             ├─12423 "nginx: worker process"
             ├─12424 "nginx: worker process"
             ├─12425 "nginx: worker process"
             ├─12426 "nginx: worker process"
             ├─12427 "nginx: worker process"
             ├─12428 "nginx: worker process"
             ├─12429 "nginx: worker process"
             └─12430 "nginx: worker process"

Mar 18 13:50:34 stapp01 systemd[1]: Starting The nginx HTTP and reverse proxy server...
Mar 18 13:50:34 stapp01 nginx[12400]: nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
Mar 18 13:50:34 stapp01 nginx[12400]: nginx: configuration file /etc/nginx/nginx.conf test is successful
Mar 18 13:50:34 stapp01 systemd[1]: Started The nginx HTTP and reverse proxy server.
[tony@stapp01 ~]$

[tony@stapp01 ~]$ cat /etc/hosts 
# Kubernetes-managed hosts file.
127.0.0.1       localhost
::1     localhost ip6-localhost ip6-loopback
fe00::0 ip6-localnet
fe00::0 ip6-mcastprefix
fe00::1 ip6-allnodes
fe00::2 ip6-allrouters
10.244.164.37   stapp01

# Entries added by HostAliases.
10.0.15.5       docker-registry-mirror.kodekloud.com
[tony@stapp01 ~]$

[tony@stapp01 ~]$ curl -IK https://stapp01
Warning: error trying read config from the 'https://stapp01' file
curl: no URL specified!
curl: try 'curl --help' for more information
[tony@stapp01 ~]$ curl -IK https://10.244.164.37
Warning: error trying read config from the 'https://10.244.164.37' file
curl: no URL specified!
curl: try 'curl --help' for more information
[tony@stapp01 ~]$

thor@jump-host ~$ cat /etc/host
host.conf  hostname   hosts      
thor@jump-host ~$ cat /etc/hosts 
# Kubernetes-managed hosts file.
127.0.0.1       localhost
::1     localhost ip6-localhost ip6-loopback
fe00::0 ip6-localnet
fe00::0 ip6-mcastprefix
fe00::1 ip6-allnodes
fe00::2 ip6-allrouters
10.244.81.7     jump-host

# Entries added by HostAliases.
10.0.15.5       docker-registry-mirror.kodekloud.com
thor@jump-host ~$
thor@jump-host ~$ cat /etc/host
host.conf  hostname   hosts      
thor@jump-host ~$ cat /etc/hosts 
# Kubernetes-managed hosts file.
127.0.0.1       localhost
::1     localhost ip6-localhost ip6-loopback
fe00::0 ip6-localnet
fe00::0 ip6-mcastprefix
fe00::1 ip6-allnodes
fe00::2 ip6-allrouters
10.244.81.7     jump-host

# Entries added by HostAliases.
10.0.15.5       docker-registry-mirror.kodekloud.com
thor@jump-host ~$ 

thor@jump-host ~$ history
    1  ssh tony@stapp01
    2  cat /etc/hosts 
    3  curl -Ik https://tony@stapp01
    4  history
thor@jump-host ~$

thor@jump-host ~$ ssh tony@stapp01
tony@stapp01's password: 
Last login: Wed Mar 18 13:38:50 2026 from 10.244.81.7
[tony@stapp01 ~]$ history
    1  sudo yum install -y nginx
    2  sudo systemctl enable - now nginx
    3  sudo systemctl enable nginx
    4  sudo mv /tmp/nautilus.crt /etc/nginx/ssl/
    5  sudo mkdir -p /etc/nginx/ssl
    6  sudo mv /tmp/nautilus.crt /etc/nginx/ssl/
    7  sudo mv /tmp/nautilus.key /etc/nginx/ssl/
    8  sudo tee /etc/nginx/conf.d/nautilus.conf << 'EOF'
    9  server {
   10  listen 443 ssl;
   11  server_name _;
   12  ssl_certificate /etc/nginx/ssl/nautilus.crt;
   13  ssl_certificate_key /etc/nginx/ssl/nautilus.key;
   14  root /usr/share/nginx/html;
   15  }
   16  EOF
   17  echo 'Welcome!' | sudo tee /usr/share/nginx/html/index.html
   18  sudo nginx -t
   19  sudo systemctl reload nginx
   20  sudo systemctl start nginx
   21  sudo systemctl status nginx
   22  cat /etc/hosts 
   23  curl -IK https://stapp01
   24  curl -IK https://10.244.164.37
   25  exit
   26  history
[tony@stapp01 ~]$ 
```

<img width="1790" height="1143" alt="image" src="https://github.com/user-attachments/assets/f414689b-4d98-43fd-9dee-1018332c2990" />

<img width="960" height="653" alt="image" src="https://github.com/user-attachments/assets/3c370f5d-68c4-45fa-a88e-7be023a44b80" />
<img width="870" height="583" alt="image" src="https://github.com/user-attachments/assets/4fce7abc-51d5-4cc2-9bfb-04fddf61a3d3" />
<img width="992" height="622" alt="image" src="https://github.com/user-attachments/assets/c3617b96-c7be-4bdb-8fc1-0304360c728d" />
