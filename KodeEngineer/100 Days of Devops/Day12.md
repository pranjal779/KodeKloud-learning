# Day 12: Linux Network Services [Failed Task]

Our monitoring tool has reported an issue in Stratos Datacenter. One of our app servers has an issue, 
as its Apache service is not reachable on port 6100 (which is the Apache port). 
The service itself could be down, the firewall could be at fault, or something else could be causing the issue.

Use tools like telnet, netstat, etc. to find and fix the issue. Also make sure Apache is reachable from the jump host without compromising any security settings.

Once fixed, you can test the same using command curl http://stapp01:6100 command from jump host.

Note: Please do not try to alter the existing index.html code, as it will lead to task failure.

<img width="825" height="473" alt="image" src="https://github.com/user-attachments/assets/7b084b84-f3db-4b61-8ed0-c567987f86f7" />

## [KodeKloud Engineer Day 12: Linux Network Services.](https://medium.com/@janemils/kodekloud-engineer-day-12-linux-network-services-e63e4ec3bfe4)

Let’s first decide on an approach on how to solve this problem, before jumping into the solution.

1. Define the problem clearly and make a list of the symptoms and the possible causes for the symptoms and also gather the evidences.
2. Check if the Apache process is running.
3. Check if Apache is listening on the correct port.
4. Check firewall rules.
5. Test connectivity from the jump host.
6. Check logs.
7. Fix the issue and verify the fix.


```sh
[tony@stapp01 ~]$ sudo systemctl status httpd

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for tony: 
● httpd.service - The Apache HTTP Server
   Loaded: loaded (/usr/lib/systemd/system/httpd.service; disabled; vendor preset: disabled)
   Active: failed (Result: exit-code) since Thu 2026-03-05 14:39:30 UTC; 9min ago
     Docs: man:httpd.service(8)
  Process: 543 ExecStart=/usr/sbin/httpd $OPTIONS -DFOREGROUND (code=exited, status=1/FAILURE)
 Main PID: 543 (code=exited, status=1/FAILURE)
   Status: "Reading configuration..."

Mar 05 14:39:30 stapp01.stratos.xfusioncorp.com httpd[543]: (98)Address already in use: AH00072: make_sock: could not bind t
o address 0.0.0.0:6100
Mar 05 14:39:30 stapp01.stratos.xfusioncorp.com httpd[543]: no listening sockets available, shutting down
Mar 05 14:39:30 stapp01.stratos.xfusioncorp.com httpd[543]: AH00015: Unable to open logs
Mar 05 14:39:30 stapp01.stratos.xfusioncorp.com systemd[1]: httpd.service: Child 543 belongs to http
d.service.
Mar 05 14:39:30 stapp01.stratos.xfusioncorp.com systemd[1]: httpd.service: Main process exited, code
=exited, status=1/FAILURE
Mar 05 14:39:30 stapp01.stratos.xfusioncorp.com systemd[1]: httpd.service: Failed with result 'exit-
code'.
Mar 05 14:39:30 stapp01.stratos.xfusioncorp.com systemd[1]: httpd.service: Changed start -> failed

Mar 05 14:39:30 stapp01.stratos.xfusioncorp.com systemd[1]: httpd.service: Job httpd.service/start f
inished, result=failed
Mar 05 14:39:30 stapp01.stratos.xfusioncorp.com systemd[1]: Failed to start The Apache HTTP Server.

Mar 05 14:39:30 stapp01.stratos.xfusioncorp.com systemd[1]: httpd.service: Unit entered failed state
.
[tony@stapp01 ~]$
```

```sh
Mar 05 14:39:30 stapp01.stratos.xfusioncorp.com httpd[543]: (98)Address already in use: AH00072: make_sock: could not bind t
o address 0.0.0.0:6100
Mar 05 14:39:30 stapp01.stratos.xfusioncorp.com httpd[543]: no listening sockets available, shutting down
Mar 05 14:39:30 stapp01.stratos.xfusioncorp.com httpd[543]: AH00015: Unable to open logs
```

```sh
[tony@stapp01 ~]$ sudo netstat -tulnp | grep 6100
tcp        0      0 127.0.0.1:6100          0.0.0.0:*               LISTEN      486/sendmail: accep 
[tony@stapp01 ~]$ 
```

