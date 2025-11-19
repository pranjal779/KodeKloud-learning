# Managing Users

```sh
useradd bob

grep -i bob /etc/passwd

grep -i bob /etc/shadow

passwd bob

whoami

passwd

useradd -u 1009 -d /home/robert-s /bin/bash -c "mercury Project member" bob

id bob

grep -i bob /etc/passwd
```

<img width="1985" height="1117" alt="image" src="https://github.com/user-attachments/assets/726e7514-44f7-4227-8920-94ffc622b57f" />

```sh
userdel bob

groupadd -g 1011 developer

groupdel developer
```

