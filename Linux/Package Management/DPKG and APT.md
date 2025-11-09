# DPKG Utility
## Debian + Ubuntu + PureOS

# DPKG = Debian Package Manager

## Working with DPKG - extension = .DEB
1. Installation/Upgrade
   - ```dpkg -i telnet.deb```
2. Uninstalling
   - ```dpkg -r telnet.deb```   
3. List
  - ```dpkg -l telnet```
4. Status
  - ```dpkg -s telnet```
7. Verifying
  - ```dpkg -p <path to file>```

# APT / APT-GET
```sh
apt install gimp
apt-get install gimp


```
 ### APT = Advanced package managers, more user friendly and better than apt-get

 ## APT acts a frontend package manager 

 Software Repository for apt -> /etc/apt/sources.list
 <img width="1321" height="1035" alt="image" src="https://github.com/user-attachments/assets/0efefef1-cc83-43ef-87c3-9914e0c21f04" />

```sh
apt update

apt upgrade

apt edit-sources
```

The command ```apt edit-sources``` opens up the /etc/apt/sources.list file in the text editor of your choice

```sh
apt install telnet

apt remove telnet

apt search telnet

apt list | grep telnet
```
