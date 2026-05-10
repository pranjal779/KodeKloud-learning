# Day 34: Git Hook

<img width="827" height="537" alt="image" src="https://github.com/user-attachments/assets/0a956a8a-9c54-4872-90b1-6919f5e054ef" />
<img width="1992" height="812" alt="image" src="https://github.com/user-attachments/assets/3cc6df9a-27d4-4b3c-9f60-9e9928c65678" />
<img width="1932" height="842" alt="image" src="https://github.com/user-attachments/assets/4c571b94-80d5-415e-a649-a10cb15f9836" />

<img width="1997" height="1087" alt="image" src="https://github.com/user-attachments/assets/507a6b34-19ab-45fd-b35d-c4d6a6a23609" />


```sh
thor@jumphost ~$ ssh natasha@ststor01
The authenticity of host 'ststor01 (10.244.97.188)' can't be established.
ED25519 key fingerprint is SHA256:yEyN8qvzhNxfcKVE+H05zwQPmQMKCXj4JyGWuOP1HIg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'ststor01' (ED25519) to the list of known hosts.
natasha@ststor01's password: 
[natasha@ststor01 ~]$ 
[natasha@ststor01 ~]$ 
[natasha@ststor01 ~]$ cd /usr/src/kodekloudrepos/
[natasha@ststor01 kodekloudrepos]$ ls -la
total 16
drwxr-xr-x 3 natasha natasha 4096 May 10 02:01 .
drwxr-xr-x 1 root    root    4096 May 10 02:01 ..
drwxr-xr-x 3 natasha natasha 4096 May 10 02:01 media
[natasha@ststor01 kodekloudrepos]$ cd media/
[natasha@ststor01 media]$ ls -la
total 20
drwxr-xr-x 3 natasha natasha 4096 May 10 02:01 .
drwxr-xr-x 3 natasha natasha 4096 May 10 02:01 ..
drwxr-xr-x 7 natasha natasha 4096 May 10 02:01 .git
-rw-r--r-- 1 natasha natasha   22 May 10 02:01 feature.txt
-rw-r--r-- 1 natasha natasha   34 May 10 02:01 info.txt
[natasha@ststor01 media]$ ls -ll
total 8
-rw-r--r-- 1 natasha natasha 22 May 10 02:01 feature.txt
-rw-r--r-- 1 natasha natasha 34 May 10 02:01 info.txt
[natasha@ststor01 media]$ cd /opt/media.git/
[natasha@ststor01 media.git]$ ls -la
total 36
drwxr-xr-x  6 natasha natasha 4096 May 10 02:01 .
drwxr-xr-x  1 root    root    4096 May 10 02:01 ..
-rw-r--r--  1 natasha natasha   23 May 10 02:01 HEAD
-rw-r--r--  1 natasha natasha   66 May 10 02:01 config
-rw-r--r--  1 natasha natasha   73 May 10 02:01 description
drwxr-xr-x  2 natasha natasha 4096 May 10 02:01 hooks
drwxr-xr-x  2 natasha natasha 4096 May 10 02:01 info
drwxr-xr-x 10 natasha natasha 4096 May 10 02:01 objects
drwxr-xr-x  4 natasha natasha 4096 May 10 02:01 refs
[natasha@ststor01 media.git]$ 

```

<img width="1945" height="1192" alt="image" src="https://github.com/user-attachments/assets/625fef7c-2ecf-49d3-aa00-ab1acb88a2d8" />

```sh
[natasha@ststor01 hooks]$ vi update.sample

```

<img width="707" height="937" alt="image" src="https://github.com/user-attachments/assets/b234e02c-41d1-41d1-b0c7-21be8f2b9969" />
<img width="682" height="547" alt="image" src="https://github.com/user-attachments/assets/a03dc78b-f278-49c1-9e33-124e14c83f42" />

