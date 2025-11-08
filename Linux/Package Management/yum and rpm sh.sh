# RPM
# Working with RPM

# Installation
rmp -ivh telnet.rpm

# Uninstalling
rpm -e telnet.rpm

# Upgrade
rpm -Uvh telnet.rpm

# Query
rpm -q telnet.rpm

# Verifying
rmp -Vf #<path to file>


yum install httpd

# or
yum install httpd -y

yum repolist

yum provides scp # command name as argument ? scp is the argument

yum remove httpd

yum update telnet

yum update # to update all the package in the system and check for new ones
