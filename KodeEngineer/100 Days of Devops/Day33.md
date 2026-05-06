# Day 33: Resolve Git Merge Conflicts

<img width="1267" height="668" alt="image" src="https://github.com/user-attachments/assets/6bac4562-7d2e-4ee3-b47e-ddaeb7ad7267" />

<img width="872" height="612" alt="image" src="https://github.com/user-attachments/assets/f72b1332-8ce2-4a06-85f0-f8f7370d3627" />

<img width="1968" height="882" alt="image" src="https://github.com/user-attachments/assets/949cb059-8fbe-4694-96f5-335646decff5" />

<img width="2147" height="1158" alt="image" src="https://github.com/user-attachments/assets/87215567-60de-4e74-ba56-fa87dd8f8af4" />

```sh
[max@ststor01 story-blog]$ git pull origin master
remote: Enumerating objects: 4, done.
remote: Counting objects: 100% (4/4), done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
Unpacking objects: 100% (3/3), 355 bytes | 355.00 KiB/s, done.
From http://gitea:3000/sarah/story-blog
 * branch            master     -> FETCH_HEAD
   0a3925f..09b2e8d  master     -> origin/master
Auto-merging story-index.txt
CONFLICT (add/add): Merge conflict in story-index.txt
Automatic merge failed; fix conflicts and then commit the result.
[max@ststor01 story-blog]$ vi story-index.txt 
[max@ststor01 story-blog]$ git log --oneline
2f0d67d (HEAD -> master) Added the fox and grapes story
0a3925f Merge branch 'story/frogs-and-ox'
94d4511 Fix typo in story title
1516fce Completed frogs-and-ox story
f400180 Added the lion and mouse story
a9f9370 Add incomplete frogs-and-ox story
[max@ststor01 story-blog]$ git push origin master
Username for 'http://gitea:3000': sarah
Password for 'http://sarah@gitea:3000': 
To http://gitea:3000/sarah/story-blog.git
 ! [rejected]        master -> master (non-fast-forward)
error: failed to push some refs to 'http://gitea:3000/sarah/story-blog.git'
hint: Updates were rejected because the tip of your current branch is behind
hint: its remote counterpart. If you want to integrate the remote changes,
hint: use 'git pull' before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
[max@ststor01 story-blog]$
```

<img width="2317" height="1167" alt="image" src="https://github.com/user-attachments/assets/b37faad4-877f-4e4e-81fd-7f77893547bb" />

```sh
[max@ststor01 story-blog]$ vi story-index.txt 
[max@ststor01 story-blog]$ git add story-index.txt 
[max@ststor01 story-blog]$ git commit -m "resolved merge conflicts and fixed typo in story titles"
[master 426b056] resolved merge conflicts and fixed typo in story titles
[max@ststor01 story-blog]$ git push origin master
Username for 'http://gitea:3000': sarah
Password for 'http://sarah@gitea:3000': 
Enumerating objects: 10, done.
Counting objects: 100% (10/10), done.
Delta compression using up to 16 threads
Compressing objects: 100% (7/7), done.
Writing objects: 100% (7/7), 1.22 KiB | 1.22 MiB/s, done.
Total 7 (delta 1), reused 0 (delta 0), pack-reused 0 (from 0)
remote: . Processing 1 references
remote: Processed 1 references in total
To http://gitea:3000/sarah/story-blog.git
   09b2e8d..426b056  master -> master
[max@ststor01 story-blog]$ cat story-index.txt 
<<<<<<< HEAD
1. The Lion and the Mouse
2. The Frogs and the Ox
3. The Fox and the Grapes
4. The Donkey and the Dog
=======
1. The Lion and the Mouse
2. The Frogs and the Ox
3. The Fox and the Grapes
>>>>>>> 09b2e8dbb14eb67df8376a3e5ccd1ff2f604521e
[max@ststor01 story-blog]$ 
```

