## commands

- To check the exact version of the kernel running on a Linux system
```sh
uname -r
```


```sh

dmesg

dmesg | grep -i usb

udevadm info --query=path --name/dev/sda5

udevadm monitor

lspci

lsblk
```

<img width="1950" height="1032" alt="image" src="https://github.com/user-attachments/assets/00728d23-4a9e-4574-9ebc-526896afe3f2" />
<img width="970" height="553" alt="image" src="https://github.com/user-attachments/assets/fd18e6c4-e881-4fdb-a35e-212f14f5a2eb" />

```sh
lscpu

lsmem

lsmem --summary

free

free -m    # -m for in mb's

free -k    # -k for kb's

free -g    # -g for gb's

lshw
```

## super user commands

```sh

sudo lshw
```
