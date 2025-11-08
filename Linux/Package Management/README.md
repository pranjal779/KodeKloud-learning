# Package Management
1. Introduction to Package Manager
   - Functions of Package Managers
     - Package Integrity and Authenticity
     - Simplified Package Management
     - Grouping Packages
     - Manage Dependencies

2. Types of Package Managers
   - DPKG
   - RPM
   - APT
   - APT-GET
   - YUM
   - DNF
    

--------

### RPM

1. Working with RPM
     1. Installation
        - ```rmp -ivh telnet.rpm```
     2. Uninstalling
        - ```rpm -e telnet.rpm```
     3. Upgrade
        - ```rpm -Uvh telnet.rpm```
     4. Query
        - ```rpm -q telnet.rpm```
      5. Verifying
         - ```rmp -Vf <path to file>```
        
---------

### YUM
YUM stands for Yellowdog Updater Modified.  
It is a command-line package-management utility for computers running the Linux operating system, particularly those using the RPM Package Manager, such as Red Hat Enterprise Linux, CentOS, and Fedora (though newer versions of these distributions often use DNF, which is a successor to YUM). YUM simplifies the process of installing, updating, and removing software packages and their dependencies. 


### YUM Package Manager
1. RPM Based Distros
2. Software Repositories
3. High Level Package Manager
4. Automtic Dependency Resolution


* Software Repository
  - /etx/yum.repos.d
  - /etc/yum.repos.d/redhat.repo
  - /etc/yum.repos.d/nginx.repo
 
```sh
yum install httpd

# or
yum install httpd -y

yum repolist

yum provides scp # command name as argument ? scp is the argument

yum remove httpd

yum update telnet

yum update # to update all the package in the system and check for new ones
```
