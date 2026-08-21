# Copy File to Docker Container

The Nautilus DevOps team possesses confidential data on App Server 2 in the Stratos Datacenter. A container named ubuntu_latest is running on the same server.

Copy an encrypted file /tmp/nautilus.txt.gpg from the docker host to the ubuntu_latest container located at /tmp/. Ensure the file is not modified during this operation.

<img width="843" height="437" alt="image" src="https://github.com/user-attachments/assets/973866e0-06bb-4852-8cc4-5d7f149ae759" />

---

```sh
thor@jump-host ~$ ssh steve@stapp02
The authenticity of host 'stapp02 (10.244.97.152)' can't be established.
ED25519 key fingerprint is SHA256:9xe6h2v5VNo5CrlTE7IUU3dL+oqx+iREQGTfEJQ0XZw.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp02' (ED25519) to the list of known hosts.
steve@stapp02's password: 
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$ docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED              STATUS              PORTS     NAMES
8939a6e31f08   ubuntu    "/bin/bash"   About a minute ago   Up About a minute             ubuntu_latest
[steve@stapp02 ~]$ docker describe 8939a6e31f08
docker: 'describe' is not a docker command.
See 'docker --help'
[steve@stapp02 ~]$ docker inspect 8939a6e31f08
[
    {
        "Id": "8939a6e31f08fd7453ea22ebee0aa7d41b8cbbb9a2983720eb54d9b62f01facb",
        "Created": "2026-08-21T08:28:18.402350658Z",
        "Path": "/bin/bash",
        "Args": [],
        "State": {
            "Status": "running",
            "Running": true,
            "Paused": false,
            "Restarting": false,
            "OOMKilled": false,
            "Dead": false,
            "Pid": 8039,
            "ExitCode": 0,
            "Error": "",
            "StartedAt": "2026-08-21T08:28:18.851376312Z",
            "FinishedAt": "0001-01-01T00:00:00Z"
        },
        "Image": "sha256:af52039db3f8df8b54cd80945bdabea797445f414955027fa0bed9cd3908244b",
        "ResolvConfPath": "/var/lib/docker/containers/8939a6e31f08fd7453ea22ebee0aa7d41b8cbbb9a2983720eb54d9b62f01facb/resolv.conf",
        "HostnamePath": "/var/lib/docker/containers/8939a6e31f08fd7453ea22ebee0aa7d41b8cbbb9a2983720eb54d9b62f01facb/hostname",
        "HostsPath": "/var/lib/docker/containers/8939a6e31f08fd7453ea22ebee0aa7d41b8cbbb9a2983720eb54d9b62f01facb/hosts",
        "LogPath": "/var/lib/docker/containers/8939a6e31f08fd7453ea22ebee0aa7d41b8cbbb9a2983720eb54d9b62f01facb/8939a6e31f08fd7453ea22ebee0aa7d41b8cbbb9a2983720eb54d9b62f01facb-json.log",
        "Name": "/ubuntu_latest",
        "RestartCount": 0,
        "Driver": "overlay2",
        "Platform": "linux",
        "MountLabel": "",
        "ProcessLabel": "",
        "AppArmorProfile": "",
        "ExecIDs": null,
        "HostConfig": {
            "Binds": null,
            "ContainerIDFile": "",
            "LogConfig": {
                "Type": "json-file",
                "Config": {}
            },
            "NetworkMode": "bridge",
            "PortBindings": {},
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
                "LowerDir": "/var/lib/docker/overlay2/78be3fc267f41c4bfa022493450ef48bc6d30bc54ef95a2de345e42758e641b5-init/diff:/var/lib/docker/overlay2/24edbc4d3d1e0239f884a1ddc58e8859816520d33d2389de02b095d6c73b45ca/diff:/var/lib/docker/overlay2/6d769ed9f99e07cde6a2f48347e12411331194114a935dfa65da02d0c0c6ee84/diff",
                "MergedDir": "/var/lib/docker/overlay2/78be3fc267f41c4bfa022493450ef48bc6d30bc54ef95a2de345e42758e641b5/merged",
                "UpperDir": "/var/lib/docker/overlay2/78be3fc267f41c4bfa022493450ef48bc6d30bc54ef95a2de345e42758e641b5/diff",
                "WorkDir": "/var/lib/docker/overlay2/78be3fc267f41c4bfa022493450ef48bc6d30bc54ef95a2de345e42758e641b5/work"
            },
            "Name": "overlay2"
        },
        "Mounts": [],
        "Config": {
            "Hostname": "8939a6e31f08",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": true,
            "OpenStdin": true,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "/bin/bash"
            ],
            "Image": "ubuntu",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": {
                "org.opencontainers.image.created": "2026-08-17T09:02:45.677319+00:00",
                "org.opencontainers.image.description": "The Ubuntu container image maintained by Canonical\n\nUbuntu is a Debian-based Linux operating system that runs from the desktop to the cloud, to all your internet connected things.\nIt is the world's most popular operating system across public clouds and OpenStack clouds.\nIt is the number one platform for containers; from Docker to Kubernetes to LXD, Ubuntu can run your containers at scale.\nFast, secure and simple, Ubuntu powers millions of PCs worldwide.\n",
                "org.opencontainers.image.title": "ubuntu",
                "org.opencontainers.image.version": "26.04"
            }
        },
        "NetworkSettings": {
            "Bridge": "",
            "SandboxID": "6e738dde7b7077d5f016178f3395e49e5773ff46c0f97a004b3afa2e2301d529",
            "SandboxKey": "/var/run/docker/netns/6e738dde7b70",
            "Ports": {},
            "HairpinMode": false,
            "LinkLocalIPv6Address": "",
            "LinkLocalIPv6PrefixLen": 0,
            "SecondaryIPAddresses": null,
            "SecondaryIPv6Addresses": null,
            "EndpointID": "a765f8907dd6c830695523120ae76e945967b23e3308e39818b88bf055e478a5",
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
                    "NetworkID": "0b2fbe11a49993ea17655fd1c5cdabf5b56c86c0162454f19e1c88f5775a0744",
                    "EndpointID": "a765f8907dd6c830695523120ae76e945967b23e3308e39818b88bf055e478a5",
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
[steve@stapp02 ~]$

```


```sh
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$ docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED         STATUS         PORTS     NAMES
8939a6e31f08   ubuntu    "/bin/bash"   9 minutes ago   Up 9 minutes             ubuntu_latest
[steve@stapp02 ~]$ docker cp /tmp/nautilus.txt.gpg ubuntu_latest:/tmp/
Successfully copied 2.05kB to ubuntu_latest:/tmp/
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$ docker exec -it ubuntu_latest ls -l /tmp/
total 4
-rw-r--r-- 1 root root 105 Aug 21 08:28 nautilus.txt.gpg
[steve@stapp02 ~]$ history
    1  docker ps
    2  docker describe 8939a6e31f08
    3  docker inspect 8939a6e31f08
    4  docker ps
    5  docker cp /tmp/nautilus.txt.gpg ubuntu_latest:/tmp/
    6  docker exec -it ubuntu_latest ls -l /tmp/
    7  history
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$
```


<img width="2256" height="842" alt="image" src="https://github.com/user-attachments/assets/2e99204d-55ff-4c69-8d35-56d0c34d3f39" />

<img width="2227" height="1165" alt="image" src="https://github.com/user-attachments/assets/0643d5bb-4c07-49fa-ae2d-e661c387ecc1" />

<img width="2017" height="1177" alt="image" src="https://github.com/user-attachments/assets/8b10b115-b5df-469d-bd77-c9859a14011b" />



















