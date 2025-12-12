 DAY 4 – PERMISSIONS AND OWNERSHIP (NOTES)

Linux permissions structure
Every file has three permission groups: owner, group, others.
Each group gets read (r), write (w), and execute (x) permissions.
Example: rwxr-x--- means owner = rwx, group = r-x, others = ---.

chmod
Used to change permissions.
Two types:

Symbolic: u+x, g-r, o+w, a+rwx

Numeric: r=4, w=2, x=1 (example: 644, 755, 700)
755 = owner full, group and others read/execute.
700 = only owner can use the file.

chown
Changes the owner of a file.
Important in systems with multiple users or services.

chgrp
Changes the group of a file.
Used to manage team-based directories and shared access.

umask
Defines default permissions for newly created files and folders.
umask subtracts permissions from the system default.
umask 022 ? files created as 644, folders as 755.
umask 077 ? files created as 600, folders as 700 (more secure).

Directory permission behavior
Execute (x) on a directory means entering it.
Read (r) means listing the contents.
Write (w) means creating or deleting files.
Example: 755 directory = everyone can enter, but only owner can modify.
Example: 700 directory = only owner can access it at all.

Advanced learning from tasks

Creation of multiple users and groups teaches user management.

Shared folder with group permissions shows team collaboration setup.

Secure folder with 700 demonstrates root-only protection.

Owner-only script execution shows how to secure private scripts.

Finding 777 files teaches security auditing.

System-wide umask change strengthens system security.

ACL usage allows fine-grained permissions beyond chmod.

Project organization
You learned how to structure a Linux project professionally:
notes/ for written concepts
outputs/ for command results
scripts/ for shell scripts
README.md for project documentation
This is the same structure used in DevOps teams and GitHub portfolios.

IN SHORT:
You mastered Linux permission systems (chmod, chown, chgrp), default permission control via umask, directory security rules, ACL usage, security auditing, and proper project structuring. "@ | Set-Content day4.md@"
DAY 4 – PERMISSIONS AND OWNERSHIP (NOTES)  Linux permissions structure Every file has three permission groups: owner, group, others. Each group gets read (r), write (w), and execute (x) permissions. Example: rwxr-x--- means owner = rwx, group = r-x, others = ---.  chmod Used to change permissions. Two types:  Symbolic: u+x, g-r, o+w, a+rwx  Numeric: r=4, w=2, x=1 (example: 644, 755, 700) 755 = owner full, group and others read/execute. 700 = only owner can use the file.  chown Changes the owner of a file. Important in systems with multiple users or services.  chgrp Changes the group of a file. Used to manage team-based directories and shared access.  umask Defines default permissions for newly created files and folders. umask subtracts permissions from the system default. umask 022 ? files created as 644, folders as 755. umask 077 ? files created as 600, folders as 700 (more secure).  Directory permission behavior Execute (x) on a directory means entering it. Read (r) means listing the contents. Write (w) means creating or deleting files. Example: 755 directory = everyone can enter, but only owner can modify. Example: 700 directory = only owner can access it at all.  Advanced learning from tasks  Creation of multiple users and groups teaches user management.  Shared folder with group permissions shows team collaboration setup.  Secure folder with 700 demonstrates root-only protection.  Owner-only script execution shows how to secure private scripts.  Finding 777 files teaches security auditing.  System-wide umask change strengthens system security.  ACL usage allows fine-grained permissions beyond chmod.  Project organization You learned how to structure a Linux project professionally: notes/ for written concepts outputs/ for command results scripts/ for shell scripts README.md for project documentation This is the same structure used in DevOps teams and GitHub portfolios.  IN SHORT: You mastered Linux permission systems (chmod, chown, chgrp), default permission control via umask, directory security rules, ACL usage, security auditing, and proper project structuring.
