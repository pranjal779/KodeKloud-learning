# Day 2: Temporary User Setup with Expiry

<img width="1763" height="920" alt="image" src="https://github.com/user-attachments/assets/43fc974f-9352-451c-9d56-cb0be48b9e73" />

<img width="1682" height="953" alt="image" src="https://github.com/user-attachments/assets/07fd1c14-9f89-4d99-aadf-45a7829fcaba" />
<img width="1462" height="832" alt="image" src="https://github.com/user-attachments/assets/1b263536-6c8e-4345-a872-492a9b7c65c8" />
<img width="2438" height="1180" alt="image" src="https://github.com/user-attachments/assets/9b1d3abf-64e3-49fa-bd15-93d445e9fd2c" />
<img width="1802" height="913" alt="image" src="https://github.com/user-attachments/assets/0a6f5548-dbd2-4df4-828d-de63970c8fe0" />
<img width="1768" height="801" alt="image" src="https://github.com/user-attachments/assets/be67bf68-3548-46ce-81ec-fcc4a913ba61" />
<img width="1837" height="916" alt="image" src="https://github.com/user-attachments/assets/b8b3d267-be53-47b2-ab74-03eba0b9335c" />



--------------------

In Linux, creating an account for a "limited duration" means setting an expiration date after which the user will no longer be able to log in. Your command successfully handles both the user creation and the specific access limitation required by the task. 
Why You Used This Command
The task requires giving a temporary user, mariyam, access that expires on a specific date. 

* Access for a Limited Duration: By setting an expiration date, the system automatically locks the account after that date passes, preventing any further logins without manually deleting the user.
* Security Best Practice: This follows the principle of least privilege for temporary resources; it ensures that if you forget to manually remove the user later, the system "locks the door" for you.  

Breaking Down the Command
sudo useradd -e 2027-02-17 mariyam

| Component | Purpose |
|---|---|
| sudo | Runs the command with root (administrative) privileges, which is required to add or modify users. |
| useradd | The standard low-level utility used to create new user accounts in Linux. |
| -e | Short for --expiredate. This flag tells the system to disable the account on a specific date. |
| 2027-02-17 | The date the account will expire. It must follow the YYYY-MM-DD format. |
| mariyam | The username of the account being created. |

How to Find This Command in the Future

* Check the Manual: Use man useradd in your terminal. It lists all available flags, including -e for expiration dates.
* Help Flag: Run useradd --help for a quick list of common options.
* Verify the Result: To confirm the expiration date was set correctly, use sudo chage -l mariyam. Look for the "Account expires" line in the output.



The chage command (short for change age) is the standard tool used to manage user password and account expiration settings in Linux.
Your syntax, sudo chage -E YYYY-MM-DD username, is exactly correct for setting an account's expiration date.
Key Uses of chage
While useradd -e is used when creating a new user, chage is typically used to modify an existing user's limits or to view their current status. 

* View Account Status: sudo chage -l username
* This lists all aging information, including when the password was last changed and when the account will expire.
* Set Account Expiration: sudo chage -E 2027-02-17 mariyam
* The account will be disabled on the specified date.
* Force Password Change: sudo chage -d 0 username
* This forces a user to change their password the very next time they log in.
* Set Password Expiry Warning: sudo chage -W 7 username
* The user will start seeing a "password expires soon" warning 7 days before it actually happens.

useradd -e vs. chage -E

| Command | When to use it |
|---|---|
| useradd -e | When you are creating the user for the first time. |
| chage -E | When the user already exists and you need to change or add an expiration date. |

Pro-Tip for KodeKloud: If you accidentally created mariyam without an expiration date, you don't need to delete and recreate her. You can just run the chage -E command to fix it on the fly!



The anatomy of the chage -E command breaks down into four functional parts that tell the Linux system exactly who is being restricted, what is being changed, and when it should happen.
Anatomy of sudo chage -E YYYY-MM-DD username

| Part | Name | Description |
|---|---|---|
| sudo | Privilege Escalation | Grants root-level access. Modifying user accounts (stored in /etc/shadow) requires administrative permissions. |
| chage | Command Utility | Short for "change age". It is the primary tool for managing password and account expiration policies. |
| -E | Option (Flag) | Specifically stands for --expiredate. It tells the command to set the date when the entire user account will be disabled. |
| YYYY-MM-DD | Date Parameter | The specific "deadline." Once this date passes, the user can no longer log in. It must follow the ISO 8601 format (e.g., 2027-02-17). |
| username | Target Argument | The login name of the user you want to modify (e.g., mariyam). |

------------------------------
Key Differences from useradd -e
While both commands achieve the same result for your task, they are used at different stages of user management:

* useradd -e: Used only when creating a brand-new user.
* chage -E: Used to update or fix an account that already exists.

How to "Undo" or Remove Expiration
If you ever need to make the account permanent again (removing the limited duration), you can use the value -1:

sudo chage -E -1 mariyam

This sets the account to never expire. You can verify the change by running sudo chage -l mariyam, which will now show "Account expires : never". 
Would you like to know how to force a user to change their password the first time they log in?


