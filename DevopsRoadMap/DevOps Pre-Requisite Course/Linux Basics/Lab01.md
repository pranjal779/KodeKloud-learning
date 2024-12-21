```sh
thor@host01 ~$ pwd
/home/thor
thor@host01 ~$ cd /home/thor/test_dir
thor@host01 ~/test_dir$ ls
dir1  dir2  dir3  test_file1.txt  test_file2.txt  test_file4.txt
thor@host01 ~/test_dir$ ls -la
total 20
drwxr-xr-x 5 root root 4096 Dec 21 10:50 .
drwx------ 1 thor thor 4096 Dec 21 10:50 ..
drwxr-xr-x 2 root root 4096 Dec 21 10:50 dir1
drwxr-xr-x 2 root root 4096 Dec 21 10:50 dir2
drwxr-xr-x 2 root root 4096 Dec 21 10:50 dir3
-rw-r--r-- 1 root root    0 Dec 21 10:50 test_file1.txt
-rw-r--r-- 1 root root    0 Dec 21 10:50 test_file2.txt
-rw-r--r-- 1 root root    0 Dec 21 10:50 test_file4.txt
thor@host01 ~/test_dir$ cd ..
thor@host01 ~$ pwd
/home/thor
thor@host01 ~$ tree ~/test_dir
/home/thor/test_dir
├── dir1
├── dir2
├── dir3
├── test_file1.txt
├── test_file2.txt
└── test_file4.txt

3 directories, 3 files
thor@host01 ~$ ls
test_dir
thor@host01 ~$ touch empty_file.txt
thor@host01 ~$ ls
empty_file.txt  test_dir
thor@host01 ~$ cat > contents_file.txt
This is not empty file
thor@host01 ~$ cat contents_file.txt 
This is not empty file
thor@host01 ~$ ls
contents_file.txt  empty_file.txt  test_dir
thor@host01 ~$ pwd
/home/thor
thor@host01 ~$ mkdir empty_dir
thor@host01 ~$ mkdir -p /home/thor/asia/india/bangalore
thor@host01 ~$ tree
.
├── asia
│   └── india
│       └── bangalore
├── contents_file.txt
├── empty_dir
├── empty_file.txt
└── test_dir
    ├── dir1
    ├── dir2
    ├── dir3
    ├── test_file1.txt
    ├── test_file2.txt
    └── test_file4.txt

8 directories, 5 files
thor@host01 ~$
```