```sh
[tony@stapp01 ~]$ whereis sendmail
sendmail: /usr/sbin/sendmail.sendmail /usr/sbin/sendmail /usr/lib/sendmail.sendmail /usr/lib/sendmail /usr/share/man/man8/sendmail.8.gz
[tony@stapp01 ~]$ dpkg -L sendmail
-bash: dpkg: command not found
[tony@stapp01 ~]$ rpm -ql sendmail
/etc/NetworkManager/dispatcher.d/10-sendmail
/etc/mail
/etc/mail/Makefile
/etc/mail/access
/etc/mail/access.db
/etc/mail/aliasesdb-stamp
/etc/mail/domaintable
/etc/mail/domaintable.db
/etc/mail/helpfile
/etc/mail/local-host-names
/etc/mail/mailertable
/etc/mail/mailertable.db
/etc/mail/make
/etc/mail/sendmail.cf
/etc/mail/sendmail.mc
/etc/mail/submit.cf
/etc/mail/submit.mc
/etc/mail/trusted-users
/etc/mail/virtusertable
/etc/mail/virtusertable.db
/etc/pam.d/smtp
/etc/pam.d/smtp.sendmail
/etc/sasl2/Sendmail.conf
/etc/smrsh
/etc/sysconfig/sendmail
/usr/bin/hoststat
/usr/bin/mailq
/usr/bin/mailq.sendmail
/usr/bin/makemap
/usr/bin/newaliases
/usr/bin/newaliases.sendmail
/usr/bin/purgestat
/usr/bin/rmail
/usr/bin/rmail.sendmail
/usr/lib/.build-id
/usr/lib/.build-id/06
/usr/lib/.build-id/06/2a2cc8b68afec4edf1277853ead102f3a16f0b
/usr/lib/.build-id/24
/usr/lib/.build-id/24/0eae6c09cb6567ee902d985b543367913d568e
/usr/lib/.build-id/2a
/usr/lib/.build-id/2a/c6debaa27f2a52a20257703dfa76e3ebff857b
/usr/lib/.build-id/aa
/usr/lib/.build-id/aa/2916020736fab237ea58a496c04eb61dc016dd
/usr/lib/.build-id/c2
/usr/lib/.build-id/c2/bc0bd7e97d9ee556ec810d58bff13a8e2132d4
/usr/lib/.build-id/d3
/usr/lib/.build-id/d3/2702e00311da87fcc531065ea4eb9c7f7e5074
/usr/lib/.build-id/d4
/usr/lib/.build-id/d4/13fe3c359a5df34808d4bdad8bfd9c268b481c
/usr/lib/sendmail
/usr/lib/sendmail.sendmail
/usr/lib/systemd/system/sendmail.service
/usr/lib/systemd/system/sm-client.service
/usr/sbin/editmap
/usr/sbin/editmap.sendmail
/usr/sbin/mailstats
/usr/sbin/makemap
/usr/sbin/makemap.sendmail
/usr/sbin/praliases
/usr/sbin/sendmail
/usr/sbin/sendmail.sendmail
/usr/sbin/smrsh
/usr/share/doc/sendmail
/usr/share/doc/sendmail/FAQ
/usr/share/doc/sendmail/KNOWNBUGS
/usr/share/doc/sendmail/LICENSE
/usr/share/doc/sendmail/README
/usr/share/doc/sendmail/RELEASE_NOTES.gz
/usr/share/man/man1/mailq.1.gz
/usr/share/man/man1/mailq.sendmail.1.gz
/usr/share/man/man1/newaliases.1.gz
/usr/share/man/man1/newaliases.sendmail.1.gz
/usr/share/man/man5/aliases.5.gz
/usr/share/man/man5/aliases.sendmail.5.gz
/usr/share/man/man8/editmap.8.gz
/usr/share/man/man8/editmap.sendmail.8.gz
/usr/share/man/man8/hoststat.8.gz
/usr/share/man/man8/mailstats.8.gz
/usr/share/man/man8/makemap.8.gz
/usr/share/man/man8/makemap.sendmail.8.gz
/usr/share/man/man8/praliases.8.gz
/usr/share/man/man8/purgestat.8.gz
/usr/share/man/man8/rmail.8.gz
/usr/share/man/man8/rmail.sendmail.8.gz
/usr/share/man/man8/sendmail.8.gz
/usr/share/man/man8/sendmail.sendmail.8.gz
/usr/share/man/man8/smrsh.8.gz
/var/log/mail
/var/log/mail/statistics
/var/spool/clientmqueue
/var/spool/clientmqueue/sm-client.st
/var/spool/mqueue
[tony@stapp01 ~]$
````

```sh
/etc/mail/sendmail.mc

