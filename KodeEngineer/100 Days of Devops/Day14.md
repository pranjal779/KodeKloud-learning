# Day 14: Linux Process Troubleshooting

<img width="1406" height="808" alt="image" src="https://github.com/user-attachments/assets/dd9dce76-35a8-4424-a596-3e300e4d6189" />

The production support team of xFusionCorp Industries has deployed some of the latest monitoring tools to keep an eye on every service, application, etc. running on the systems. 
One of the monitoring systems reported about Apache service unavailability on one of the app servers in Stratos DC.

Identify the faulty app host and fix the issue. Make sure Apache service is up and running on all app hosts. 
They might not have hosted any code yet on these servers, so you don't need to worry if Apache isn't serving any pages. 
Just make sure the service is up and running. Also, make sure Apache is running on port 5000 on all app servers.

<img width="902" height="407" alt="image" src="https://github.com/user-attachments/assets/7fca5794-fd9b-42c6-bd58-a40206e87558" />

```sh
[tony@stapp01 ~]$ systemctl status httpd
× httpd.service - The Apache HTTP Server
     Loaded: loaded (/usr/lib/systemd/system/httpd.service; disabled; preset: disabled)
     Active: failed (Result: exit-code) since Tue 2026-03-17 14:55:08 UTC; 3min 23s ago
       Docs: man:httpd.service(8)
    Process: 11740 ExecStart=/usr/sbin/httpd $OPTIONS -DFOREGROUND (code=exited, status=1/FAILURE)
   Main PID: 11740 (code=exited, status=1/FAILURE)
     Status: "Reading configuration..."
        CPU: 38ms

Mar 17 14:55:07 stapp01 systemd[1]: Starting The Apache HTTP Server...
Mar 17 14:55:07 stapp01 httpd[11740]: AH00558: httpd: Could not reliably determine the server's fully qualified domain name>
Mar 17 14:55:07 stapp01 httpd[11740]: (98)Address already in use: AH00072: make_sock: could not bind to address [::]:5000
Mar 17 14:55:07 stapp01 httpd[11740]: (98)Address already in use: AH00072: make_sock: could not bind to address 0.0.0.0:5000
Mar 17 14:55:07 stapp01 httpd[11740]: no listening sockets available, shutting down
Mar 17 14:55:07 stapp01 httpd[11740]: AH00015: Unable to open logs
Mar 17 14:55:08 stapp01 systemd[1]: httpd.service: Main process exited, code=exited, status=1/FAILURE
Mar 17 14:55:08 stapp01 systemd[1]: httpd.service: Failed with result 'exit-code'.
Mar 17 14:55:08 stapp01 systemd[1]: Failed to start The Apache HTTP Server.
[tony@stapp01 ~]$ cat /etc/hosts
# Kubernetes-managed hosts file.
127.0.0.1       localhost
::1     localhost ip6-localhost ip6-loopback
fe00::0 ip6-localnet
fe00::0 ip6-mcastprefix
fe00::1 ip6-allnodes
fe00::2 ip6-allrouters
10.244.81.45    stapp01

# Entries added by HostAliases.
10.0.15.5       docker-registry-mirror.kodekloud.com
[tony@stapp01 ~]$ 

[tony@stapp01 ~]$ telnet 10.244.81.45 5000
Trying 10.244.81.45...
telnet: connect to address 10.244.81.45: Connection refused
[tony@stapp01 ~]$ 

[tony@stapp01 ~]$ journalctl -u httpd.service -xe
Mar 17 14:55:07 stapp01 systemd[1]: Starting The Apache HTTP Server...
░░ Subject: A start job for unit httpd.service has begun execution
░░ Defined-By: systemd
░░ Support: https://access.redhat.com/support
░░ 
░░ A start job for unit httpd.service has begun execution.
░░ 
░░ The job identifier is 21730.
Mar 17 14:55:07 stapp01 httpd[11740]: AH00558: httpd: Could not reliably determine the server's fully qualified domain name>
Mar 17 14:55:07 stapp01 httpd[11740]: (98)Address already in use: AH00072: make_sock: could not bind to address [::]:5000
Mar 17 14:55:07 stapp01 httpd[11740]: (98)Address already in use: AH00072: make_sock: could not bind to address 0.0.0.0:5000
Mar 17 14:55:07 stapp01 httpd[11740]: no listening sockets available, shutting down
Mar 17 14:55:07 stapp01 httpd[11740]: AH00015: Unable to open logs
Mar 17 14:55:08 stapp01 systemd[1]: httpd.service: Main process exited, code=exited, status=1/FAILURE
░░ Subject: Unit process exited
░░ Defined-By: systemd
░░ Support: https://access.redhat.com/support
░░ 
░░ An ExecStart= process belonging to unit httpd.service has exited.
░░ 
░░ The process' exit code is 'exited' and its exit status is 1.
Mar 17 14:55:08 stapp01 systemd[1]: httpd.service: Failed with result 'exit-code'.
░░ Subject: Unit failed
░░ Defined-By: systemd
░░ Support: https://access.redhat.com/support
░░ 
░░ The unit httpd.service has entered the 'failed' state with result 'exit-code'.
Mar 17 14:55:08 stapp01 systemd[1]: Failed to start The Apache HTTP Server.
░░ Subject: A start job for unit httpd.service has failed
░░ Defined-By: systemd
░░ Support: https://access.redhat.com/support
░░ 
░░ A start job for unit httpd.service has finished with a failure.
░░ 
░░ The job identifier is 21730 and the job result is failed.
lines 1-35/35 (END)

[tony@stapp01 ~]$ sudo ss -tuln | grep 5000

tcp   LISTEN 0      10         127.0.0.1:5000      0.0.0.0:*   
[tony@stapp01 ~]$

[tony@stapp01 ~]$ sudo lsof -i :5000
COMMAND    PID USER   FD   TYPE    DEVICE SIZE/OFF NODE NAME
sendmail 11186 root    4u  IPv4 586910659      0t0  TCP localhost:commplex-main (LISTEN)
[tony@stapp01 ~]$
[tony@stapp01 ~]$ sudo kill 11186
[tony@stapp01 ~]$ sudo lsof -i :5000
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ sudo systemctl status httpd
● httpd.service - The Apache HTTP Server
     Loaded: loaded (/usr/lib/systemd/system/httpd.service; disabled; preset: disabled)
     Active: active (running) since Tue 2026-03-17 15:06:51 UTC; 13s ago
       Docs: man:httpd.service(8)
   Main PID: 38265 (httpd)
     Status: "Total requests: 0; Idle/Busy workers 100/0;Requests/sec: 0; Bytes served/sec:   0 B/sec"
      Tasks: 177 (limit: 404712)
     Memory: 15.0M
        CPU: 62ms
     CGroup: /system.slice/httpd.service
             ├─38265 /usr/sbin/httpd -DFOREGROUND
             ├─38272 /usr/sbin/httpd -DFOREGROUND
             ├─38273 /usr/sbin/httpd -DFOREGROUND
             ├─38274 /usr/sbin/httpd -DFOREGROUND
             └─38275 /usr/sbin/httpd -DFOREGROUND

Mar 17 15:06:51 stapp01 systemd[1]: Starting The Apache HTTP Server...
Mar 17 15:06:51 stapp01 httpd[38265]: AH00558: httpd: Could not reliably determine the server's fully qualified domain name>
Mar 17 15:06:51 stapp01 httpd[38265]: Server configured, listening on: port 5000
Mar 17 15:06:51 stapp01 systemd[1]: Started The Apache HTTP Server.
lines 1-20/20 (END)

[tony@stapp01 ~]$ history
    1  systemctl status httpd
    2  cat /etc/hosts
    3  netstat -tulpn | grep 5000
    4  telnet 10.244.81.45 5000
    5  journalctl -u httpd.service -xe
    6  sudo ss -tuln | grep 5000
    7  sudo netstat -tulnp | grep 5000
    8  sudo lsof -i :5000
    9  sudo kill 11186
   10  sudo lsof -i :5000
   11  sudo systemctl restart service
   12  sudo systemctl start httpd
   13  sudo systemctl status httpd
   14  history
[tony@stapp01 ~]$ 

```


