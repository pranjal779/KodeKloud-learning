```sh
ls -l bash-script.sh
```

<img width="1956" height="1163" alt="image" src="https://github.com/user-attachments/assets/64b48b31-f1fd-4fc1-a1b2-f3a50791e26b" />
<img width="1827" height="977" alt="image" src="https://github.com/user-attachments/assets/64734921-afb0-4490-87bf-4b19330bb55c" />

### Directory Permissions
<img width="977" height="787" alt="image" src="https://github.com/user-attachments/assets/fa8cbf00-35a0-488d-acf8-b095d7011539" />

```sh
ls -ld /home/bob/random_dir

whoami

ls /home/bob/random_dir

cd /home/bob/random_dir
```
<img width="2007" height="1026" alt="image" src="https://github.com/user-attachments/assets/5e993aba-2f33-4d3d-9e24-2c40d946576c" />

<img width="1550" height="1061" alt="image" src="https://github.com/user-attachments/assets/e4ab720e-cf53-46d6-ad81-5a807ca83b90" />

# Modifying File Permissions
```sh
chmod <permissions> file

chmod u+rwx test-file

chmod ugo+r-x test-file

chmod o-rwx test-file

chmod u+rwx,g+r-x,o-rwx test-file
```

<img width="1838" height="885" alt="image" src="https://github.com/user-attachments/assets/db545de3-1147-487f-878b-3154e952d6b4" />

### Modifying File Permission

```sh
chmod <permissions> file

chmod 777 test-file

chmod 555 test-file

chmod 660 test-file

chomd 750 test-file
```
<img width="1881" height="920" alt="image" src="https://github.com/user-attachments/assets/f6d342cb-a327-4a04-92de-da451dda5edc" />


```sh
chown owner:group file

chown bob:developer test-file

chown bob android.apk

chgrp android test-file
```

<img width="1953" height="858" alt="image" src="https://github.com/user-attachments/assets/77a94788-3f07-4c2f-9d66-24d6eb8de8ff" />