```sh
[natasha@ststor01 hooks]$ cat post-update
#!/bin/bash

# Get the current date
RELEASE_DATE=$(date +%y-%m-%d)
RELEASE_TAG="release-$RELEASE_DATE"

# Check if master branch was updated
for ref in "$@"; do
    if [[ $ref == "refs/head/master" ]]; then
        echo "Master branch updated, creating release tag: $RELEASE_TAG"

        # Navigate to the working repository
        cd /usr/src/kodekloudrepos

        # Update the working repository
        git pull origin master

        # Create the tag
        git tag "$RELEASE_TAG"

        # Push the tag to origin
        git push origin "$RELEASE_TAG"

        echo "Release tag $RELEASE_TAG created successfully"
    fi
done
[natasha@ststor01 hooks]$

```

<img width="1066" height="692" alt="image" src="https://github.com/user-attachments/assets/9066163f-7724-4697-a990-00a9ce82c4aa" />

<img width="1072" height="1122" alt="image" src="https://github.com/user-attachments/assets/df8ccfef-edd2-4175-9a32-21f0d9f81cfa" />

<img width="962" height="711" alt="image" src="https://github.com/user-attachments/assets/1e61b0df-53dc-4999-8c7f-54757f0a2faf" />


```sh
thor@jumphost ~$ ssh natasha@ststor01
The authenticity of host 'ststor01 (10.244.97.188)' can't be established.
ED25519 key fingerprint is SHA256:yEyN8qvzhNxfcKVE+H05zwQPmQMKCXj4JyGWuOP1HIg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'ststor01' (ED25519) to the list of known hosts.
natasha@ststor01's password: 
[natasha@ststor01 ~]$ 
[natasha@ststor01 ~]$ 
[natasha@ststor01 ~]$ cd /usr/src/kodekloudrepos/
[natasha@ststor01 kodekloudrepos]$ ls -la
total 16
drwxr-xr-x 3 natasha natasha 4096 May 10 02:01 .
drwxr-xr-x 1 root    root    4096 May 10 02:01 ..
drwxr-xr-x 3 natasha natasha 4096 May 10 02:01 media
[natasha@ststor01 kodekloudrepos]$ cd media/
[natasha@ststor01 media]$ ls -la
total 20
drwxr-xr-x 3 natasha natasha 4096 May 10 02:01 .
drwxr-xr-x 3 natasha natasha 4096 May 10 02:01 ..
drwxr-xr-x 7 natasha natasha 4096 May 10 02:01 .git
-rw-r--r-- 1 natasha natasha   22 May 10 02:01 feature.txt
-rw-r--r-- 1 natasha natasha   34 May 10 02:01 info.txt
[natasha@ststor01 media]$ ls -ll
total 8
-rw-r--r-- 1 natasha natasha 22 May 10 02:01 feature.txt
-rw-r--r-- 1 natasha natasha 34 May 10 02:01 info.txt
[natasha@ststor01 media]$ cd /opt/media.git/
[natasha@ststor01 media.git]$ ls -la
total 36
drwxr-xr-x  6 natasha natasha 4096 May 10 02:01 .
drwxr-xr-x  1 root    root    4096 May 10 02:01 ..
-rw-r--r--  1 natasha natasha   23 May 10 02:01 HEAD
-rw-r--r--  1 natasha natasha   66 May 10 02:01 config
-rw-r--r--  1 natasha natasha   73 May 10 02:01 description
drwxr-xr-x  2 natasha natasha 4096 May 10 02:01 hooks
drwxr-xr-x  2 natasha natasha 4096 May 10 02:01 info
drwxr-xr-x 10 natasha natasha 4096 May 10 02:01 objects
drwxr-xr-x  4 natasha natasha 4096 May 10 02:01 refs
[natasha@ststor01 media.git]$ cd hooks
[natasha@ststor01 hooks]$ ls -la
total 72
drwxr-xr-x 2 natasha natasha 4096 May 10 02:01 .
drwxr-xr-x 6 natasha natasha 4096 May 10 02:01 ..
-rwxr-xr-x 1 natasha natasha  482 May 10 02:01 applypatch-msg.sample
-rwxr-xr-x 1 natasha natasha  900 May 10 02:01 commit-msg.sample
-rwxr-xr-x 1 natasha natasha 4726 May 10 02:01 fsmonitor-watchman.sample
-rwxr-xr-x 1 natasha natasha  193 May 10 02:01 post-update.sample
-rwxr-xr-x 1 natasha natasha  428 May 10 02:01 pre-applypatch.sample
-rwxr-xr-x 1 natasha natasha 1653 May 10 02:01 pre-commit.sample
-rwxr-xr-x 1 natasha natasha  420 May 10 02:01 pre-merge-commit.sample
-rwxr-xr-x 1 natasha natasha 1378 May 10 02:01 pre-push.sample
-rwxr-xr-x 1 natasha natasha 4902 May 10 02:01 pre-rebase.sample
-rwxr-xr-x 1 natasha natasha  548 May 10 02:01 pre-receive.sample
-rwxr-xr-x 1 natasha natasha 1496 May 10 02:01 prepare-commit-msg.sample
-rwxr-xr-x 1 natasha natasha 2787 May 10 02:01 push-to-checkout.sample
-rwxr-xr-x 1 natasha natasha 2312 May 10 02:01 sendemail-validate.sample
-rwxr-xr-x 1 natasha natasha 3654 May 10 02:01 update.sample
[natasha@ststor01 hooks]$ vi update.sample
[natasha@ststor01 hooks]$ vi post-update
[natasha@ststor01 hooks]$ cat pst-update
cat: pst-update: No such file or directory
[natasha@ststor01 hooks]$ cat post-update
#!/bin/bash

# Get the current date
RELEASE_DATE=$(date +%y-%m-%d)
RELEASE_TAG="release-$RELEASE_DATE"

# Check if master branch was updated
for ref in "$@"; do
    if [[ $ref == "refs/head/master" ]]; then
        echo "Master branch updated, creating release tag: $RELEASE_TAG"

        # Navigate to the working repository
        cd /usr/src/kodekloudrepos

        # Update the working repository
        git pull origin master

        # Create the tag
        git tag "$RELEASE_TAG"

        # Push the tag to origin
        git push origin "$RELEASE_TAG"

        echo "Release tag $RELEASE_TAG created successfully"
    fi
done
[natasha@ststor01 hooks]$ cd ..
[natasha@ststor01 media.git]$ cd hooks
[natasha@ststor01 hooks]$ chmod +x psot-update
chmod: cannot access 'psot-update': No such file or directory
[natasha@ststor01 hooks]$ sudo chmod +x psot-update
chmod: cannot access 'psot-update': No such file or directory
[natasha@ststor01 hooks]$ sudo chmod +x post-update
[natasha@ststor01 hooks]$ cd /usr/src/kodekloudrepos/
[natasha@ststor01 kodekloudrepos]$ cd media/
[natasha@ststor01 media]$ git branch
* feature
  master
[natasha@ststor01 media]$ git checkout master
Switched to branch 'master'
Your branch is up to date with 'origin/master'.
[natasha@ststor01 media]$ git merge feature
Updating cc6cc20..d949a25
Fast-forward
 feature.txt | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 feature.txt
[natasha@ststor01 media]$ git push origin master
Total 0 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To /opt/media.git
   cc6cc20..d949a25  master -> master
[natasha@ststor01 media]$
```

<img width="2071" height="1127" alt="image" src="https://github.com/user-attachments/assets/cbe891b8-4f39-4bc6-8512-69ef7801ad2f" />
<img width="995" height="887" alt="image" src="https://github.com/user-attachments/assets/f6a5c14a-f571-4e99-9509-c51826c46fd8" />

