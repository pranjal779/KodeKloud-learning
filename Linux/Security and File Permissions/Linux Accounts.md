# Linux Accounts

## Linux Security
  - Access Controls
  - PAM
  - Network Security
  - SSH Hardening
  - SELinux
  - Many More


```sh
cat /etc/passwd

cat /etc/group
```

## User
  - Username
  - UID
  - GID
  - Home Directory
  - Default Shell

```sh
id michael

grep -i michael /etc/passwd
```

## Account Type
- User Account - bob, michael, dave
- SuperUser Account - root
- System Accounts - shh, mail
- Service Accounts - nginx, mercury

```sh
id

who

last
```

## Switching Users
```sh
su -

su -c "whoami"

sudo apt-get install nginx

cat /etc/sudoers

# visudo -> /etc/sudoers

grep -i ^root /etc/password

cat /etc/sudoers
```

<img width="1985" height="1001" alt="image" src="https://github.com/user-attachments/assets/682374b4-f19f-4b5f-8849-a00ea753c454" />




