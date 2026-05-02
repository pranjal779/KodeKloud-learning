# Day 27: Git Revert Some Changes

<img width="817" height="412" alt="image" src="https://github.com/user-attachments/assets/297a6101-ffbe-409c-9df3-415c34816c26" />

The Nautilus application development team was working on a git repository /usr/src/kodekloudrepos/demo present on Storage server in Stratos DC. 
However, they reported an issue with the recent commits being pushed to this repo. 
They have asked the DevOps team to revert repo HEAD to last commit. Below are more details about the task:

1. In /usr/src/kodekloudrepos/demo git repository, revert the latest commit ( HEAD ) to the previous commit (JFYI the previous commit hash should be with initial commit message ).
2. Use revert demo message (please use all small letters for commit message) for the new revert commit.


<img width="692" height="858" alt="image" src="https://github.com/user-attachments/assets/47153b1d-456c-4a49-b8c5-f804c19c376b" />
<img width="690" height="492" alt="image" src="https://github.com/user-attachments/assets/0cfbf209-19b4-407a-b4b2-bb29581b3b31" />

To revert the repository to the previous commit as requested, follow these steps on the Storage server:
1. Navigate to the Repository
   First, change your directory to the git repository:cd /usr/src/kodekloudrepos/demo
2. Revert the Latest Commit
   To revert the HEAD commit and create a new commit with the specified message, use the following command:
   git revert HEAD --no-edit
   Note: If you want to change the message immediately via the command line, use:
   git revert HEAD -m "revert demo"
3. Update the Commit Message
   If you haven't set the message yet, or need to ensure it matches the requirement exactly (all lowercase):
   git commit --amend -m "revert demo"

Summary of Commands
```bash
cd /usr/src/kodekloudrepos/demo
git revert HEAD --no-edit
git commit --amend -m "revert demo"
```

Verification: You can run git log to confirm that the new commit is at the top and the previous state (the "initial commit") is now the parent.

<img width="2387" height="1192" alt="image" src="https://github.com/user-attachments/assets/433bbea6-d5b5-46e4-90a5-4cf98d7b5626" />
<img width="1645" height="1102" alt="image" src="https://github.com/user-attachments/assets/565f8186-0eb1-4974-963f-1bd408d0142a" />
<img width="2332" height="1166" alt="image" src="https://github.com/user-attachments/assets/75a94ef5-bec1-4887-b0cf-e84f54fff1b0" />
<img width="958" height="657" alt="image" src="https://github.com/user-attachments/assets/7ca66ef9-dbc6-409a-8c76-f327fd3f1295" />