[tony@stapp01 ~]$ sudo vi /etc/mail/sendmail.mc
[sudo] password for tony: 
[tony@stapp01 ~]$ cd /etc/mail
[tony@stapp01 mail]$ sudo sh -c "m4 /etc/mail/sendmail.mc > /etc/mail/sendmail.cf"
[tony@stapp01 mail]$ sudo systemctl restart sendmail
[tony@stapp01 mail]$ sudo systemctl status sendmail
● sendmail.service - Sendmail Mail Transport Agent
   Loaded: loaded (/usr/lib/systemd/system/sendmail.service; disabled; vendor preset: disabled)
   Active: active (running) since Thu 2026-03-05 15:09:51 UTC; 37s ago
  Process: 1243 ExecStart=/usr/sbin/sendmail -bd $SENDMAIL_OPTS $SENDMAIL_OPTARG (code=exited, status=0/SUCCESS)
  Process: 1233 ExecStartPre=/etc/mail/make aliases (code=exited, status=0/SUCCESS)
  Process: 1232 ExecStartPre=/etc/mail/make (code=exited, status=0/SUCCESS)
 Main PID: 1250 (sendmail)
    Tasks: 1 (limit: 411434)
   Memory: 3.7M
   CGroup: /docker/a34227159778878be70499f05ef8cd58acfc433a95ab7da77fc9cf25a86154f4/system.slice/sendmail.service
           └─1250 sendmail: accepting connections

Mar 05 15:09:51 stapp01.stratos.xfusioncorp.com systemd[1]: sendmail.service: Trying to read PID file /run/s
endmail.pid in case it changed
Mar 05 15:09:51 stapp01.stratos.xfusioncorp.com systemd[1]: sendmail.service: Can't open PID file /run/sendm
ail.pid (yet?) after start: No such file or directory
Mar 05 15:09:51 stapp01.stratos.xfusioncorp.com systemd[1]: sendmail.service: inotify event
Mar 05 15:09:51 stapp01.stratos.xfusioncorp.com systemd[1]: sendmail.service: New main PID 1250 belongs to s
ervice, we are happy.
Mar 05 15:09:51 stapp01.stratos.xfusioncorp.com systemd[1]: sendmail.service: Main PID loaded: 1250
Mar 05 15:09:51 stapp01.stratos.xfusioncorp.com systemd[1]: sendmail.service: Stopping watch for PID file /r
un/sendmail.pid
Mar 05 15:09:51 stapp01.stratos.xfusioncorp.com systemd[1]: sendmail.service: Changed start -> running
Mar 05 15:09:51 stapp01.stratos.xfusioncorp.com systemd[1]: sendmail.service: Job sendmail.service/start fin
ished, result=done
Mar 05 15:09:51 stapp01.stratos.xfusioncorp.com systemd[1]: Started Sendmail Mail Transport Agent.
Mar 05 15:09:51 stapp01.stratos.xfusioncorp.com systemd[1]: sendmail.service: Failed to send unit change sig
nal for sendmail.service: Connection reset by peer
[tony@stapp01 mail]$
[tony@stapp01 mail]$ sudo netstat -tulnp | grep sendmail
tcp        0      0 127.0.0.1:6100          0.0.0.0:*               LISTEN      1250/sendmail: acce 
[tony@stapp01 mail]$

