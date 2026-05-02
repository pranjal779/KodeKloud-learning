# Day 29: Manage Git Pull Requests

Max want to push some new changes to one of the repositories but we don't want people to push directly to master branch, since that would be the final version of the code. It should always only have content that has been reviewed and approved. We cannot just allow everyone to directly push to the master branch. So, let's do it the right way as discussed below:


SSH into storage server using user max, password Max_pass123 . There you can find an already cloned repo under Max user's home.


Max has written his story about The 🦊 Fox and Grapes 🍇


Max has already pushed his story to remote git repository hosted on Gitea branch story/fox-and-grapes


Check the contents of the cloned repository. Confirm that you can see Sarah's story and history of commits by running git log and validate author info, commit message etc.


Max has pushed his story, but his story is still not in the master branch. Let's create a Pull Request(PR) to merge Max's story/fox-and-grapes branch into the master branch


Click on the Gitea UI button on the top bar. You should be able to access the Gitea page.


UI login info:

- Username: max

- Password: Max_pass123

PR title : Added fox-and-grapes story

PR pull from branch: story/fox-and-grapes (source)

PR merge into branch: master (destination)


Before we can add our story to the master branch, it has to be reviewed. So, let's ask tom to review our PR by assigning him as a reviewer


Add tom as reviewer through the Git Portal UI

Go to the newly created PR

Click on Reviewers on the right

Add tom as a reviewer to the PR

Now let's review and approve the PR as user Tom


Login to the portal with the user tom


Logout of Git Portal UI if logged in as max


UI login info:

- Username: tom

- Password: Tom_pass123

PR title : Added fox-and-grapes story

Review and merge it.

Great stuff!! The story has been merged! 👏


Note: For these kind of scenarios requiring changes to be done in a web UI, please take screenshots so that you can share it with us for review in case your task is marked incomplete. 
You may also consider using a screen recording software such as loom.com to record and share your work.


<img width="935" height="1150" alt="image" src="https://github.com/user-attachments/assets/0fa96783-c02b-4e41-a25e-ca1c92779025" />
<img width="792" height="943" alt="image" src="https://github.com/user-attachments/assets/1d38f2fb-afd2-4626-9aca-389611d8fef5" />
<img width="1192" height="927" alt="image" src="https://github.com/user-attachments/assets/67163e45-e965-4404-9249-2aa20ebf0eb0" />
<img width="672" height="287" alt="image" src="https://github.com/user-attachments/assets/a3e0b015-7439-4a53-aba2-49ee6bb07c02" />
<img width="1000" height="481" alt="image" src="https://github.com/user-attachments/assets/0f211af3-8b43-4ae1-95d3-d02740c69308" />
<img width="1000" height="691" alt="image" src="https://github.com/user-attachments/assets/1ff1bcb5-52a9-4bdb-b389-5a550e1ad44f" />
<img width="1232" height="952" alt="image" src="https://github.com/user-attachments/assets/fcccfa37-3355-43f4-b1f6-050bb082e8f0" />
<img width="2521" height="552" alt="image" src="https://github.com/user-attachments/assets/909c7120-74d2-44df-8ecc-c1fa0896d8d1" />
<img width="1703" height="637" alt="image" src="https://github.com/user-attachments/assets/97d11ad8-486b-48ae-be83-dc67311354eb" />
<img width="1953" height="823" alt="image" src="https://github.com/user-attachments/assets/bd31fa06-7fff-42cd-ace7-639042e1c4f9" />
<img width="1857" height="772" alt="image" src="https://github.com/user-attachments/assets/5db75c87-fd4f-45c5-8fe7-d6900bbb9021" />
<img width="1752" height="780" alt="image" src="https://github.com/user-attachments/assets/b89fb46a-5aaf-42e9-b81c-e82f9483364f" />
<img width="641" height="490" alt="image" src="https://github.com/user-attachments/assets/7c895c65-5bb6-49c4-a0aa-7591a7cf051c" />
<img width="1876" height="478" alt="image" src="https://github.com/user-attachments/assets/986beca3-cdb3-4b3c-8496-b1bdbd1c88a2" />
<img width="1782" height="880" alt="image" src="https://github.com/user-attachments/assets/a96e2ad2-ad29-46f8-8a90-aa9b05a96411" />
<img width="2001" height="1101" alt="image" src="https://github.com/user-attachments/assets/e5fcb420-0a11-41d8-956d-40deb3aa691a" />
<img width="953" height="616" alt="image" src="https://github.com/user-attachments/assets/db93660e-ccb1-46d2-ae71-f7bb1749ffcb" />



