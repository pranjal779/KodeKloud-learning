# Day 35: Install Docker Packages and Start Docker Service

<img width="852" height="312" alt="image" src="https://github.com/user-attachments/assets/fa6d7066-2b6e-4991-a5f6-dff3df546b5f" />


```sh
[tony@stapp01 ~]$ sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100 30.8M  100 30.8M    0     0  36.0M      0 --:--:-- --:--:-- --:--:-- 36.0M
[tony@stapp01 ~]$ sudo chmod +x /usr/local/bin/docker-compose
[tony@stapp01 ~]$
[tony@stapp01 ~]$ docker-compose --version
Docker Compose version v5.1.3
[tony@stapp01 ~]$ sudo systemctl start docker
[tony@stapp01 ~]$ sudo systemctl enable docker
Created symlink /etc/systemd/system/multi-user.target.wants/docker.service → /usr/lib/systemd/system/docker.service.
[tony@stapp01 ~]$ sudo systemctl status docker
● docker.service - Docker Application Container Engine
     Loaded: loaded (/usr/lib/systemd/system/docker.service; enabled; preset: disabled)
     Active: active (running) since Tue 2026-05-12 13:40:33 UTC; 10s ago
TriggeredBy: ● docker.socket
       Docs: https://docs.docker.com
   Main PID: 44403 (dockerd)
      Tasks: 16
     Memory: 25.5M (peak: 27.1M)
        CPU: 249ms
     CGroup: /system.slice/docker.service
             └─44403 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock

May 12 13:40:32 stapp01 dockerd[44403]: time="2026-05-12T13:40:32.985711151Z" level=info msg="Deleting nftables IPv6 rules">
May 12 13:40:33 stapp01 dockerd[44403]: time="2026-05-12T13:40:33.283852285Z" level=warning msg="ip6tables is enabled, but >
May 12 13:40:33 stapp01 dockerd[44403]: time="2026-05-12T13:40:33.304739702Z" level=warning msg="configuring DOCKER-USER" e>
May 12 13:40:33 stapp01 dockerd[44403]: time="2026-05-12T13:40:33.415423789Z" level=info msg="Loading containers: done."
May 12 13:40:33 stapp01 dockerd[44403]: time="2026-05-12T13:40:33.421228477Z" level=info msg="Docker daemon" commit=56be731>
May 12 13:40:33 stapp01 dockerd[44403]: time="2026-05-12T13:40:33.421361256Z" level=info msg="Initializing buildkit"
May 12 13:40:33 stapp01 dockerd[44403]: time="2026-05-12T13:40:33.508141839Z" level=info msg="Completed buildkit initializa>
May 12 13:40:33 stapp01 dockerd[44403]: time="2026-05-12T13:40:33.511201126Z" level=info msg="Daemon has completed initiali>
May 12 13:40:33 stapp01 dockerd[44403]: time="2026-05-12T13:40:33.511236015Z" level=info msg="API listen on /run/docker.soc>
May 12 13:40:33 stapp01 systemd[1]: Started Docker Application Container Engine.
[tony@stapp01 ~]$ sudo docker --version
Docker version 29.4.3, build 055a478

[tony@stapp01 ~]$ history
    1  sudo yum update -y
    2  sudo yum install -y yum-utils device-mapper-persistent-data lvm2
    3  sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    4  sudo yum install -y docker-ce docker-ce-cli containerd.io
    5  sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    6  sudo chmod +x /usr/local/bin/docker-compose
    7  docker-compose --version
    8  sudo systemctl start docker
    9  sudo systemctl enable docker
   10  sudo systemctl status docker
   11  sudo docker --version
   12  history
[tony@stapp01 ~]$ 
```
<img width="2357" height="1177" alt="image" src="https://github.com/user-attachments/assets/104f3b0e-9496-4428-93f8-6ff0ae5bc21c" />

<img width="1002" height="655" alt="image" src="https://github.com/user-attachments/assets/25b68b34-ebe7-4381-8eb0-6d9eade184cf" />
<img width="871" height="477" alt="image" src="https://github.com/user-attachments/assets/de37220b-08c5-4142-971d-1a6e52fa3dbc" />
<img width="796" height="505" alt="image" src="https://github.com/user-attachments/assets/cf87273b-b9a5-4a51-b5e2-3adcfdd4eb7d" />

