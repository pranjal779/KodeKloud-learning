IPv4 and IPv6 CIDR (Classless Inter-Domain Routing) blocks use the exact same concept of slash notation to divide network and host bits, but they differ significantly in base address length, total capacity, and typical sizing conventions. [1, 2] 
## Key Similarities

* Slash Notation: Both use a slash (/) followed by a number to show how many bits belong to the network prefix. [1, 2] 
* Core Purpose: Both define a contiguous range of IP addresses for routing and subnetting. [2, 3] 

## Core Differences

* Address Size: IPv4 addresses are 32 bits long (written in decimal format like 192.0.2.0/24), while IPv6 addresses are 128 bits long (written in hexadecimal format like 2001:db8::/32). [2] 
* Scale of Blocks: Because IPv6 has a massive 128-bit space, a standard local network (LAN) allocation is almost always a /64, which contains 18.4 quintillion addresses. In contrast, an IPv4 /24 provides just 256 addresses. [4] 
* Subnet Conventions: IPv4 CIDR blocks commonly range from /16 down to /28 for user subnets. IPv6 CIDR blocks for subnets typically scale in increments of /4 (such as /44 to /64), where the final 64 bits are always reserved for the host interface identifier. [3, 5, 6] 

Would you like to see how to calculate available host IPs for an IPv4 subnet mask versus an IPv6 prefix?

[1] [https://www.ipv4.global](https://www.ipv4.global/events/4-6-difference/)
[2] [https://larus.net](https://larus.net/blog/understanding-ip-address-blocks/)
[3] [https://en.wikipedia.org](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing)
[4] [https://www.ripe.net](https://www.ripe.net/about-us/press-centre/understanding-ip-addressing/)
[5] [https://docs.aws.amazon.com](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-cidr-blocks.html)
[6] [https://docs.aws.amazon.com](https://docs.aws.amazon.com/vpc/latest/userguide/subnet-sizing.html)
