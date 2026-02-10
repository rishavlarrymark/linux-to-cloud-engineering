# 🧠 LINUX — QUICK RECALL (LAYER 1)
> Purpose: fast memory refresh only (no explanations)

---

## Filesystem & Navigation
- `pwd` → current location
- `ls -la` → all files + permissions
- `cd` → move directory
- `/` → root
- `/etc` → configs
- `/var` → logs, runtime
- `/home` → user space
- `/tmp` → temporary

---

## File Operations
- `touch` → create empty file
- `mkdir -p` → nested dirs
- `cp` → copy
- `mv` → move/rename
- `rm` → delete
- `rm -r` → delete dir
- `file` → real file type
- `stat` → metadata

---

## Viewing & Logs
- `less` → safe file view
- `cat` → small files only
- `head` → start of file
- `tail` → end of file
- `tail -f` → live logs
- `watch` → repeat command
- `ls -lh` → file size

---

## Permissions & Ownership
- `r w x` → read write execute
- `user | group | others`
- symbolic → `u+x g-r o+w a+rwx`
- numeric → `4=r 2=w 1=x`
- common → `755 644 600`
- `chmod` → permissions
- `chown` → ownership
- `sudo` → admin

---

## Users & Groups
## Users & Groups (DAY 5)
- `id user` → user exists?
- `groups user` → user’s groups
- `getent passwd user` → user DB entry
- `getent group group` → group exists
- `useradd -m -s /bin/bash user` → create login user
- `passwd user` → set password
- `groupadd group` → create group
- `usermod -aG group user` → add user to group
- `sudo -l` → allowed sudo actions
- `usermod -aG sudo user` → grant sudo
- `userdel -r user` → delete user + home

---

## System, CPU, Memory & Disk (DAY 6)
- `uptime` → system runtime + load
- `top` → live CPU processes
- `htop` → visual CPU/core view
- `mpstat -P ALL 2` → per-core CPU usage
- `free -h` → memory availability
- `vmstat 2` → CPU + memory + IO wait
- `df -h` → disk usage
- `df -T` → filesystem type
- `df -i` → inode usage
- `du -sh *` → directory sizes
- `du -sh /var/*` → space hogs
- `ls -li` → inode numbers
- `mount` → mounted filesystems
- `umount` → detach filesystem

## Processes
(add later)
