# 🔐 PERMISSIONS & OWNERSHIP — Production Operational Scenarios

## Permission denied
- **Situation:** command or service cannot access file  
- **Symptom:** `Permission denied`  
- **Root cause:** missing r/w/x on file or directory  
- **Fix:** inspect permissions and adjust minimally  

---

## `ls -l`
- **Situation:** access behaving unexpectedly  
- **Symptom:** unclear who can read/write/execute  
- **Root cause:** ownership or mode unknown  
- **Fix:** verify owner, group, and rwx bits  

---

## `chmod` (symbolic)
- **Situation:** small, targeted permission change needed  
- **Symptom:** specific access blocked or too open  
- **Root cause:** single bit incorrect  
- **Fix:** add/remove only required permission  

---

## `chmod` (numeric)
- **Situation:** enforce known-safe permission state  
- **Symptom:** inconsistent or messy permissions  
- **Root cause:** multiple bits incorrect  
- **Fix:** set exact mode (e.g., 755, 644, 600)  

---

## `777`
- **Situation:** quick access granted to “fix” issue  
- **Symptom:** security exposure or audit failure  
- **Root cause:** over-permissive shortcut  
- **Fix:** revert to least-privilege mode  
⚠️ **Risk:** anyone can read/write/execute  

---

## Directory execute (`x`)
- **Situation:** cannot `cd` or access files inside directory  
- **Symptom:** permission denied despite read  
- **Root cause:** execute bit missing on directory  
- **Fix:** add execute permission to directory  

---

## `chown`
- **Situation:** correct permissions but access still fails  
- **Symptom:** changes ignored despite chmod  
- **Root cause:** wrong owner or group  
- **Fix:** change ownership to correct user/group  

---

## `chown -R`
- **Situation:** project copied or created as root  
- **Symptom:** widespread permission errors  
- **Root cause:** mixed ownership across tree  
- **Fix:** recursively reset ownership  
⚠️ **Risk:** changing ownership of wrong path  

---

## `sudo`
- **Situation:** administrative action required  
- **Symptom:** operation not permitted  
- **Root cause:** insufficient privileges  
- **Fix:** run single command with sudo  

---

## `sudo -i`
- **Situation:** extended admin work required  
- **Symptom:** multiple commands need root  
- **Root cause:** repeated privilege escalation  
- **Fix:** enter root shell temporarily  
⚠️ **Risk:** full system access; exit immediately after task  

---

## Ownership check
- **Situation:** unsure who controls a file  
- **Symptom:** chmod ineffective  
- **Root cause:** not the file owner  
- **Fix:** compare `whoami` with file owner  

