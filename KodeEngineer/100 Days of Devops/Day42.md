# Day 42: Create a Docker Network

The Nautilus DevOps team needs to set up several docker environments for different applications. 
One of the team members has been assigned a ticket where he has been asked to create some docker networks to be used later. 
Complete the task based on the following ticket description:

a. Create a docker network named as blog on App Server 3 in Stratos DC.

b. Configure it to use macvlan drivers.

c. Set it to use subnet 172.28.0.0/24 and iprange 172.28.0.0/24.

<img width="845" height="382" alt="image" src="https://github.com/user-attachments/assets/645d1c6f-c121-4dc5-ae5a-eb50a2ca0e8e" />

```sh
thor@jump-host ~$ ssh banner@stapp03
The authenticity of host 'stapp03 (10.244.30.32)' can't be established.
ED25519 key fingerprint is SHA256:RE1DaL2Y2VwVmYVCkw67Vshns7s0X24xOzXLxn3Ve1Y.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp03' (ED25519) to the list of known hosts.
banner@stapp03's password: 
[banner@stapp03 ~]$ docker network create -d macvlan --bunet=172.28.0.0/24 --iprange=172.28.0.0/24 blog
unknown flag: --bunet
See 'docker network create --help'.
[banner@stapp03 ~]$ docker network create -d macvlan --subnet=172.28.0.0/24 --iprange=172.28.0.0/24 blog
unknown flag: --iprange
See 'docker network create --help'.
[banner@stapp03 ~]$ docker network create -d macvlan --subnet=172.28.0.0/24 --ip-range=172.28.0.0/24 blog
85b3f689d39c3271e4dceb18bd2a4773e3d99b2a0180c6d840b1bdb41c99dcc7
[banner@stapp03 ~]$ docker network ls
NETWORK ID     NAME      DRIVER    SCOPE
85b3f689d39c   blog      macvlan   local
06696ef9f73c   bridge    bridge    local
14ea9480c774   host      host      local
7de16e01bcc7   none      null      local
[banner@stapp03 ~]$

[banner@stapp03 ~]$ docker network inspect blog
[
    {
        "Name": "blog",
        "Id": "85b3f689d39c3271e4dceb18bd2a4773e3d99b2a0180c6d840b1bdb41c99dcc7",
        "Created": "2026-05-17T12:12:15.740353523Z",
        "Scope": "local",
        "Driver": "macvlan",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.28.0.0/24",
                    "IPRange": "172.28.0.0/24"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {},
        "Options": {},
        "Labels": {}
    }
]
[banner@stapp03 ~]$


```

<img width="2032" height="1132" alt="image" src="https://github.com/user-attachments/assets/8899154b-a389-4e49-9311-a81d1aaf5845" />
<img width="2072" height="1167" alt="image" src="https://github.com/user-attachments/assets/45f14cc6-d059-4501-bf19-8add928d63e6" />

