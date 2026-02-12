# 💽 DISK & STORAGE — Production Operational Scenarios

### `df -h`

- **Situation:** App reports “No space left on device”  
- **Symptom:** Writes failing, services crashing  
- **Root cause:** Filesystem at or near 100% usage  
- **Fix:** Identify full mount → investigate large paths  

---

### `du -sh /*`

- **Situation:** Filesystem usage high  
- **Symptom:** `df` shows high Use%  
- **Root cause:** Large directory consuming space  
- **Fix:** Drill down into largest path  

---

### `df full but du not matching`

- **Command:** `lsof | grep deleted`
- **Situation:** `df` shows 100%, `du` does not  
- **Symptom:** Disk full but no large visible files  
- **Root cause:** Deleted file still held open by process  
- **Fix:** Restart offending process  
- ⚠️ **Risk:** Restarting critical service without impact review  

---

### `lsblk`

- **Situation:** New disk attached (cloud/VM)  
- **Symptom:** Storage not visible in expected path  
- **Root cause:** Disk not mounted  
- **Fix:** Verify device → mount correctly  

---

### `mount`

- **Situation:** Application writing to wrong disk  
- **Symptom:** Unexpected filesystem filling up  
- **Root cause:** Incorrect or missing mount point  
- **Fix:** Verify mount location → remount if required  
- ⚠️ **Risk:** Writing to root instead of data volume  

---

### `ncdu -x /`

- **Situation:** Need fast disk usage analysis  
- **Symptom:** Unknown large data growth  
- **Root cause:** Log growth / temp files / app data  
- **Fix:** Identify large directories → clean safely  

---

### `Disk full – app cannot write`

- **Command:** `df -h` → `du -sh` → check mount → verify permissions  
- **Situation:** Service failing to write data  
- **Symptom:** “No space left on device”  
- **Root cause:** Disk full / wrong mount / permission issue  
- ⚠️ **Risk:** Data corruption if forced writes continue  
---