[tony@stapp01 mail]$ sudo systemctl restart sendmail
[tony@stapp01 mail]$ sudo systemctl status sendmail
● sendmail.service - Sendmail Mail Transport Agent
   Loaded: loaded (/usr/lib/systemd/system/sendmail.service; disabled; vendor preset: disabled)
   Active: active (running) since Thu 2026-03-05 15:22:41 UTC; 11s ago
  Process: 1888 ExecStart=/usr/sbin/sendmail -bd $SENDMAIL_OPTS $SENDMAIL_OPTARG (code=exited, status=0/SUCCESS)
  Process: 1878 ExecStartPre=/etc/mail/make aliases (code=exited, status=0/SUCCESS)
  Process: 1877 ExecStartPre=/etc/mail/make (code=exited, status=0/SUCCESS)
 Main PID: 1895 (sendmail)
    Tasks: 1 (limit: 411434)
   Memory: 3.5M


[tony@stapp01 mail]$ sudo firewall-cmd --list-all
sudo: firewall-cmd: command not found
[tony@stapp01 mail]$ sudo iptables -L -n
Chain INPUT (policy ACCEPT)
target     prot opt source               destination         
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0            state NEW tcp dpt:22
REJECT     all  --  0.0.0.0/0            0.0.0.0/0            reject-with icmp-host-prohibited

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         
REJECT     all  --  0.0.0.0/0            0.0.0.0/0            reject-with icmp-host-prohibited

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         
# Warning: iptables-legacy tables present, use iptables-legacy to see them
[tony@stapp01 mail]$

[tony@stapp01 mail]$ sudo firewall-cmd --list-all
sudo: firewall-cmd: command not found
[tony@stapp01 mail]$ sudo firewall-cmd --list-all
sudo: firewall-cmd: command not found
[tony@stapp01 mail]$ sudo iptables -L -n
Chain INPUT (policy ACCEPT)
target     prot opt source               destination         
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0            state NEW tcp dpt:22
REJECT     all  --  0.0.0.0/0            0.0.0.0/0            reject-with icmp-host-prohibited

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         
REJECT     all  --  0.0.0.0/0            0.0.0.0/0            reject-with icmp-host-prohibited

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         
# Warning: iptables-legacy tables present, use iptables-legacy to see them
[tony@stapp01 mail]$ # Allow incoming TCP on port 3004
[tony@stapp01 mail]$ sudo iptables -I INPUT 1 -p tcp --dport 3004 -j ACCEPT
[tony@stapp01 mail]$ # Save the rules permanently (RHEL/CentOS)
[tony@stapp01 mail]$ sudo service iptables save
iptables: Saving firewall rules to /etc/sysconfig/iptables:[  OK  ]
[tony@stapp01 mail]$ # Run the iptables command to verify if the rule is applied successfully.
[tony@stapp01 mail]$ sudo iptables -L -n
Chain INPUT (policy ACCEPT)
target     prot opt source               destination         
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0            tcp dpt:3004
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0            state NEW tcp dpt:22
REJECT     all  --  0.0.0.0/0            0.0.0.0/0            reject-with icmp-host-prohibited

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         
REJECT     all  --  0.0.0.0/0            0.0.0.0/0            reject-with icmp-host-prohibited

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         
# Warning: iptables-legacy tables present, use iptables-legacy to see them
[tony@stapp01 mail]$


[tony@stapp01 ~]$ sudo iptables -I INPUT 1 -p tcp --dport 6100 -j ACCEPT
[sudo] password for tony: 
Sorry, try again.
[sudo] password for tony: 
[tony@stapp01 ~]$  # Save the rules permanently (RHEL/CentOS)
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ sudo service iptables save
iptables: Saving firewall rules to /etc/sysconfig/iptables:[  OK  ]
[tony@stapp01 ~]$ # Run the iptables command to verify if the rule is applied successfully.
[tony@stapp01 ~]$ sudo iptables -L -n
Chain INPUT (policy ACCEPT)
target     prot opt source               destination         
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0            tcp dpt:6100
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0            tcp dpt:3004
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0            state NEW tcp dpt:22
REJECT     all  --  0.0.0.0/0            0.0.0.0/0            reject-with icmp-host-prohibited

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         
REJECT     all  --  0.0.0.0/0            0.0.0.0/0            reject-with icmp-host-prohibited

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         
# Warning: iptables-legacy tables present, use iptables-legacy to see them
[tony@stapp01 ~]$



```
