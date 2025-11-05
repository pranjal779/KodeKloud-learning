## Linux Boot Sequence Overview

BIOS POST -> BOOT loader -> Kernel Initialization -> INIT Process (systemd)

```sh
ls -l /sbin/init
```

## Runlevels 
## Systemd Target (Runlevels)


## Viewing and Changing Systemd Target
```sh
systemctl get-default



ls -ltr /etx/systemd/system/default.target
```

<img width="1902" height="1060" alt="image" src="https://github.com/user-attachments/assets/3568b3b6-3db7-481a-9467-d41ba78c4e88" />

<img width="1032" height="822" alt="image" src="https://github.com/user-attachments/assets/a6f8a828-eaa4-415e-a050-172834ca48dd" />
