## 👤 USERS, GROUPS & SUDO — Production Operational Scenarios

### User not found
Situation: command fails on user  
Symptom: no such user  
Root cause: user not created / deleted  
Fix: verify user  
Command:  
id username  

---

### User can’t log in
Situation: login/auth fails  
Symptom: authentication error  
Root cause: password or shell missing  
Fix: set password / shell  
Commands:  
passwd username  
usermod -s /bin/bash username  

---

### Home directory missing
Situation: user exists but apps/scripts fail  
Symptom: path /home/username not found  
Root cause: user created without -m  
Fix: create home and fix ownership  
Commands:  
mkdir /home/username  
chown username:username /home/username  

⚠️ Risk: services may fail due to missing expected paths

---

### Permission denied on shared files
Situation: user blocked from resource  
Symptom: permission denied  
Root cause: missing group membership  
Fix: add user to group  
Command:  
usermod -aG group user  

⚠️ Risk: without -a, existing groups are lost

---

### Group “not visible”
Situation: group seems missing  
Symptom: id group fails  
Root cause: group checked as user  
Fix: query group DB  
Command:  
getent group group  

---

### sudo denied
Situation: admin command fails  
Symptom: “not in sudoers”  
Root cause: user not in sudo group  
Fix: grant sudo access  
Command:  
usermod -aG sudo user  

⚠️ Risk: sudo misconfig = security exposure

---

### Unsure admin scope
Situation: unclear sudo rights  
Symptom: inconsistent permission behavior  
Root cause: sudo rules unknown  
Fix: inspect sudo scope  
Command:  
sudo -l  

---

### sudo broken after edit
Situation: sudo stops working  
Symptom: all sudo commands fail  
Root cause: invalid sudoers syntax  
Fix: always edit via visudo  
Command:  
visudo  

⚠️ Risk: invalid sudoers locks all admin access

---

### User removal
Situation: access must be revoked  
Symptom: user still present  
Root cause: identity not removed  
Fix: delete user and data  
Command:  
userdel -r username  

⚠️ Risk: deletes all user data

---

id → user exists?  
getent group → group exists?  
usermod -aG → access control  
sudo -l → privilege scope  

Nothing more is needed for real production.
