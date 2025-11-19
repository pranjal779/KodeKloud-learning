ip link

ip addr add <IP/CIDR> dev eth0 - example

ping <ip>

#### Routing (2:21)

route

#### Gateway

~route command

ip route add <ip/cidr> via <ip>
example:
ip route add 192.168.2.0/24 via 192.168.1.1


route

**4:30**

# takeawys

```sh
ip link

ip addr

ip addr add <ip/cidr> dev eth0

### Now remember, changes made using these commands are only valid till a system restart. if you want to persists these changes,
### you must set them in the /etc/network/interfaces files. IP route or simply the route command is used to view the routing table

ip route

ip route add
```