```sh
[steve@stapp02 ~]$ sudo systemctl status httpd

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for steve: 
● httpd.service - The Apache HTTP Server
     Loaded: loaded (/usr/lib/systemd/system/httpd.service; disabled; preset: disabled)
     Active: active (running) since Tue 2026-03-17 14:55:08 UTC; 14min ago
       Docs: man:httpd.service(8)
   Main PID: 9257 (httpd)
     Status: "Total requests: 0; Idle/Busy workers 100/0;Requests/sec: 0; Bytes served/sec:   0 B/sec"
      Tasks: 177 (limit: 404712)
     Memory: 15.1M
        CPU: 508ms
     CGroup: /system.slice/httpd.service
             ├─9257 /usr/sbin/httpd -DFOREGROUND
             ├─9264 /usr/sbin/httpd -DFOREGROUND
             ├─9265 /usr/sbin/httpd -DFOREGROUND
             ├─9266 /usr/sbin/httpd -DFOREGROUND
             └─9267 /usr/sbin/httpd -DFOREGROUND

Mar 17 14:55:08 stapp02 systemd[1]: Starting The Apache HTTP Server...
Mar 17 14:55:08 stapp02 httpd[9257]: AH00558: httpd: Could not reliably determine the server's fully qualified domain name,>
Mar 17 14:55:08 stapp02 httpd[9257]: Server configured, listening on: port 5000
Mar 17 14:55:08 stapp02 systemd[1]: Started The Apache HTTP Server.
lines 1-20/20 (END)

```

