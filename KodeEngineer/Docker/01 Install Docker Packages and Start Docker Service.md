# Install Docker Packages and Start Docker Service

The Nautilus DevOps team aims to containerize various applications following a recent meeting with the application development team. They intend to conduct testing with the following steps:

1. Install docker-ce and docker compose packages on App Server 1.

2. Initiate the docker service.


<img width="782" height="462" alt="image" src="https://github.com/user-attachments/assets/f1b3e0c0-dedb-404c-867b-a2ba8fe841e0" />

```sh
thor@jump-host ~$ ssh tony@stapp01
The authenticity of host 'stapp01 (10.244.240.119)' can't be established.
ED25519 key fingerprint is SHA256:tGvmyQlhWwHr4mlVjd3IiSPBhX1HpYYQO3YSZcjMwyA.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp01' (ED25519) to the list of known hosts.
tony@stapp01's password: 
[tony@stapp01 ~]$ sudo yum install -y yum-utils

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for tony: 
CentOS Stream 9 - BaseOS                                                     24 kB/s |  14 kB     00:00    
CentOS Stream 9 - BaseOS                                                    6.2 MB/s | 9.0 MB     00:01    
CentOS Stream 9 - AppStream                                                  97 kB/s |  14 kB     00:00    
CentOS Stream 9 - AppStream                                                  13 MB/s |  28 MB     00:02    
CentOS Stream 9 - Extras packages                                            34 kB/s |  15 kB     00:00    
CentOS Stream 9 - Extras packages                                            28 kB/s |  22 kB     00:00    
Extra Packages for Enterprise Linux 9 - x86_64                               46 kB/s |  34 kB     00:00    
Extra Packages for Enterprise Linux 9 - x86_64                               23 MB/s |  21 MB     00:00    
Extra Packages for Enterprise Linux 9 openh264 (From Cisco) - x86_64        2.8 kB/s | 993  B     00:00    
Extra Packages for Enterprise Linux 9 - Next - x86_64                       252 kB/s |  38 kB     00:00    
Extra Packages for Enterprise Linux 9 - Next - x86_64                       456 kB/s | 265 kB     00:00    
Package yum-utils-4.3.0-25.el9.noarch is already installed.
Dependencies resolved.
============================================================================================================
 Package                              Architecture       Version                   Repository          Size
============================================================================================================
Upgrading:
 dnf-plugins-core                     noarch             4.3.0-26.el9              baseos              36 k
 python3-dnf-plugins-core             noarch             4.3.0-26.el9              baseos             263 k
 yum-utils                            noarch             4.3.0-26.el9              baseos              39 k

Transaction Summary
============================================================================================================
Upgrade  3 Packages

Total download size: 337 k
Downloading Packages:
(1/3): dnf-plugins-core-4.3.0-26.el9.noarch.rpm                             150 kB/s |  36 kB     00:00    
(2/3): yum-utils-4.3.0-26.el9.noarch.rpm                                    162 kB/s |  39 kB     00:00    
(3/3): python3-dnf-plugins-core-4.3.0-26.el9.noarch.rpm                     856 kB/s | 263 kB     00:00    
------------------------------------------------------------------------------------------------------------
Total                                                                       734 kB/s | 337 kB     00:00     
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                    1/1 
  Upgrading        : python3-dnf-plugins-core-4.3.0-26.el9.noarch                                       1/6 
  Upgrading        : dnf-plugins-core-4.3.0-26.el9.noarch                                               2/6 
  Upgrading        : yum-utils-4.3.0-26.el9.noarch                                                      3/6 
  Cleanup          : yum-utils-4.3.0-25.el9.noarch                                                      4/6 
  Cleanup          : dnf-plugins-core-4.3.0-25.el9.noarch                                               5/6 
  Cleanup          : python3-dnf-plugins-core-4.3.0-25.el9.noarch                                       6/6 
  Running scriptlet: python3-dnf-plugins-core-4.3.0-25.el9.noarch                                       6/6 
  Verifying        : dnf-plugins-core-4.3.0-26.el9.noarch                                               1/6 
  Verifying        : dnf-plugins-core-4.3.0-25.el9.noarch                                               2/6 
  Verifying        : python3-dnf-plugins-core-4.3.0-26.el9.noarch                                       3/6 
  Verifying        : python3-dnf-plugins-core-4.3.0-25.el9.noarch                                       4/6 
  Verifying        : yum-utils-4.3.0-26.el9.noarch                                                      5/6 
  Verifying        : yum-utils-4.3.0-25.el9.noarch                                                      6/6 

Upgraded:
  dnf-plugins-core-4.3.0-26.el9.noarch             python3-dnf-plugins-core-4.3.0-26.el9.noarch            
  yum-utils-4.3.0-26.el9.noarch                   

Complete!
[tony@stapp01 ~]$ sudo yum-config-manager --add-repo https://docker.com
Adding repo from: https://docker.com
[tony@stapp01 ~]$ sudo yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
created by dnf config-manager from https://docker.com                       571 kB/s | 195 kB     00:00    
Errors during downloading metadata for repository 'docker.com':
  - Status code: 404 for https://www.docker.com/repodata/repomd.xml (IP: 23.185.0.4)
Error: Failed to download metadata for repo 'docker.com': Cannot download repomd.xml: Cannot download repodata/repomd.xml: All mirrors were tried
[tony@stapp01 ~]$ sudo apt-get update
sudo: apt-get: command not found
[tony@stapp01 ~]$ sudo get upate
sudo: get: command not found
[tony@stapp01 ~]$ sudo get update
sudo: get: command not found
[tony@stapp01 ~]$ sudo yum update
created by dnf config-manager from https://docker.com                       812 kB/s | 195 kB     00:00    
Errors during downloading metadata for repository 'docker.com':
  - Status code: 404 for https://www.docker.com/repodata/repomd.xml (IP: 23.185.0.4)
Error: Failed to download metadata for repo 'docker.com': Cannot download repomd.xml: Cannot download repodata/repomd.xml: All mirrors were tried
[tony@stapp01 ~]$ sudo yum update -y
created by dnf config-manager from https://docker.com                       948 kB/s | 195 kB     00:00    
Errors during downloading metadata for repository 'docker.com':
  - Status code: 404 for https://www.docker.com/repodata/repomd.xml (IP: 23.185.0.4)
Error: Failed to download metadata for repo 'docker.com': Cannot download repomd.xml: Cannot download repodata/repomd.xml: All mirrors were tried
[tony@stapp01 ~]$ sudo dnf update -y
created by dnf config-manager from https://docker.com                       858 kB/s | 195 kB     00:00    
Errors during downloading metadata for repository 'docker.com':
  - Status code: 404 for https://www.docker.com/repodata/repomd.xml (IP: 23.185.0.4)
Error: Failed to download metadata for repo 'docker.com': Cannot download repomd.xml: Cannot download repodata/repomd.xml: All mirrors were tried
[tony@stapp01 ~]$ sudo dnf install -y yum-utils device-mapper-persistent-data lvm2
created by dnf config-manager from https://docker.com                       835 kB/s | 195 kB     00:00    
Errors during downloading metadata for repository 'docker.com':
  - Status code: 404 for https://www.docker.com/repodata/repomd.xml (IP: 23.185.0.4)
Error: Failed to download metadata for repo 'docker.com': Cannot download repomd.xml: Cannot download repodata/repomd.xml: All mirrors were tried
[tony@stapp01 ~]$ sudo rm -f /etc/yum.repos.d/docker.com.repo
[tony@stapp01 ~]$ sudo dnf clean all
50 files removed
[tony@stapp01 ~]$ sudo dnf config-manager --add-repo https://docker.com
Adding repo from: https://docker.com
[tony@stapp01 ~]$ sudo dnf install -y yum-utils device-mapper-persistent-data lvm2 docker-ce docker-ce-cli containerd.io
CentOS Stream 9 - BaseOS                                                     14 MB/s | 9.0 MB     00:00    
CentOS Stream 9 - AppStream                                                  22 MB/s |  28 MB     00:01    
CentOS Stream 9 - Extras packages                                            34 kB/s |  22 kB     00:00    
created by dnf config-manager from https://docker.com                       810 kB/s | 195 kB     00:00    
Errors during downloading metadata for repository 'docker.com':
  - Status code: 404 for https://www.docker.com/repodata/repomd.xml (IP: 23.185.0.4)
Error: Failed to download metadata for repo 'docker.com': Cannot download repomd.xml: Cannot download repodata/repomd.xml: All mirrors were tried
[tony@stapp01 ~]$ sudo rm -f /etc/yum.repos.d/docker.com.repo
[tony@stapp01 ~]$ sudo dnf clean all
21 files removed
[tony@stapp01 ~]$ sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo 
Adding repo from: https://download.docker.com/linux/centos/docker-ce.repo
[tony@stapp01 ~]$ sudo dnf install -y yum-utils device-mapper-persistent-data lvm2 docker-ce docker-ce-cli containerd.io
CentOS Stream 9 - BaseOS                                                     10 MB/s | 9.0 MB     00:00    
CentOS Stream 9 - AppStream                                                  25 MB/s |  28 MB     00:01    
CentOS Stream 9 - Extras packages                                            60 kB/s |  22 kB     00:00    
Docker CE Stable - x86_64                                                   1.8 MB/s |  84 kB     00:00    
Extra Packages for Enterprise Linux 9 - x86_64                               55 MB/s |  21 MB     00:00    
Extra Packages for Enterprise Linux 9 openh264 (From Cisco) - x86_64        4.4 kB/s | 2.5 kB     00:00    
Extra Packages for Enterprise Linux 9 - Next - x86_64                       1.5 MB/s | 265 kB     00:00    
Package yum-utils-4.3.0-26.el9.noarch is already installed.
Dependencies resolved.
============================================================================================================
 Package                              Architecture  Version                   Repository               Size
============================================================================================================
Installing:
 containerd.io                        x86_64        2.3.3-1.el9               docker-ce-stable         34 M
 device-mapper-persistent-data        x86_64        1.1.0-1.el9               baseos                  1.1 M
 docker-ce                            x86_64        3:29.7.2-1.el9            docker-ce-stable         25 M
 docker-ce-cli                        x86_64        1:29.7.2-1.el9            docker-ce-stable        8.6 M
 lvm2                                 x86_64        9:2.03.33-6.el9           baseos                  1.6 M
Upgrading:
 device-mapper                        x86_64        9:1.02.207-6.el9          baseos                  140 k
 device-mapper-libs                   x86_64        9:1.02.207-6.el9          baseos                  179 k
Installing dependencies:
 container-selinux                    noarch        4:2.245.0-1.el9           appstream                59 k
 device-mapper-event                  x86_64        9:1.02.207-6.el9          baseos                   34 k
 device-mapper-event-libs             x86_64        9:1.02.207-6.el9          baseos                   31 k
 iptables-legacy                      x86_64        1.8.10-11.1.el9           epel                     50 k
 iptables-legacy-libs                 x86_64        1.8.10-11.1.el9           epel                     38 k
 iptables-libs                        x86_64        1.8.10-11.el9             baseos                  462 k
 jansson                              x86_64        2.14-1.el9                baseos                   46 k
 libaio                               x86_64        0.3.112-1.el9             baseos                   22 k
 libmnl                               x86_64        1.0.4-16.el9              baseos                   28 k
 libnetfilter_conntrack               x86_64        1.0.9-1.el9               baseos                   59 k
 libnfnetlink                         x86_64        1.0.1-23.el9              baseos                   29 k
 libnftnl                             x86_64        1.2.6-4.el9               baseos                   88 k
 libnvme                              x86_64        1.16.2-1.el9              baseos                  117 k
 lvm2-libs                            x86_64        9:2.03.33-6.el9           baseos                  1.0 M
 nftables                             x86_64        1:1.0.9-9.el9             baseos                  455 k
 xz                                   x86_64        5.2.5-8.el9               baseos                  226 k
Installing weak dependencies:
 docker-buildx-plugin                 x86_64        0.36.1-1.el9              docker-ce-stable         18 M
 docker-ce-rootless-extras            x86_64        29.7.2-1.el9              docker-ce-stable        5.6 M
 docker-compose-plugin                x86_64        5.5.0-1.el9               docker-ce-stable         12 M

Transaction Summary
============================================================================================================
Install  24 Packages
Upgrade   2 Packages

Total download size: 109 M
Downloading Packages:
(1/26): device-mapper-event-libs-1.02.207-6.el9.x86_64.rpm                  172 kB/s |  31 kB     00:00    
(2/26): device-mapper-event-1.02.207-6.el9.x86_64.rpm                       186 kB/s |  34 kB     00:00    
(3/26): iptables-libs-1.8.10-11.el9.x86_64.rpm                              3.7 MB/s | 462 kB     00:00    
(4/26): jansson-2.14-1.el9.x86_64.rpm                                       309 kB/s |  46 kB     00:00    
(5/26): libaio-0.3.112-1.el9.x86_64.rpm                                     168 kB/s |  22 kB     00:00    
(6/26): device-mapper-persistent-data-1.1.0-1.el9.x86_64.rpm                2.4 MB/s | 1.1 MB     00:00    
(7/26): libmnl-1.0.4-16.el9.x86_64.rpm                                      176 kB/s |  28 kB     00:00    
(8/26): libnetfilter_conntrack-1.0.9-1.el9.x86_64.rpm                       897 kB/s |  59 kB     00:00    
(9/26): libnfnetlink-1.0.1-23.el9.x86_64.rpm                                710 kB/s |  29 kB     00:00    
(10/26): libnftnl-1.2.6-4.el9.x86_64.rpm                                    714 kB/s |  88 kB     00:00    
(11/26): libnvme-1.16.2-1.el9.x86_64.rpm                                    179 kB/s | 117 kB     00:00    
(12/26): lvm2-2.03.33-6.el9.x86_64.rpm                                      1.2 MB/s | 1.6 MB     00:01    
(13/26): lvm2-libs-2.03.33-6.el9.x86_64.rpm                                 656 kB/s | 1.0 MB     00:01    
(14/26): nftables-1.0.9-9.el9.x86_64.rpm                                    393 kB/s | 455 kB     00:01    
(15/26): xz-5.2.5-8.el9.x86_64.rpm                                          403 kB/s | 226 kB     00:00    
(16/26): container-selinux-2.245.0-1.el9.noarch.rpm                         242 kB/s |  59 kB     00:00    
(17/26): docker-buildx-plugin-0.36.1-1.el9.x86_64.rpm                        24 MB/s |  18 MB     00:00    
(18/26): docker-ce-29.7.2-1.el9.x86_64.rpm                                   26 MB/s |  25 MB     00:00    
(19/26): docker-ce-cli-29.7.2-1.el9.x86_64.rpm                               26 MB/s | 8.6 MB     00:00    
(20/26): containerd.io-2.3.3-1.el9.x86_64.rpm                                28 MB/s |  34 MB     00:01    
(21/26): docker-ce-rootless-extras-29.7.2-1.el9.x86_64.rpm                   40 MB/s | 5.6 MB     00:00    
(22/26): iptables-legacy-1.8.10-11.1.el9.x86_64.rpm                         1.5 MB/s |  50 kB     00:00    
(23/26): iptables-legacy-libs-1.8.10-11.1.el9.x86_64.rpm                    1.7 MB/s |  38 kB     00:00    
(24/26): docker-compose-plugin-5.5.0-1.el9.x86_64.rpm                        50 MB/s |  12 MB     00:00    
(25/26): device-mapper-1.02.207-6.el9.x86_64.rpm                            1.1 MB/s | 140 kB     00:00    
(26/26): device-mapper-libs-1.02.207-6.el9.x86_64.rpm                       1.2 MB/s | 179 kB     00:00    
------------------------------------------------------------------------------------------------------------
Total                                                                        24 MB/s | 109 MB     00:04     
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                    1/1 
  Installing       : libmnl-1.0.4-16.el9.x86_64                                                        1/28 
  Upgrading        : device-mapper-libs-9:1.02.207-6.el9.x86_64                                        2/28 
  Upgrading        : device-mapper-9:1.02.207-6.el9.x86_64                                             3/28 
  Installing       : device-mapper-event-libs-9:1.02.207-6.el9.x86_64                                  4/28 
  Installing       : docker-buildx-plugin-0.36.1-1.el9.x86_64                                          5/28 
  Running scriptlet: docker-buildx-plugin-0.36.1-1.el9.x86_64                                          5/28 
  Installing       : docker-compose-plugin-5.5.0-1.el9.x86_64                                          6/28 
  Running scriptlet: docker-compose-plugin-5.5.0-1.el9.x86_64                                          6/28 
  Running scriptlet: container-selinux-4:2.245.0-1.el9.noarch                                          7/28 
  Installing       : container-selinux-4:2.245.0-1.el9.noarch                                          7/28 
  Running scriptlet: container-selinux-4:2.245.0-1.el9.noarch                                          7/28 
  Installing       : libnvme-1.16.2-1.el9.x86_64                                                       8/28 
  Installing       : libaio-0.3.112-1.el9.x86_64                                                       9/28 
  Installing       : containerd.io-2.3.3-1.el9.x86_64                                                 10/28 
  Running scriptlet: containerd.io-2.3.3-1.el9.x86_64                                                 10/28 
  Installing       : docker-ce-cli-1:29.7.2-1.el9.x86_64                                              11/28 
  Running scriptlet: docker-ce-cli-1:29.7.2-1.el9.x86_64                                              11/28 
  Installing       : device-mapper-event-9:1.02.207-6.el9.x86_64                                      12/28 
  Running scriptlet: device-mapper-event-9:1.02.207-6.el9.x86_64                                      12/28 
Created symlink /etc/systemd/system/sockets.target.wants/dm-event.socket → /usr/lib/systemd/system/dm-event.socket.

  Installing       : lvm2-libs-9:2.03.33-6.el9.x86_64                                                 13/28 
  Installing       : libnftnl-1.2.6-4.el9.x86_64                                                      14/28 
  Installing       : iptables-legacy-libs-1.8.10-11.1.el9.x86_64                                      15/28 
  Installing       : xz-5.2.5-8.el9.x86_64                                                            16/28 
  Installing       : libnfnetlink-1.0.1-23.el9.x86_64                                                 17/28 
  Installing       : libnetfilter_conntrack-1.0.9-1.el9.x86_64                                        18/28 
  Installing       : iptables-libs-1.8.10-11.el9.x86_64                                               19/28 
  Installing       : iptables-legacy-1.8.10-11.1.el9.x86_64                                           20/28 
  Running scriptlet: iptables-legacy-1.8.10-11.1.el9.x86_64                                           20/28 
  Installing       : jansson-2.14-1.el9.x86_64                                                        21/28 
  Installing       : nftables-1:1.0.9-9.el9.x86_64                                                    22/28 
  Running scriptlet: nftables-1:1.0.9-9.el9.x86_64                                                    22/28 
  Installing       : docker-ce-rootless-extras-29.7.2-1.el9.x86_64                                    23/28 
  Running scriptlet: docker-ce-rootless-extras-29.7.2-1.el9.x86_64                                    23/28 
  Installing       : docker-ce-3:29.7.2-1.el9.x86_64                                                  24/28 
  Running scriptlet: docker-ce-3:29.7.2-1.el9.x86_64                                                  24/28 
  Installing       : device-mapper-persistent-data-1.1.0-1.el9.x86_64                                 25/28 
  Installing       : lvm2-9:2.03.33-6.el9.x86_64                                                      26/28 
  Running scriptlet: lvm2-9:2.03.33-6.el9.x86_64                                                      26/28 
Created symlink /etc/systemd/system/sysinit.target.wants/lvm2-monitor.service → /usr/lib/systemd/system/lvm2-monitor.service.
Created symlink /etc/systemd/system/sysinit.target.wants/lvm2-lvmpolld.socket → /usr/lib/systemd/system/lvm2-lvmpolld.socket.

  Cleanup          : device-mapper-9:1.02.206-2.el9.x86_64                                            27/28 
  Cleanup          : device-mapper-libs-9:1.02.206-2.el9.x86_64                                       28/28 
  Running scriptlet: container-selinux-4:2.245.0-1.el9.noarch                                         28/28 
  Running scriptlet: device-mapper-libs-9:1.02.206-2.el9.x86_64                                       28/28 
  Verifying        : device-mapper-event-9:1.02.207-6.el9.x86_64                                       1/28 
  Verifying        : device-mapper-event-libs-9:1.02.207-6.el9.x86_64                                  2/28 
  Verifying        : device-mapper-persistent-data-1.1.0-1.el9.x86_64                                  3/28 
  Verifying        : iptables-libs-1.8.10-11.el9.x86_64                                                4/28 
  Verifying        : jansson-2.14-1.el9.x86_64                                                         5/28 
  Verifying        : libaio-0.3.112-1.el9.x86_64                                                       6/28 
  Verifying        : libmnl-1.0.4-16.el9.x86_64                                                        7/28 
  Verifying        : libnetfilter_conntrack-1.0.9-1.el9.x86_64                                         8/28 
  Verifying        : libnfnetlink-1.0.1-23.el9.x86_64                                                  9/28 
  Verifying        : libnftnl-1.2.6-4.el9.x86_64                                                      10/28 
  Verifying        : libnvme-1.16.2-1.el9.x86_64                                                      11/28 
  Verifying        : lvm2-9:2.03.33-6.el9.x86_64                                                      12/28 
  Verifying        : lvm2-libs-9:2.03.33-6.el9.x86_64                                                 13/28 
  Verifying        : nftables-1:1.0.9-9.el9.x86_64                                                    14/28 
  Verifying        : xz-5.2.5-8.el9.x86_64                                                            15/28 
  Verifying        : container-selinux-4:2.245.0-1.el9.noarch                                         16/28 
  Verifying        : containerd.io-2.3.3-1.el9.x86_64                                                 17/28 
  Verifying        : docker-buildx-plugin-0.36.1-1.el9.x86_64                                         18/28 
  Verifying        : docker-ce-3:29.7.2-1.el9.x86_64                                                  19/28 
  Verifying        : docker-ce-cli-1:29.7.2-1.el9.x86_64                                              20/28 
  Verifying        : docker-ce-rootless-extras-29.7.2-1.el9.x86_64                                    21/28 
  Verifying        : docker-compose-plugin-5.5.0-1.el9.x86_64                                         22/28 
  Verifying        : iptables-legacy-1.8.10-11.1.el9.x86_64                                           23/28 
  Verifying        : iptables-legacy-libs-1.8.10-11.1.el9.x86_64                                      24/28 
  Verifying        : device-mapper-9:1.02.207-6.el9.x86_64                                            25/28 
  Verifying        : device-mapper-9:1.02.206-2.el9.x86_64                                            26/28 
  Verifying        : device-mapper-libs-9:1.02.207-6.el9.x86_64                                       27/28 
  Verifying        : device-mapper-libs-9:1.02.206-2.el9.x86_64                                       28/28 

Upgraded:
  device-mapper-9:1.02.207-6.el9.x86_64              device-mapper-libs-9:1.02.207-6.el9.x86_64             
Installed:
  container-selinux-4:2.245.0-1.el9.noarch             containerd.io-2.3.3-1.el9.x86_64                    
  device-mapper-event-9:1.02.207-6.el9.x86_64          device-mapper-event-libs-9:1.02.207-6.el9.x86_64    
  device-mapper-persistent-data-1.1.0-1.el9.x86_64     docker-buildx-plugin-0.36.1-1.el9.x86_64            
  docker-ce-3:29.7.2-1.el9.x86_64                      docker-ce-cli-1:29.7.2-1.el9.x86_64                 
  docker-ce-rootless-extras-29.7.2-1.el9.x86_64        docker-compose-plugin-5.5.0-1.el9.x86_64            
  iptables-legacy-1.8.10-11.1.el9.x86_64               iptables-legacy-libs-1.8.10-11.1.el9.x86_64         
  iptables-libs-1.8.10-11.el9.x86_64                   jansson-2.14-1.el9.x86_64                           
  libaio-0.3.112-1.el9.x86_64                          libmnl-1.0.4-16.el9.x86_64                          
  libnetfilter_conntrack-1.0.9-1.el9.x86_64            libnfnetlink-1.0.1-23.el9.x86_64                    
  libnftnl-1.2.6-4.el9.x86_64                          libnvme-1.16.2-1.el9.x86_64                         
  lvm2-9:2.03.33-6.el9.x86_64                          lvm2-libs-9:2.03.33-6.el9.x86_64                    
  nftables-1:1.0.9-9.el9.x86_64                        xz-5.2.5-8.el9.x86_64                               

Complete!
[tony@stapp01 ~]$ sudo systemctl enable --now dockerCreated symlink /etc/systemd/system/multi-user.target.wants/docker.service → /usr/lib/systemd/system/docker.service.
[tony@stapp01 ~]$ sudo docker run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
4f55086f7dd0: Pull complete 
Digest: sha256:5dd0d3e6e255913fc30f90b9f2b1d359cc2cbdb48090cc4b65f1676e203243cc
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/

[tony@stapp01 ~]$ history    1  sudo yum install -y yum-utils
    2  sudo yum-config-manager --add-repo https://docker.com
    3  sudo yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
    4  sudo apt-get update
    5  sudo get upate
    6  sudo get update
    7  sudo yum update
    8  sudo yum update -y
    9  sudo dnf update -y
   10  sudo dnf install -y yum-utils device-mapper-persistent-data lvm2
   11  sudo rm -f /etc/yum.repos.d/docker.com.repo
   12  sudo dnf clean all
   13  sudo dnf config-manager --add-repo https://docker.com
   14  sudo dnf install -y yum-utils device-mapper-persistent-data lvm2 docker-ce docker-ce-cli containerd.io
   15  sudo rm -f /etc/yum.repos.d/docker.com.repo
   16  sudo dnf clean all
   17  sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
   18  sudo dnf install -y yum-utils device-mapper-persistent-data lvm2 docker-ce docker-ce-cli containerd.io
   19  sudo systemctl enable --now docker
   20  sudo docker run hello-world
   21  history
[tony@stapp01 ~]$ sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
Last metadata expiration check: 0:03:19 ago on Tue Aug 18 14:36:25 2026.
Package docker-ce-3:29.7.2-1.el9.x86_64 is already installed.
Package docker-ce-cli-1:29.7.2-1.el9.x86_64 is already installed.
Package containerd.io-2.3.3-1.el9.x86_64 is already installed.
Package docker-buildx-plugin-0.36.1-1.el9.x86_64 is already installed.
Package docker-compose-plugin-5.5.0-1.el9.x86_64 is already installed.
Dependencies resolved.
Nothing to do.
Complete!
[tony@stapp01 ~]$ sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
Adding repo from: https://download.docker.com/linux/rhel/docker-ce.repo
[tony@stapp01 ~]$ sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
Docker CE Stable - x86_64                                                   1.2 MB/s |  59 kB     00:00    
Package docker-ce-3:29.7.2-1.el9.x86_64 is already installed.
Package docker-ce-cli-1:29.7.2-1.el9.x86_64 is already installed.
Package containerd.io-2.3.3-1.el9.x86_64 is already installed.
Package docker-buildx-plugin-0.36.1-1.el9.x86_64 is already installed.
Package docker-compose-plugin-5.5.0-1.el9.x86_64 is already installed.
Dependencies resolved.
Nothing to do.
Complete!
[tony@stapp01 ~]$ sudo systemctl enable --now docker
[tony@stapp01 ~]$ sudo systemctl status docker
● docker.service - Docker Application Container Engine
     Loaded: loaded (/usr/lib/systemd/system/docker.service; enabled; preset: disabled)
     Active: active (running) since Tue 2026-08-18 14:36:39 UTC; 4min 36s ago
TriggeredBy: ● docker.socket
       Docs: https://docs.docker.com
   Main PID: 35735 (dockerd)
      Tasks: 17
     Memory: 28.0M (peak: 33.9M)
        CPU: 490ms
     CGroup: /system.slice/docker.service
             └─35735 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock

Aug 18 14:36:39 stapp01 dockerd[35735]: time="2026-08-18T14:36:39.280417998Z" level=info msg="Loading conta>
Aug 18 14:36:39 stapp01 dockerd[35735]: time="2026-08-18T14:36:39.286966308Z" level=info msg="Docker daemon>
Aug 18 14:36:39 stapp01 dockerd[35735]: time="2026-08-18T14:36:39.287082087Z" level=info msg="Initializing >
Aug 18 14:36:39 stapp01 dockerd[35735]: time="2026-08-18T14:36:39.287267764Z" level=warning msg="failed che>
Aug 18 14:36:39 stapp01 dockerd[35735]: time="2026-08-18T14:36:39.446366152Z" level=info msg="Completed bui>
Aug 18 14:36:39 stapp01 dockerd[35735]: time="2026-08-18T14:36:39.449891329Z" level=info msg="Daemon has co>
Aug 18 14:36:39 stapp01 dockerd[35735]: time="2026-08-18T14:36:39.449927068Z" level=info msg="API listen on>
Aug 18 14:36:39 stapp01 systemd[1]: Started Docker Application Container Engine.
Aug 18 14:36:48 stapp01 dockerd[35735]: time="2026-08-18T14:36:48.603449007Z" level=info msg="sbJoin: gwep4>
Aug 18 14:36:48 stapp01 dockerd[35735]: time="2026-08-18T14:36:48.669213513Z" level=info msg="received task>
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$



[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ sudo systemctl start docker
sudo systemctl enable docker
[tony@stapp01 ~]$ sudo systemctl status docker
● docker.service - Docker Application Container Engine
     Loaded: loaded (/usr/lib/systemd/system/docker.service; enabled; preset: disabled)
     Active: active (running) since Tue 2026-08-18 14:36:39 UTC; 6min ago
TriggeredBy: ● docker.socket
       Docs: https://docs.docker.com
   Main PID: 35735 (dockerd)
      Tasks: 17
     Memory: 28.0M (peak: 33.9M)
        CPU: 497ms
     CGroup: /system.slice/docker.service
             └─35735 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock

Aug 18 14:36:39 stapp01 dockerd[35735]: time="2026-08-18T14:36:39.280417998Z" level=info msg="Loading conta>
Aug 18 14:36:39 stapp01 dockerd[35735]: time="2026-08-18T14:36:39.286966308Z" level=info msg="Docker daemon>
Aug 18 14:36:39 stapp01 dockerd[35735]: time="2026-08-18T14:36:39.287082087Z" level=info msg="Initializing >
Aug 18 14:36:39 stapp01 dockerd[35735]: time="2026-08-18T14:36:39.287267764Z" level=warning msg="failed che>
Aug 18 14:36:39 stapp01 dockerd[35735]: time="2026-08-18T14:36:39.446366152Z" level=info msg="Completed bui>
Aug 18 14:36:39 stapp01 dockerd[35735]: time="2026-08-18T14:36:39.449891329Z" level=info msg="Daemon has co>
Aug 18 14:36:39 stapp01 dockerd[35735]: time="2026-08-18T14:36:39.449927068Z" level=info msg="API listen on>
Aug 18 14:36:39 stapp01 systemd[1]: Started Docker Application Container Engine.
Aug 18 14:36:48 stapp01 dockerd[35735]: time="2026-08-18T14:36:48.603449007Z" level=info msg="sbJoin: gwep4>
Aug 18 14:36:48 stapp01 dockerd[35735]: time="2026-08-18T14:36:48.669213513Z" level=info msg="received task>
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$


[tony@stapp01 ~]$ history
    1  sudo yum install -y yum-utils
    2  sudo yum-config-manager --add-repo https://docker.com
    3  sudo yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
    4  sudo apt-get update
    5  sudo get upate
    6  sudo get update
    7  sudo yum update
    8  sudo yum update -y
    9  sudo dnf update -y
   10  sudo dnf install -y yum-utils device-mapper-persistent-data lvm2
   11  sudo rm -f /etc/yum.repos.d/docker.com.repo
   12  sudo dnf clean all
   13  sudo dnf config-manager --add-repo https://docker.com
   14  sudo dnf install -y yum-utils device-mapper-persistent-data lvm2 docker-ce docker-ce-cli containerd.io
   15  sudo rm -f /etc/yum.repos.d/docker.com.repo
   16  sudo dnf clean all
   17  sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
   18  sudo dnf install -y yum-utils device-mapper-persistent-data lvm2 docker-ce docker-ce-cli containerd.io
   19  sudo systemctl enable --now docker
   20  sudo docker run hello-world
   21  history
   22  sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
   23  sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
   24  sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
   25  sudo systemctl enable --now docker
   26  sudo systemctl status docker
   27  sudo systemctl start docker
   28  sudo systemctl enable docker
   29  sudo systemctl status docker
   30  history
[tony@stapp01 ~]$ 


```



<img width="1756" height="1172" alt="image" src="https://github.com/user-attachments/assets/d089bf1a-34ed-4544-a4cd-4e13d9edd11f" />
