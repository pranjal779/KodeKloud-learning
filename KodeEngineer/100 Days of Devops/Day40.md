# Day 40: Docker EXEC Operations

<img width="1312" height="742" alt="image" src="https://github.com/user-attachments/assets/06a619ae-a14e-45c9-a693-ccfa4c670b21" />


One of the Nautilus DevOps team members was working to configure services on a kkloud container that is running on App Server 1 in Stratos Datacenter. 
Due to some personal work he is on PTO for the rest of the week, but we need to finish his pending work ASAP. Please complete the remaining work as per details given below:

a. Install apache2 in kkloud container using apt that is running on App Server 1 in Stratos Datacenter.

b. Configure Apache to listen on port 5004 instead of default http port. Do not bind it to listen on specific IP or hostname only, i.e it should listen on localhost, 127.0.0.1, container ip, etc.

c. Make sure Apache service is up and running inside the container. Keep the container in running state at the end.

```sh
thor@jump-host ~$ ssh tony@stapp01
The authenticity of host 'stapp01 (10.244.81.107)' can't be established.
ED25519 key fingerprint is SHA256:4AM/kaY3gClIumu/31y90cDcqU2IyWsIy9E/C6i5o/M.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp01' (ED25519) to the list of known hosts.
tony@stapp01's password: 
[tony@stapp01 ~]$ 

[tony@stapp01 ~]$ docker ps
CONTAINER ID   IMAGE          COMMAND       CREATED          STATUS          PORTS     NAMES
7a6a2f32587d   ubuntu:18.04   "/bin/bash"   10 minutes ago   Up 10 minutes             kkloud
[tony@stapp01 ~]$ 


root@7a6a2f32587d:/# ls /etc/        
adduser.conf            default       hostname      libaudit.conf  mtab           protocols    rpc          sysctl.d
alternatives            deluser.conf  hosts         logcheck       network        python3.6    securetty    systemd
apache2                 dpkg          init.d        login.defs     networks       rc0.d        security     terminfo
apt                     environment   inputrc       logrotate.d    nsswitch.conf  rc1.d        selinux      ufw
bash.bashrc             fstab         issue         lsb-release    opt            rc2.d        services     update-motd.d
bindresvport.blacklist  gai.conf      issue.net     machine-id     os-release     rc3.d        shadow       vim
ca-certificates         group         kernel        magic          pam.conf       rc4.d        shells
ca-certificates.conf    group-        ld.so.cache   magic.mime     pam.d          rc5.d        skel
cloud                   gshadow       ld.so.conf    mailcap        passwd         rc6.d        ssl
cron.daily              gshadow-      ld.so.conf.d  mailcap.order  perl           rcS.d        subgid
debconf.conf            gss           ldap          mime.types     profile        resolv.conf  subuid
debian_version          host.conf     legal         mke2fs.conf    profile.d      rmt          sysctl.conf
root@7a6a2f32587d:/# ls /etc/apache2/
apache2.conf    conf-enabled  magic           mods-enabled  sites-available
conf-available  envvars       mods-available  ports.conf    sites-enabled
root@7a6a2f32587d:/# 

root@7a6a2f32587d:/# cat /etc/apache2/ports.conf 
# If you just change the port or add more ports here, you will likely also
# have to change the VirtualHost statement in
# /etc/apache2/sites-enabled/000-default.conf

Listen 80

<IfModule ssl_module>
        Listen 443
</IfModule>

<IfModule mod_gnutls.c>
        Listen 443
</IfModule>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
root@7a6a2f32587d:/# 

root@7a6a2f32587d:/# vi /etc/apache2/ports.conf 
root@7a6a2f32587d:/# cat /etc/apache2/ports.conf 
# If you just change the port or add more ports here, you will likely also
# have to change the VirtualHost statement in
# /etc/apache2/sites-enabled/000-default.conf

Listen 5004

<IfModule ssl_module>
        Listen 443
</IfModule>

<IfModule mod_gnutls.c>
        Listen 443
</IfModule>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
root@7a6a2f32587d:/#

root@7a6a2f32587d:/# cat /etc/apache2/sites-enabled/
cat: /etc/apache2/sites-enabled/: Is a directory
root@7a6a2f32587d:/# ls /etc/apache2/sites-enabled/
000-default.conf
root@7a6a2f32587d:/# cat /etc/apache2/sites-enabled/000-default.conf 
<VirtualHost *:80>
        # The ServerName directive sets the request scheme, hostname and port that
        # the server uses to identify itself. This is used when creating
        # redirection URLs. In the context of virtual hosts, the ServerName
        # specifies what hostname must appear in the request's Host: header to
        # match this virtual host. For the default virtual host (this file) this
        # value is not decisive as it is used as a last resort host regardless.
        # However, you must set it for any further virtual host explicitly.
        #ServerName www.example.com

        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html

        # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
        # error, crit, alert, emerg.
        # It is also possible to configure the loglevel for particular
        # modules, e.g.
        #LogLevel info ssl:warn

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

        # For most configuration files from conf-available/, which are
        # enabled or disabled at a global level, it is possible to
        # include a line for only one particular virtual host. For example the
        # following line enables the CGI configuration for this host only
        # after it has been globally disabled with "a2disconf".
        #Include conf-available/serve-cgi-bin.conf
</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
root@7a6a2f32587d:/#

root@7a6a2f32587d:/# vi /etc/apache2/sites-enabled/000-default.conf 
root@7a6a2f32587d:/# cat /etc/apache2/sites-enabled/000-default.conf 
<VirtualHost *:5004>
        # The ServerName directive sets the request scheme, hostname and port that
        # the server uses to identify itself. This is used when creating
        # redirection URLs. In the context of virtual hosts, the ServerName
        # specifies what hostname must appear in the request's Host: header to
        # match this virtual host. For the default virtual host (this file) this
        # value is not decisive as it is used as a last resort host regardless.
        # However, you must set it for any further virtual host explicitly.
        #ServerName www.example.com

        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html

        # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
        # error, crit, alert, emerg.
        # It is also possible to configure the loglevel for particular
        # modules, e.g.
        #LogLevel info ssl:warn

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

        # For most configuration files from conf-available/, which are
        # enabled or disabled at a global level, it is possible to
        # include a line for only one particular virtual host. For example the
        # following line enables the CGI configuration for this host only
        # after it has been globally disabled with "a2disconf".
        #Include conf-available/serve-cgi-bin.conf
</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
root@7a6a2f32587d:/#

root@7a6a2f32587d:/# service apache2 start  
 * Starting Apache httpd web server apache2                                                  * 
root@7a6a2f32587d:/# service apache2 status
 * apache2 is running
root@7a6a2f32587d:/#

root@7a6a2f32587d:/# history
    1  apt update && apt install -y vim
    2  apt install -y apache2
    3  clear
    4  ls /etc/
    5  ls /etc/apache2/
    6  cat /etc/apache2/ports.conf 
    7  vi /etc/apache2/ports.conf 
    8  cat /etc/apache2/ports.conf 
    9  cat /etc/apache2/sites-enabled/
   10  ls /etc/apache2/sites-enabled/
   11  cat /etc/apache2/sites-enabled/000-default.conf 
   12  vi /etc/apache2/sites-enabled/000-default.conf 
   13  cat /etc/apache2/sites-enabled/000-default.conf 
   14  systemctl restart apache2
   15  systemctl apache2 restart
   16  servcie apache2 restart
   17  service apache2 restart
   18  cat /etc/apache2/port.conf
   19  cat /etc/apache2/ports.conf
   20  netstat -tulnp | grep 5001
   21  netstat -tulnp | grep 5004
   22  service apache2 start
   23  service apache2 status
   24  history
root@7a6a2f32587d:/# 
```



<img width="1822" height="1157" alt="image" src="https://github.com/user-attachments/assets/66709ee5-8302-43e3-ba74-ec7557c460e9" />
<img width="1977" height="1167" alt="image" src="https://github.com/user-attachments/assets/bbfbca5a-82a0-4235-bc31-aae394a169e6" />