```sh

[banner@stapp03 ~]$ sudo systemctl status httpd
● httpd.service - The Apache HTTP Server
     Loaded: loaded (/usr/lib/systemd/system/httpd.service; disabled; preset: disabled)
     Active: active (running) since Tue 2026-03-17 14:55:08 UTC; 16min ago
       Docs: man:httpd.service(8)
   Main PID: 9436 (httpd)
     Status: "Total requests: 0; Idle/Busy workers 100/0;Requests/sec: 0; Bytes served/sec:   0 B/sec"
      Tasks: 177 (limit: 404712)
     Memory: 15.1M
        CPU: 582ms
     CGroup: /system.slice/httpd.service
             ├─9436 /usr/sbin/httpd -DFOREGROUND
             ├─9443 /usr/sbin/httpd -DFOREGROUND
             ├─9444 /usr/sbin/httpd -DFOREGROUND
             ├─9445 /usr/sbin/httpd -DFOREGROUND
             └─9446 /usr/sbin/httpd -DFOREGROUND

Mar 17 14:55:08 stapp03 systemd[1]: Starting The Apache HTTP Server...
Mar 17 14:55:08 stapp03 httpd[9436]: AH00558: httpd: Could not reliably determine the server's fully qualified domain name,>
Mar 17 14:55:08 stapp03 httpd[9436]: Server configured, listening on: port 5000
Mar 17 14:55:08 stapp03 systemd[1]: Started The Apache HTTP Server.
lines 1-20/20 (END)
```

<img width="2412" height="1173" alt="image" src="https://github.com/user-attachments/assets/87d4fd74-994d-4a82-80f6-2d07a687a1bd" />

<img width="2382" height="1182" alt="image" src="https://github.com/user-attachments/assets/e224db4f-c391-4a38-b2f1-951a65443038" />
<img width="1058" height="601" alt="image" src="https://github.com/user-attachments/assets/d2c856c0-37e2-444d-a060-23efbc5c9398" />
<img width="887" height="552" alt="image" src="https://github.com/user-attachments/assets/37c6b4ed-442b-4d2d-8688-acfb6c93d2c9" />

