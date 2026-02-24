# FILE SEARCH & DISK DEBUG  —  Production Operational Scenarios

---

## `find /etc -name "app.conf"`

- **Situation:** Application fails to start due to missing config  
- **Symptom:** Error: config file not found  
- **Root cause:** File exists but in unexpected path  
- **Fix:** Locate exact config path and update service config or move file  
---

## `find /var -size +1G`

- **Situation:** Disk usage spike on production server  
- **Symptom:** `df -h` shows high utilization  
- **Root cause:** Large files (logs, dumps, backups) consuming space  
- **Fix:** Identify large files and archive or delete per retention policy  
- ⚠️ **Risk:** Deleting active files may impact running services  
---

## `find /var/log -mtime +30`

- **Situation:** Log partition filling up over time  
- **Symptom:** Increasing disk usage without active spike  
- **Root cause:** Old logs not rotated or cleaned  
- **Fix:** Identify stale logs and remove or compress based on policy  
- ⚠️ **Risk:** Removing logs required for compliance/audit  
---

## `stat filename`

- **Situation:** Unexpected file behavior or access issue  
- **Symptom:** Permission denied or unexplained modification  
- **Root cause:** Ownership, permission, or timestamp mismatch  
- **Fix:** Inspect metadata and correct ownership/permissions  
---

## `lsof | grep deleted`

- **Situation:** Disk full but no large files visible via `du`  
- **Symptom:** `df` shows full, `du` does not match  
- **Root cause:** Deleted file still held open by running process  
- **Fix:** Restart affected process to release file handle  
- ⚠️ **Risk:** Restarting critical service may cause downtime  
---
