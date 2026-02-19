
<img width="1371" height="772" alt="image" src="https://github.com/user-attachments/assets/a38def7b-98f0-4245-8e82-92882e4c0347" />

Following a security audit, the xFusionCorp Industries security team has opted to enhance application and server security with SELinux. 
To initiate testing, the following requirements have been established for App server 1 in the Stratos Datacenter:


Install the required SELinux packages.

Permanently disable SELinux for the time being; it will be re-enabled after necessary configuration changes.

No need to reboot the server, as a scheduled maintenance reboot is already planned for tonight.

Disregard the current status of SELinux via the command line; the final status after the reboot should be disabled.

<img width="967" height="796" alt="image" src="https://github.com/user-attachments/assets/0f0a2361-45d5-45ea-884f-d4266b59ae42" />

### [Solution](https://medium.com/@janemils/kodekloud-engineer-day-5-selinux-installation-and-configuration-8f4b423b3837)

```sh
thor@jumphost ~$ ssh natasha@172.16.238.15
ssh: connect to host 172.16.238.15 port 22: No route to host
thor@jumphost ~$ ssh peter@172.16.239.10
ssh: connect to host 172.16.239.10 port 22: No route to host
thor@jumphost ~$ ssh tony@172.16.238.10
The authenticity of host '172.16.238.10 (172.16.238.10)' can't be established.
ED25519 key fingerprint is SHA256:6lY8ZDj7YOxFY4F4H6qMG2yqGFo6iK/pOmdVB5UJWzQ.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '172.16.238.10' (ED25519) to the list of known hosts.
tony@172.16.238.10's password: 
[tony@stapp01 ~]$ ls
[tony@stapp01 ~]$ ls -ltr
total 0
[tony@stapp01 ~]$ cat /etc/os-release 
NAME="CentOS Stream"
VERSION="9"
ID="centos"
ID_LIKE="rhel fedora"
VERSION_ID="9"
PLATFORM_ID="platform:el9"
PRETTY_NAME="CentOS Stream 9"
ANSI_COLOR="0;31"
LOGO="fedora-logo-icon"
CPE_NAME="cpe:/o:centos:centos:9"
HOME_URL="https://centos.org/"
BUG_REPORT_URL="https://issues.redhat.com/"
REDHAT_SUPPORT_PRODUCT="Red Hat Enterprise Linux 9"
REDHAT_SUPPORT_PRODUCT_VERSION="CentOS Stream"
[tony@stapp01 ~]$

````
<img width="938" height="855" alt="image" src="https://github.com/user-attachments/assets/23d496a9-d849-4ed7-a965-0c7663d97526" />

<img width="987" height="841" alt="image" src="https://github.com/user-attachments/assets/7f4988e2-7ea1-4542-ba85-42075050358f" />

<img width="1041" height="742" alt="image" src="https://github.com/user-attachments/assets/46b147ea-d43c-4fb6-a1e4-25d223d97a88" />




```txt
# This file controls the state of SELinux on the system.
# SELINUX= can take one of these three values:
#     enforcing - SELinux security policy is enforced.
#     permissive - SELinux prints warnings instead of enforcing.
#     disabled - No SELinux policy is loaded.
# See also:
# https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/using_selinux/changing-selinux-states-and-modes_using-selinux#changing-selinux-modes-at-boot-time_changing-selinux-states-and-modes
#
# NOTE: Up to RHEL 8 release included, SELINUX=disabled would also
# fully disable SELinux during boot. If you need a system with SELinux
# fully disabled instead of SELinux running with no policy loaded, you
# need to pass selinux=0 to the kernel command line. You can use grubby
# to persistently set the bootloader to boot with selinux=0:
#
#    grubby --update-kernel ALL --args selinux=0
#
# To revert back to SELinux enabled:
#
#    grubby --update-kernel ALL --remove-args selinux
#
SELINUX=enforcing
# SELINUXTYPE= can take one of these three values:
#     targeted - Targeted processes are protected,
#     mls - Multi Level Security protection.
SELINUXTYPE=targeted
```


<img width="2422" height="1146" alt="image" src="https://github.com/user-attachments/assets/524b557a-fe4a-4540-9cba-e622a102cdb8" />

<img width="2332" height="1196" alt="image" src="https://github.com/user-attachments/assets/b4f33e87-4a4d-4ee3-bdce-f6cc4f97fcd5" />

```sh
[tony@stapp01 ~]$ history
    1  ls
    2  ls -ltr
    3  cat /etc/os-release 
    4  sudo apt install policycoreutils selinux-basics selinux-utils -y
    5  rpm -q policycoreutils selinux-policy
    6  sudo dnf install -y policycoreutils policycoreutils-python-utils selinux-policy selinux-policy-targeted
    7  ls /etc/selinux
    8  sudo vi /etc/selinux/config
    9  history
[tony@stapp01 ~]$
```

<img width="923" height="863" alt="image" src="https://github.com/user-attachments/assets/ae624cd0-1fb7-4891-9f00-0787d86e43aa" />

<img width="967" height="721" alt="image" src="https://github.com/user-attachments/assets/7eacfad0-65bd-4877-a0e0-6d444968dcc8" />

