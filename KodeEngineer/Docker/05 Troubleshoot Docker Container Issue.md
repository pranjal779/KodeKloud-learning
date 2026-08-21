# Troubleshoot Docker Container Issue

<img width="800" height="482" alt="image" src="https://github.com/user-attachments/assets/4f31ac92-fdf2-4131-8508-b97589d34f8f" />


An issue has arisen with a static website running in a container named nautilus on App Server 1. To resolve the issue, investigate the following details:

Check if the container's volume /usr/local/apache2/htdocs is correctly mapped with the host's volume /var/www/html.

Verify that the website is accessible on host port 8085 on App Server 1. Confirm that the command curl http://localhost:8085/ works on App Server 1.

---

```sh


thor@jump-host ~$ ssh tony@stapp01
The authenticity of host 'stapp01 (10.244.190.34)' can't be established.
ED25519 key fingerprint is SHA256:XlJwfZyiPTyq7Ri+WYz/C58AQ+IawwTVQ6g+Qat4CKA.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp01' (ED25519) to the list of known hosts.
tony@stapp01's password: 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
[tony@stapp01 ~]$ doscker ps -a
-bash: doscker: command not found
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ docker ps -a
CONTAINER ID   IMAGE     COMMAND              CREATED         STATUS                     PORTS     NAMES
144c640215cf   httpd     "httpd-foreground"   5 minutes ago   Exited (0) 5 minutes ago             nautilus
[tony@stapp01 ~]$ docker start nautilus
nautilus
[tony@stapp01 ~]$ docker ps -a
CONTAINER ID   IMAGE     COMMAND              CREATED         STATUS         PORTS                                   NAMES
144c640215cf   httpd     "httpd-foreground"   5 minutes ago   Up 6 seconds   0.0.0.0:8085->80/tcp, :::8085->80/tcp   nautilus
[tony@stapp01 ~]$ docker inspect nautilus
[
    {
        "Id": "144c640215cf7604e5a6e759995dffad3af2cc4511b36465845eacb7e7b59399",
        "Created": "2026-08-21T08:43:11.540684416Z",
        "Path": "httpd-foreground",
        "Args": [],
        "State": {
            "Status": "running",
            "Running": true,
            "Paused": false,
            "Restarting": false,
            "OOMKilled": false,
            "Dead": false,
            "Pid": 14061,
            "ExitCode": 0,
            "Error": "",
            "StartedAt": "2026-08-21T08:48:57.273047779Z",
            "FinishedAt": "2026-08-21T08:43:13.217222814Z"
        },
        "Image": "sha256:46ababc59dbd026ab02d09961f28873185d8331b0939954aa24f57b55fca7244",
        "ResolvConfPath": "/var/lib/docker/containers/144c640215cf7604e5a6e759995dffad3af2cc4511b36465845eacb7e7b59399/resolv.conf",
        "HostnamePath": "/var/lib/docker/containers/144c640215cf7604e5a6e759995dffad3af2cc4511b36465845eacb7e7b59399/hostname",
        "HostsPath": "/var/lib/docker/containers/144c640215cf7604e5a6e759995dffad3af2cc4511b36465845eacb7e7b59399/hosts",
        "LogPath": "/var/lib/docker/containers/144c640215cf7604e5a6e759995dffad3af2cc4511b36465845eacb7e7b59399/144c640215cf7604e5a6e759995dffad3af2cc4511b36465845eacb7e7b59399-json.log",
        "Name": "/nautilus",
        "RestartCount": 0,
        "Driver": "overlay2",
        "Platform": "linux",
        "MountLabel": "",
        "ProcessLabel": "",
        "AppArmorProfile": "",
        "ExecIDs": null,
        "HostConfig": {
            "Binds": [
                "/var/www/html:/usr/local/apache2/htdocs/"
            ],
            "ContainerIDFile": "",
            "LogConfig": {
                "Type": "json-file",
                "Config": {}
            },
            "NetworkMode": "bridge",
            "PortBindings": {
                "80/tcp": [
                    {
                        "HostIp": "",
                        "HostPort": "8085"
                    }
                ]
            },
            "RestartPolicy": {
                "Name": "no",
                "MaximumRetryCount": 0
            },
            "AutoRemove": false,
            "VolumeDriver": "",
            "VolumesFrom": null,
            "ConsoleSize": [
                0,
                0
            ],
            "CapAdd": null,
            "CapDrop": null,
            "CgroupnsMode": "private",
            "Dns": [],
            "DnsOptions": [],
            "DnsSearch": [],
            "ExtraHosts": null,
            "GroupAdd": null,
            "IpcMode": "private",
            "Cgroup": "",
            "Links": null,
            "OomScoreAdj": 0,
            "PidMode": "",
            "Privileged": false,
            "PublishAllPorts": false,
            "ReadonlyRootfs": false,
            "SecurityOpt": null,
            "UTSMode": "",
            "UsernsMode": "",
            "ShmSize": 67108864,
            "Runtime": "runc",
            "Isolation": "",
            "CpuShares": 0,
            "Memory": 0,
            "NanoCpus": 0,
            "CgroupParent": "",
            "BlkioWeight": 0,
            "BlkioWeightDevice": [],
            "BlkioDeviceReadBps": [],
            "BlkioDeviceWriteBps": [],
            "BlkioDeviceReadIOps": [],
            "BlkioDeviceWriteIOps": [],
            "CpuPeriod": 0,
            "CpuQuota": 0,
            "CpuRealtimePeriod": 0,
            "CpuRealtimeRuntime": 0,
            "CpusetCpus": "",
            "CpusetMems": "",
            "Devices": [],
            "DeviceCgroupRules": null,
            "DeviceRequests": null,
            "MemoryReservation": 0,
            "MemorySwap": 0,
            "MemorySwappiness": null,
            "OomKillDisable": null,
            "PidsLimit": null,
            "Ulimits": [],
            "CpuCount": 0,
            "CpuPercent": 0,
            "IOMaximumIOps": 0,
            "IOMaximumBandwidth": 0,
            "MaskedPaths": [
                "/proc/asound",
                "/proc/acpi",
                "/proc/kcore",
                "/proc/keys",
                "/proc/latency_stats",
                "/proc/timer_list",
                "/proc/timer_stats",
                "/proc/sched_debug",
                "/proc/scsi",
                "/sys/firmware",
                "/sys/devices/virtual/powercap"
            ],
            "ReadonlyPaths": [
                "/proc/bus",
                "/proc/fs",
                "/proc/irq",
                "/proc/sys",
                "/proc/sysrq-trigger"
            ]
        },
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/lib/docker/overlay2/a20be80d64783dbded83c3d9f4593d1b85f3b5950d79ee6afafbd9c2f3a682a5-init/diff:/var/lib/docker/overlay2/381353849d73a3a1b238150eb70a0819115bef0b4697e8833fdbc62ee4160187/diff:/var/lib/docker/overlay2/1cd0d843d260ab0719544d86c3363fe59b4928a3b58435eb14197d4f583ba55c/diff:/var/lib/docker/overlay2/729970e0bc77097bc15471e3af9ccbcee59d6a5eba277fc9d9fdb0d7b989170f/diff:/var/lib/docker/overlay2/e523e6fd1b2740f11ac652bc881ac975024252e14678eb9044952859eb980936/diff:/var/lib/docker/overlay2/0183e1d839fe99a094d4d9354473b64bfc55e95ad74f5bd855583bbf66c044a9/diff:/var/lib/docker/overlay2/c40c73480552179d3c52e53f0cdaa2a0149313c89877af5d499d3da659e26131/diff",
                "MergedDir": "/var/lib/docker/overlay2/a20be80d64783dbded83c3d9f4593d1b85f3b5950d79ee6afafbd9c2f3a682a5/merged",
                "UpperDir": "/var/lib/docker/overlay2/a20be80d64783dbded83c3d9f4593d1b85f3b5950d79ee6afafbd9c2f3a682a5/diff",
                "WorkDir": "/var/lib/docker/overlay2/a20be80d64783dbded83c3d9f4593d1b85f3b5950d79ee6afafbd9c2f3a682a5/work"
            },
            "Name": "overlay2"
        },
        "Mounts": [
            {
                "Type": "bind",
                "Source": "/var/www/html",
                "Destination": "/usr/local/apache2/htdocs",
                "Mode": "",
                "RW": true,
                "Propagation": "rprivate"
            }
        ],
        "Config": {
            "Hostname": "144c640215cf",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "ExposedPorts": {
                "80/tcp": {}
            },
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/apache2/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                "HTTPD_PREFIX=/usr/local/apache2",
                "HTTPD_VERSION=2.4.68",
                "HTTPD_SHA256=68c74d4df38c26bed4dfbdb8f3baf1eb532f3872357becc1bba5d136f6b63c06",
                "HTTPD_PATCHES="
            ],
            "Cmd": [
                "httpd-foreground"
            ],
            "Image": "httpd",
            "Volumes": null,
            "WorkingDir": "/usr/local/apache2",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": {},
            "StopSignal": "SIGWINCH"
        },
        "NetworkSettings": {
            "Bridge": "",
            "SandboxID": "4ceefeff01cddd43c1fc1bbecab3efd93f01d2f96475caf5466a06c53e12318a",
            "SandboxKey": "/var/run/docker/netns/4ceefeff01cd",
            "Ports": {
                "80/tcp": [
                    {
                        "HostIp": "0.0.0.0",
                        "HostPort": "8085"
                    },
                    {
                        "HostIp": "::",
                        "HostPort": "8085"
                    }
                ]
            },
            "HairpinMode": false,
            "LinkLocalIPv6Address": "",
            "LinkLocalIPv6PrefixLen": 0,
            "SecondaryIPAddresses": null,
            "SecondaryIPv6Addresses": null,
            "EndpointID": "9df2e1417056b19251631984186dc07e1d32299f24a7dc3986378e07c2430e53",
            "Gateway": "172.12.0.1",
            "GlobalIPv6Address": "",
            "GlobalIPv6PrefixLen": 0,
            "IPAddress": "172.12.0.2",
            "IPPrefixLen": 24,
            "IPv6Gateway": "",
            "MacAddress": "02:42:ac:0c:00:02",
            "Networks": {
                "bridge": {
                    "IPAMConfig": null,
                    "Links": null,
                    "Aliases": null,
                    "MacAddress": "02:42:ac:0c:00:02",
                    "NetworkID": "2a647abcbbce42c3705ffb44d50259b6973c4b5457eb75aa6dbcf5ede1a31b34",
                    "EndpointID": "9df2e1417056b19251631984186dc07e1d32299f24a7dc3986378e07c2430e53",
                    "Gateway": "172.12.0.1",
                    "IPAddress": "172.12.0.2",
                    "IPPrefixLen": 24,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "DriverOpts": null,
                    "DNSNames": null
                }
            }
        }
    }
]
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$


```




```sh
tony@stapp01 ~]$ 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ docker ps
CONTAINER ID   IMAGE     COMMAND              CREATED         STATUS         PORTS                                   NAMES
144c640215cf   httpd     "httpd-foreground"   8 minutes ago   Up 2 minutes   0.0.0.0:8085->80/tcp, :::8085->80/tcp   nautilus
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ curl http://localhost:8085/
Welcome to xFusionCorp Industries![tony@stapp01 ~]$ 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ hisory
-bash: hisory: command not found
[tony@stapp01 ~]$ history
    1  docker ps
    2  doscker ps -a
    3  docker ps -a
    4  docker start nautilus
    5  docker ps -a
    6  docker inspect nautilus
    7  docker ps
    8  curl http://localhost:8085/
    9  hisory
   10  history
[tony@stapp01 ~]$

```

<img width="2413" height="1188" alt="image" src="https://github.com/user-attachments/assets/cb0f1e55-a49a-44b0-96c6-50938bad2fc6" />
<img width="2430" height="1200" alt="image" src="https://github.com/user-attachments/assets/120bf741-f370-4ef8-91fc-4e34449473f6" />




