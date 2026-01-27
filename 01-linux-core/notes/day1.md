# 📁 FILESYSTEM & NAVIGATION — Production Operational Scenarios

## `pwd`
- **Primary use:** confirm current working directory before any operation  
- **Situation:** unsure where you are  
- **Symptom:** wrong files edited or deleted  
- **Root cause:** working in an unexpected directory  
- **Fix:** run `pwd` before any risky command  

---

## `ls` / `ls -l` / `ls -a`
- **Primary use:** inspect files, permissions, ownership, hidden configs  
- **Situation:** checking files or permissions  
- **Symptom:** file “not found” or permission confusion  
- **Root cause:** hidden files or wrong expectations  
- **Fix:** use `ls -la` to see everything  

---

## `cd`
- **Primary use:** move between filesystem locations  
- **Situation:** moving between directories  
- **Symptom:** `No such file or directory`  
- **Root cause:** wrong path (relative vs absolute)  
- **Fix:** use `cd /full/path` or `cd ..`  

---

## `tree`
- **Primary use:** visualize project or service directory structure  
- **Situation:** understanding project structure  
- **Symptom:** confusion about where config or code lives  
- **Root cause:** nested directories not visualized  
- **Fix:** use `tree -L 2` for quick layout  

---

## `/etc`
- **Primary use:** system-wide and service configuration files  
- **Situation:** configuration change needed  
- **Symptom:** service not behaving as expected  
- **Root cause:** wrong or missing configuration  
- **Fix:** check `/etc/<service>/`  
⚠️ **Risk:** editing without backup can break the system  

---

## `/var`
- **Primary use:** logs, runtime data, caches, service state  
- **Situation:** application or service failing  
- **Symptom:** silent crash or disk full  
- **Root cause:** logs or variable data filling disk  
- **Fix:** inspect `/var/log` and `/var/lib`  

---

## `/home`
- **Primary use:** user workspaces, scripts, personal configs  
- **Situation:** user files or scripts  
- **Symptom:** permission denied in system directories  
- **Root cause:** working outside home directory  
- **Fix:** keep work under `/home/<user>`  

---

## `/tmp`
- **Primary use:** short-lived temporary files used by processes  
- **Situation:** temporary files needed  
- **Symptom:** files disappear after reboot  
- **Root cause:** `/tmp` is auto-cleaned  
- **Fix:** never store important data here  

---

## `/` (Root Directory)
- **Primary use:** top-level filesystem boundary (everything starts here)  
- **Situation:** system-wide navigation  
- **Symptom:** accidental system damage  
- **Root cause:** running commands blindly at `/`  
- **Fix:** read-only mindset in root directory  
⚠️ **Risk:** destructive commands affect the entire system  
